	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .Cheating
	checkevent EVENT_MET_BLUE
	iftrue .AlreadyMetBlue
	setevent EVENT_MET_BLUE
	writetext CinnabarIslandBlueText
	promptbutton
	readvar VAR_KANTO_BADGES
	getnum STRING_BUFFER_3
	ifequal 0, .NoKantoBadges
	ifequal 1, .OnlyOneKantoBadge
	ifless 7, .NotEnoughBadges
.GotEnoughBadges
	writetext CinnabarIslandEqual15Badges
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

.AlreadyMetBlue
	writetext CinnabarAlreadyMetBlue
	promptbutton
	readvar VAR_KANTO_BADGES
	getnum STRING_BUFFER_3
	ifequal 0, .NoKantoBadges
	ifequal 1, .OnlyOneKantoBadge
	ifequal 7, .GotEnoughBadges
	; fallthrough
.NotEnoughBadges
	writetext CinnabarIslandLessThan15Badges
	waitbutton
	closetext
	end

.NoKantoBadges:
	writetext CinnabarIslandNoKantoBadges
	waitbutton
	closetext
	end

.OnlyOneKantoBadge:
	writetext CinnabarIslandOnlyOneKantoBadge
	waitbutton
	closetext
	end

.Cheating
	writetext CinnabarIslandPlayerCheating
	waitbutton
	closetext
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Who are you?"

	para "Well, it's plain"
	line "to see that you're"
	cont "a trainer…"

	para "My name's Blue."

	para "I was once the"
	line "Champion, although"

	para "it was short-lived"
	line "thanks to Red…"

	para "Anyway, what do"
	line "you want? You want"

	para "to challenge me or"
	line "something?"

	para "…I hate to say"
	line "it, but I'm not in"

	para "the mood for a"
	line "battle now."

	para "Take a good look"
	line "around you…"

	para "A volcano erupts,"
	line "and just like"

	para "that, a whole town"
	line "disappears."

	para "We can go on win-"
	line "ning and losing in"

	para "#mon. But if"
	line "nature so much as"

	para "twitches, we can"
	line "be overwhelmed"
	cont "in a second."

	para "…"

	para "That's the way it"
	line "is…"

	para "But, anyway, I'm"
	line "still a trainer."

	para "If I see a strong"
	line "opponent, it makes"
	cont "me want to battle."

	para "If you want to"
	line "battle me, show me"

	para "how many Kanto"
	line "Badges you've got."
	done

CinnabarAlreadyMetBlue:
	text "Hey, buddy."

	para "Have you finally"
	line "collected enough"
	cont "Kanto Badges?"
	done
	
CinnabarIslandNoKantoBadges:
	text "…"

	para "So no Badges…"

	para "You're not ready"
	line "to battle me…"
	done

CinnabarIslandOnlyOneKantoBadge:
	text "…"

	para "Only one Badge…"

	para "You're not ready"
	line "to battle me…"
	done

CinnabarIslandLessThan15Badges:
	text "…"

	para "@"
	text_ram wStringBuffer3
	text " Kanto Badges…"

	para "You're not ready"
	line "to battle me…"
	done

CinnabarIslandEqual15Badges:
	text "…"

	para "Yep, you've got"
	line "enough Badges."

	para "If you want to"
	line "battle me, come to"
	cont "the Viridian Gym."

	para "I'll be waiting for"
	line "you!"
	done

CinnabarIslandPlayerCheating:
	text "Hey. Before any-"
	line "thing, I want to"
	cont "ask you something."

	para "Why do you have"
	line "the Earth Badge?"

	para "Are you so weak"
	line "that you need to"
	cont "rely on cheats?"

	para "Pathetic… and you"
	line "are the Johto"
	cont "Champion?"

	para "Come back when you"
	line "decide to play"
	cont "fair."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "Cinnabar Gym has"
	line "relocated to Sea-"
	cont "foam Islands."

	para "Blaine"
	done

CinnabarIslandSignText:
	text "Cinnabar Island"

	para "The Ravaged Town"
	line "of the Past"
	done

CinnabarIsland_MapEvents:
	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
