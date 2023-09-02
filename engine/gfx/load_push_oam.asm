WriteOAMDMACodeToHRAM::
	lb bc, (OAMDMACodeEnd - OAMDMACode), LOW(hTransferShadowOAM)
	ld hl, OAMDMACode
.copy
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .copy
	ret

OAMDMACode:
; This code is defined in ROM, but
; copied to and called from HRAM.
LOAD "OAM DMA", HRAM
hTransferShadowOAM::
	ldh [c], a
.wait
	dec b
	jr nz, .wait
	ret
ENDL
OAMDMACodeEnd:
