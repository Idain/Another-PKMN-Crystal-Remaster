DefaultOptions:
; wOptions: fast text speed, stereo toggled and Battle Set toggled
	db TEXT_DELAY_FAST | (1 << STEREO) | (1 << BATTLE_SHIFT)
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
