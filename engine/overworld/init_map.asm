ReanchorBGMap_NoOAMUpdate::
	ldh a, [hOAMUpdate]
	push af

	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh [hLCDCPointer], a
	ldh [hBGMapMode], a
	ld a, $90
	ldh [hWY], a
	call LoadMapPart
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	farcall LoadOW_BGPal7
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	call HDMATransfer_FillBGMap0WithBlack
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld [wBGMapAnchor], a
	ld a, HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a

	call ApplyBGMapAnchorToObjects

	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a

	ld hl, wVramState
	set 6, [hl]
	ret

LoadFonts_NoOAMUpdate::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	farcall LoadFontsExtra
	ld a, $90
	ldh [hWY], a
	call SafeUpdateSprites
	farcall LoadStandardFont

	pop af
	ldh [hOAMUpdate], a
	ret

HDMATransfer_FillBGMap0WithBlack:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld a, "■"
	ld hl, wDecompressScratch
	ld bc, wScratchAttrmap - wDecompressScratch
	call ByteFill
	ld a, HIGH(wDecompressScratch)
	ldh [rHDMA1], a
	ld a, LOW(wDecompressScratch)
	ldh [rHDMA2], a
	ld a, HIGH(vBGMap0 - VRAM_Begin)
	ldh [rHDMA3], a
	ld a, LOW(vBGMap0 - VRAM_Begin)
	ldh [rHDMA4], a
	ld a, $3f
	ldh [hDMATransfer], a
	call DelayFrame

	pop af
	ldh [rSVBK], a
	ret
