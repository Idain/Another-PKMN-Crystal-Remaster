	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UPGRADE
	iftrue .GotUpgrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UPGRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UPGRADE
.GotUpgrade:
	writetext SilphCoOfficerText_GotUpgrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Bulding."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

SilphCoOfficerText_GotUpgrade:
	text "It's Silph Co.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere yet."
	done

SilphCo1F_MapEvents:
	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
