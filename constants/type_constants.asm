; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BIRD
	const BUG
	const GHOST
	const STEEL

UNUSED_TYPES EQU const_value
	const_next 19
	const CURSE_TYPE
UNUSED_TYPES_END EQU const_value

	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC_TYPE
	const ICE
	const DRAGON
	const DARK
TYPES_END EQU const_value

TYPE_MASK EQU %00111111
PHYSICAL  EQU %01000000
SPECIAL   EQU %10000000
STATUS    EQU %11000000

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END - 1 ; discount BIRD

POKEDEX_TYPE_STRING_LENGTH EQU 9
