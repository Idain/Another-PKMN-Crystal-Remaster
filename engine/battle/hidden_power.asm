BattleHiddenPowerDamage:
; Override Hidden Power's type based on the user's DVs.

	ld bc, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, HiddenPowerDamage
	ld bc, wEnemyMonDVs
	; fallthrough
HiddenPowerDamage::
	call GetHiddenPowerType

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a
	ret

GetHiddenPowerType::
	; Def & 3
	ld a, [bc]
	and %0011
	ld d, a

	; + (Atk & 3) << 2
	ld a, [bc]
	and %0011 << 4
	swap a
	add a
	add a
	or d
	inc a ; Skip Normal
	ld e, a
	ret
