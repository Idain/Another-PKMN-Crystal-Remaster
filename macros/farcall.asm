; Far calls to another bank

MACRO farcall ; bank, address
	assert !(\1 & $8000), "cannot `farcall \1` in RAM"
	rst FarCall
	dbw BANK(\1), \1
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `farcall \1`"
ENDM

MACRO callfar ; address, bank
	assert !(\1 & $8000), "cannot `callfar \1` in RAM"
	rst FarCall
	dbw BANK(\1), \1
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `callfar \1`"
ENDM

MACRO farjp ; bank, address
	assert !(\1 & $8000), "cannot `farjp \1` in RAM"
	rst FarCall
	dbw BANK(\1), \1 | $8000
	assert warn, BANK(\1) != 0 && BANK(\1) != BANK(@), "unnecessary `farjp \1`"
ENDM

MACRO homecall
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
	assert warn, BANK(\1) != 0, "unnecessary `homecall \1`"
ENDM
