	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BattleTowerOutsideNoopCallback
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

BattleTowerOutsideNoopCallback:
	endcallback

BattleTowerOutsideShowCiviliansCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	endcallback

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText_Mobile

BattleTowerOutsideBeautyScript:
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_Mobile:
	text "Wow, the Battle"
	line "Tower is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#mon."
	done

BattleTowerOutsideBeautyText:
	text "You can use only"
	line "three #mon."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done


BattleTowerOutsideSailorText:
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done

BattleTowerOutsideSignText:
	text "Battle Tower"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done
	
BattleTowerOutside_MapEvents:
	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	def_object_events
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
