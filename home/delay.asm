DelayFrame::
; Wait for one frame
	xor a ; ld a, FALSE
	ldh [hVBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt
	nop
	ldh a, [hVBlankOccurred]
	and a
	jr z, .halt
	ret

DelayFrames::
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
