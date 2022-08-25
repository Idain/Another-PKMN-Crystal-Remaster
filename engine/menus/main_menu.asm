	; MainMenuItems indexes
	const_def
	const MAINMENU_NEW_GAME               ; 0
	const MAINMENU_CONTINUE               ; 1
	const MAINMENU_MOBILE_MYSTERY         ; 2
	const MAINMENU_MOBILE                 ; 3
	const MAINMENU_MOBILE_STUDIUM         ; 4
	const MAINMENU_MYSTERY_MOBILE_STUDIUM ; 5
	const MAINMENU_MYSTERY                ; 6
	const MAINMENU_MYSTERY_STUDIUM        ; 7
	const MAINMENU_STUDIUM                ; 8

	; MainMenu.Strings and MainMenu.Jumptable indexes
	const_def
	const MAINMENUITEM_CONTINUE       ; 0
	const MAINMENUITEM_NEW_GAME       ; 1
	const MAINMENUITEM_OPTION         ; 2
	const MAINMENUITEM_MYSTERY_GIFT   ; 3
	const MAINMENUITEM_MOBILE         ; 4
	const MAINMENUITEM_MOBILE_STUDIUM ; 5
	const MAINMENUITEM_DEBUG_ROOM     ; 6

MobileMenuGFX:
INCBIN "gfx/mobile/mobile_menu.2bpp"

MainMenu:
.loop
	xor a
	ld [wDisableTextAcceleration], a
	call ClearTilemapEtc
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPaused
	res GAME_TIMER_PAUSED_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	ret c
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 16, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
; entries correspond to MAINMENUITEM_* constants
	db "CONTINUE@"
	db "NEW GAME@"
	db "OPTION@"
	db "MYSTERY GIFT@"
	db "MOBILE@"
	db "MOBILE STUDIUM@"
if DEF(_DEBUG)
	db "DEBUG ROOM@"
endc

.Jumptable:
; entries correspond to MAINMENUITEM_* constants
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Option
	dw MainMenu_MysteryGift
	dw MainMenu_Mobile
	dw MainMenu_MobileStudium
if DEF(_DEBUG)
	dw MainMenu_DebugRoom
endc

MainMenuItems:
; entries correspond to MAINMENU_* constants

	; MAINMENU_NEW_GAME
	db 2
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db -1

	; MAINMENU_CONTINUE
	db 3 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MOBILE_MYSTERY
	db 5 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MYSTERY_GIFT
	db MAINMENUITEM_MOBILE
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MOBILE
	db 4 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MOBILE
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MOBILE_STUDIUM
	db 5 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MOBILE
	db MAINMENUITEM_MOBILE_STUDIUM
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MYSTERY_MOBILE_STUDIUM
	db 6 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MYSTERY_GIFT
	db MAINMENUITEM_MOBILE
	db MAINMENUITEM_MOBILE_STUDIUM
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MYSTERY
	db 4 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MYSTERY_GIFT
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_MYSTERY_STUDIUM
	db 5 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MYSTERY_GIFT
	db MAINMENUITEM_MOBILE_STUDIUM
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

	; MAINMENU_STUDIUM
	db 4 + DEF(_DEBUG)
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_MOBILE_STUDIUM
if DEF(_DEBUG)
	db MAINMENUITEM_DEBUG_ROOM
endc
	db -1

MainMenu_GetWhichMenu:
	nop
	nop
	nop
	ld a, [wSaveFileExists]
	and a
	jr nz, .next
	ld a, MAINMENU_NEW_GAME
	ret

.next
	ldh a, [hCGB]
	cp TRUE
	ld a, MAINMENU_CONTINUE
	ret nz
	ld a, BANK(sNumDailyMysteryGiftPartnerIDs)
	call OpenSRAM
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	inc a ; locked?
	call CloseSRAM
	ld a, MAINMENU_MYSTERY
	ret nz ; mystery_gift
	ld a, MAINMENU_CONTINUE
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr nz, .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

MainMenu_PrintCurrentTimeAndDay:
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jp nz, SpeechTextbox ; time fail
	hlcoord 0, 14
	lb bc, 2, 18
	jp Textbox

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 1, 15
	farcall PrintDayOfWeek
	decoord 4, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld a, ":"
	ld [hli], a
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.PrintTimeNotSet:
	hlcoord 1, 14
	ld de, .TimeNotSetString
	jp PlaceString

.TimeNotSetString:
	db "TIME NOT SET@"

ClearTilemapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	farcall LoadFontsExtra
	farcall LoadStandardFont
	jp ClearWindowData

MainMenu_NewGame:
	farcall NewGame
	ret

MainMenu_Option:
	farcall Option
	ret

MainMenu_Continue:
	farcall Continue
	ret

MainMenu_MysteryGift:
	farcall MysteryGift
	ret
