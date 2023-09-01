FarCall_de::
; Call a:de.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _de_
	jr ReturnFarCall

FarCall_hl::
; Call a:hl.
; Preserves other registers.
	ldh [hTempBank], a
	jr DoFarCall

_FarCall::
; Call the following dba pointer on the stack.
; Preserves a, bc, de, hl
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hPredefHL + 1], a
	ld a, l
	ldh [hPredefHL], a
	pop hl
	ld a, [hli]
	ldh [hTempBank], a
	ld a, [hli]
	bit 7, [hl]
	jr nz, .farjp
	inc hl
	push hl
	dec hl
.farjp
	ld h, [hl]
	ld l, a
	res 7, h
	; fallthrough
DoFarCall:
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call RetrieveHLAndCallFunction
	; fallthrough

ReturnFarCall:
; We want to retain the contents of f.
; To do this, we can update its preserved value on the stack directly.
	ldh [hFarCallSavedA], a
	push af
	push hl
	ld hl, sp+2 ; read f
	ld a, [hli]
	assert HIGH(wStackBottom) == HIGH(wStackTop)
	inc l ; faster than inc hl (stack is always at $c0xx)
	ld [hl], a ; write f
	pop hl
	pop af
	pop af
	rst Bankswitch
	ldh a, [hFarCallSavedA]
	ret

RetrieveHLAndCallFunction:
; Call the function at hl with restored values of a and hl.
	push hl
	ld hl, hPredefHL
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hFarCallSavedA]
	ret
