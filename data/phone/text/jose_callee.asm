JoseAnswerPhoneText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>?"
	line "Good morning!"
	done

JoseAnswerPhoneDayText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>? Hi!"
	done

JoseAnswerPhoneNiteText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>?"
	line "Good evening!"
	done

JoseGreetText:
JoseGreetDayText:
JoseGreetNiteText:
	text "Oh, <PLAY_G>?"

	para "Tweet! Yeah, it's"
	line "me, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText:
	text "Are your #mon"
	line "still cooking?"

	para "My @"
	text_ram wStringBuffer4
	text " has"
	line "too much energy."

	para "Once it takes off,"
	line "it won't come back"
	cont "for a while."
	done
