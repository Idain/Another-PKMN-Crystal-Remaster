BattleCommand_SleepTalk:
; sleeptalk
	
	call ClearLastMove
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonMoves + 1
	ld a, [wDisabledMove]
	ld d, a
	jr z, .got_moves
	ld hl, wEnemyMonMoves + 1
	ld a, [wEnemyDisabledMove]
	ld d, a
.got_moves
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	call .safely_check_has_usable_move
	jr c, .fail
	dec hl
.sample_move
	push hl
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .sample_move
	ld e, a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp e
	jr z, .sample_move
	ld a, e
	cp d
	jr z, .sample_move
	call .check_unselectable_move
	jr c, .sample_move
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, e
	ld [hl], a
	call CheckUserIsCharging
	jr nz, .charging
	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wBattleAnimParam], a
.charging
	call LoadMoveAnim
	call UpdateMoveData
	jp ResetTurn

.fail
	call AnimateFailedMove
	jp TryPrintButItFailed

.safely_check_has_usable_move
	push hl
	push de
	push bc
	call .check_has_usable_move
	pop bc
	pop de
	pop hl
	ret

.check_has_usable_move
	ldh a, [hBattleTurn]
	and a
	ld a, [wDisabledMove]
	jr z, .got_move_2

	ld a, [wEnemyDisabledMove]
.got_move_2
	ld b, a  ; Contains possible disabled move
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld c, a  ; Current move, aka Sleep Talk.
	dec hl
	ld d, NUM_MOVES
.loop2
	ld a, [hl]
	and a
	jr z, .carry

	cp c
	jr z, .nope
	cp b
	jr z, .nope

	call .check_unselectable_move
	jr nc, .no_carry

.nope
	inc hl
	dec d
	jr nz, .loop2

.carry
	scf
	ret

.no_carry
	and a
	ret

.check_unselectable_move  
; If move can´t be selected, set Carry flag.
	push hl
	push de
	push bc

	ld b, a
	callfar GetMoveAnim
	ld a, b
	ld hl, SleepTalk_unallowed_moves
	call IsInByteArray

	pop bc
	pop de
	pop hl
	ret

INCLUDE "engine/battle/list_moves/SleepTalk_unallowed_moves.asm"
