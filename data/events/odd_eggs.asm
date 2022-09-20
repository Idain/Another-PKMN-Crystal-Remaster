DEF NUM_ODD_EGGS EQU 14

MACRO prob
	DEF prob_total += \1
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs (below)
	table_width 2, OddEggProbabilities
DEF prob_total = 0
; Pichu
	prob 7
	prob 7
; Cleffa
	prob 8
	prob 8
; Igglybuff
	prob 7
	prob 7
; Smoochum
	prob 7
	prob 7
; Magby
	prob 7
	prob 7
; Elekid
	prob 7
	prob 7
; Tyrogue
	prob 7
	prob 7
	assert_table_length NUM_ODD_EGGS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, TAIL_WHIP, DIZZY_PUNCH
	dw 02048 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 30, 20, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 10 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, TAIL_WHIP, DIZZY_PUNCH
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 10 ; Atk
	bigdw 8 ; Def
	bigdw 12 ; Spd
	bigdw 10 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, ENCORE, DIZZY_PUNCH
	dw 04096 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 20, 5, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 8 ; Atk
	bigdw 8 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, ENCORE, DIZZY_PUNCH
	dw 00768 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 35, 20, 5, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 9 ; Atk
	bigdw 9 ; Def
	bigdw 8 ; Spd
	bigdw 11 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DEFENSE_CURL, DIZZY_PUNCH
	dw 04096 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 15, 20, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 25 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DEFENSE_CURL, DIZZY_PUNCH
	dw 00768 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 15, 20, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 25 ; Max HP
	bigdw 9 ; Atk
	bigdw 8 ; Def
	bigdw 8 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, MEDITATE
	dw 03584 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 30, 10, 40 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 14 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, MEDITATE
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 35, 30, 10, 40 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 9 ; Atk
	bigdw 8 ; Def
	bigdw 15 ; Spd
	bigdw 15 ; SAtk
	bigdw 13 ; SDef
	db "Egg@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db SMOG, LEER, EMBER, DIZZY_PUNCH
	dw 02560 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 20, 30, 25, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 13 ; Atk
	bigdw 9 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db SMOG, LEER, EMBER, DIZZY_PUNCH
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 10, 15 ; DVs
	db 20, 30, 25, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 14 ; Atk
	bigdw 10 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, THUNDERSHOCK, DIZZY_PUNCH
	dw 03072 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 30, 30, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 12 ; Atk
	bigdw 9 ; Def
	bigdw 15 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, THUNDERSHOCK, DIZZY_PUNCH
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 30, 30, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 12 ; Atk
	bigdw 10 ; Def
	bigdw 16 ; Spd
	bigdw 13 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, FOCUS_ENERGY, FORESIGHT, DIZZY_PUNCH
	dw 02560 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 10, 10, 10, 10 ; DVs
	db 35, 30, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 9 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, FOCUS_ENERGY, FORESIGHT, DIZZY_PUNCH
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 35, 30, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 10 ; Atk
	bigdw 10 ; Def
	bigdw 10 ; Spd
	bigdw 10 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	assert_table_length NUM_ODD_EGGS
