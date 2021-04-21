	object_const_def
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER

AzaleaMart_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaMartClerkScript:
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .EightBadgesStock
	checkflag ENGINE_GLACIERBADGE
	iftrue .SevenBadgesStock
	checkflag ENGINE_MINERALBADGE
	iftrue .FiveBadgesStock
	checkflag ENGINE_PLAINBADGE
	iftrue .ThreeBadgesStock
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

.ThreeBadgesStock
	pokemart MARTTYPE_STANDARD, MART_AZALEA_THREE_BADGES
	closetext
	end

.FiveBadgesStock
	pokemart MARTTYPE_STANDARD, MART_AZALEA_FIVE_BADGES
	closetext
	end

.SevenBadgesStock
	pokemart MARTTYPE_STANDARD, MART_AZALEA_SEVEN_BADGES
	closetext
	end

.EightBadgesStock
	pokemart MARTTYPE_STANDARD, MART_AZALEA_EIGHT_BADGES
	closetext
	end

AzaleaMartCooltrainerMScript:
	checkflag ENGINE_MINERALBADGE
	iftrue .GreatBallStock
	jumptextfaceplayer AzaleaMartCooltrainerMText

.GreatBallStock
	jumptextfaceplayer AzaleaMartCooltrainerMGreatBallStockText
	
AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "There's no Great"
	line "Ball here. #"

	para "Balls will have"
	line "to do."

	para "I wish Kurt would"
	line "make me some of"
	cont "his custom Balls."
	done

AzaleaMartCooltrainerMGreatBallStockText:
	text "Finally! There are"
	line "Great Balls in"
	cont "stock!"

	para "Still, I wish I"
	line "had some of Kurt's"
	cont "custom Balls…"
	done

AzaleaMartBugCatcherText:
	text "A Great Ball is"
	line "better for catch-"
	cont "ing #mon than a"
	cont "# Ball."

	para "But Kurt's might"
	line "be better some-"
	cont "times."
	done

AzaleaMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
