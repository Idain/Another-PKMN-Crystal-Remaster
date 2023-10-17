BattleCommand_BatonPass:
	ldh a, [hBattleTurn]
	and a
	jr nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedBatonPass

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

	farcall PassedBattleMonEntrance

	jp ResetBatonPassStatus

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jp z, FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jp z, FailedBatonPass

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	farcall EnemySwitch_SetMode
	farcall ResetBattleParticipants
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	farcall ApplyStatLevelMultiplierOnAllStats

	farcall SpikesDamage

	jr ResetBatonPassStatus

BatonPass_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	farcall LinkBattleSendReceiveAction
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

BatonPass_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	farcall LinkBattleSendReceiveAction

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jp c, CloseWindow

.baton_pass
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
	jp CloseWindow

FailedBatonPass:
	call AnimateFailedMove
	jp PrintButItFailed

ResetBatonPassStatus:
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	jr nz, .ok

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
.ok

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wPlayerSubStatus5

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	xor a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ret

CheckAnyOtherAliveMons:
; These return nz if any is alive
	ldh a, [hBattleTurn]
	and a
	jr nz, CheckAnyOtherAliveEnemyMons
	; fallthrough
CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld de, wCurBattleMon
	ld a, [wPartyCount]
	jr DoCheckAnyOtherAliveMons
CheckAnyOtherAliveOpponentMons:
	ldh a, [hBattleTurn]
	and a
	jr nz, CheckAnyOtherAlivePartyMons
	; fallthrough
CheckAnyOtherAliveEnemyMons:
	ld a, [wBattleMode]
	dec a
	ret z
	ld hl, wOTPartyMon1HP
	ld de, wCurOTMon
	ld a, [wOTPartyCount]
	; fallthrough
DoCheckAnyOtherAliveMons:
	ld b, a
	ld a, [de]
	ld e, a
	ld d, b
	inc e
	; - 1 to account for the hl++
	ld bc, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr z, .not_alive

	; Ignore current mon
	dec e
	jr z, .not_alive2
	ret
.not_alive
	dec e
.not_alive2
	add hl, bc
	dec d
	jr nz, .loop
	ret