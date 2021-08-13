Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#mon League"

	para "Victory Road"
	line "Entrance"
	done

Route22_MapEvents:
	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
