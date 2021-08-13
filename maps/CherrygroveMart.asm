	object_const_def
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveMartClerkScript:
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .EightBadgesStock
	checkflag ENGINE_GLACIERBADGE
	iftrue .SevenBadgesStock
	checkflag ENGINE_MINERALBADGE
	iftrue .FiveBadgesStock
	checkflag ENGINE_MINERALBADGE
	iftrue .ThreeBadgesStock
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .OneBadgeStock
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

.OneBadgeStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_ONE_BADGE
	closetext
	end

.ThreeBadgesStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_THREE_BADGES
	closetext
	end

.FiveBadgesStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_FIVE_BADGES
	closetext
	end

.SevenBadgesStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_SEVEN_BADGES
	closetext
	end

.EightBadgesStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_EIGHT_BADGES
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "They're fresh out"
	line "of # Balls!"

	para "When will they get"
	line "more of them?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "# Balls are in"
	line "stock! Now I can"
	cont "catch #mon!"
	done

CherrygroveMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #mon poi-"
	line "soned my #mon!"

	para "I just kept going,"
	line "but my #mon"
	cont "gradually lost HP."

	para "Thankfully, when"
	line "it was about to"

	para "faint, the poison"
	line "faded away."

	para "You should keep an"
	line "Antidote with you."
	done

CherrygroveMart_MapEvents:
	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
