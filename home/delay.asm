DelayFrame::
; Wait for one frame
	ld a, 1
	ldh [hVBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt
	nop
	ldh a, [hVBlankOccurred]
	and a
	jr nz, .halt
	ret

DelayFrames::
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
