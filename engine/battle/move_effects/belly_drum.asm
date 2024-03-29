BattleCommand_BellyDrum:
	farcall GetHalfMaxHP
	farcall CheckUserHasEnoughHP
	jr nc, .failed

	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	farcall SubtractHPFromUser
	call UpdateUserInParty
	ld a, MAX_STAT_LEVEL - BASE_STAT_LEVEL

.max_attack_loop
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .max_attack_loop

	ld hl, BellyDrumText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
