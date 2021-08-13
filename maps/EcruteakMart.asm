	object_const_def
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakMartClerkScript:
	opentext
	readvar VAR_JOHTO_BADGES
	ifequal 8, .EightBadgesStock
	ifequal 7, .SevenBadgesStock
	ifequal 5, .FiveBadgesStock
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end
	
.FiveBadgesStock
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK_FIVE_BADGES
	closetext
	end

.SevenBadgesStock
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK_SEVEN_BADGES
	closetext
	end

.EightBadgesStock
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK_EIGHT_BADGES
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "My Eevee evolved"
	line "into an Espeon."

	para "But my friend's"
	line "Eevee turned into"
	cont "an Umbreon."

	para "I wonder why? We"
	line "both were raising"

	para "our Eevee in the"
	line "same way…"
	done

EcruteakMartGrannyText:
	text "If you use Revive,"
	line "a #mon that's"

	para "fainted will wake"
	line "right up."
	done

EcruteakMart_MapEvents:
	def_warp_events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
