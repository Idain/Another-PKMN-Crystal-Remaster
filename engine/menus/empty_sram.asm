EmptyAllSRAMBanks:
for x, NUM_SRAM_BANKS - 1
	ld a, x
	call .EmptyBank
endr
	ld a, NUM_SRAM_BANKS - 1
	; fallthrough
.EmptyBank:
	call OpenSRAM
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	jp CloseSRAM
