; Functions dealing with palettes.

UpdatePalsIfCGB::
; update bgp data from wBGPals2
; update obp data from wOBPals2
; return carry if successful

; check cgb
	ldh a, [hCGB]
	and a
	ret z

UpdateCGBPals::
; return carry if successful
; any pals to update?
	ldh a, [hCGBPalUpdate]
	and a
	ret z
	; fallthrough

ForceUpdateCGBPals::
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, wBGPals2

; copy 8 pals to bgpd
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	lb bc, (8 / 2), LOW(rBGPD)
.bgp
rept (1 palettes) * 2
	ld a, [hli]
	ldh [c], a
endr

	dec b
	jr nz, .bgp

; hl is now wOBPals2

; copy 8 pals to obpd
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	lb bc, (8 / 2), LOW(rOBPD)
.obp
rept (1 palettes) * 2
	ld a, [hli]
	ldh [c], a
endr

	dec b
	jr nz, .obp

	pop af
	ldh [rSVBK], a

; clear pal update queue
	xor a
	ldh [hCGBPalUpdate], a

	scf
	ret

DmgToCgbBGPals::
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ldh [rBGP], a
	push af

; Don't need to be here if DMG
	ldh a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc

	ldh a, [rSVBK]
	push af

	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

; copy & reorder bg pal buffer
	ld hl, wBGPals2 ; to
	ld de, wBGPals1 ; from
; order
	ldh a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	pop bc
	pop de
	pop hl
.end
	pop af
	ret

DmgToCgbObjPals::
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ldh [rOBP0], a
	ld a, d
	ldh [rOBP1], a

	ldh a, [hCGB]
	and a
	ret z

	push hl
	push de
	push bc

	ldh a, [rSVBK]
	push af

	ld a, BANK(wOBPals2)
	ldh [rSVBK], a

; copy & reorder obj pal buffer
	ld hl, wOBPals2 ; to
	ld de, wOBPals1 ; from
; order
	ldh a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	pop bc
	pop de
	pop hl
	ret

DmgToCgbObjPal0::
	ldh [rOBP0], a
	push af

; Don't need to be here if not CGB
	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a

	ld hl, wOBPals2 palette 0
	ld de, wOBPals1 palette 0
	ldh a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

DmgToCgbObjPal1::
	ldh [rOBP1], a
	push af

	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a

	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	ldh a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

CopyPals::
; copy c palettes in order b from de to hl

	push bc
	ld c, NUM_PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	maskbits 1 << PAL_COLOR_SIZE
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

; dest
	pop hl
; write color
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; next pal color
rept PAL_COLOR_SIZE
	srl b
endr
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, PALETTE_SIZE
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret

DarkenColorByAQuarter::
	; Extract Red color and darken it
	ld a, [hl]
	and %00011111
	ld d, a
	srl d
	srl d
	sub d
	ld d, a
	; Store result back in red
	ld a, [hl]
	and %11100000
	or d
	ld [hl], a

	; Extract Green color and darken it
	ld a, [hli]
	and %11100000
	rrca
	swap a
	ld d, a ; d = 00000ggg
	ld a, [hld]
	and %00000011
	swap a
	rrca
	or d
	ld d, a
	srl d
	srl d
	sub d
	ld d, a
	; Store a back in green
	rlca
	swap a
	ld d, a
	and %11100000
	ld e, a
	ld a, d
	and %00000011
	ld d, a
	ld a, [hl]
	and %00011111
	or e
	ld [hli], a
	ld a, [hl]
	and %11111100
	or d
	ld [hl], a

	; Extract Blue color and darken it
;	ld a, [hl]
	and %01111100
	rrca
	rrca
	ld d, a
	srl d
	srl d
	sub d
	ld d, a
	; store color back in blue
	sla d
	sla d
	ld a, [hl]
	and %10000011
	or d
	ld [hld], a
	ret

ClearVBank1::
	ldh a, [hCGB]
	and a
	ret z

	ld a, 1
	ldh [rVBK], a

	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	xor a
	call ByteFill

;	xor a
	ldh [rVBK], a
	ret

ReloadSpritesNoPalettes::
	ldh a, [hCGB]
	and a
	ret z
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld bc, (8 palettes) + (2 palettes)
	xor a
	call ByteFill
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	jp DelayFrame
