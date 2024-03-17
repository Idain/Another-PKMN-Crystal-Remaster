	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "I'm raising my"
	line "#mon. Want to"
	cont "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

BirdKeeperHankAfterBattleText:
	text "If you have a"
	line "specific #mon"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

PicnickerHopeAfterBattleText:
	text "I heard Clefairy"
	line "appear at Mt.Moon."

	para "But where could"
	line "they be?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……I'll go train"
	line "some more…"
	done

MtMoonSquareSignText:
	text "Mt.Moon Square"

	para "Just go up the"
	line "stairs."
	done

Route4_MapEvents:
	def_warp_events
	warp_event  6,  7, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_READ, MtMoonSquareSign
	bg_event 17,  6, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 31, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event 16, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 46,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
