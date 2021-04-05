momitem: MACRO
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   600, MOM_ITEM, SUPER_POTION
	momitem      0,   375, MOM_ITEM, FULL_HEAL
	momitem      0,   180, MOM_ITEM, POKE_BALL
	momitem      0,   450, MOM_ITEM, ESCAPE_ROPE
	momitem      0,   500, MOM_ITEM, GREAT_BALL
.End

MomItems_2:
	momitem  10000,   600, MOM_ITEM, SUPER_POTION
	momitem  20000,  1200, MOM_ITEM, HYPER_POTION
	momitem  30000,   750, MOM_ITEM, MAX_REPEL
	momitem  40000,  1800, MOM_DOLL, DECO_CHARMANDER_DOLL
	momitem  50000,  3000, MOM_ITEM, MOON_STONE
	momitem  60000,  1000, MOM_ITEM, POLKADOT_BOW
	momitem  70000,  4800, MOM_DOLL, DECO_CLEFAIRY_DOLL
	momitem  80000,  2500, MOM_ITEM, FULL_RESTORE
	momitem  90000,  8000, MOM_DOLL, DECO_PIKACHU_DOLL
	momitem 100000, 22800, MOM_DOLL, DECO_BIG_SNORLAX_DOLL
.End

	dt 0 ; unused
