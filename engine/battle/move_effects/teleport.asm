BattleCommand_Teleport:
	ld a, [wBattleType]
	cp BATTLETYPE_TRAP ; or BATTLETYPE_FORCESHINY, BATTLETYPE_LEGENDARY
	jp nc, FailedTeleport

	ldh a, [hBattleTurn]
	and a
	jr nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedTeleport

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 15
	call DelayFrames

; Transition into switchmon menu
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu

	farcall ForcePickSwitchMonInBattle

; Return to battle scene
	call ClearPalettes
	farcall LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld c, 30
	call DelayFrames

	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox

	ld a, [wCurPartyMon]
	ld [wCurBattleMon], a
	farcall AddBattleParticipant
	farcall InitBattleMon
	farcall ResetPlayerStatLevels
	farcall SendOutPlayerMon
	farcall EmptyBattleTextbox
	call LoadTilemapToTempTilemap
	call SetPlayerTurn
	farcall SpikesDamage
	jp ResetBatonPassStatus
	
.Enemy:
	; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jr z, .run_away

	call CheckAnyOtherAliveEnemyMons
	jr z, FailedTeleport

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	farcall ResetEnemyStatLevels
	farcall EnemySwitch_SetMode
	farcall ResetBattleParticipants
	farcall SpikesDamage
	jp ResetBatonPassStatus

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

FailedTeleport:
	call AnimateFailedMove
	jp PrintButItFailed
