AI_SwitchOrTryItem:
	and a

	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

	farcall CheckEnemyLockedIn
	ret nz

	ld hl, wEnemyMonType1
	ld a, [hli]
	cp GHOST
	jr z, .try_switch
	ld a, [hl]
	cp GHOST
	jr z, .try_switch

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jp nz, AI_TryItem

	ld a, [wEnemyWrapCount]
	and a
	jp nz, AI_TryItem

.try_switch
	; always load the first trainer class in wTrainerClass for Battle Tower trainers
	ld hl, TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH
	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .ok

	ld a, [wTrainerClass]
	dec a
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes

.ok
	bit SWITCH_RARELY_F, [hl]
	jr nz, SwitchRarely
	bit SWITCH_SOMETIMES_F, [hl]
	jp nz, SwitchSometimes
	bit SWITCH_OFTEN_F, [hl]	
	jp z, AI_TryItem
	; fallthrough
SwitchOften:
	callfar CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jp z, AI_TryItem

	cp $10
	jr nz, .not_10
	call Random
	cp 50 percent + 1
	jr c, .switch
	jp AI_TryItem

.not_10
	cp $20
	jr nz, .not_20
	call Random
	cp 79 percent - 1
	jr c, .switch
	jp AI_TryItem

.not_20
	; $30
	call Random
	cp 4 percent
	jp c, AI_TryItem

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	; In register 'a' is the number (1-6) of the mon to switch to
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch

SwitchRarely:
	callfar CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jr z, AI_TryItem

	cp $10
	jr nz, .not_10
	call Random
	cp 8 percent
	jr c, .switch
	jr AI_TryItem

.not_10
	cp $20
	jr nz, .not_20
	call Random
	cp 12 percent
	jr c, .switch
	jr AI_TryItem

.not_20
	; $30
	call Random
	cp 79 percent - 1
	jr c, AI_TryItem

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch

SwitchSometimes:
	callfar CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jr z, AI_TryItem

	cp $10
	jr nz, .not_10
	call Random
	cp 20 percent - 1
	jr c, .switch
	jr AI_TryItem

.not_10
	cp $20
	jr nz, .not_20
	call Random
	cp 50 percent + 1
	jr c, .switch
	jr AI_TryItem

.not_20
	; $30
	call Random
	cp 20 percent - 1
	jr c, AI_TryItem

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch

AI_TryItem:
	; items are not allowed in the Battle Tower
	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	ld a, [wEnemyTrainerItem1]
	ld b, a
	ld a, [wEnemyTrainerItem2]
	or b
	ret z

	call .IsHighestLevel
	ret nc

	ld a, [wTrainerClass]
	ld hl, (TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH) - NUM_TRAINER_ATTRIBUTES
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, AI_Items
.loop
	ld de, wEnemyTrainerItem1
	ld a, [hl]
	and a
	inc a
	ret z

	ld a, [de]
	cp [hl]
	jr z, .has_item
	inc de
	ld a, [de]
	cp [hl]
	jr z, .has_item

	inc hl
	inc hl
	inc hl
	jr .loop

.has_item
	inc hl

	push hl
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_

	pop de
	pop hl

	inc hl
	inc hl
	jr c, .loop

; used item
	ld hl, wEnemySubStatus3
	res SUBSTATUS_BIDE, [hl]

	xor a
	ld [de], a
	ld [wEnemyFuryCutterCount], a
	ld [wEnemyProtectCount], a
	ld [wEnemyRageCounter], a
	ld [wLastEnemyCounterMove], a
	inc a
	ld [wEnemyGoesFirst], a

	ld hl, wEnemySubStatus4
	res SUBSTATUS_RAGE, [hl]

	scf
	ret

.IsHighestLevel:
	ld a, [wOTPartyCount]
	ld d, a
	ld e, 0
	ld hl, wOTPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
.next
	ld a, [hl]
	cp e
	jr c, .ok
	ld e, a
.ok
	add hl, bc
	dec d
	jr nz, .next

	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call AddNTimes
	ld a, [hl]
	cp e
	jr nc, .yes
	and a
	ret

.yes
	scf
	ret

AI_Items:
	dbw FULL_RESTORE, .FullRestore
	dbw MAX_POTION,   .MaxPotion
	dbw HYPER_POTION, .HealingItem
	dbw SUPER_POTION, .HealingItem
	dbw POTION,       .HealingItem
	dbw FRESH_WATER,  .HealingItem
	dbw SODA_POP,     .HealingItem
	dbw LEMONADE,     .HealingItem
	dbw MOOMOO_MILK,  .HealingItem
	dbw BERRY,        .HealingItem
	dbw ENERGYPOWDER, .HealingItem
	dbw ENERGY_ROOT,  .HealingItem
	dbw BERRY_JUICE,  .HealingItem
	dbw MIRACLEBERRY, .FullHeal
	dbw FULL_HEAL,    .FullHeal
	dbw GUARD_SPEC,   .GuardSpec
	dbw DIRE_HIT,     .DireHit
	dbw X_ATTACK,     .XAttack
	dbw X_DEFEND,     .XDefend
	dbw X_SPEED,      .XSpeed
	dbw X_SP_ATK,     .XSpAtk
	dbw X_SP_DEF,	  .XSpDef
	dbw X_ACCURACY,   .XAccuracy
	db -1 ; end

.FullHeal:
	call .Status
	jp c, .DontUse
	call EnemyUsedFullHeal
	jp .Use

.Status:
	ld a, [wEnemyMonStatus]
	and a
	jp z, .DontUse

	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .StatusCheckContext
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	call Random
	cp 20 percent - 1
	jp c, .Use
	jp .DontUse

.StatusCheckContext:
	ld a, [wEnemyMonStatus]
	bit TOX, a
	jr z, .FailToxicCheck
	ld a, [wEnemyToxicCount]
	cp 4
	jr c, .FailToxicCheck
	call Random
	cp 50 percent + 1
	jp c, .Use
.FailToxicCheck:
	ld a, [wEnemyMonStatus]
	and SLP_MASK
	jp z, .DontUse
	jp .Use

.FullRestore:
	call .HealItem
	jp nc, .UseFullRestore
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp z, .DontUse
	call .Status
	jp c, .DontUse

.UseFullRestore:
	call EnemyUsedFullRestore
	jp .Use

.MaxPotion:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedMaxPotion
	jp .Use

.HealItem:
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .CheckHalfOrQuarterHP
	call AICheckEnemyHalfHP
	jp c, .DontUse
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp nz, .CheckQuarterHP
	call AICheckEnemyQuarterHP
	jp nc, .Use
	call Random
	cp 50 percent + 1
	jp c, .Use
	jp .DontUse

.CheckQuarterHP:
	call AICheckEnemyQuarterHP
	jp c, .DontUse
	call Random
	cp 20 percent - 1
	jp c, .DontUse
	jp .Use

.CheckHalfOrQuarterHP:
	call AICheckEnemyHalfHP
	jp c, .DontUse
	call AICheckEnemyQuarterHP
	jp nc, .Use
	call Random
	cp 20 percent - 1
	jp nc, .DontUse
	jp .Use

.HealingItem:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedHealingItem
	jp .Use

.XAccuracy:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXAccuracy
	jr .Use

.GuardSpec:
	call .XItem
	jr c, .DontUse
	call EnemyUsedGuardSpec
	jr .Use

.DireHit:
	call .XItem
	jr c, .DontUse
	call EnemyUsedDireHit
	jr .Use

.XAttack:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXAttack
	jr .Use

.XDefend:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXDefend
	jr .Use

.XSpeed:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpeed
	jr .Use

.XSpAtk:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpAtk
	jr .Use

.XSpDef:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpDef
	jr .Use

.XItem:
	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .notfirstturnout
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jr nz, .Use
	call Random
	cp 50 percent + 1
	jr c, .DontUse
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .Use
	call Random
	cp 50 percent + 1
	jr c, .DontUse
	jr .Use

.notfirstturnout
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp z, .DontUse
	call Random
	cp 20 percent - 1
	jr c, .Use
	; fallthrough
.DontUse:
	scf
	ret

.Use:
	and a
	ret

AIUpdateHUD:
	call UpdateEnemyMonInParty
	farcall UpdateEnemyHUD
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemyItemState
	dec [hl]
	scf
	ret

AIUsedItemSound:
	push de
	ld de, SFX_FULL_HEAL
	call PlaySFX
	pop de
	ret

EnemyUsedFullHeal:
	call AIUsedItemSound
	call AI_HealStatus
	ld a, FULL_HEAL
	jp PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedMaxPotion:
	ld a, MAX_POTION
	ld [wCurEnemyItem], a
	jr FullRestoreContinue

EnemyUsedFullRestore:
	call AI_HealStatus
	ld a, FULL_RESTORE
	ld [wCurEnemyItem], a

FullRestoreContinue:
	ld de, wCurHPAnimOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wCurHPAnimMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wCurHPAnimMaxHP + 1], a
	ld [wEnemyMonHP], a
	jr EnemyHealingFinish

EnemyUsedHealingItem:
	ld a, [de]
	ld [wCurEnemyItem], a
	ld b, a
	ld hl, HealingHPAmounts
.next
	ld a, BANK(HealingHPAmounts)
	call GetFarByte
	inc hl
	cp b
	jr z, .done
	inc hl
	inc hl
	jr .next

.done
	ld a, BANK(HealingHPAmounts)
	call GetFarByte
	ld b, a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wCurHPAnimOldHP], a
	add b
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [hl]
	ld [wCurHPAnimOldHP + 1], a
	ld [wCurHPAnimNewHP + 1], a
	jr nc, .ok
	inc a
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a
.ok
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wCurHPAnimMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wCurHPAnimMaxHP + 1], a
	sbc b
	jr nc, EnemyHealingFinish
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a

EnemyHealingFinish:
	call PrintText_UsedItemOn
	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	call AIUsedItemSound
	predef AnimateHPBar
	jp AIUpdateHUD

AI_TrySwitch:
; Determine whether the AI can switch based on how many Pokemon are still alive.
; If it can switch, it will.
	ld a, [wOTPartyCount]
	ld c, a
	ld hl, wOTPartyMon1HP
	ld d, 0
.SwitchLoop:
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .fainted
	inc d
.fainted
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .SwitchLoop

	ld a, d
	cp 2
	jr nc, AI_Switch
	and a
	ret

AI_Switch:
	ld a, $1
	ld [wEnemyIsSwitching], a
	ld [wEnemyGoesFirst], a
	ld hl, wEnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ldh [hBattleTurn], a
	callfar PursuitSwitch

	push af
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wEnemyMonStatus
	ld bc, MON_MAXHP - MON_STATUS
	call CopyBytes
	pop af

	jr c, .skiptext
	ld hl, EnemyWithdrewText
	call PrintText

.skiptext
	ld a, 1
	ld [wBattleHasJustStarted], a
	callfar NewEnemyMonStatus
	callfar ResetEnemyStatLevels
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	farcall EnemySwitch
	farcall ResetBattleParticipants
	xor a
	ld [wBattleHasJustStarted], a
	ld a, [wLinkMode]
	and a
	ret nz
	scf
	ret

EnemyWithdrewText:
	text_far _EnemyWithdrewText
	text_end

AI_HealStatus:
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	call GetPartyLocation
	xor a
	ld [hl], a
	ld [wEnemyMonStatus], a
	ld [wEnemyConfuseCount], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ret

EnemyUsedGuardSpec:
	call AIUsedItemSound
	ld hl, wEnemyScreens
	ld de, wEnemyMistCount
	set SCREENS_MIST, [hl]
	ld a, 5
	ld [de], a
	ld a, GUARD_SPEC
	jp PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedDireHit:
	call AIUsedItemSound
	ld hl, wEnemySubStatus4
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	ld a, DIRE_HIT
	jp PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedXAttack: 	; Boost by 2 stages
	ld b, $10 | ATTACK
	ld a, X_ATTACK
	jr EnemyUsedXItem

EnemyUsedXDefend: 	; Boost by 2 stages
	ld b, $10 | DEFENSE
	ld a, X_DEFEND
	jr EnemyUsedXItem

EnemyUsedXSpeed: 	; Boost by 2 stages
	ld b, $10 | SPEED
	ld a, X_SPEED
	jr EnemyUsedXItem

EnemyUsedXSpDef: 	; Boost by 2 stages
	ld b, $10 | SP_DEFENSE
	ld a, X_SP_DEF
	jr EnemyUsedXItem

EnemyUsedXSpAtk: 	; Boost by 2 stages
	ld b, $10 | SP_ATTACK
	ld a, X_SP_ATK
	jr EnemyUsedXItem

EnemyUsedXAccuracy: ; Boost by 2 stages
	ld b, $10 | ACCURACY
	ld a, X_ACCURACY

; Parameter
; a = ITEM_CONSTANT
; b = BATTLE_CONSTANT (ATTACK, DEFENSE, SPEED, SP_ATTACK, SP_DEFENSE, ACCURACY, EVASION)
EnemyUsedXItem:
	ld [wCurEnemyItem], a
	push bc
	call PrintText_UsedItemOn
	pop bc
	farcall RaiseStat
	jp AIUpdateHUD

; Parameter
; a = ITEM_CONSTANT
PrintText_UsedItemOn_AND_AIUpdateHUD:
	ld [wCurEnemyItem], a
	call PrintText_UsedItemOn
	jp AIUpdateHUD

PrintText_UsedItemOn:
	ld a, [wCurEnemyItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, EnemyUsedOnText
	jp PrintText

EnemyUsedOnText:
	text_far _EnemyUsedOnText
	text_end
