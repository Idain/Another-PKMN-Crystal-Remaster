GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret

ReadTrainerParty:
	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH
	xor a
	call ByteFill

	ld a, [wOtherTrainerClass]
	cp CAL
	jr nz, .not_cal2
	ld a, [wOtherTrainerID]
	cp CAL2
	jr z, .cal2
	ld a, [wOtherTrainerClass]
.not_cal2

	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a	
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	call GetNextTrainerDataByte
	inc a
	jr nz, .loop
	jr .skip_trainer

.got_trainer
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .got_trainer ; Skip name.

	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a
	ld d, h
	ld e, l
	call ReadTrainerPartyPieces
	jp ComputeTrainerReward

.cal2
	ld a, BANK(sMysteryGiftTrainer)
	call OpenSRAM
	ld a, TRAINERTYPE_MOVES
	ld [wOtherTrainerType], a
	ld de, sMysteryGiftTrainer
	call ReadTrainerPartyPieces
	call CloseSRAM
	jp ComputeTrainerReward

ReadTrainerPartyPieces:
	ld h, d
	ld l, e

.loop
; end?
	call GetNextTrainerDataByte
	cp -1
	ret z

; level
	ld [wCurPartyLevel], a

; species
	call GetNextTrainerDataByte
	ld [wCurPartySpecies], a

; add to party
	ld a, OTPARTYMON
	ld [wMonType], a
	push hl
	predef TryAddMonToParty
	pop hl

; nickname?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_NICKNAME_F, a
	jr z, .no_nickname

	push de
	ld de, wStringBuffer2
.copy_nickname
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy_nickname

	push hl
	ld a, [wOTPartyCount]
	ld hl, wOTPartyMonNicknames - MON_NAME_LENGTH
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	pop de

.no_nickname
; dvs?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_DVS_F, a
	jr z, .no_dvs

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1DVs
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

; When reading DVs, treat PERFECT_DV Sas $ff
	call GetNextTrainerDataByte
	and a ; cp PERFECT_DVS
	jr nz, .atk_def_dv_ok
	ld a, $ff
.atk_def_dv_ok
	ld [de], a
	inc de
	call GetNextTrainerDataByte
	and a ; cp PERFECT_DVS
	jr nz, .spd_spc_dv_ok
	ld a, $ff
.spd_spc_dv_ok
	ld [de], a

.no_dvs
; evs?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_EVS_F, a
	jr z, .no_evs

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1EVs
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl
	ld c, NUM_STATS
.evs_loop
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	dec c
	jr nz, .evs_loop

.no_evs
; happpiness?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_HAPPINESS_F, a
	jr z, .no_happiness

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Happiness
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	cp MAX_HAPPINESS
	jr nz, .happiness_ok
	ld a, $ff
.happiness_ok
	ld [de], a
	
.no_happiness
; item?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ITEM_F, a
	jr z, .no_item

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	ld [de], a
.no_item
; moves?
	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_MOVES_F, a
	jr z, .no_moves

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	call GetPartyLocation
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp

.copied_pp
	pop hl
.no_moves
; Custom DVs or EVs affect stats, so recalculate them 
; after TryAddMonToParty
	ld a, [wOtherTrainerType]
	and TRAINERTYPE_DVS | TRAINERTYPE_EVS
	jr z, .no_stat_recalc

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1MaxHP
	call GetPartyLocation
	ld d, h
	ld e, l

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1EVs - 1
	call GetPartyLocation

; recalculate stats
	ld b, TRUE
	push de
	predef CalcMonStats
	pop hl

; copy max HP to current HP
	inc hl
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, c
	ld [hld], a
	ld [hl], b
	pop hl
.no_stat_recalc
	jp .loop

ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	ld a, [wCurPartyLevel]
	ld [hl], a ; hMultiplier
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

Battle_GetTrainerName::
	ld a, [wInBattleTowerBattle]
	and a
	ld hl, wOTPlayerName
	ld a, BANK(@)
	ld [wTrainerGroupBank], a
	jp nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a

GetTrainerName::
	ld a, c
	ld hl, wRivalName
	cp RIVAL1
	jr z, CopyTrainerName
	cp RIVAL2
	jr z, CopyTrainerName
	cp CAL
	jr nz, .not_cal2
	; fallthrough

	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, [sMysteryGiftTrainerHouseFlag]
	and a
	call CloseSRAM
	jr z, .not_cal2

	ld a, BANK(sMysteryGiftPartnerName)
	call OpenSRAM
	ld hl, sMysteryGiftPartnerName
	call CopyTrainerName
	jp CloseSRAM

.not_cal2
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	call GetNextTrainerDataByte
	cp -1
	jr nz, .skip
	jr .loop

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
	call FarCopyBytes
	pop de
	ret

INCLUDE "data/trainers/party_pointers.asm"

SetTrainerBattleLevel:
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.skip_party
	ld a, [hli]
	inc a
	jr nz, .skip_party
	jr .skip_trainer

.got_trainer
	ld a, [hli]
	cp "@"
	jr nz, .got_trainer ; Skip name.

	inc hl
	ld a, [hl]
	ld [wCurPartyLevel], a
	ret