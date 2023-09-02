ClearBGPalettes::
	call ClearPalettes
WaitBGMap::
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ldh [hBGMapMode], a
; Wait for it to do its magic
	ld c, 3
	jp DelayFrames

WaitBGMap2::
	ldh a, [hCGB]
	and a
	jr z, WaitBGMap

	ld a, 2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
	jr WaitBGMap

IsCGB::
	ldh a, [hCGB]
	and a
	ret

ApplyTilemap::
	ldh a, [hCGB]
	and a
	jr z, WaitBGMap

	ld a, 1
	ld [hBGMapMode], a
	ld a, [wSpriteUpdatesEnabled]
	and a
	ld b, 3
	jr nz, SafeCopyTilemapAtOnce
	ld b, 1 << 3 | 3
	; fallthrough
SafeCopyTilemapAtOnce::
; copies the tile&attr map at once
; without any tearing
; input:
; b: 0 = no palette copy
;    1 = copy raw palettes
;    2 = set palettes and copy
;    3 = use whatever was in hCGBPalUpdate
; bit 2: if set, clear hOAMUpdate
; bit 3: if set, only update tilemap
	farjp _SafeCopyTilemapAtOnce

CGBOnly_CopyTilemapAtOnce::
	ldh a, [hCGB]
	and a
	jr z, WaitBGMap
	; fallthrough
CopyTilemapAtOnce::
	farjp _CopyTilemapAtOnce

SetPalettes::
; Inits the Palettes
; depending on the system the monochromes palettes or color palettes
	ldh a, [hCGB]
	and a
	jr nz, .SetPalettesForGameBoyColor
	ld a, %11100100
	ldh [rBGP], a
	ld a, %11010000
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

.SetPalettesForGameBoyColor:
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret

ClearPalettes::
; Make all palettes white

; CGB: make all the palette colors white
	ldh a, [hCGB]
	and a
	jr nz, .cgb

; DMG: just change palettes to 0 (white)
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

.cgb
	ldh a, [rSVBK]
	push af

	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

; Fill wBGPals2 and wOBPals2 with $ffff (white)
	ld hl, wBGPals2
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill

	pop af
	ldh [rSVBK], a

; Request palette update
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

GetMemSGBLayout::
	ld b, SCGB_DEFAULT
GetSGBLayout::
; load sgb packets unless dmg

	ldh a, [hCGB]
	and a
	jr nz, .sgb

	ldh a, [hSGB]
	and a
	ret z

.sgb
	predef_jump LoadSGBLayout

SetHPPal::
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret

GetHPPal::
; Get palette for hp bar pixel length e in d.
	ld d, HP_GREEN
	ld a, e
	cp (HP_BAR_LENGTH_PX * 50 / 100) ; 24
	ret nc
	inc d ; HP_YELLOW
	cp (HP_BAR_LENGTH_PX * 21 / 100) ; 10
	ret nc
	inc d ; HP_RED
	ret
