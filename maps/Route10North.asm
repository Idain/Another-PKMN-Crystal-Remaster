Route10North_MapScripts:
	def_scene_scripts

	def_callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

PowerPlantSignText:
	text "Kanto Power Plant"
	done

Route10North_MapEvents:
	def_warp_events
	warp_event 10,  3, ROCK_TUNNEL_1F, 1
	warp_event 15,  5, ROUTE_10_POKECENTER_1F, 1
	warp_event  8, 29, POWER_PLANT, 1

	def_coord_events

	def_bg_events
	bg_event  7, 31, BGEVENT_READ, PowerPlantSign
	bg_event 16,  5, BGEVENT_READ, Route10PokecenterSign

	def_object_events
