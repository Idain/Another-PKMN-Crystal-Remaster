BattleCommand_LeechSeed:
	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2
	call CheckSubstituteOpp
	jp nz, PrintDidntAffect2

	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok

	ld a, [de]
	cp GRASS
	jr z, .grass
	inc de
	ld a, [de]
	cp GRASS
	jr z, .grass

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .already_seeded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
	jp StdBattleTextbox

.grass
	call AnimateFailedMove
	jp PrintDidntAffect

.already_seeded
	call AnimateFailedMove
	ld hl, AlreadySeededText
	jp StdBattleTextbox
