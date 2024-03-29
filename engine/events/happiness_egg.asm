GetFirstPokemonHappiness:
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartySpecies
.loop
	ld a, [de]
	cp EGG
	jr nz, .done
	inc de
	add hl, bc
	jr .loop

.done
	ld [wNamedObjectIndex], a
	ld a, [hl]
	ld [wScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

CheckFirstMonIsEgg:
	ld a, [wPartySpecies]
	ld [wNamedObjectIndex], a
	cp EGG
	ld a, TRUE
	jr z, .egg
	xor a ; FALSE

.egg
	ld [wScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

ChangeHappiness:
; Perform happiness action c on wCurPartyMon

	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	cp EGG
	ret z

	ld a, MON_HAPPINESS
	call GetPartyParamLocation

	ld d, h
	ld e, l

	push de
	ld a, [de]
	cp HAPPINESS_THRESHOLD_1
	ld e, 0
	jr c, .ok
	inc e
	cp HAPPINESS_THRESHOLD_2
	jr c, .ok
	inc e

.ok
	dec c
	ld b, 0
	ld hl, HappinessChanges
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, 0
	add hl, de
	pop de
	; If happiness change is 0, don't modify anything.
	ld a, [hl]
	and a
	jr z, .done2
	ld b, a
	add a
	jr c, .negative

	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	cp SOOTHE_BELL
	jr nz, .continue

	ld a, b
	inc a
	srl a
	add b
	ld b, a
	; fallthrough
.continue
	ld a, [de]
	add b
	jr nc, .done
	ld a, $ff
	jr .done

.negative
	ld a, [de]
	add b
	jr c, .done
	xor a
	; fallthrough
.done
	ld [de], a
.done2
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wPartyMenuCursor]
	cp b
	ret nz
	ld a, [de]
	ld [wBattleMonHappiness], a
	ret

INCLUDE "data/events/happiness_changes.asm"

StepHappiness::
; Raise the party's happiness by 1 point every step cycle.

	ld de, wPartyCount
	ld a, [de]
	and a
	ret z

	ld c, a
	ld hl, wPartyMon1Happiness
.loop
	inc de
	ld a, [de]
	cp EGG
	jr z, .next
	inc [hl]
	jr nz, .SootheBellCheck
	dec [hl]
	jr .next
    
.SootheBellCheck:
    push hl
	push bc
	ld bc, MON_ITEM - MON_HAPPINESS
	add hl, bc
	pop bc

    ld a, [hl]
    pop hl
    cp SOOTHE_BELL
    jr nz, .next
    
    inc [hl]
    jr nz, .next
    dec [hl]
	; fallthrough
.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec c
	jr nz, .loop
	ret

DayCareStep::
; Raise the experience of Day-Care Pokémon every step cycle.

	ld a, [wDayCareMan]
	bit DAYCAREMAN_HAS_MON_F, a
	jr z, .day_care_lady

	ld a, [wBreedMon1Level] ; level
	cp MAX_LEVEL
	jr nc, .day_care_lady
	ld hl, wBreedMon1Exp + 2 ; exp
	inc [hl]
	jr nz, .day_care_lady
	dec hl
	inc [hl]
	jr nz, .day_care_lady
	dec hl
	inc [hl]
	ld a, [hl]
	cp HIGH(MAX_DAY_CARE_EXP >> 8)
	jr c, .day_care_lady
	ld [hl], HIGH(MAX_DAY_CARE_EXP >> 8)

.day_care_lady
	ld a, [wDayCareLady]
	bit DAYCARELADY_HAS_MON_F, a
	jr z, .check_egg

	ld a, [wBreedMon2Level] ; level
	cp MAX_LEVEL
	jr nc, .check_egg
	ld hl, wBreedMon2Exp + 2 ; exp
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	ld a, [hl]
	cp HIGH(MAX_DAY_CARE_EXP >> 8)
	jr c, .check_egg
	ld [hl], HIGH(MAX_DAY_CARE_EXP >> 8)

.check_egg
	ld hl, wDayCareMan
	bit DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	ret z
	ld hl, wStepsToEgg
	dec [hl]
	ret nz

	call Random
	ld [hl], a
	farcall CheckBreedmonCompatibility
	ld a, [wBreedingCompatibility]
	cp 230
	ld b, 70 percent + 1
	jr nc, .okay
	cp 125
	ld b, 50 percent + 1
	jr nc, .okay
	ld b, 20 percent

.okay
	call Random
	cp b
	ret nc
	ld hl, wDayCareMan
	res DAYCAREMAN_MONS_COMPATIBLE_F, [hl]
	set DAYCAREMAN_HAS_EGG_F, [hl]
	ret
