	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownPokefanMText:
	text "That's quite some"
	line "building, eh?"

	para "It's Kanto's Radio"
	line "Tower."
	done

LavenderTownTeacherText:
	text "Kanto has many"
	line "good radio shows."
	done

LavenderTownGrampsText:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #mon."
	done

LavenderTownYoungsterText:
	text "You need a #"
	line "Flute to wake"
	cont "sleeping #mon."

	para "Every trainer has"
	line "to know that!"
	done

LavenderTownSignText:
	text "Lavender Town"

	para "The Noble Town"
	done

KantoRadioStationSignText:
	text "Kanto Radio"
	line "Station"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "Lavender Volunteer"
	line "#mon House"
	done

SoulHouseSignText:
	text "House of Memories"

	para "May #mon Spir-"
	line "its Rest Easy."
	done

LavenderTown_MapEvents:
	def_warp_events
	warp_event  9,  7, LAVENDER_POKECENTER_1F, 1
	warp_event 11, 13, MR_FUJIS_HOUSE, 1
	warp_event  7, 17, LAVENDER_SPEECH_HOUSE, 1
	warp_event 11, 17, LAVENDER_NAME_RATER, 1
	warp_event  5,  7, LAVENDER_MART, 2
	warp_event 21, 15, SOUL_HOUSE, 1
	warp_event 18,  7, LAV_RADIO_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 17, 11, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  9, 13, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 17, 15, BGEVENT_READ, SoulHouseSign
	bg_event 10,  7, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  6,  7, BGEVENT_READ, LavenderMartSignText

	def_object_events
	object_event 20, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  6, 19, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 19, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
