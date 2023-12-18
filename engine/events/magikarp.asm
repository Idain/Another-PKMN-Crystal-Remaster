CheckMagikarpLength:
	; Returns 3 if you select a Magikarp that beats the previous record.
	; Returns 2 if you select a Magikarp, but the current record is longer.
	; Returns 1 if you press B in the Pokemon selection menu.
	; Returns 0 if the Pokemon you select is not a Magikarp.

	; Let's start by selecting a Magikarp.
	farcall SelectMonFromParty
	jr c, .declined
	ld a, [wCurPartySpecies]
	cp MAGIKARP
	jr nz, .not_magikarp

	; Now let's compute its length based on its DVs and ID.
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	call GetPartyLocation
	push hl
	ld bc, MON_DVS
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, MON_ID
	add hl, bc
	ld b, h
	ld c, l
	call CalcMagikarpLength
	call PrintMagikarpLength
	ld hl, .MagikarpGuruMeasureText
	call PrintText

	; Did we beat the record?
	ld hl, wMagikarpLengthMm
	ld de, wBestMagikarpLengthMm
	ld c, 2
	call CompareBytes
	jr nc, .not_long_enough

	; NEW RECORD!!! Let's save that.
	ld hl, wMagikarpLengthMm
	ld de, wBestMagikarpLengthMm
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOTs
	call SkipNames
	call CopyBytes
	ld a, MAGIKARPLENGTH_BEAT_RECORD
	ld [wScriptVar], a
	ret

.not_long_enough
	ld a, MAGIKARPLENGTH_TOO_SHORT
	ld [wScriptVar], a
	ret

.declined
	ld a, MAGIKARPLENGTH_REFUSED
	ld [wScriptVar], a
	ret

.not_magikarp
	xor a ; MAGIKARPLENGTH_NOT_MAGIKARP
	ld [wScriptVar], a
	ret

.MagikarpGuruMeasureText:
	text_far _MagikarpGuruMeasureText
	text_end

PrintMagikarpLength:
	ld a, [wMagikarpLengthMmHi]
	ld b, a
	ld a, [wMagikarpLengthMmLo]
	ld c, a
	ld de, DIV(1.0q16, 25.4q16, 16) ; 1 in / 25.4 mm = 0.03937 in/mm
	xor a
	ldh [hTmpd], a
	ldh [hTmpe], a
	ld hl, 0
	ld a, 16
	ldh [hProduct], a
.loop
	add hl, hl
	ldh a, [hTmpe]
	rla
	ldh [hTmpe], a
	ldh a, [hTmpd]
	rla
	ldh [hTmpd], a
	sla e
	rl d
	jr nc, .noadd
	add hl, bc
	ldh a, [hTmpe]
	adc 0
	ldh [hTmpe], a
	ldh a, [hTmpd]
	adc 0
	ldh [hTmpd], a
.noadd
	ldh a, [hProduct]
	dec a
	ldh [hProduct], a
	jr nz, .loop
	ldh a, [hTmpd]
	ld h, a
	ldh a, [hTmpe]
	ld l, a
	ld bc, -12
	ld e, 0
.inchloop
	ld a, h
	and a
	jr nz, .inchloop2
	ld a, l
	cp 12
	jr c, .inchdone
.inchloop2
	add hl, bc
	inc e
	jr .inchloop
.inchdone
	; Temporarily save metric values
	ld a, [wMagikarpLengthMmHi]
	ldh [hTmpd], a
	ld a, [wMagikarpLengthMmLo]
	ldh [hTmpe], a

	; Print imperial values
	ld a, e
	ld [wMagikarpLengthMmHi], a
	ld a, l
	ld [wMagikarpLengthMmLo], a
	ld hl, wStringBuffer1
	ld de, wMagikarpLengthMmHi
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, "′"
	ld [hli], a
	ld de, wMagikarpLengthMmLo
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, "″"
	ld [hli], a
	ld [hl], "@"

	; Restore metric values
	ldh a, [hTmpd]
	ld [wMagikarpLengthMmHi], a
	ldh a, [hTmpe]
	ld [wMagikarpLengthMmLo], a
	ret

CalcMagikarpLength:
; Return Magikarp's length (in feet and inches) at wMagikarpLengthMm (big endian).
;
; input:
;   de: wEnemyMonDVs
;   bc: wPlayerID

; This function is poorly commented.

; In short, it generates a value between 90 and 1786 using
; a Magikarp's DVs and its trainer ID. This value is further
; filtered in LoadEnemyMon to make longer Magikarp even rarer.

; The value is generated from a lookup table.
; The index is determined by the dv xored with the player's trainer id.

; bc = rrc(dv[0]) ++ rrc(dv[1]) ^ rrc(id)

; if bc ≥ 65510: [wMagikarpLengthMm] = bc - 65510 + 1600
; else:          [wMagikarpLengthMm] = z * 100 + (bc - x) / y

; X, Y, and Z depend on the value of bc as follows:

; if bc = 0-109:        x =   110,  y =   1,  z =  2
; if bc = 110-309:      x =   310,  y =   2,  z =  3
; if bc = 310-709:      x =   710,  y =   4,  z =  4
; if bc = 710-2709:     x =  2710,  y =  20,  z =  5
; if bc = 2710-7709:    x =  7710,  y =  50,  z =  6
; if bc = 7710-17709:   x = 17710,  y = 100,  z =  7
; if bc = 17710-32709:  x = 32710,  y = 150,  z =  8
; if bc = 32710-47709:  x = 47710,  y = 150,  z =  9
; if bc = 47710-57709:  x = 57710,  y = 100,  z = 10
; if bc = 57710-62709:  x = 62710,  y =  50,  z = 11
; if bc = 62710-64709:  x = 64710,  y =  20,  z = 12
; if bc = 64710-65209:  x = 65210,  y =   5,  z = 13
; if bc = 65210-65409:  x = 65410,  y =   2,  z = 14
; if bc = 65410-65509:  x = 65510,  y =   1,  z = 15

	; bc = rrc(dv[0]) ++ rrc(dv[1]) ^ rrc(id)

	; id
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, a
	ld c, [hl]
	rrc b
	rrc c

	; dv
	ld a, [de]
	inc de
	rrca
	rrca
	xor b
	ld b, a

	ld a, [de]
	rrca
	rrca
	xor c
	ld c, a

	ld hl, MagikarpLengths
	ld a, 2
	ld [wTempByteValue], a

.read
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call .BCLessThanDE
	jr nc, .next

	; c = (bc - de) / [hl]
	call .BCMinusDE
	ld a, b
	ldh [hDividend + 0], a
	ld a, c
	ldh [hDividend + 1], a
	ld a, [hl]
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a

	; de = c + 100 × (2 + i)
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, 100
	ldh [hMultiplicand + 2], a
	ld a, [wTempByteValue]
	ldh [hMultiplier], a
	call Multiply
	ld b, 0
	ldh a, [hProduct + 3]
	add c
	ld e, a
	ldh a, [hProduct + 2]
	adc b
	ld d, a
	jr .done

.next
	inc hl ; align to next triplet
	ld a, [wTempByteValue]
	inc a ; no-optimize inefficient WRAM increment/decrement
	ld [wTempByteValue], a
	cp 16
	jr c, .read

	call .BCMinusDE
	ld hl, 1600
	add hl, bc
	ld d, h
	ld e, l

.done
	ld hl, wMagikarpLengthMm
	ld a, d
	ld [hli], a
	ld [hl], e
	ret

.BCLessThanDE:
	ld a, b
	cp d
	ret c
	ret nz
	ld a, c
	cp e
	ret

.BCMinusDE:
; bc -= de
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	ret

INCLUDE "data/events/magikarp_lengths.asm"

MagikarpHouseSign:
	ld a, [wBestMagikarpLengthMmHi]
	ld [wMagikarpLengthMmHi], a
	ld a, [wBestMagikarpLengthMmLo]
	ld [wMagikarpLengthMmLo], a
	call PrintMagikarpLength
	ld hl, .KarpGuruRecordText
	jp PrintText

.KarpGuruRecordText:
	text_far _KarpGuruRecordText
	text_end
