_NoPhotoText::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

_EggPhotoText::
	text "An Egg? My talent"
	line "is worth more…"
	done

_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "the Name Rater."

	para "I rate the names"
	line "of #mon."

	para "Would you like me"
	line "to rate names?"
	done

_NameRaterWhichMonText::
	text "Which #mon's"
	line "nickname should I"
	cont "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

_NameRaterEggText::
	text "Whoa… That's just"
	line "an Egg."
	done

_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

_NameRaterNamedText::
	text "All right. This"
	line "#mon is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

_BoostedExpPointsText::
	text_start
	line "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " Exp. Points!"
	prompt

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " Exp. Points!"
	prompt

_GoMonText::
	text "Go! @"
	text_end

_DoItMonText::
	text "Do it! @"
	text_end

_GoForItMonText::
	text "Go for it,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " that's"
	line "enough! Come back!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Come back!@"
	text_end

_GoodComeBackText::
	text " good!"
	line "Come back!@"
	text_end

_ComeBackText::
	text " come"
	line "back!"
	done

_BootedTMText::
	text "Booted up a TM."
	prompt

_BootedHMText::
	text "Booted up an HM."
	prompt

_ContainedMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #mon?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "s."
	prompt

_ReceivedTMHMText::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "The link has been"
	line "cancelled."
	prompt

_MysteryGiftCommErrorText::
	text "Communication"
	line "error."
	prompt

_RetrieveMysteryGiftText::
	text "Must retrieve gift"
	line "at #mon Center."
	prompt

_YourFriendIsNotReadyText::
	text "Your friend isn't"
	line "ready."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "gifts a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. One gift"
	line "a day per person."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

_NameCardReceivedCardText::
	text "Received"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s Card."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s Card was"
	line "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "The Card was not"
	line "registered."
	prompt

_NameCardLinkCancelledText::
	text "The link has been"
	line "cancelled."
	prompt

_NameCardLinkCommErrorText::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! A new Badge"
	line "is required."
	prompt

_CantUseItemText::
	text "Can't use that"
	line "here."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " used"
	line "Cut!"
	prompt

_CutNothingText::
	text "There's nothing to"
	line "cut here."
	prompt

_BlindingFlashText::
	text "A blinding flash"
	line "lights the area!@"
	text_promptbutton
	text_end

_UsedSurfText::
	text_ram wStringBuffer2
	text " used"
	line "Surf!"
	done

_CantSurfText::
	text "You can't surf"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "Ssurfing."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to Surf?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "Waterfall"
	done

_HugeWaterfallText::
	text "Wow, it's a huge"
	line "waterfall."
	done

_AskWaterfallText::
	text "Do you want to use"
	line "Waterfall?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "Dig!"
	done

_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "Escape Rope."
	done

_CantUseDigText::
	text "Can't use that"
	line "here."
	done

_TeleportReturnText::
	text "Return to the last"
	line "#mon Center."
	done

_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "A #mon is using"
	line "Strength already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "Strength!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

_AskStrengthText::
	text "A #mon may be"
	line "able to move this."

	para "Want to use"
	line "Strength?"
	done

_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	done

_BouldersMayMoveText::
	text "A #mon may be"
	line "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "Whirlpool!"
	prompt

_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "A #mon may be"
	line "able to pass it."
	done

_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "Whirlpool?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "headbutt!"
	prompt

_HeadbuttNothingText::
	text "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "A #mon could be"
	line "in this tree."

	para "Want to Headbutt"
	line "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
	line "Rock Smash"
	prompt

_MaySmashText::
	text "Maybe a #mon"
	line "can break this."
	done

_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to use Rock"
	line "Smash?"
	done

_RodBiteText::
	text "Oh!"
	line "A bite!"
	prompt

_RodNothingText::
	text "Not even a nibble!"
	prompt

_UnusedNothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "This tree can be"
	line "cut!"

	para "Want to use Cut?"
	done

_CanCutText::
	text "This tree can be"
	line "cut!"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> whited"
	line "out!"
	done

_WhitedOutToWildMonText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> panicked"
	line "and dropped"
	cont "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "…"

	para "<……><……><……>"
	line "<……><……><……>"

	para "<PLAYER> whited"
	line "out!"
	done

_WhitedOutToTrainerText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> paid"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text " to the"
	cont "winner…"

	para "<……><……><……>"
	line "<……><……><……>"

	para "<PLAYER> whited"
	line "out!"
	done	

_ItemfinderItemNearbyText::
	text "Yes! The Dowsing"
	line "MCHN indicates"

	para "there's an item"
	line "nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! The Dowsing"
	line "MCHN isn't respond-"
	cont "ing."
	prompt

_PoisonRecoveryText::
	text_ram wStringBuffer3
	text_start
	line "survived the"
	cont "poisoning!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " used"
	line "Sweet Scent!"
	done

_SweetScentNothingText::
	text "Looks like there's"
	line "nothing here…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #mon"
	line "were all healed!"
	done

_AnEggCantHoldAnItemText::
	text "An Egg can't hold"
	line "an item."
	prompt

_PackNoItemText::
	text "No items."
	done

_AskThrowAwayText::
	text "Throw away how"
	line "many?"
	done

_AskQuantityThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

_ThrewAwayText::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	prompt

_OakThisIsntTheTimeText::
	text "Oak: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

_YouDontHaveAMonText::
	text "You don't have a"
	line "#mon!"
	prompt

_RegisteredItemText::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "You can't register"
	line "that item."
	prompt

_AskItemMoveText::
	text "Where should this"
	line "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "You can't use it"
	line "in a battle."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Are you a boy?"
	line "Or are you a girl?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>went way up!"
	prompt

_BattleStatWentUpText::
	text " went up!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sharply fell!"
	prompt

_BattleStatFellText::
	text " fell!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "dug a hole!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMoveText::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text "!"
	done

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its Egg!@"
	sound_caught_mon
	text_promptbutton
	text_end

_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nickname
	text_start
	line "that was left with"
	cont "the Day-Care Lady."
	done

_LeftWithDayCareManText::
	text "It's @"
	text_ram wBreedMon1Nickname
	text_start
	line "that was left with"
	cont "the Day-Care Man."
	done

_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no mail"
	line "here."
	prompt

_MailClearedPutAwayText::
	text "The cleared mail"
	line "was put away."
	prompt

_MailPackFullText::
	text "The Pack is full."
	prompt

_MailMessageLostText::
	text "The mail's message"
	line "will be lost. OK?"
	done

_MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

_MailEggText::
	text "An Egg can't hold"
	line "any Mail."
	prompt

_MailMovedFromBoxText::
	text "The Mail was moved"
	line "from the Mailbox."
	prompt

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " was"
	line "sent to Bill's PC."
	prompt

_PCGottaHavePokemonText::
	text "You gotta have"
	line "#mon to call!"
	prompt

_PCWhatText::
	text "What?"
	done

_PCMonHoldingMailText::
	text "There is a #mon"
	line "holding a mail."

	para "Please remove the"
	line "mail."
	prompt

_PCNoSingleMonText::
	text "You don't have a"
	line "single #mon!"
	prompt

_PCCantDepositLastMonText::
	text "You can't deposit"
	line "your last #mon!"
	prompt

_PCCantTakeText::
	text "You can't take any"
	line "more #mon."
	prompt

_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Switch #mon?"
	done

_ContestAlreadyCaughtText::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that Magikarp."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your PC Box."
	prompt

_CaughtAskNicknameText::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #mon to"
	cont "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

_PlayersPCNoItemsText::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "Bill's PC"
	line "accessed."

	para "#mon Storage"
	line "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

_PokecenterOaksPCText::
	text "Prof.Oak's PC"
	line "accessed."

	para "#dex Rating"
	line "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#dex rated?"
	done

_OakPCText2::
	text "Current #dex"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #mon seen"
	line "@"
	text_ram wStringBuffer4
	text " #mon owned"

	para "Prof.Oak's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #mon"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # Balls."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #dex."

	para "Catch different"
	line "kinds of #mon!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #dex is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#mon grow,"

	para "others use the"
	line "effects of stones."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing rod? You"

	para "can catch #mon"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #mon only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #dex is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#mon, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met Kurt?"
	line "His custom Balls"
	cont "should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #mon than"

	para "the last #dex"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #mon?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #dex"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #mon!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#mon professor"
	line "right now!"
	done

_OakRating18::
	text "Your #dex is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#dex! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to Prof."
	line "Oak's PC closed."
	done

_MemoryGameYeahText::
	text " , yeah!"
	done

_MemoryGameDarnText::
	text "Darn…"
	done

_StartMenuContestEndText::
	text "Would you like to"
	line "end the Contest?"
	done

_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(s)."
	prompt

_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "Oak: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Please remove the"
	line "Mail first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

_MailLoseMessageText::
	text "The Mail will lose"
	line "its message. OK?"
	done

_MailDetachedText::
	text "Mail detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "There's no space"
	line "for removing Mail."
	prompt

_MailAskSendToPCText::
	text "Send the removed"
	line "Mail to your PC?"
	done

_MailboxFullText::
	text "Your PC's Mailbox"
	line "is full."
	prompt

_MailSentToPCText::
	text "The Mail was sent"
	line "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "An item in your"
	line "Pack may be"

	para "registered for use"
	line "on Select Button."
	done

_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #mon!"

	para "My name is Oak."

	para "People call me the"
	line "#mon Professor."
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#mon.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

_OakText4::
	text "People and #mon"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #mon, some"
	cont "battle with them."
	prompt

_OakText5::
	text "But we don't know"
	line "everything about"
	cont "#mon yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#mon every day."
	prompt
