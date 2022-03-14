Marts:
; entries correspond to MART_* constants (see constants/mart_constants.asm)
	table_width 2, Marts
	dw MartCherrygrove
	dw MartCherrygroveDex
	dw MartCherrygroveOneBadge
	dw MartCherrygroveThreeBadges
	dw MartCherrygroveFiveBadges
	dw MartCherrygroveSevenBadges
	dw MartCherrygroveEightBadges
	dw MartViolet
	dw MartVioletOneBadge
	dw MartVioletThreeBadges
	dw MartVioletFiveBadges
	dw MartVioletSevenBadges
	dw MartVioletEightBadges
	dw MartAzalea
	dw MartAzaleaThreeBadges
	dw MartAzaleaFiveBadges
	dw MartAzaleaSevenBadges
	dw MartAzaleaEightBadges
	dw MartCianwood
	dw MartGoldenrod2F1
	dw MartGoldenrod2F2
	dw MartGoldenrod3F
	dw MartGoldenrod4F
	dw MartGoldenrod5F
	dw MartOlivine
	dw MartOlivineFiveBadges
	dw MartOlivineSevenBadges
	dw MartOlivineEightBadges
	dw MartEcruteak
	dw MartEcruteakFiveBadges
	dw MartEcruteakSevenBadges
	dw MartEcruteakEightBadges
	dw MartMahogany1
	dw MartMahogany2
	dw MartBlackthorn
	dw MartBlackthornEightBadges
	dw MartViridian
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartIndigoPlateau
	dw MartUnderground
	assert_table_length NUM_MARTS

MartCherrygrove:
	db 3 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db -1 ; end

MartCherrygroveDex:
	db 4 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db -1 ; end

MartCherrygroveOneBadge:
	db 10 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db -1 ; end

MartCherrygroveThreeBadges:
MartEcruteak:
	db 13 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db -1 ; end

MartCherrygroveFiveBadges:
	db 16 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db -1 ; end

MartCherrygroveSevenBadges:
MartEcruteakSevenBadges:
MartBlackthorn:
	db 18 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartCherrygroveEightBadges:
MartEcruteakEightBadges:
MartBlackthornEightBadges:
MartPewter:
MartLavender:
	db 19 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartViolet:
	db 6 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db FLOWER_MAIL
	db -1 ; end

MartVioletOneBadge:
	db 11 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db FLOWER_MAIL
	db -1 ; end

MartVioletThreeBadges:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartVioletFiveBadges:
	db 16 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartVioletSevenBadges:
	db 19 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartVioletEightBadges:
MartFuchsia:
MartSaffron:
MartViridian:
	db 20 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartAzalea:
	db 12 ; # items
	db CHARCOAL
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db FLOWER_MAIL
	db -1 ; end

MartAzaleaThreeBadges:
	db 15 ; # items
	db CHARCOAL
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartAzaleaFiveBadges:
	db 17 ; # items
	db CHARCOAL
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartAzaleaSevenBadges:
	db 20 ; # items
	db CHARCOAL
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartAzaleaEightBadges:
	db 21 ; # items
	db CHARCOAL
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db FLOWER_MAIL
	db -1 ; end

MartCianwood:
	db 5 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db -1 ; end

MartGoldenrod2F1:
MartCeladon2F1:
	db 11 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db FULL_HEAL
	db -1 ; end

MartGoldenrod2F2:
	db 16 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db POKE_DOLL
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db FLOWER_MAIL
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db MOON_STONE
	db SUN_STONE
	db DUSK_STONE
	db -1 ; end

MartGoldenrod3F:
MartCeladon5F2:
	db 8 ; # items
	db X_SPEED
	db X_ATTACK
	db X_DEFEND
	db GUARD_SPEC
	db DIRE_HIT
	db X_ACCURACY
	db X_SPECIAL
	db X_SP_DEF	
	db -1 ; end

MartGoldenrod4F:
MartCeladon5F1:
	db 8 ; # items
	db PROTEIN
	db IRON
	db CALCIUM
	db ZINC
	db CARBOS
	db HP_UP
	db PP_UP
	db PP_MAX
	db -1 ; end

MartGoldenrod5F:
	db 6 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_LIGHT_SCREEN
	db TM_REFLECT
	db TM_FALSE_SWIPE
	db -1 ; end

MartOlivine:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db SURF_MAIL
	db -1 ; end

MartOlivineFiveBadges:
	db 16 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db SURF_MAIL
	db -1 ; end

MartOlivineSevenBadges:
	db 19 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db SURF_MAIL
	db -1 ; end

MartOlivineEightBadges:
MartCerulean:
	db 20 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db SURF_MAIL
	db -1 ; end

MartEcruteakFiveBadges:
	db 15 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db -1 ; end

MartMahogany1:
	db 4 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db -1 ; end

MartMahogany2:
	db 9 ; # items
	db RAGECANDYBAR
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db SUPER_REPEL
	db REVIVE
	db FLOWER_MAIL
	db -1 ; end

MartVermilion:
	db 20 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db LITEBLUEMAIL
	db -1 ; end
	
MartCeladon2F2:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db POKE_DOLL
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartCeladon3F:
	db 7 ; # items
	db TM_PSYCH_UP
	db TM_PROTECT
	db TM_ICY_WIND
	db TM_SAFEGUARD
	db TM_EXPLOSION
	db TM_SWORDS_DANCE
	db TM_SUBSTITUTE
	db -1 ; end

MartCeladon4F:
	db 9 ; # items
	db LOVELY_MAIL
	db SURF_MAIL
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db MOON_STONE
	db SUN_STONE
	db DUSK_STONE
	db -1 ; end

MartMtMoon:
	db 11 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db PORTRAITMAIL
	db EON_MAIL
	db MORPH_MAIL
	db BLUESKY_MAIL
	db MUSIC_MAIL
	db MIRAGE_MAIL
	db -1 ; end

MartIndigoPlateau:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db HEAL_POWDER
	db ENERGYPOWDER
	db ENERGY_ROOT
	db REVIVAL_HERB
	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end
