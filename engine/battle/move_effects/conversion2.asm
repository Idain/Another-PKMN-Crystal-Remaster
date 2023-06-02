BattleCommand_Conversion2:
	ld a, [wAttackMissed]
	and a
	jp nz, FailMove
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, FailMove
	push hl
	ld hl, (Moves + MOVE_TYPE) - MOVE_LENGTH
	call GetMoveAttr
	and TYPE_MASK
	ld d, a
	pop hl
	call BattleCommand_SwitchTurn

.loop
	call BattleRandom
	maskbits NUM_TYPES
	cp NUM_TYPES
	jr nc, .loop
.okay
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	push af
	push hl
	ld a, d
	ld [hl], a
	call BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop
	call BattleCommand_SwitchTurn

	ld a, [hl]
	ld [wNamedObjectIndex], a
	predef GetTypeName
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextbox
