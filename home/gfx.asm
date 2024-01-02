DEF TILES_PER_CYCLE EQU 8
DEF MOBILE_TILES_PER_CYCLE EQU 6

Get2bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy2bpp

	homecall HDMATransfer2bpp

	ret

Get1bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	homecall HDMATransfer1bpp

	ret

FarCopyBytesDouble_DoubleBankSwitch::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call FarCopyBytesDouble

	pop af
	rst Bankswitch
	ret

DecompressRequest2bpp::
	push de
	ld a, BANK(sScratch)
	call OpenSRAM
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
	call Request2bpp
	jp CloseSRAM

FarCopyBytes::
; copy bc bytes from a:hl to de

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM
	ldh a, [rLY]
	cp $88
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_CYCLE
	ldh [hRequested2bppSize], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested2bppSize]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_CYCLE
	ldh [hRequested2bppSize], a
	call DelayFrame
	ldh a, [hRequested2bppSize]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy2bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM
	ldh a, [rLY]
	cp $88
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested1bppSize]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_CYCLE
	ldh [hRequested1bppSize], a
	call DelayFrame
	ldh a, [hRequested1bppSize]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy1bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

WriteVCopyRegistersToHRAM:
	ld a, c
	ldh [hTilesPerCycle], a
	ld a, e
	ldh [hRequestedVTileSource], a
	ld a, d
	ldh [hRequestedVTileSource + 1], a
	ld a, l
	ldh [hRequestedVTileDest], a
	ld a, h
	ldh [hRequestedVTileDest + 1], a
	ret

Get2bpp::
; copy c 2bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp
	; fallthrough

Copy2bpp:
	rst SwapHLDE

; bank
	ld a, b

; bc = c * LEN_2BPP_TILE
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes

Get1bpp::
; copy c 1bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr nz, Request1bpp
	; fallthrough

Copy1bpp::
	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * LEN_1BPP_TILE
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble

HBlankCopy1bpp:
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jr .innerLoop

.outerLoop
	ldh a, [rLY]
	cp $88
	jr nc, ContinueHBlankCopy
.innerLoop
	pop bc
	pop de
.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank
	ld a, c
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
	ld a, l
	and $f
	jr nz, .innerLoop
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop
	jr DoneHBlankCopy

ContinueHBlankCopy:
	ld [hRequestedVTileSource], sp
	ld sp, hl
	ld [hRequestedVTileDest], sp
	scf
DoneHBlankCopy:
	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	reti

HBlankCopy2bpp::
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest + 1
	ld a, [hld]
	ld l, [hl]
	ld h, a

	sub HIGH(VRAM_Begin)
	cp HIGH(VRAM_End) - HIGH(VRAM_Begin)
	jr nc, .innerLoop

; VRAM to VRAM copy
	lb bc, %11, rSTAT & $ff
	jr .waitNoHBlank2
.outerLoop2
	ldh a, [rLY]
	cp $88
	jr nc, ContinueHBlankCopy
.waitNoHBlank2
	ldh a, [c]
	and b
	jr z, .waitNoHBlank2
.waitHBlank2
	ldh a, [c]
	and b
	jr nz, .waitHBlank2
rept 4
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr
	ld a, l
	and $f
	jr nz, .waitNoHBlank2
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop2
	jr DoneHBlankCopy

.outerLoop
	ldh a, [rLY]
	cp $88
	jr nc, ContinueHBlankCopy
.innerLoop
	pop bc
	pop de
.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 2
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr
	ld a, l
	and $f
	jr nz, .innerLoop
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop
	jp DoneHBlankCopy
