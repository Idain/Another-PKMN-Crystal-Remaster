BattleCommand_Growth:

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyStatLevels

.go   
; Attack
	ld a, [hli]
	cp MAX_STAT_LEVEL
	jr c, .checkweather

; Special Attack
    inc hl
    inc hl
	ld a, [hl]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.checkweather
	call AnimateCurrentMove

	ld a, [wBattleWeather]
	cp WEATHER_SUN ; If the weather is harsh sunlight...
	jr z, .RaiseAttacks2 ; Boost both Atk and Sp.Atk by 2

.RaiseAttacks:
	call BattleCommand_AttackUp
    call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp
    jp BattleCommand_StatUpMessage

.RaiseAttacks2:
	call BattleCommand_AttackUp2
    call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
    jp BattleCommand_StatUpMessage

.cantraise
; Can't raise either stat.
	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox

