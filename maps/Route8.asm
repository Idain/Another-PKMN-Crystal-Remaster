	object_const_def
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "We're the Kanto"
	line "#mon Federation"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

BikerDwayneAfterBattleText:
	text "The Kanto #mon"
	line "Federation will"
	cont "never fall!"
	done

BikerHarrisSeenText:
	text "The cops shut down"
	line "our Underground"

	para "Path! That really"
	line "fries me!"
	done

BikerHarrisBeatenText:
	text "F-forgive me!"
	done

BikerHarrisAfterBattleText:
	text "Wiped out by some"
	line "punk from Johto…"
	done

BikerZekeSeenText:
	text "We're the Kanto"
	line "#mon Federa-"
	cont "tion!"
	cont "Right on!"
	done

BikerZekeBeatenText:
	text "Yikes! Sorry!"
	done

BikerZekeAfterBattleText:
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

SupernerdSamSeenText:
	text "How does the Mag-"
	line "net Train work?"
	done

SupernerdSamBeatenText:
	text "I just want to see"
	line "the Magnet Train…"
	done

SupernerdSamAfterBattleText:
	text "The power of mag-"
	line "nets is awesome!"
	done

SupernerdTomSeenText:
	text "Hm… You've got"
	line "many Gym Badges."
	done

SupernerdTomBeatenText:
	text "Just as I thought…"
	line "You're tough!"
	done

SupernerdTomAfterBattleText:
	text "It's no surprise"
	line "that you've got"
	cont "many Gym Badges!"
	done

Route8LockedDoorText:
	text "It's locked…"
	done

Route8UndergroundPathSignText:
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done

Route8_MapEvents:
	def_warp_events
	warp_event  6, 10, ROUTE_8_SAFFRON_GATE, 3
	warp_event  6, 11, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 15,  8, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 13,  7, BGEVENT_READ, Route8LockedDoor

	def_object_events
	object_event 12, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	object_event 25,  8, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 21, 13, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, -1
	object_event 37,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 42, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	object_event 45,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
