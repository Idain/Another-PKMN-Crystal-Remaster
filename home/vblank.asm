; VBlank is the interrupt responsible for updating VRAM.

; In Pokemon Crystal, VBlank has been hijacked to act as the
; main loop. After time-sensitive graphics operations have been
; performed, joypad input and sound functions are executed.

; This prevents the display and audio output from lagging.

VBlank::
	push af
	push bc
	push de
	push hl

	ldh a, [hROMBank]
	ldh [hROMBankBackup], a

	ldh a, [hVBlank]
	cp 7
	jr z, .skipToGameTime

	and 7
	add a

	ld e, a
	ld d, 0
	ld hl, .VBlanks
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

.doGameTime
	call GameTimer

	ld a, TRUE
	ldh [hVBlankOccurred], a

	ldh a, [hROMBankBackup]
	rst Bankswitch

	pop hl
	pop de
	pop bc
	pop af
	reti

.skipToGameTime
	call AnimateTileset
	jr .doGameTime

.VBlanks:
	dw VBlank0 ; 0
	dw VBlank1 ; 1
	dw VBlank2 ; 2
	dw VBlank1 ; 3
	dw VBlank4 ; 4
	dw VBlank5 ; 5
	dw VBlank6 ; 6
	dw VBlank7 ; 7

VBlank0::
; normal operation

; rng
; scx, scy, wy, wx
; bg map buffer
; palettes
; dma transfer
; bg map
; tiles
; oam
; joypad
; sound

	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	ldh a, [hWY]
	ldh [rWY], a
	ldh a, [hWX]
	ldh [rWX], a

	; There's only time to call one of these in one vblank.
	; Calls are in order of priority.

	call UpdateBGMapBuffer
	jr c, .done
	call UpdatePalsIfCGB
	jr c, .done
	call DMATransfer
	jr c, .done
	call UpdateBGMap

	; These have their own timing checks.

	call Serve2bppRequest
	call Serve1bppRequest
	call AnimateTileset

.done

	call PushOAM
	; vblank-sensitive operations are done

	; inc frame counter
	ld hl, hVBlankCounter
	inc [hl]

	; advance random variables
	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomAdd]
	adc b
	ldh [hRandomAdd], a

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a

	ld a, TRUE
	ldh [hVBlankOccurred], a

	ld a, [wOverworldDelay]
	and a
	jr z, .ok
	dec a
	ld [wOverworldDelay], a
.ok

	ld a, [wTextDelayFrames]
	and a
	jr z, .ok2
	dec a
	ld [wTextDelayFrames], a
.ok2

	call UpdateJoypad
	; fallthrough

VBlankUpdateSound::
; sound only

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	jp _UpdateSound

VBlank2::
	call AnimateTileset
	jr VBlankUpdateSound

VBlank1::
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a

	call UpdateCGBPals
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest
	call LYOverrideStackCopy

.done
	call PushOAM

	; get requested ints
	ldh a, [rIE]
	push af
	ldh a, [rIF]
	push af

	xor a
	ldh [rIF], a

	ei
	call VBlankUpdateSound
	di

	; request lcdstat
	ldh a, [rIF]
	ld b, a
	; and any other ints
	pop af
	or b
	ld b, a
	; reset ints
	xor a
	ldh [rIF], a
	; enable ints besides joypad
	pop af
	ldh [rIE], a
	; request ints
	ld a, b
	ldh [rIF], a
	ret

VBlank4::
; bg map
; tiles
; oam
; joypad
; serial
; sound

	call UpdateBGMap
	call Serve2bppRequest

	call PushOAM

	call UpdateJoypad

	call AskSerial

	jr VBlankUpdateSound

VBlank5::
; scx
; palettes
; bg map
; tiles
; joypad
; sound

	ldh a, [hSCX]
	ldh [rSCX], a

	call UpdatePalsIfCGB
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest

.done
	call UpdateJoypad

	xor a
	ldh [rIF], a
	ldh a, [rIE]
	push af

	ei
	call VBlankUpdateSound
	di

	xor a
	ldh [rIF], a
	; enable usual interrupts
	pop af
	ldh [rIE], a
	ret

VBlank6::
; palettes
; tiles
; dma transfer
; sound

	; inc frame counter
	ld hl, hVBlankCounter
	inc [hl]

	call UpdateCGBPals
	jr c, .done

	call Serve2bppRequest
	call Serve1bppRequest
	call DMATransfer
.done
	jp VBlankUpdateSound

VBlank7::
; special vblank routine
; copies tilemap in one frame without any tearing
; also updates oam, and pals if specified
	ld a, BANK(VBlankSafeCopyTilemapAtOnce)
	rst Bankswitch
	jp VBlankSafeCopyTilemapAtOnce
