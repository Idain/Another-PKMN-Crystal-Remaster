GiveDratini:
; Change the moveset of the last Dratini in the party.
; Give it a special moveset with Extremespeed.

	ld bc, wPartyCount
	ld a, [bc]
	dec a
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
.CheckForDratini:
; start at the end of the party and search backwards for a Dratini
	ld a, [hl]
	cp DRATINI
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForDratini
	ret

.GiveMoveset:
	; Insert Extremespeed in Pokémon's first move slot
	ld de, MON_MOVES - MON_SPECIES
	add hl, de
	ld a, EXTREMESPEED ; no-optimize *hl = N
	ld [hl], a

	; get the PP of the new move
	push hl
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl

	; get the address of the move's PP and update the PP
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a
	ret

