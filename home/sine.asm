Cosine::
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sine::
; input: a = a signed 6-bit value
; output: a = d * sin(a * pi/32)
	and %111111
	cp %100000
	jr nc, .negative
	call .apply
	ld a, h
	ret
.negative
	and %011111
	call .apply
	ld a, h
	cpl
	inc a
	ret
.apply
	ld e, a
	ld a, d
	ld d, 0

	ld hl, .sinetable

	add hl, de
	add hl, de
	ld e, [hl] ; no-optimize b|c|d|e = *hl++|*hl--
	inc hl
	ld d, [hl]
	ld hl, 0
.multiply ; factor amplitude
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret

.sinetable
	sine_table 32
