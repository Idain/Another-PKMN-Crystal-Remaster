	object_const_def
	const BLACKTHORNPOKECENTER1F_NURSE
	const BLACKTHORNPOKECENTER1F_GENTLEMAN
	const BLACKTHORNPOKECENTER1F_TWIN1
	const BLACKTHORNPOKECENTER1F_TWIN2
	const BLACKTHORNPOKECENTER1F_COOLTRAINER_M

BlackthornPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

BlackthornPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BlackthornPokecenter1FGentlemanScript:
	jumptextfaceplayer BlackthornPokecenter1FGentlemanText

BlackthornPokecenter1FTwin1Script:
	jumptextfaceplayer BlackthornPokecenter1FTwin1Text

BlackthornPokecenter1FTwin2Script:
	jumptextfaceplayer BlackthornPokecenter1FTwin2Text

BlackthornPokecenter1FCooltrainerMScript:
	jumpstd HappinessCheckScript

BlackthornPokecenter1FGentlemanText:
	text "Deep inside far-"
	line "off Indigo Plateau"

	para "is the #mon"
	line "League."

	para "I hear the best"
	line "trainers gather"

	para "there from around"
	line "the country."
	done

BlackthornPokecenter1FTwin1Text:
	text "There was this"
	line "move I just had"

	para "to teach my #-"
	line "mon."

	para "So I got the Move"
	line "Deleter to make it"
	cont "forget an HM move."
	done

BlackthornPokecenter1FTwin2Text:
	text "I made my #mon"
	line "forget a move by"

	para "accident while"
	line "training, so I"

	para "got the Move Re-"
	line "minder to make it"
	cont "relearn the move."
	done

BlackthornPokecenter1F_MapEvents:
	def_warp_events
	warp_event  3,  7, BLACKTHORN_CITY, 5
	warp_event  4,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FNurseScript, -1
	object_event  5,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FTwin1Script, -1
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FTwin2Script, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FCooltrainerMScript, -1
