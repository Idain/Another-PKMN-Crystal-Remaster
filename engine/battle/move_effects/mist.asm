BattleCommand_Mist:
; mist

	ld hl, wPlayerScreens
	ld de, wPlayerMistCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemyMistCount
.ok
	bit SCREENS_MIST, [hl]
	jr nz, .already_mist
	set SCREENS_MIST, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextbox
/*
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_MIST, [hl]
	jr nz, .already_mist
	set SUBSTATUS_MIST, [hl]
	call AnimateCurrentMove
	ld hl, MistText
	jp StdBattleTextbox
*/
.already_mist
	call AnimateFailedMove
	jp PrintButItFailed
