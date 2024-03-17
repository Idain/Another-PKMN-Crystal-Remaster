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

SafeHDMATransfer::
; Copy c 2bpp tiles from b:de to hl using GDMA. Assumes $00 < c <= $80.
	dec c
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	; load the source and target MSB and LSB
	ld a, d
	ldh [rHDMA1], a ; source MSB
	ld a, e
	ldh [rHDMA2], a ; source LSB
	ld a, h
	ldh [rHDMA3], a ; target MSB
	ld a, l
	ldh [rHDMA4], a ; target LSB

	; if LCD is disabled, just run all of it
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr nz, .lcd_enabled

	ld a, c
	ldh [rHDMA5], a
	jr .done

.lcd_enabled
	push de
	di
.loop
	ld a, c
	cp 3
	ld d, c
	jr c, .got_tilecopy
	ld d, 2
.got_tilecopy
	push bc
	lb bc, rSTAT_MODE_MASK, LOW(rSTAT)
.wait_hblank1
	ld a, [c]
	and b
	jr z, .wait_hblank1
.wait_hblank2
	ld a, [c]
	and b
	jr nz, .wait_hblank2

	ld a, d
	ldh [rHDMA5], a
	pop bc
	ld a, c
	sub 3
	ld c, a
	jr nc, .loop
	ei
	pop de
.done
	pop af
	rst Bankswitch
	pop af
	ldh [hBGMapMode], a
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

CheckGDMA:
; Check if we can use GDMA. Return carry if we can.
	ldh a, [hCGB]
	and a
	ret z

	; The 4 least significant bits must be zero.
	ld a, e
	or l
	and $f
	ret nz

	; Must be a copy from non-VRAM to VRAM.
	ld a, d
	sub $80
	cp $20
	ccf
	ret nc
	ld a, h
	sub $80
	cp $20
	ret nc

	; Must not be a copy of >$80 tiles.
	ld a, c
	dec a
	add a
	ccf
	ret

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	call CheckGDMA
	jmp c, SafeHDMATransfer

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
	call CheckGDMA
	jmp c, SafeHDMATransfer

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM
	ld b, c
	di
	call _Serve2bppRequest

	pop af
	rst Bankswitch
	reti

Get1bpp::
; copy c 1bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp
	; fallthrough

Copy1bpp::
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM
	ld b, c
	di
	call _Serve1bppRequest

	pop af
	rst Bankswitch
	reti

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
	and rSTAT_MODE_MASK
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and rSTAT_MODE_MASK
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
	lb bc, rSTAT_MODE_MASK, LOW(rSTAT)
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
	and rSTAT_MODE_MASK
	jr z, .waitNoHBlank
.waitHBlank
	ldh a, [rSTAT]
	and rSTAT_MODE_MASK
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
