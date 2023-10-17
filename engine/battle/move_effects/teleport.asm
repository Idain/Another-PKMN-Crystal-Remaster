BattleCommand_Teleport:
	ld a, [wBattleType]
	cp BATTLETYPE_TRAP ; or BATTLETYPE_FORCESHINY, BATTLETYPE_LEGENDARY
	jr nc, .failed

	; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr z, .run_away
	; fallthrough
.failed
	call AnimateFailedMove
	jp PrintButItFailed

.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wBattleAnimParam], a
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 15
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextbox
