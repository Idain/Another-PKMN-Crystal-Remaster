	object_const_def
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	sdefer BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 10
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "Battle Tower"
	line "welcomes you!"

	para "I could show you"
	line "to a Battle Room."
	done

Text_WantToGoIntoABattleRoom:
	text "Want to go into a"
	line "Battle Room?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Right this way to"
	line "your Battle Room."
	done

Text_BattleTowerIntroduction_2:
	text "Battle Tower is a"
	line "facility made for"
	cont "#mon battles."

	para "Countless #mon"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "Battle Rooms."

	para "There are many"
	line "Battle Rooms in"
	cont "the Battle Tower."

	para "Each Room holds"
	line "seven trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"

	para "save. If not, you"
	line "won't be able to"

	para "resume your Room"
	line "challenge."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Received a list of"
	line "Leaders on the"
	cont "Honor Roll."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Please confirm on"
	line "this monitor."
	done

Text_ThanksForVisiting:
	text "Thanks for"
	line "visiting!"
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "For that, you get"
	line "this great prize!"

	para ""
	done

Text_PlayerGotFive:
	text "<PLAYER> got five"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Oops, your Pack is"
	line "stuffed full."

	para "Please make room"
	line "and come back."
	done

Text_WeHopeToServeYouAgain:
	text "We hope to serve"
	line "you again."
	done

Text_PleaseStepThisWay:
	text "Please step this"
	line "way."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Would you like to"
	line "hear about the"
	cont "Battle Tower?"
	done

Text_CantBeRegistered:
	text "Your record from"
	line "the previous"

	para "Battle Room can't"
	line "be registered. OK?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Your record from"
	line "the previous"

	para "Battle Room can't"
	line "be registered."

	para "Also, the existing"
	line "record will be"
	cont "deleted. OK?"
	done

Text_ReadBattleTowerRules:
	text "Battle Tower rules"
	line "are written here."

	para "Read the rules?"
	done

Text_BattleTowerRules:
	text "Three #mon may"
	line "enter battles."

	para "All three must be"
	line "different."

	para "The items they"
	line "hold must also be"
	cont "different."

	para "Certain #mon"
	line "may also have"

	para "level restrictions"
	line "placed on them."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Excuse me!"
	line "You didn't save"

	para "before exiting"
	line "the Battle Room."

	para "I'm awfully sorry,"
	line "but your challenge"

	para "will be declared"
	line "invalid."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Your #mon will"
	line "be healed to full"
	cont "health."
	done

Text_NextUpOpponentNo:
	text "Next up, opponent"
	line "no.@"
	text_ram wStringBuffer3
	text ". Ready?"
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Before entering"
	line "the Battle Room,"

	para "your progress will"
	line "be saved."
	done

Text_SaveAndEndTheSession:
	text "SAVE and end the"
	line "session?"
	done

Text_SaveBeforeReentry:
	text "Your record will"
	line "be saved before"

	para "you go back into"
	line "the previous Room."
	done

Text_CancelYourBattleRoomChallenge:
	text "Cancel your Battle"
	line "Room challenge?"
	done

Text_WeveBeenWaitingForYou:
	text "We've been waiting"
	line "for you. This way"

	para "to a Battle Room,"
	line "please."
	done

Text_FiveDayBattleLimit_Mobile:
	text "You may enter only"
	line "five Battle Rooms"
	cont "each day."

	para "Please come back"
	line "tomorrow."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Sorry, but it's"
	line "not possible to"

	para "register your"
	line "current record at"

	para "the Center because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

Text_AMonLevelExceeds:
	text "One or more of"
	line "your #mon's"
	cont "levels exceeds @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " may not"
	line "enter a Battle"
	cont "Room under L70."

	para "This Battle Room"
	line "is for L@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done

Text_BattleTowerCooltrainerF:
	text "There are lots of"
	line "Battle Rooms, but"

	para "I'm going to win"
	line "them all!"
	done

Text_BattleTowerGranny:
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#mon hold items"

	para "is the key to"
	line "winning battles."
	done

Text_BattleTowerBugCatcher:
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#mon."

	para "Don't let there be"
	line "any fire #mon…"
	done

BattleTower1F_MapEvents:
	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
