UpdateItemDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ld a, [wMenuSelection]
	inc a
	ret z
	decoord 1, 14
	farcall PrintItemDescription
	ret
