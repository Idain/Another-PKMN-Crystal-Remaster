; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 00
	const POKE_BALL    ; 01
	const GREAT_BALL   ; 02
	const ULTRA_BALL   ; 03
	const MASTER_BALL  ; 04
	const HEAVY_BALL   ; 05
	const LEVEL_BALL   ; 06
	const LURE_BALL    ; 07
	const FAST_BALL    ; 08
	const FRIEND_BALL  ; 09
	const MOON_BALL    ; 0a
	const LOVE_BALL    ; 0b
	const PARK_BALL    ; 0c
DEF NUM_POKE_BALLS EQU const_value - 1
	const BRIGHTPOWDER ; 03
	const TOWN_MAP     ; 06
	const BICYCLE      ; 07
	const MOON_STONE   ; 08
	const ANTIDOTE     ; 09
	const BURN_HEAL    ; 0a
	const ICE_HEAL     ; 0b
	const AWAKENING    ; 0c
	const PARLYZ_HEAL  ; 0d
	const FULL_RESTORE ; 0e
	const MAX_POTION   ; 0f
	const HYPER_POTION ; 10
	const SUPER_POTION ; 11
	const POTION       ; 12
	const ESCAPE_ROPE  ; 13
	const REPEL        ; 14
	const MAX_ELIXER   ; 15
	const FIRE_STONE   ; 16
	const THUNDERSTONE ; 17
	const WATER_STONE  ; 18
	const HP_UP        ; 19
	const PROTEIN      ; 1a
	const IRON         ; 1b
	const CARBOS       ; 1c
	const CALCIUM      ; 1d
	const ZINC  	   ; 1e
	const RARE_CANDY   ; 1f
	const X_ACCURACY   ; 20
	const LEAF_STONE   ; 21
	const METAL_POWDER ; 22
	const NUGGET       ; 23
	const POKE_DOLL    ; 24
	const FULL_HEAL    ; 25
	const REVIVE       ; 26
	const MAX_REVIVE   ; 27
	const GUARD_SPEC   ; 28
	const SUPER_REPEL  ; 29
	const MAX_REPEL    ; 2a
	const DIRE_HIT     ; 2b
	const FRESH_WATER  ; 2c
	const SODA_POP     ; 2d
	const LEMONADE     ; 2e
	const X_ATTACK     ; 2f
	const X_DEFEND     ; 30
	const X_SPEED      ; 31
	const X_SP_ATK     ; 32
	const X_SP_DEF     ; 33
	const COIN_CASE    ; 34
	const ITEMFINDER   ; 35
	const POKE_FLUTE   ; 36
	const EXP_SHARE    ; 37
	const OLD_ROD      ; 38
	const GOOD_ROD     ; 39
	const SILVER_LEAF  ; 3a
	const SUPER_ROD    ; 3b
	const PP_UP        ; 3c
	const PP_MAX	   ; 3d
	const ETHER        ; 3e
	const MAX_ETHER    ; 3f
	const ELIXER       ; 40
	const RED_SCALE    ; 41
	const SECRETPOTION ; 42
	const S_S_TICKET   ; 43
	const MYSTERY_EGG  ; 44
	const CLEAR_BELL   ; 45
	const SILVER_WING  ; 46
	const MOOMOO_MILK  ; 47
	const QUICK_CLAW   ; 48
	const PSNCUREBERRY ; 49
	const GOLD_LEAF    ; 4a
	const SOFT_SAND    ; 4b
	const SHARP_BEAK   ; 4c
	const PRZCUREBERRY ; 4d
	const BURNT_BERRY  ; 4e
	const ICE_BERRY    ; 4f
	const POISON_BARB  ; 50
	const KINGS_ROCK   ; 51
	const BITTER_BERRY ; 52
	const MINT_BERRY   ; 53
	const RED_APRICORN ; 54
	const TINYMUSHROOM ; 55
	const BIG_MUSHROOM ; 56
	const SILVERPOWDER ; 57
	const BLU_APRICORN ; 58
	const AMULET_COIN  ; 59
	const YLW_APRICORN ; 5a
	const GRN_APRICORN ; 5b
	const CLEANSE_TAG  ; 5c
	const MYSTIC_WATER ; 5d
	const TWISTEDSPOON ; 5e
	const WHT_APRICORN ; 5f
	const BLACKBELT_I  ; 60
	const BLK_APRICORN ; 61
	const PNK_APRICORN ; 62
	const BLACKGLASSES ; 63
	const SLOWPOKETAIL ; 64
	const PINK_BOW     ; 65
	const STICK        ; 66
	const SMOKE_BALL   ; 67
	const NEVERMELTICE ; 68
	const MAGNET       ; 69
	const MIRACLEBERRY ; 6a
	const PEARL        ; 6b
	const BIG_PEARL    ; 6c
	const EVERSTONE    ; 6d
	const SPELL_TAG    ; 6e
	const RAGECANDYBAR ; 6f
	const GS_BALL      ; 70
	const BLUE_CARD    ; 71
	const MIRACLE_SEED ; 72
	const THICK_CLUB   ; 73
	const FOCUS_BAND   ; 74
	const ENERGYPOWDER ; 75
	const ENERGY_ROOT  ; 76
	const HEAL_POWDER  ; 77
	const REVIVAL_HERB ; 78
	const HARD_STONE   ; 79
	const LUCKY_EGG    ; 7a
	const CARD_KEY     ; 7b
	const MACHINE_PART ; 7c
	const EGG_TICKET   ; 7d
	const LOST_ITEM    ; 7e
	const STARDUST     ; 7f
	const STAR_PIECE   ; 80
	const BASEMENT_KEY ; 81
	const PASS         ; 82
	const LUCKY_PUNCH  ; 83
	const CHARCOAL     ; 84
	const BERRY_JUICE  ; 85
	const SCOPE_LENS   ; 86
	const METAL_COAT   ; 87
	const DRAGON_FANG  ; 88
	const LEFTOVERS    ; 89
	const SOOTHE_BELL  ; 8a
	const EVIOLITE     ; 8b
	const DUSK_STONE   ; 8c
	const MYSTERYBERRY ; 8d
	const DRAGON_SCALE ; 8e
	const BERSERK_GENE ; 8f
	const LINK_CABLE   ; 90
	const ITEM_9A      ; 91
	const ITEM_9B      ; 92
	const SACRED_ASH   ; 93
	const FLOWER_MAIL  ; 95
	const ITEM_A2      ; 99
	const LIGHT_BALL   ; 9a
	const NORMAL_BOX   ; 9e
	const GORGEOUS_BOX ; 9f
	const SUN_STONE    ; a0
	const POLKADOT_BOW ; a1
	const ITEM_AB      ; a2
	const UP_GRADE     ; a3
	const BERRY        ; a4
	const GOLD_BERRY   ; a5
	const SQUIRTBOTTLE ; a6
	const ITEM_B0      ; a7
	const RAINBOW_WING ; a9
	const ITEM_B3      ; aa
	const BRICK_PIECE  ; ab
	const SURF_MAIL    ; ac
	const LITEBLUEMAIL ; ad
	const PORTRAITMAIL ; ae
	const LOVELY_MAIL  ; af
	const EON_MAIL     ; b0
	const MORPH_MAIL   ; b1
	const BLUESKY_MAIL ; b2
	const MUSIC_MAIL   ; b3
	const MIRAGE_MAIL  ; b4
	const ITEM_BE  	   ; b5
	const ITEM_C3      ; b6
	const ITEM_DC      ; b7
DEF NUM_ITEMS EQU const_value - 1

DEF __tmhm_value__ = 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $b8
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE = \1
	add_tmnum \1
ENDM

; see data/moves/tmhm_moves.asm for moves
DEF TM01 EQU const_value
	add_tm DYNAMICPUNCH ; b8
	add_tm HEADBUTT     ; b9
	add_tm CURSE        ; ba
	add_tm ROLLOUT      ; bb
	add_tm ROAR         ; bc
	add_tm TOXIC        ; bd
	add_tm HAIL			; be
	add_tm ROCK_SMASH   ; bf
	add_tm PSYCH_UP     ; c0
	add_tm HIDDEN_POWER ; c1
	add_tm SUNNY_DAY    ; c2
	add_tm SWEET_SCENT  ; c3
	add_tm SNORE        ; c4
	add_tm BLIZZARD     ; c5
	add_tm HYPER_BEAM   ; c6
	add_tm LIGHT_SCREEN ; c7
	add_tm PROTECT      ; c8
	add_tm RAIN_DANCE   ; c9
	add_tm GIGA_DRAIN   ; ca
	add_tm SAFEGUARD	; cb
	add_tm FRUSTRATION  ; cc
	add_tm SOLARBEAM    ; cd
	add_tm IRON_TAIL    ; ce
	add_tm DRAGONBREATH ; cf
	add_tm THUNDER      ; d0
	add_tm EARTHQUAKE   ; d1
	add_tm RETURN       ; d2
	add_tm DIG          ; d3
	add_tm PSYCHIC_M    ; d4
	add_tm SHADOW_BALL  ; d5
	add_tm MUD_SLAP     ; d6
	add_tm DOUBLE_TEAM  ; d7
	add_tm REFLECT		; d8
	add_tm SWAGGER      ; d9
	add_tm SLEEP_TALK   ; da
	add_tm SLUDGE_BOMB  ; db
	add_tm SANDSTORM    ; dc
	add_tm FIRE_BLAST   ; dd
	add_tm SWIFT        ; de
	add_tm DEFENSE_CURL ; df
	add_tm THUNDERPUNCH ; e0
	add_tm DREAM_EATER  ; e1
	add_tm DETECT       ; e2
	add_tm REST         ; e3
	add_tm ATTRACT      ; e4
	add_tm THIEF        ; e5
	add_tm STEEL_WING   ; e6
	add_tm FIRE_PUNCH   ; e7
	add_tm FURY_CUTTER  ; e8
	add_tm NIGHTMARE    ; e9
	add_tm FALSE_SWIPE  ; ea
	add_tm ZAP_CANNON   ; eb
	add_tm ENDURE 		; ec
	add_tm ICY_WIND 	; ed
	add_tm ICE_PUNCH 	; ee
	add_tm EXPLOSION  	; ef
	add_tm THUNDER_WAVE ; f0
	add_tm SWORDS_DANCE	; f1
	add_tm ROCK_SLIDE	; f2
	add_tm SUBSTITUTE	; f3
DEF NUM_TMS EQU __tmhm_value__ - 1

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $f4
; - \1_TMNUM: the learnable TM/HM flag, starting at 61
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT          ; f4
	add_hm FLY          ; f5
	add_hm SURF         ; f6
	add_hm STRENGTH     ; f7
	add_hm FLASH        ; f8
	add_hm WHIRLPOOL    ; f9
	add_hm WATERFALL    ; fa
DEF NUM_HMS EQU __tmhm_value__ - NUM_TMS - 1

MACRO add_mt
; Defines two constants:
; - \1_TMNUM: the learnable TM/HM flag, starting at 68
; - MT##_MOVE: alias for the move id, equal to the value of \1
	DEF MT_VALUE = __tmhm_value__ - NUM_TMS - NUM_HMS
	DEF MT{02d:MT_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

DEF MT01 EQU const_value
	add_mt FLAMETHROWER
	add_mt THUNDERBOLT
	add_mt ICE_BEAM
;	add_mt BODY_SLAM
;	add_mt COUNTER
;	add_mt DOUBLE_EDGE
;	add_mt METRONOME
;	add_mt MIMIC
;	add_mt SEISMIC_TOSS
;	add_mt SOFTBOILED
;	add_mt MEGA_PUNCH
;	add_mt MEGA_KICK
DEF NUM_TUTORS = __tmhm_value__ - NUM_TMS - NUM_HMS - 1

DEF NUM_TM_HM_TUTOR EQU NUM_TMS + NUM_HMS + NUM_TUTORS


DEF USE_SCRIPT_VAR EQU $00
DEF ITEM_FROM_MEM  EQU $ff

; leftovers from red
DEF SAFARI_BALL    EQU $08 ; MOON_STONE
