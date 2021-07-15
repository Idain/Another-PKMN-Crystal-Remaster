DrawKrisPackGFX:
	ld hl, PackFGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, vTiles2 tile $50
	lb bc, BANK(PackFGFX), 20
	jp Request2bpp

PackFGFXPointers:
	dw PackFGFX + (20 tiles) * 0 ; ITEM_POCKET
	dw PackFGFX + (20 tiles) * 1 ; MEDICINE_POCKET
	dw PackFGFX + (20 tiles) * 2 ; BALL_POCKET	
	dw PackFGFX + (20 tiles) * 3 ; TM_HM_POCKET
	dw PackFGFX + (20 tiles) * 4 ; BERRY_POCKET
	dw PackFGFX + (20 tiles) * 5 ; KEY_ITEM_POCKET


PackFGFX:
INCBIN "gfx/pack/pack_f.2bpp"
