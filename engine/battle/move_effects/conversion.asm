BattleCommand_Conversion:
	ld hl, wBattleMonMoves
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonType1
.got_moves
	ld a, [hl]
	and a
	jr z, .fail
	
	push de
	ld de, wStringBuffer1
	ld hl, (Moves + MOVE_TYPE) - MOVE_LENGTH
	call GetMoveAttr
	and TYPE_MASK
	ld [de], a
	pop de

	ld hl, wStringBuffer1
	ld a, [de]
	cp [hl]
	jr z, .fail
	inc de
	ld a, [de]
	cp [hl]
	jr nz, .done
	; fallthrough
.fail
	call AnimateFailedMove
	jp PrintButItFailed

.done
	ld a, [hl]
	ld [de], a
	dec de
	ld [de], a
	ld [wNamedObjectIndex], a
	predef GetTypeName
	call AnimateCurrentMove
	ld hl, TransformedTypeText
	jp StdBattleTextbox
