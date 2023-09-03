FarDecompress::
; Decompress graphics data from a:hl to de.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call Decompress

	pop af
	rst Bankswitch
	ret

Decompress::
; Decompress LZ data from hl to de.
	ldh a, [hVBlank]
	push af
	ld a, 2 ; sound only XXX use constants for vblank modes
	ldh [hVBlank], a
	call _Decompress
	pop af
	ldh [hVBlank], a
	ret

_Decompress::
; Pokemon GSC uses an lz variant (lz3) for compression.
; This is mainly (but not necessarily) used for graphics.

; This function decompresses lz-compressed data from hl to de.

DEF LZ_END EQU $ff ; Compressed data is terminated with $ff.

; A typical control command consists of:

DEF LZ_CMD EQU %11100000 ; command id (bits 5-7)
DEF LZ_LEN EQU %00011111 ; length n   (bits 0-4)

; Additional parameters are read during command execution.

; Commands:

DEF LZ_LITERAL   EQU 0 << 5 ; Read literal data for n bytes.
DEF LZ_ITERATE   EQU 1 << 5 ; Write the same byte for n bytes.
DEF LZ_ALTERNATE EQU 2 << 5 ; Alternate two bytes for n bytes.
DEF LZ_ZERO      EQU 3 << 5 ; Write 0 for n bytes.

; Another class of commands reuses data from the decompressed output.
DEF LZ_RW        EQU 2 + 5 ; bit

; These commands take a signed offset to start copying from.
; Wraparound is simulated.
; Positive offsets (15-bit) are added to the start address.
; Negative offsets (7-bit) are subtracted from the current position.

DEF LZ_REPEAT    EQU 4 << 5 ; Repeat n bytes from the offset.
DEF LZ_FLIP      EQU 5 << 5 ; Repeat n bitflipped bytes.
DEF LZ_REVERSE   EQU 6 << 5 ; Repeat n bytes in reverse.

; If the value in the count needs to be larger than 5 bits,
; LZ_LONG can be used to expand the count to 10 bits.
DEF LZ_LONG      EQU 7 << 5

; A new control command is read in bits 2-4.
; The top two bits of the length are bits 0-1.
; Another byte is read containing the bottom 8 bits.
DEF LZ_LONG_HI   EQU %00000011

; In other words, the structure of the command becomes
; 111xxxyy yyyyyyyy
; x: the new control command
; y: the length

	; Swap de and hl for speed
	rst SwapHLDE

	; Save the output address
	; for rewrite commands.
	ld a, l
	ldh [hLZAddress], a
	ld a, h
	ldh [hLZAddress + 1], a

.Main
	ld a, [de]
	cp LZ_LONG
	jr c, .short
	cp LZ_END
	jr nz, .long
	rst SwapHLDE
	ret

.long
; The count is now 10 bits.

	; Read the next 3 bits.
	; %00011100 -> %11100000
	add a
	add a
	add a

; This is our new control code.
	and LZ_CMD
	ldh [hBuffer], a

	ld a, [de]
	inc de
	and LZ_LONG_HI
	ld b, a
	ld a, [de]
	inc de
	ld c, a

	; read at least 1 byte
	inc bc
	inc a
	jr .command

.short
	and LZ_CMD
	ldh [hBuffer], a

	ld a, [de]
	inc de
	and LZ_LEN
	ld c, a
	ld b, 0

	; read at least 1 byte
	inc c

.command
	; Modify loop counts to support 8 bit loop counters
	jr z, .multiple_of_256
	inc b
.multiple_of_256
	ldh a, [hBuffer]

	bit LZ_RW, a
	jr nz, .copy

	cp LZ_ITERATE
	jr z, .repeat_one
	cp LZ_ALTERNATE
	jr z, .repeat_two
	cp LZ_ZERO
	jr z, .zero

; Read literal data for bc bytes.
.literal_data_loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .literal_data_loop
	dec b
	jr nz, .literal_data_loop
	jr .Main

.repeat_one
; Write the same byte for bc bytes.
	ld a, [de]
	inc de
.repeat_loop
	ld [hli], a
	dec c
	jr nz, .repeat_loop
	dec b
	jr nz, .repeat_loop
	jr .Main

.repeat_two
; Alternate two bytes for bc bytes.

; store alternating bytes in d and e
	ld a, [de]
	inc de
	push de
	ldh [hBuffer], a
	ld a, [de]
	ld e, a
	ldh a, [hBuffer]
	ld d, a
; d = byte 1
; e = byte 2
; hl = destination
.repeat_two_loop
	ld a, d
	ld [hli], a

	dec c
	jr nz, .next_byte
	dec b
	jr z, .done_repeating
.next_byte
	ld a, e
	ld [hli], a

	dec c
	jr nz, .repeat_two_loop
	dec b
	jr nz, .repeat_two_loop
.done_repeating

; Skip past the bytes we were alternating.
	pop de
	inc de
	jr .Main

.zero
; Write 0 for bc bytes.
	xor a
	jr .repeat_loop

.copy
; Copy decompressed data from previously outputted values.
	push de
	push hl

	ld a, [de]
	bit 7, a ; set: relative, clear: absolute
	jr z, .absolute

	; Relative offsets count backwards from hl and contain an excess of $7f.
	; In other words, $80 = hl - 1, $81 = hl - 2, ..., $ff = hl - 128.
	cpl
	sub $80
	ld e, a
	ld d, $ff
	jr .ok

.absolute
; Absolute offset from the beginning of the output.
	ld h, a
	inc de
	ld a, [de]
	ld l, a
	ldh a, [hLZAddress]
	ld e, a
	ldh a, [hLZAddress + 1]
	ld d, a

.ok
	add hl, de
	ld d, h
	ld e, l
	pop hl

; Determine the kind of copy.
; Note that [hBuffer] could also contain LZ_LONG, but that's an error in the command stream, as of now unhandled.
	ldh a, [hBuffer]

	cp LZ_FLIP
	jr z, .flipped
	cp LZ_REVERSE
	jr z, .reversed

; Copy data for bc bytes.
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copy_loop
	dec b
	jr nz, .copy_loop
	jr .done_copying

.flipped
; Copy bitflipped data for bc bytes.
	ld a, [de]
	inc de
	ld [hl], b ; use the current output as buffer

; https://github.com/pret/pokecrystal/wiki/Optimizing-assembly-code#reverse-the-bits-of-a
	ld b, a
	rlca
	rlca
	xor b
	and $aa
	xor b
	ld b, a
	swap b
	xor b
	and $33
	xor b
	rrca

	ld b, [hl]
	ld [hli], a
	dec c
	jr nz, .flipped
	dec b
	jr nz, .flipped
	jr .done_copying

.reversed
; Copy byte-reversed data for bc bytes.
	ld a, [de]
	dec de
	ld [hli], a
	dec c
	jr nz, .reversed
	dec b
	jr nz, .reversed

.done_copying
	pop de
	ld a, [de]
	add a
	jr c, .next
	inc de ; positive offset is two bytes
.next
	inc de
	jp .Main