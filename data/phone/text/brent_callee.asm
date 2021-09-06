BrentAnswerPhoneText:
BrentAnswerPhoneDayText:
BrentAnswerPhoneNiteText:
	text "Yes? @"
	text_ram wStringBuffer3
	text " here…"

	para "Ah, <PLAYER>. What"
	line "can I do for you?"
	done

BrentGreetText:
BrentGreetDayText:
BrentGreetNiteText:
	text "Hiya, <PLAYER>, how"
	line "are you doing?"

	para "Hey, it's me,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGenericText:
	text "Oh yeah, I saw you"
	line "coming out of a"

	para "#mon Center the"
	line "other day."

	para "You heal your"
	line "#mon regularly,"

	para "don't you?"
	line "I'm impressed."

	para "Heh, my @"
	text_ram wStringBuffer4
	text_start
	line "is so tough, it"

	para "doesn't need to go"
	line "to #mon Centers"
	cont "often. Heheh!"
	done
