HDMATransferAttrmapAndTilemapToWRAMBank3::
	call StackCallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call HDMATransferToWRAMBank3
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	jp HDMATransferToWRAMBank3

HDMATransferTilemapToWRAMBank3::
	call StackCallInSafeGFXMode

.Function:
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	jp HDMATransferToWRAMBank3

HDMATransferAttrmapToWRAMBank3:
	call StackCallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	jp HDMATransferToWRAMBank3

ReloadMapPart::
	call StackCallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer

	di
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call DoHBlankHDMATransfer_toBGMap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call DoHBlankHDMATransfer_toBGMap
	pop af
	ldh [rVBK], a
	reti

Mobile_ReloadMapPart:
	call StackCallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadTilemapForHDMATransfer

	di
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call HDMATransfer_NoDI
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	call HDMATransfer_NoDI
	pop af
	ldh [rVBK], a
	reti

Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap:
	call StackCallInSafeGFXMode

.Function:
	; Transfer wAttrmap and Tilemap to BGMap
	; Fill vBGAttrs with $00
	; Fill vBGTiles with $ff
	decoord 0, 0, wAttrmap
	ld hl, wScratchAttrmap
	call PadAttrmapForHDMATransfer
	ld c, $ff
	decoord 0, 0
	ld hl, wScratchTilemap
	call PadMapForHDMATransfer

	ld a, $1
	ldh [rVBK], a
	ld hl, wScratchAttrmap
	call DoHBlankHDMATransfer_toBGMap
	xor a
	ldh [rVBK], a
	ld hl, wScratchTilemap
	jr DoHBlankHDMATransfer_toBGMap

StackCallInSafeGFXMode:
	pop hl

	ldh a, [hBGMapMode]
	push af
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a
	ldh a, [rVBK]
	push af

	call _hl_

	pop af
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

HDMATransferToWRAMBank3:
	; Load HDMA Parameters
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	ldh [rHDMA2], a
	ldh a, [hBGMapAddress + 1]
	and $1f
	ldh [rHDMA3], a
	ldh a, [hBGMapAddress]
	ldh [rHDMA4], a

	ld a, $23
	ldh [hDMATransfer], a
	; fallthrough

WaitDMATransfer:
	jr .handleLoop ; no-optimize stub jump
.loop
	call DelayFrame
.handleLoop
	ldh a, [hDMATransfer]
	and a
	jr nz, .loop
	ret

DoHBlankHDMATransfer_toBGMap:
; HDMA transfer from hl to [hBGMapAddress]
; hBGMapAddress -> de
; (2 * SCREEN_HEIGHT) - 1 -> c
	ldh a, [hBGMapAddress + 1]
	ld d, a
	ldh a, [hBGMapAddress]
	ld e, a
	ld c, (2 * SCREEN_HEIGHT) - 1
	; [rHDMA1, rHDMA2] = hl & $fff0
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	and $f0 ; high nybble
	ldh [rHDMA2], a
	; [rHDMA3, rHDMA4] = de & $1ff0
	ld a, d
	and $1f ; lower 5 bits
	ldh [rHDMA3], a
	ld a, e
	and $f0 ; high nybble
	ldh [rHDMA4], a
	di
	ldh a, [rLY]
	add c ; calculate end LY
	cp $80 ; is the end LY greater than the max LY
	call nc, DI_DelayFrame ; if so, delay a frame to reset the LY
	set 7, c
.waitHBlank
	ldh a, [rSTAT]
	and rSTAT_MODE_MASK
	jr nz, .waitHBlank
	ld hl, rHDMA5
	ld [hl], c
	ld a, $ff
.waitHDMALoop
	cp [hl]
	jr nz, .waitHDMALoop
	reti

HDMATransfer_NoDI:
; HDMA transfer from hl to [hBGMapAddress]
; [hBGMapAddress] --> de
; 2 * SCREEN_HEIGHT --> c
	ldh a, [hBGMapAddress + 1]
	ld d, a
	ldh a, [hBGMapAddress]
	ld e, a
	ld c, 2 * SCREEN_HEIGHT

	; [rHDMA1, rHDMA2] = hl & $fff0
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	and $f0
	ldh [rHDMA2], a
	; [rHDMA3, rHDMA4] = de & $1ff0
	ld a, d
	and $1f
	ldh [rHDMA3], a
	ld a, e
	and $f0
	ldh [rHDMA4], a
	; b = c | %10000000
	dec c
	ld b, c
	set 7, b
	ldh a, [rLY]
	add c ; calculate end LY
	cp $7f ; is the end LY greater than the max LY
	call nc, DI_DelayFrame ; if so, delay a frame to reset the LY

	; while not [rSTAT] & rSTAT_MODE_MASK: pass
.noHBlankWait
	ldh a, [rSTAT]
	and rSTAT_MODE_MASK
	jr z, .noHBlankWait
	; load the 5th byte of HDMA
	ld hl, rHDMA5
	ld [hl], b
	ld a, $ff
.waitForHDMA
	cp [hl]
	jr nz, .waitForHDMA
	ret

DoHBlankHDMATransfer:
; a lot of waiting around for hardware registers
	; [rHDMA1, rHDMA2] = hl & $fff0
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	and $f0 ; high nybble
	ldh [rHDMA2], a
	; [rHDMA3, rHDMA4] = de & $1ff0
	ld a, d
	and $1f ; lower 5 bits
	ldh [rHDMA3], a
	ld a, e
	and $f0 ; high nybble
	ldh [rHDMA4], a
	; e = c | %10000000
	dec c ; c = number of LYs needed
	ld e, c
	set 7, e ; hblank dma transfers
	ldh a, [rLY]
	add c ; calculate end LY
	cp $7f ; is the end LY greater than the max LY
	call nc, DI_DelayFrame ; if so, delay a frame to reset the LY

	lb bc, rSTAT_MODE_MASK, LOW(rSTAT)
	; while not [rSTAT] & rSTAT_MODE_MASK: pass
.noHBlankWait
	ldh a, [c]
	and b
	jr z, .noHBlankWait
	; while [rSTAT] & rSTAT_MODE_MASK: pass
.hBlankWaitLoop
	ldh a, [c]
	and b
	jr nz, .hBlankWaitLoop
	; load the 5th byte of HDMA
	ld hl, rHDMA5
	ld [hl], e
	ld a, $ff
.waitForHDMA
	cp [hl]
	jr nz, .waitForHDMA
	ret

PadTilemapForHDMATransfer:
	ld c, " "
	jr PadMapForHDMATransfer

PadAttrmapForHDMATransfer:
	ld c, $0

PadMapForHDMATransfer:
; pad a 20x18 map to 32x18 for HDMA transfer
; back up the padding value in c to hMapObjectIndex
	ldh a, [hMapObjectIndex]
	push af
	ld a, c
	ldh [hMapObjectIndex], a

; for each row on the screen
	ld c, SCREEN_HEIGHT
.loop1
; for each tile in the row
	ld b, SCREEN_WIDTH
.loop2
; copy from de to hl
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop2

; load the original padding value of c into hl for 32 - 20 = 12 rows
	ldh a, [hMapObjectIndex]
	ld b, BG_MAP_WIDTH - SCREEN_WIDTH
.loop3
	ld [hli], a
	dec b
	jr nz, .loop3

	dec c
	jr nz, .loop1

; restore the original value of hMapObjectIndex
	pop af
	ldh [hMapObjectIndex], a
	ret

HDMATransfer2bpp::
	; 2bpp when [rLCDC] & $80
	; switch to WRAM bank 6
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a

	push bc
	push hl

	; Copy c tiles of the 2bpp from b:de to wScratchTilemap
	ld a, b ; bank
	ld l, c ; number of tiles
	ld h, $0
	; multiply by 16 (16 bytes of a 2bpp = 8 x 8 tile)
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	ld h, d ; address
	ld l, e
	ld de, wScratchTilemap
	call FarCopyBytes

	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, wScratchTilemap
	call DoHBlankHDMATransfer

	; restore the previous bank
	pop af
	ldh [rSVBK], a
	ret

HDMATransfer1bpp::
	; 1bpp when [rLCDC] & $80
.loop
	ld a, c
	cp $10
	jr c, .bankswitch
	jr z, .bankswitch
	push bc
	push hl
	push de
	ld c, $10
	call .bankswitch
	pop de
	ld hl, $80
	add hl, de
	ld d, h
	ld e, l
	pop hl
	lb bc, 1, 0
	add hl, bc
	pop bc
	ld a, c
	sub $10
	ld c, a
	jr .loop

.bankswitch
	ldh a, [rSVBK]
	push af
	ld a, BANK(wScratchTilemap)
	ldh [rSVBK], a

	push bc
	push hl

	ld a, b
	ld l, c
	ld h, $0
	add hl, hl ; multiply by 8
	add hl, hl ; multiply by 8
	add hl, hl ; multiply by 8
	ld c, l
	ld b, h
	ld h, d
	ld l, e
	ld de, wScratchTilemap
	call FarCopyBytesDouble_DoubleBankSwitch

	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, wScratchTilemap
	call DoHBlankHDMATransfer

	pop af
	ldh [rSVBK], a
	ret

HDMATransfer_OnlyTopFourRows:
	call StackCallInSafeGFXMode

.Function:
	ld hl, wScratchTilemap
	decoord 0, 0
	call .Copy
	ld hl, wScratchTilemap + $80
	decoord 0, 0, wAttrmap
	call .Copy
	di
	ld a, $1
	ldh [rVBK], a
	ld c, $8
	ld hl, wScratchTilemap + $80
	debgcoord 0, 0, vBGMap1
	call DoHBlankHDMATransfer
	xor a
	ldh [rVBK], a
	ld c, $8
	ld hl, wScratchTilemap
	debgcoord 0, 0, vBGMap1
	call DoHBlankHDMATransfer
	reti

.Copy:
	ld b, 4
.outer_loop
	ld c, SCREEN_WIDTH
.inner_loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .inner_loop
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	; hl += a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	dec b
	jr nz, .outer_loop
	ret

DI_DelayFrame:
	ldh a, [rLY]
	push bc
	ld b, a
.loop
	ldh a, [rLY]
	and a
	jr z, .done
	cp b
	jr nc, .loop
.done
	pop bc
	ret
