	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	loadtrainer PRYCE, PRYCE2
.StartGymBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM07_SNOWSCAPE
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	iflessorequal 5, .GotFifthBadge
	ifequal 6, .GotSixthBadge
	writetext PryceText_PlayerGotSeventhBadge
.continue
	writetext PryceText_GlacierBadgeSpeech
.continue2
	writetext PryceText_AGiftFromMe
	promptbutton
	verbosegiveitem TM_SNOWSCAPE
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM07_SNOWSCAPE
	writetext PryceText_SnowscapeSpeech
	waitbutton
	closetext
	end

.GotFifthBadge:
	writetext PryceText_PlayerGotFifthBadge
	sjump .continue

.GotSixthBadge:
	writetext SixthBadge_PryceText_GlacierBadgeSpeech
	sjump .continue2

.SixBadgesBattle:
	loadtrainer PRYCE, PRYCE1
	sjump .StartGymBattle

.FiveBadgesBattle:
	loadtrainer PRYCE, PRYCE3
	sjump .StartGymBattle

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	trainer SKIER, ROXANNE2, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.SixBadgesBattle:
	trainer SKIER, ROXANNE1, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script
.FiveBadgesBattle:
	trainer SKIER, ROXANNE3, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	trainer SKIER, CLARISSA2, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.SixBadgesBattle:
	trainer SKIER, CLARISSA1, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script
.FiveBadgesBattle:
	trainer SKIER, CLARISSA3, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	trainer BOARDER, RONALD2, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.SixBadgesBattle:
	trainer BOARDER, RONALD1, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script
.FiveBadgesBattle:
	trainer BOARDER, RONALD3, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	trainer BOARDER, BRAD2, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.SixBadgesBattle:
	trainer BOARDER, BRAD1, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script
.FiveBadgesBattle:
	trainer BOARDER, BRAD3, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	readvar VAR_JOHTO_BADGES
	ifequal 6, .SixBadgesBattle
	ifequal 5, .FiveBadgesBattle
; At least 4 Johto Badges.
	trainer BOARDER, DOUGLAS2, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.SixBadgesBattle:
	trainer BOARDER, DOUGLAS1, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script
.FiveBadgesBattle:
	trainer BOARDER, DOUGLAS3, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "#mon have many"
	line "experiences in"

	para "their lives, just"
	line "like we do."

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "Since I am your"
	line "elder, let me show"
	cont "you what I mean."

	para "I have been with"
	line "#mon since"

	para "before you were"
	line "born."

	para "I do not lose"
	line "easily."

	para "I, Pryce--the"
	line "Winter Trainer--"

	para "shall demonstrate"
	line "my power!"
	done

PryceText_Impressed:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this Badge!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "Glacier Badge."
	done

PryceText_PlayerGotFifthBadge:
	text "This badge will"
	line "make all #mon"

	para "up to Lv. 40 obey"
	line "you."
	done

PryceText_PlayerGotSeventhBadge:
	text "That badge will"
	line "make all #mon"

	para "up to Lv. 45 obey"
	line "you."
	done

SixthBadge_PryceText_GlacierBadgeSpeech:
	text "That badge lets"
	line "your #mon use"

	para "Whirlpool to get"
	line "across real whirl-"
	cont "pools."
	done

PryceText_GlacierBadgeSpeech:
	text "It also lets your"
	line "#mon use Whirl-" 
	cont "pool to get across"
	cont "real whirlpools."
	done

PryceText_AGiftFromMe:
	text "And this… This is"
	line "a gift from me!"
	done

PryceText_SnowscapeSpeech:
	text "That TM contains"
	line "Snowscape."

	para "It summons a snow-"
	line "storm that lasts"
	cont "for five turns."

	para "The snowstorm"
	line "boosts the Defense"

	para "of Ice-type #-"
	line "mon by 50 %."
	done

PryceText_CherishYourPokemon:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "mon will be to-"
	cont "gether for many"
	cont "years to come."

	para "Cherish your time"
	line "together!"
	done

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#mon, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

BoarderRonaldAfterBattleText:
	text "I think there's a"
	line "move a frostbitten"

	para "#mon can use to"
	line "cure itself."
	done

BoarderBradSeenText:
	text "This Gym has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderBradAfterBattleText:
	text "This Gym is great."
	line "I love boarding"
	cont "with my #mon!"
	done

BoarderDouglasSeenText:
	text "I know Pryce's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "Pryce's secret."
	done

BoarderDouglasAfterBattleText:
	text "The secret behind"
	line "Pryce's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

SkierRoxanneSeenText:
	text "To get to Pryce,"
	line "our Gym Leader,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

SkierRoxanneAfterBattleText:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this Gym."
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

SkierClarissaAfterBattleText:
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

MahoganyGymGuideText:
	text "Pryce is a veteran"
	line "who has trained"

	para "#mon for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "Ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

MahoganyGymGuideWinText:
	text "Pryce is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done

MahoganyGym_MapEvents:
	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
