	; DebugColor_GFX tile IDs
	const_def $5a
	const DEBUGTEST_TICKS_1 ; $5a
	const DEBUGTEST_TICKS_2 ; $5b
	const DEBUGTEST_WHITE   ; $5c
	const DEBUGTEST_LIGHT   ; $5d
	const DEBUGTEST_DARK    ; $5e
	const DEBUGTEST_BLACK   ; $5f
	const DEBUGTEST_0       ; $60
	const DEBUGTEST_1       ; $61
	const DEBUGTEST_2       ; $62
	const DEBUGTEST_3       ; $63
	const DEBUGTEST_4       ; $64
	const DEBUGTEST_5       ; $65
	const DEBUGTEST_6       ; $66
	const DEBUGTEST_7       ; $67
	const DEBUGTEST_8       ; $68
	const DEBUGTEST_9       ; $69
	const DEBUGTEST_A       ; $6a
	const DEBUGTEST_B       ; $6b
	const DEBUGTEST_C       ; $6c
	const DEBUGTEST_D       ; $6d
	const DEBUGTEST_E       ; $6e
	const DEBUGTEST_F       ; $6f

	; DebugColorMain.Jumptable indexes
	const_def
	const DEBUGCOLORMAIN_INITSCREEN     ; 0
	const DEBUGCOLORMAIN_UPDATESCREEN   ; 1
	const DEBUGCOLORMAIN_UPDATEPALETTES ; 2
	const DEBUGCOLORMAIN_JOYPAD         ; 3
	const DEBUGCOLORMAIN_INITTMHM       ; 4
	const DEBUGCOLORMAIN_TMHMJOYPAD     ; 5

DebugColorPicker:
; A debug menu to test monster and trainer palettes at runtime.
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	ret z

.cgb
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a

	call DisableLCD
	call DebugColor_InitVRAM
	call DebugColor_LoadGFX
	call DebugColor_InitPalettes
	call DebugColor_InitMonOrTrainerColor
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic

	xor a ; DEBUGCOLORMAIN_INITSCREEN
	ld [wJumptableIndex], a
	ld [wDebugColorCurMon], a
	ld [wDebugColorIsShiny], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	call DebugColorMain
	call DebugColor_PlaceCursor
	call DelayFrame
	jr .loop

.exit
	xor a
	ld [wDebugColorIsTrainer], a
	pop af
	ldh [hInMenu], a
	call DisableLCD
	call DebugColor_InitVRAM
	farcall LoadFontsExtra
	farcall LoadStandardFont
	call SetPalettes
	call EnableLCD
	ld de, MUSIC_MAIN_MENU
	jp PlayMusic

DebugColor_InitMonOrTrainerColor:
	ld a, [wDebugColorIsTrainer]
	and a
	jr nz, DebugColor_InitTrainerColor
	ld hl, PokemonPalettes
	; fallthrough
DebugColor_InitMonColor:
	ld de, wDebugOriginalColors
	ld c, NUM_POKEMON + 1
.loop
	push bc
	push hl
	call DebugColor_InitColor
	pop hl
	ld bc, 8
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

DebugColor_InitTrainerColor:
	ld hl, TrainerPalettes
	ld de, wDebugOriginalColors
	ld c, NUM_TRAINER_CLASSES + 1
.loop
	push bc
	push hl
	call DebugColor_InitColor
	pop hl
	ld bc, 4
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

DebugColor_InitColor:
rept 3
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
endr
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	ret

DebugColor_InitVRAM:
	ld a, $1
	ldh [rVBK], a
	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	xor a
	call ByteFill

	xor a
	ldh [rVBK], a
	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	call ByteFill

	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill

	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill

	jp ClearSprites

DebugColor_LoadGFX:
	ld hl, DebugColor_GFX
	ld de, vTiles2 tile DEBUGTEST_TICKS_1
	ld bc, 22 tiles
	call CopyBytes

	ld hl, DebugColor_GFX tile 5
	ld de, vTiles2 tile $7f
	ld bc, 1 tiles
	call CopyBytes

	ld hl, DebugColor_UpArrowGFX
	ld de, vTiles0
	ld bc, 1 tiles
	call CopyBytes

; Invert the font colors.
	farcall LoadStandardFont
	ld hl, vTiles1
	ld bc, $80 tiles
.loop
	ld a, [hl]
	cpl
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

DebugColor_InitPalettes:
	ldh a, [hCGB]
	and a
	ret z

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, Palette_DebugBG
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld hl, Palette_DebugBG
	ld c, 8 palettes
	xor a
.bg_loop
	ldh [rBGPD], a
	dec c
	jr nz, .bg_loop

	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld hl, Palette_DebugOB
	ld c, 8 palettes
.ob_loop
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .ob_loop

	ld a, LOW(palred 20 + palgreen 20 + palblue 20)
	ld [wDebugLightColor + 0], a
	ld a, HIGH(palred 20 + palgreen 20 + palblue 20)
	ld [wDebugLightColor + 1], a
	ld a, LOW(palred 10 + palgreen 10 + palblue 10)
	ld [wDebugDarkColor + 0], a
	ld a, HIGH(palred 10 + palgreen 10 + palblue 10)
	ld [wDebugDarkColor + 1], a

	pop af
	ldh [rSVBK], a
	ret

Palette_DebugBG:
INCLUDE "gfx/debug/bg.pal"

Palette_DebugOB:
INCLUDE "gfx/debug/ob.pal"

DebugColorMain:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	cp DEBUGCOLORMAIN_INITTMHM
	jr nc, .no_start_select
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .NextMon
	ld a, [hl]
	and START
	jr nz, .PreviousMon

.no_start_select
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	rst JumpTable
	ret

.NextMon:
	call DebugColor_BackupSpriteColors
	call .SetMaxNum
	ld e, a
	ld a, [wDebugColorCurMon]
	inc a
	cp e
	jr c, .SwitchMon
	xor a
	jr .SwitchMon

.PreviousMon:
	call DebugColor_BackupSpriteColors
	ld a, [wDebugColorCurMon]
	dec a
	cp -1
	jr nz, .SwitchMon
	call .SetMaxNum
	dec a

.SwitchMon:
	ld [wDebugColorCurMon], a
	ld a, DEBUGCOLORMAIN_INITSCREEN
	ld [wJumptableIndex], a
	ret

.SetMaxNum:
; Looping back around the pic set.
	ld a, [wDebugColorIsTrainer]
	and a

	; trainer
	ld a, NUM_TRAINER_CLASSES ; MYSTICALMAN
	ret nz
	
	; mon
	ld a, NUM_POKEMON ; CELEBI
	ret

.Jumptable:
; entries correspond to DEBUGCOLORMAIN_* constants
	dw DebugColor_InitScreen
	dw DebugColor_UpdateScreen
	dw DebugColor_UpdatePalettes
	dw DebugColor_Joypad
	dw DebugColor_InitTMHM
	dw DebugColor_TMHMJoypad

DebugColor_InitScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 1, 3
	lb bc, 7, 18
	ld a, DEBUGTEST_WHITE
	call FillBoxWithByte
	hlcoord 11, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_LIGHT
	call FillBoxWithByte
	hlcoord 16, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_DARK
	call FillBoxWithByte
	call DebugColor_LoadRGBMeter
	call DebugColor_SetRGBMeter
	ld a, [wDebugColorCurMon]
	inc a
	ld [wCurPartySpecies], a
	ld [wTextDecimalByte], a
	hlcoord 0, 1
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wDebugColorIsTrainer]
	and a
	jr nz, .trainer

; mon
	ld a, UNOWN_A
	ld [wUnownLetter], a
	call GetPokemonName
	hlcoord 4, 1
	call PlaceString
	xor a
	ld [wBoxAlignment], a
	hlcoord 12, 3
	call _PrepMonFrontpic
	ld de, vTiles2 tile $31
	predef GetMonBackpic
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 2, 4
	lb bc, 6, 6
	predef PlaceGraphic

	ld a, [wDebugColorIsShiny]
	and a
	ld de, .NormalText
	jr z, .place_text
; shiny
	ld de, .ShinyText
.place_text
	hlcoord 10, 17
	call PlaceString
	hlcoord 0, 17
	ld de, .SwitchText
	call PlaceString
	jr .done

.trainer
	ld a, [wTextDecimalByte]
	ld [wTrainerClass], a
	farcall GetTrainerAttributes
	ld de, wStringBuffer1
	hlcoord 4, 1
	call PlaceString
	ld de, vTiles2
	farcall GetTrainerPic
	xor a
	ld [wTempEnemyMonSpecies], a
	ldh [hGraphicStartTile], a
	hlcoord 2, 3
	lb bc, 7, 7
	predef PlaceGraphic

.done
	ld a, DEBUGCOLORMAIN_UPDATESCREEN
	ld [wJumptableIndex], a
	ret

.ShinyText:
	db "Shiny@" ; Rare (shiny)

.NormalText:
	db "Normal@" ; Normal

.SwitchText:
	db DEBUGTEST_A, " Switch▶@" ; (A) Switch

DebugColor_LoadRGBMeter:
	decoord 0, 11, wAttrmap
	hlcoord 2, 11
	ld a, 1
	call .load_meter
	decoord 0, 13, wAttrmap
	hlcoord 2, 13
	ld a, 2
	call .load_meter
	decoord 0, 15, wAttrmap
	hlcoord 2, 15
	ld a, 3
.load_meter:
	push af
	ld a, DEBUGTEST_TICKS_1
	ld [hli], a
	ld bc, 15
	ld a, DEBUGTEST_TICKS_2
	call ByteFill
	ld l, e
	ld h, d
	pop af
	ld bc, 20 * 2
	jp ByteFill

DebugColor_SetRGBMeter:
	ld a, [wDebugColorCurMon]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, wDebugOriginalColors
	add hl, de
	ld de, wDebugMiddleColors
	ld bc, 4
	call CopyBytes
	xor a
	ld [wDebugColorRGBJumptableIndex], a
	ld [wDebugColorCurColor], a
	ld de, wDebugLightColor
	jp DebugColor_CalculateRGB

DebugColor_UpdateScreen:
	ldh a, [hCGB]
	and a
	jr z, .sgb

	ld a, 2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.sgb
	call WaitBGMap

	ld a, DEBUGCOLORMAIN_UPDATEPALETTES
	ld [wJumptableIndex], a
	ret

DebugColor_UpdatePalettes:
	ldh a, [hCGB]
	and a
	jr z, .sgb

; cgb
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, wBGPals2
	ld de, wDebugMiddleColors
	ld c, 1
	call DebugColor_LoadPalettes_White_Col1_Col2_Black

	hlcoord 10, 2
	ld de, wDebugLightColor
	call DebugColor_PrintHexColor
	hlcoord 15, 2
	ld de, wDebugDarkColor
	call DebugColor_PrintHexColor

	ld a, TRUE
	ldh [hCGBPalUpdate], a

	ld a, DEBUGCOLORMAIN_JOYPAD
	ld [wJumptableIndex], a

	pop af
	ldh [rSVBK], a
	ret

.sgb
	ld hl, wSGBPals
	ld a, 1
	ld [hli], a
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	ld a, [wDebugLightColor + 0]
	ld [hli], a
	ld a, [wDebugLightColor + 1]
	ld [hli], a
	ld a, [wDebugDarkColor + 0]
	ld [hli], a
	ld a, [wDebugDarkColor + 1]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, wSGBPals
	call DebugColor_PushSGBPals

	hlcoord 10, 2
	ld de, wDebugLightColor
	call DebugColor_PrintHexColor
	hlcoord 15, 2
	ld de, wDebugDarkColor
	call DebugColor_PrintHexColor

	ld a, DEBUGCOLORMAIN_JOYPAD
	ld [wJumptableIndex], a
	ret

DebugColor_PrintHexColor:
	inc hl
	inc hl
	inc hl
	ld a, [de]
	call .place_tile
	ld a, [de]
	swap a
	call .place_tile
	inc de
	ld a, [de]
	call .place_tile
	ld a, [de]
	swap a
.place_tile:
	and $f
	add DEBUGTEST_0
	ld [hld], a
	ret

DebugColor_Joypad:
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .tmhm
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .toggle_shiny

	ld a, [wDebugColorRGBJumptableIndex]
	maskbits 4 ; .PointerTable length
	ld hl, .PointerTable
	rst JumpTable
	ret

.tmhm
; Enter the TM/HM checker.
	ld a, DEBUGCOLORMAIN_INITTMHM
	ld [wJumptableIndex], a
	ret

.toggle_shiny
; Toggle between the normal and shiny mon colors.
	ld a, [wDebugColorIsTrainer]
	and a
	ret nz

	ld a, [wDebugColorIsShiny]
	xor %00000100
	ld [wDebugColorIsShiny], a
	ld c, a
	ld b, 0
	ld hl, PokemonPalettes
	add hl, bc
	call DebugColor_InitMonColor

	ld a, DEBUGCOLORMAIN_INITSCREEN
	ld [wJumptableIndex], a
	ret

.PointerTable:
	dw DebugColor_SelectColorBox
	dw DebugColor_ChangeRedValue
	dw DebugColor_ChangeGreenValue
	dw DebugColor_ChangeBlueValue

DebugColor_SelectColorBox:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_RIGHT
	jr nz, .dark
	ld a, [hl]
	and D_LEFT
	ret z

;light
	xor a ; FALSE
	ld [wDebugColorCurColor], a
	ld de, wDebugLightColor
	jp DebugColor_CalculateRGB

.dark
	ld a, TRUE
	ld [wDebugColorCurColor], a
	ld de, wDebugDarkColor
	jp DebugColor_CalculateRGB

DebugColor_ChangeRedValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wDebugRedChannel
	jr DebugColor_UpdateRGBColor

DebugColor_ChangeGreenValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wDebugGreenChannel
	jr DebugColor_UpdateRGBColor

DebugColor_ChangeBlueValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wDebugBlueChannel
	; fallthrough

DebugColor_UpdateRGBColor:
	ldh a, [hJoyLast]
	and D_LEFT
	jr nz, .decrement
	ldh a, [hJoyLast]
	and D_RIGHT
	ret z

;increment
	ld a, [hl]
	cp 31
	ret nc
	inc [hl]
	jr .done

.decrement
	ld a, [hl]
	and a
	ret z
	dec [hl]

.done
	call DebugColor_CalculatePalette
	ld a, DEBUGCOLORMAIN_UPDATEPALETTES
	ld [wJumptableIndex], a
	ret

DebugColor_PreviousRGBColor:
	ld hl, wDebugColorRGBJumptableIndex
	dec [hl]
	ret

DebugColor_NextRGBColor:
	ld hl, wDebugColorRGBJumptableIndex
	inc [hl]
	ret

DebugColor_InitTMHM:
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH * 8
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 1, 12
	ld de, DebugColor_AreYouFinishedString
	call PlaceString
	xor a
	ld [wDebugColorCurTMHM], a
	call DebugColor_PrintTMHMMove
	ld a, DEBUGCOLORMAIN_TMHMJOYPAD
	ld [wJumptableIndex], a
	ret

DebugColor_TMHMJoypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .exit

	ld a, [hl]
	and B_BUTTON
	jr z, .scroll

.cancel
	ld a, DEBUGCOLORMAIN_INITSCREEN
	ld [wJumptableIndex], a
	ret

.exit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.scroll:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_UP
	ret z

.up
	ld a, [wDebugColorCurTMHM]
	cp NUM_TM_HM_TUTOR - 1
	jr z, .wrap_down
	inc a
	jr .done

.wrap_down
	xor a
	jr .done

.down
	ld a, [wDebugColorCurTMHM]
	and a
	jr z, .wrap_up
	dec a
	jr .done

.wrap_up
	ld a, NUM_TM_HM_TUTOR - 1
.done
	ld [wDebugColorCurTMHM], a
	; fallthrough
DebugColor_PrintTMHMMove:
	hlcoord 8, 11
	call .ClearRow
	hlcoord 8, 12
	call .ClearRow
	hlcoord 8, 13
	call .ClearRow
	hlcoord 8, 14
	call .ClearRow

	ld a, [wDebugColorCurTMHM]
	inc a
	ld [wTempTMHM], a
	predef GetTMHMMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	hlcoord 8, 12
	call PlaceString

	ld a, [wDebugColorCurTMHM]
	call .GetNumberedTMHM
	ld [wCurItem], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	ld de, .AbleText
	jr nz, .place_string
	ld de, .NotAbleText
.place_string
	hlcoord 8, 14
	jp PlaceString

.AbleText:
	db "Can learn@" ; Learnable"

.NotAbleText:
	db "Can't learn@"; Not learnable

.GetNumberedTMHM:
	cp NUM_TMS
	jr c, .tm
; hm - skip two gap items
	add 2
.tm
	add TM01
	ret

.ClearRow:
	ld bc, 12
	ld a, DEBUGTEST_BLACK
	jp ByteFill

DebugColor_CalculatePalette:
	ld a, [wDebugRedChannel]
	and %00011111
	ld e, a
	ld a, [wDebugGreenChannel]
	and %00000111
	add a
	swap a
	or e
	ld e, a
	ld a, [wDebugGreenChannel]
	and %00011000
	add a
	swap a
	ld d, a
	ld a, [wDebugBlueChannel]
	and %00011111
	add a
	add a
	or d
	ld d, a
	ld a, [wDebugColorCurColor]
	and a
	jr z, .light

; dark
	ld a, e
	ld [wDebugDarkColor + 0], a
	ld a, d
	ld [wDebugDarkColor + 1], a
	ret

.light
	ld a, e
	ld [wDebugLightColor + 0], a
	ld a, d
	ld [wDebugLightColor + 1], a
	ret

DebugColor_CalculateRGB:
	ld a, [de]
	and %00011111
	ld [wDebugRedChannel], a
	ld a, [de]
	and %11100000
	swap a
	srl a
	ld b, a
	inc de
	ld a, [de]
	and %00000011
	swap a
	srl a
	or b
	ld [wDebugGreenChannel], a
	ld a, [de]
	and %01111100
	srl a
	srl a
	ld [wDebugBlueChannel], a
	ret

DebugColor_BackupSpriteColors:
	ld a, [wDebugColorCurMon]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, wDebugOriginalColors
	add hl, de
	ld e, l
	ld d, h
	ld hl, wDebugMiddleColors
	ld bc, 4
	jp CopyBytes

DebugColor_LoadPalettes_White_Col1_Col2_Black:
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
rept 4
	ld a, [de]
	inc de
	ld [hli], a
endr
	xor a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop
	ret

DebugColor_PushSGBPals:
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a
	call _DebugColor_PushSGBPals
	pop af
	ld [wJoypadDisable], a
	ret

_DebugColor_PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.loop2
	ld e, $8
	ld a, [hli]
	ld d, a
.loop3
	bit 0, d
	ld a, $10
	jr nz, .okay
	ld a, $20
.okay
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	pop bc
	dec b
	jr nz, .loop
	ret

DebugColor_PlaceCursor:
	ld a, DEBUGTEST_BLACK
	hlcoord 10, 0
	ld [hl], a
	hlcoord 15, 0
	ld [hl], a
	hlcoord 1, 11
	ld [hl], a
	hlcoord 1, 13
	ld [hl], a
	hlcoord 1, 15
	ld [hl], a

	ld a, [wJumptableIndex]
	cp DEBUGCOLORMAIN_JOYPAD
	jp nz, ClearSprites

	ld a, [wDebugColorRGBJumptableIndex]
	and a
	jr z, .place_cursor
	dec a
	hlcoord 1, 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"

.place_cursor
	ld a, [wDebugColorCurColor]
	and a
	jr z, .light
; dark
	hlcoord 15, 0
	jr .place
.light
	hlcoord 10, 0
.place
	ld [hl], "▶"

	lb bc, $70, 5 ; b = initial tile id, c = initial palette
	ld hl, wShadowOAM
	ld de, wDebugRedChannel
	call .placesprite
	ld de, wDebugGreenChannel
	call .placesprite
	ld de, wDebugBlueChannel
.placesprite:
	ld a, b
	ld [hli], a ; y
	ld a, [de]
	add a
	add a
	add 3 * TILE_WIDTH
	ld [hli], a ; x
	xor a
	ld [hli], a ; tile id
	ld a, c
	ld [hli], a ; attributes
	ld a, 2 * TILE_WIDTH
	add b
	ld b, a
	inc c
	ret

DebugColor_AreYouFinishedString:
	db   "Done?"             			  ; Are you finished?
	next "Yes<DOT><DOT>", DEBUGTEST_A     ; YES..(A)
	next "No<DOT><DOT><DOT>", DEBUGTEST_B ; NO...(B)
	db   "@"

DebugColor_UpArrowGFX:
INCBIN "gfx/debug/up_arrow.2bpp"

DebugColor_GFX:
INCBIN "gfx/debug/color_test.2bpp"
