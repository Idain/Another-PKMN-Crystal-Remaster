DebugFightMenu:
	ldh a, [hInMenu]
	push af
	ld a, TRUE
	ldh [hInMenu], a
	ld de, MUSIC_NONE
	call PlayMusic

	; All Pokémon will obey
	ld a, 1 << EARTHBADGE
	ld [wKantoBadges], a

	; Zero out number of items
	ld hl, wNumItems
	xor a
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	ld bc, MAX_ITEMS * 2 
	call ByteFill

;	ld hl, wNumKeyItems
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	ld bc, MAX_KEY_ITEMS
	call ByteFill

;	ld hl, wNumBalls
	ld [hli], a
	dec a
	ld [hli], a 
	inc a
	ld bc, MAX_BALLS * 2
	call ByteFill
	
;	ld hl, wNumBerries
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	ld bc, MAX_BERRIES * 2
	call ByteFill

;	ld hl, wNumMedicines
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	ld bc, MAX_MEDICINE * 2
	call ByteFill

; Load medicine data
	ld hl, wNumMedicines
	ld de, DebugFight_MedicineData
.loop_medicine
	ld a, [de]
	cp -1
	jr z, .load_items
	inc de
	ld [wCurItem], a
	ld a, [de]
	inc de
	ld [wItemQuantityChange], a
	push de
	call ReceiveItem
	pop de
	jr .loop_medicine

; Load item data
.load_items
	ld hl, wNumItems
	ld de, DebugFight_ItemData
.loop_items
	ld a, [de]
	cp -1
	jr z, .load_balls
	inc de
	ld [wCurItem], a
	ld a, [de]
	inc de
	ld [wItemQuantityChange], a
	push de
	call ReceiveItem
	pop de
	jr .loop_items

; Load Ball data
.load_balls
	ld hl, wNumBalls
	ld de, DebugFight_PokeBallData
.loop_balls
	ld a, [de]
	cp -1
	jr z, .ChoosePlayerParty
	inc de
	ld [wCurItem], a
	ld a, [de]
	inc de
	ld [wItemQuantityChange], a
	push de
	call ReceiveItem
	pop de
	jr .loop_balls

.ChoosePlayerParty:
	farcall StatsScreen_LoadFont
	call ClearTilemap
	call ClearSprites
	; fallthrough
RestartDebugFightMenu:
	hlcoord 0, 0
	lb bc, 1, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 5, 1
	ld de, DebugFight_TestFightText
	call PlaceString
	hlcoord 1, 4
	ld de, DebugFight_PlayerPartyHeaderText
	call PlaceString
	hlcoord 0, 6
	ld [hl], "▶"
	hlcoord 1, 6
	ld de, DebugFight_DefaultPlayerPartyText
	call PlaceString

	xor a
	ld [wCurPartyMon], a
	ld [wEnemyMon], a
	ld [wTrainerClass], a
	inc a
	ld [wEnemyMonLevel], a
	ld hl, wDebugFightMonLevel
rept PARTY_LENGTH - 1
	ld [hli], a
endr
	ld [hl], a
	lb bc, 0, 1
	ld hl, wOTPartyCount
	call DebugFight_ResetParty
	ld hl, wPartyCount
	call DebugFight_ResetParty

	ld de, wPartySpecies
	hlcoord 1, 6

DebugFight_PlaceArrow:
	push hl
	push bc
	dec hl
	ld [hl], "▶"
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
	ld [hl], " "
	pop bc
	pop hl

DebugFight_SpeciesJoypad:
	push bc
	push de
	call DelayFrame
	call JoyTextDelay
	pop de
	pop bc

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, DebugFight_IncrementSpecies
	bit B_BUTTON_F, a
	jp nz, DebugFight_DecrementSpecies
	bit START_F, a
	jp nz, DebugFight_StartButton
	bit D_RIGHT_F, a
	jp nz, DebugFight_ChangeToLevelColumn
	bit D_UP_F, a
	jp nz, DebugFight_PreviousMon
	bit D_DOWN_F, a
	jp nz, DebugFight_NextMon
	bit SELECT_F, a
	jr z, DebugFight_SpeciesJoypad
; If SELECT is pressed, return to the Debug Menu
	pop af
	ldh [hInMenu], a
	ld hl, wDebugFlags
	res DEBUG_BATTLE_F, [hl]
	ld de, MUSIC_MAIN_MENU
	jp PlayMusic

DebugFight_ResetParty:
	xor a
REPT 6
	ld [hli], a
ENDR
	ld [hl], a
	ret

DebugFight_ItemData:
	db X_ATTACK,     99
	db X_DEFEND,     99
	db X_SPEED,      99
	db X_SP_ATK,     99
	db X_SP_DEF,	 99
	db GUARD_SPEC,   99
	db POKE_DOLL,    99
	db X_ACCURACY,   99
	db -1

DebugFight_MedicineData:
	db FULL_RESTORE, 99
	db REVIVE,       99
	db MAX_REVIVE,   99
	db ETHER,        99
	db MAX_ETHER,    99
	db ELIXER,       99
	db FULL_HEAL,    99
	db SUPER_POTION, 99
	db ANTIDOTE,     99
	db BURN_HEAL,    99
	db ICE_HEAL,     99
	db AWAKENING,    99
	db PARLYZ_HEAL,  99
	db -1

DebugFight_PokeBallData:
	db MASTER_BALL,  99
	db ULTRA_BALL,   99
	db GREAT_BALL,   99
	db POKE_BALL,    99
	db HEAVY_BALL,   99
	db LEVEL_BALL,   99
	db LURE_BALL,    99
	db FAST_BALL,    99
	db FRIEND_BALL,  99
	db MOON_BALL,    99
	db LOVE_BALL,    99
	db -1

DebugFight_IncrementSpecies:
	inc b
	ld a, b
	cp NUM_POKEMON + 1
	jr c, DebugFight_DisplaySpeciesID
	xor a
	ld b, a

DebugFight_DisplaySpeciesID:
; Display the Species ID of the current Pokemon and clear out the old name
	ld [de], a
	ld [wTempByteValue], a
	push bc
	push hl
	push de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum

	inc hl
	push hl
	ld de, DebugFight_EmptyText
	call PlaceString

	ld bc, -SCREEN_WIDTH
	add hl, bc
	ld de, DebugFight_EmptyText
	call PlaceString

	pop hl
	ld a, [wTempByteValue]
	and a
	jr nz, .print_monstername
; If current mon is species 000, print "----------"
	ld de, DebugFight_DefaultSpeciesText
	jr .dex_zero

.print_monstername
	call GetPokemonName

.dex_zero
	call PlaceString
	pop de
	pop hl
	pop bc
	jp DebugFight_SpeciesJoypad

DebugFight_DecrementSpecies:
	dec b
	ld a, b
	cp NUM_POKEMON + 1
	jr c, DebugFight_DisplaySpeciesID
	ld a, NUM_POKEMON ; last Pokémon in Pokédex
	ld b, a
	jr DebugFight_DisplaySpeciesID

DebugFight_PreviousMon:
; No need to decrement if we're already on the 0th option
	ld a, [wCurPartyMon]
	dec a
	cp -1
	jp z, DebugFight_SpeciesJoypad
; Update selected option
	ld [wCurPartyMon], a
	dec de
; Blank out cursor
	dec hl
	ld [hl], " "
; And place it on previous line
	push bc
	ld bc, -2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	ld a, "▶"
	ld [hli], a
; Load data from selected option
	push hl
	call DebugFight_GetSpeciesAndLevel
	pop hl
	jp DebugFight_SpeciesJoypad

DebugFight_NextMon:
; No need to increment if we're already on the 5th option
	ld a, [wCurPartyMon]
	inc a
	cp PARTY_LENGTH
	jp nc, DebugFight_SpeciesJoypad
; Update selected option
	ld [wCurPartyMon], a
	inc de
; Blank out cursor
	dec hl
	ld [hl], " "
; And place it on next line
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	ld a, "▶"
	ld [hli], a
; Load data from selected option
	push hl
	call DebugFight_GetSpeciesAndLevel
	pop hl
	jp DebugFight_SpeciesJoypad

DebugFight_ChangeToLevelColumn:
	push hl
	push bc
; Blank out cursor
	dec hl
	ld [hl], " "
; Go to the level column
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
; Place cursor
	ld [hl], "▶"
	pop bc
	pop hl

DebugFight_LevelJoypad:
	push bc
	push de
	call DelayFrame
	call JoyTextDelay
	pop de
	pop bc

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, DebugFight_IncrementLevel
	bit B_BUTTON_F, a
	jr nz, DebugFight_DecrementLevel
	bit START_F, a
	jp nz, DebugFight_StartButton
	bit D_LEFT_F, a
	jp nz, DebugFight_PlaceArrow
	bit D_UP_F, a
	jr nz, DebugFight_PreviousLevel
	bit D_DOWN_F, a
	jr nz, DebugFight_NextLevel
	jr DebugFight_LevelJoypad

DebugFight_IncrementLevel:
	inc c
	ld a, c
	cp MAX_LEVEL + 1
	jr c, DebugFight_DisplayLevel
; If level is above MAX_LEVEL, set it back to 1
	ld c, 1

DebugFight_DisplayLevel:
	ld a, [wCurPartyMon]
	push de
; Calculate which mon's level is displayed
	ld de, wDebugFightMonLevel
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, c
	ld [de], a
	push bc
	push hl
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop hl
	pop bc
	pop de
	jr DebugFight_LevelJoypad

DebugFight_DecrementLevel:
	dec c
	ld a, c
	cp MAX_LEVEL + 1
	jr nc, .invalid
	and a
	jr nz, DebugFight_DisplayLevel

.invalid
; If level is 0 or above MAX_LEVEL, set it back to MAX_LEVEL
	ld a, MAX_LEVEL
	ld c, a
	jr DebugFight_DisplayLevel

DebugFight_PreviousLevel:
; No need to go up if we're already on the 0th option
	ld a, [wCurPartyMon]
	dec a
	cp -1
	jr z, DebugFight_LevelJoypad
; Update selected option
	ld [wCurPartyMon], a
	dec de
; Blank out cursor
	push hl ; save current pos (in species no. column)
	ld bc, 14
	add hl, bc ; move to level cursor column (x = x + 10)
	ld [hl], " "
; And place it on previous line
	pop hl
	ld bc, -2 * SCREEN_WIDTH
	add hl, bc ; move two lines up (y = y - 2)
	push hl
	ld bc, 14
	add hl, bc
	ld [hl], "▶"
; Load data from selected option
	call DebugFight_GetSpeciesAndLevel
	pop hl
	jp DebugFight_LevelJoypad

DebugFight_NextLevel:
; No need to increment if we're already on the 5th option
	ld a, [wCurPartyMon]
	inc a
	cp PARTY_LENGTH
	jp nc, DebugFight_LevelJoypad
; Update selected option
	ld [wCurPartyMon], a
	inc de
; Blank out cursor
	push hl
	ld bc, 14
	add hl, bc
	ld [hl], " "
; And place it on next line
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	push hl
	ld bc, 14
	add hl, bc
	ld [hl], "▶"
; Load data from selected option
	call DebugFight_GetSpeciesAndLevel
	pop hl
	jp DebugFight_LevelJoypad

DebugFight_GetSpeciesAndLevel:
; RETURN: b = species, c = level
; Species
	ld hl, wPartySpecies
	ld a, [wCurPartyMon]
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld b, a

; Level
	ld hl, wDebugFightMonLevel
	ld a, [wCurPartyMon]
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld c, a
	ret

DebugFight_SelectButton:
	hlcoord 0, 3
	lb bc, SCREEN_HEIGHT - 3, SCREEN_WIDTH
	call ClearBox
; Give time to clear
	ld c, 20
	call DelayFrames

; Clear Battle Mode
	xor a
	ld [wBattleMode], a
	
	hlcoord 5, 1
	ld de, DebugFight_TestFightText
	call PlaceString
	hlcoord 1, 4
	ld de, DebugFight_PlayerPartyHeaderText
	call PlaceString
	hlcoord 0, 6
	ld [hl], "▶"
	hlcoord 1, 6
	ld de, DebugFight_DefaultPlayerPartyText
	call PlaceString

	ld de, wPartyCount
	xor a
	ld [de], a
	ld [wCurPartyMon], a
	inc de
	hlcoord 1, 6
	push de
	push hl

.reprint_party
	ld a, [wCurPartyMon]
	ld de, wPartySpecies
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [de]
	cp -1
	jr z, .finish

	ld [wTempByteValue], a
	push hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	inc hl
	ld de, DebugFight_EmptyText
	call PlaceString
	call GetPokemonName
	call PlaceString
	pop hl

	push hl
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
	push hl
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, [de]
	ld [wCurPartyLevel], a
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum

	ld a, [wCurPartyMon]
	ld de, wDebugFightMonLevel
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [wCurPartyLevel]
	ld [de], a
	ld hl, wCurPartyMon
	inc [hl]
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	jr .reprint_party

.finish
	pop hl
	pop de
	ld a, [wPartyMon1]
	ld b, a
	ld a, [wPartyMon1Level]
	ld c, a
	xor a
	ld [wCurPartyMon], a
	jp DebugFight_PlaceArrow

DebugFight_StartButton:
; Player's mon selection screen
	ld hl, wPartyCount
	ld de, wDebugFightMonLevel - 1
	xor a
	ld [hli], a
	ld a, [hli]
	ld b, a
; Loop for all Pokémon in party
	ld c, PARTY_LENGTH
	xor a
	ld [wBattleMode], a
.CheckMon:
	ld a, b
	ld [wCurPartySpecies], a
	ld a, [hl]
	ld b, a
; Check level
	inc de
	ld a, [de]
	and a
	jr z, .next_mon
	ld [wCurPartyLevel], a
	xor a
	ld [wMonType], a
; Check species
	ld a, [wCurPartySpecies]
	and a
	jr z, .next_mon
	inc a
	jr z, .next_mon
; Mon checks out, add it to the party
	push hl
	push de
	push bc
	predef TryAddMonToParty
	pop bc
	pop de
	pop hl
; fallthrough
.next_mon
	inc hl
	dec c
	jr nz, .CheckMon

	ld b, PARTY_LENGTH + 1
	ld hl, wPartySpecies
	ld de, wDebugFightMonLevel - 1
.check_mon2:
	inc de
	dec b
	jp z, RestartDebugFightMenu
; Check species
	ld a, [hli]
	and a
	jr z, .check_mon2
	inc a
	jr z, .check_mon2
; Check level
	ld a, [de]
	and a
	jr z, .check_mon2

	hlcoord 0, 3
	lb bc, SCREEN_HEIGHT - 3, SCREEN_WIDTH
	call ClearBox
; Give time to clear
	ld c, 20
	call DelayFrames

; Load wild battle text by default
	ld a, WILD_BATTLE
	ld [wBattleMode], a
	ld de, DebugFight_WildMonsterText
; Setup opponent selection screen UI
	hlcoord 1, 4
	call PlaceString

	hlcoord 1, 6
	ld de, DebugFight_OpponentWildmonHeaderText
	call PlaceString

	hlcoord 0, 9
	lb bc, (SCREEN_HEIGHT / 2), SCREEN_WIDTH
	call ClearBox

	ld a, [wEnemyMonSpecies]
	ld b, a
	ld a, [wBattleMode]
	dec a
	jr z, .wild_screen

	ld a, [wTrainerClass]
	ld [wTempByteValue], a
	ld b, a
	ld de, wTempByteValue
	hlcoord 1, 8
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum

	hlcoord 5, 8
	ld de, DebugFight_EmptyText
	call PlaceString

	ld a, [wTrainerClass]
	ld c, a
	farcall GetOTName

	hlcoord 5, 8
	ld de, wOTClassName
	call PlaceString
	pop bc
	jr .display_level

.wild_screen:
; Check if wEnemyMonSpecies is 0
	ld a, b
	and a
	jr z, .display_level

; Display species index
	ld de, wTempSpecies
	ld [de], a
	hlcoord 1, 8
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Display name
	hlcoord 5, 8
	ld de, DebugFight_EmptyText
	call PlaceString
	call GetPokemonName
	hlcoord 5, 8
	call PlaceString
	pop bc

.display_level:
	ld a, [wEnemyMonLevel]
	ld c, a
	ld de, wTempByteValue
	ld [de], a
	hlcoord 16, 8
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop bc

DebugFight_EnemyHeader:
; Clear out species and level cursor
	ld a, " "
	ldcoord_a 0, 8
	ldcoord_a 15, 8
; Place cursor next to battle type
	ld a, "▶"
	ldcoord_a 0, 4

.HandleJoypad:
	push bc
	call DelayFrame
	call JoyTextDelay
	pop bc

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .SwitchBattleMode
	bit START_F, a
	jp nz, DebugFight_TryStartBattle
	bit D_DOWN_F, a
	jr nz, DebugFight_EnemyParty
	bit SELECT_F, a
	jp nz, DebugFight_SelectButton
	jr .HandleJoypad

.SwitchBattleMode:
	hlcoord 5, 7
	ld de, DebugFight_EmptyText
	call PlaceString
	xor a
	ld a, [wBattleMode]
	dec a
	jr nz, .switch_to_wild

; Switch to trainer mode
	ld a, TRAINER_BATTLE
	ld [wBattleMode], a
; Remove dakuten leftover from "wild monster" text
	hlcoord 8, 4
	lb bc, 1, 5
	call ClearBox
; Place text
	hlcoord 1, 4
	ld de, DebugFight_TrainerText
	call PlaceString

	hlcoord 1, 6
	ld de, DebugFight_OpponentTrainerHeaderText
	call PlaceString

	hlcoord 0, 9
	lb bc, (SCREEN_HEIGHT / 2), SCREEN_WIDTH
	call ClearBox
	lb bc, 0, 1 ; Reset values of b and c
	jr .HandleJoypad

.switch_to_wild:
	ld a, WILD_BATTLE
	ld [wBattleMode], a
; Place text
	hlcoord 1, 4
	ld de, DebugFight_WildMonsterText
	call PlaceString

	hlcoord 1, 6
	ld de, DebugFight_OpponentWildmonHeaderText
	call PlaceString

	hlcoord 0, 9
	lb bc, (SCREEN_HEIGHT / 2), SCREEN_WIDTH
	call ClearBox
	lb bc, 0, 1 ; Reset values of b and c
	jp .HandleJoypad

DebugFight_EnemyParty:
; Place cursor next to species/trainer number
	ld a, "▶"
	ldcoord_a 0, 8
; Clear out level and header cursor
	ld a, " "
	ldcoord_a 15, 8
	ldcoord_a 0, 4

DebugFight_EnemyPartyJoypad:
	push bc
	call DelayFrame
	call JoyTextDelay
	pop bc

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .IncrementEnemyID
	bit B_BUTTON_F, a
	jp nz, .DecrementEnemyID
	bit START_F, a
	jp nz, DebugFight_TryStartBattle
	bit D_RIGHT_F, a
	jp nz, .ChangeToLevelColumn
	bit D_UP_F, a
	jp nz, DebugFight_EnemyHeader
	bit D_DOWN_F, a
	jp nz, DebugFight_EnemyMoves
	bit SELECT_F, a
	jp nz, DebugFight_SelectButton
	jr DebugFight_EnemyPartyJoypad


.IncrementEnemyID:
	push bc
; Clear out name
	hlcoord 5, 8
	ld de, DebugFight_EmptyText
	call PlaceString
	pop bc
; Check battle mode
	ld a, [wBattleMode]
	dec a
	jr z, .increment_mon

; Increment trainer
	inc b
	ld a, b
	cp NUM_TRAINER_CLASSES
	jr c, .DisplayTrainer
	ld b, 1

.DisplayTrainer:
	ld a, b
	ld [wTempByteValue], a
; Print trainer class ID
	ld de, wTempByteValue
	hlcoord 1, 8
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Print trainer name
	ld a, [wTempByteValue]
	ld [wTrainerClass], a
	ld c, a
	farcall GetOTName
	hlcoord 5, 8
	lb bc, 1, 12
	call ClearBox
	hlcoord 5, 8
	ld de, wOTClassName
	call PlaceString
	pop bc
	jr DebugFight_EnemyPartyJoypad

.increment_mon:
	inc b
	ld a, b
	cp NUM_POKEMON + 1
	jr c, .DisplayPokemon
	ld b, 1

.DisplayPokemon:
	ld a, b
	ld [wTempByteValue], a
; Print pokemon ID
	ld de, wTempByteValue
	hlcoord 1, 8
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Print Pokémon name
	call GetPokemonName
	hlcoord 5, 8
	call PlaceString
	pop bc
	call DebugFight_UpdateAllMoves
	jp DebugFight_EnemyPartyJoypad


.DecrementEnemyID:
; Display text
	push bc
	hlcoord 5, 7
	ld de, DebugFight_EmptyText
	call PlaceString
	hlcoord 5, 8
	ld de, DebugFight_EmptyText
	call PlaceString
	pop bc
; Check battle mode
	ld a, [wBattleMode]
	dec a
	jr z, .decrement_mon
; Decrement trainer number
	dec b
	ld a, b
	cp NUM_TRAINER_CLASSES
	jr nc, .invalid_trainer
; Check zero
	and a
	jr nz, .DisplayTrainer

.invalid_trainer
	ld b, NUM_TRAINER_CLASSES ; last Trainer class
	jp .DisplayTrainer

.decrement_mon
	dec b
	ld a, b
	cp NUM_POKEMON + 1
	jr nc, .invalid_mon
	and a
	jr nz, .DisplayPokemon

.invalid_mon
	ld b, NUM_POKEMON ; last Pokémon
	jr .DisplayPokemon


.ChangeToLevelColumn:
	ld a, " "
	ldcoord_a 0, 8
	ld a, "▶"
	ldcoord_a 15, 8

DebugFight_EnemyLevelJoypad:
	push bc
	call DelayFrame
	call JoyTextDelay
	pop bc

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .IncrementLevel
	bit B_BUTTON_F, a
	jr nz, .DecrementLevel
	bit START_F, a
	jp nz, DebugFight_TryStartBattle
	bit D_LEFT_F, a
	jp nz, DebugFight_EnemyParty
	bit D_UP_F, a
	jp nz, DebugFight_EnemyHeader
	bit D_DOWN_F, a
	jp nz, DebugFight_EnemyMoves
	bit SELECT_F, a
	jp nz, DebugFight_SelectButton
	jr DebugFight_EnemyLevelJoypad

.IncrementLevel:
	inc c
	ld a, c
	cp MAX_LEVEL + 1
	jr c, .PrintLevel
; invalid
	ld c, 1

.PrintLevel
	hlcoord 16, 8
	ld a, c
	ld de, wCurPartyLevel
	ld [de], a
	push bc
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop bc
	call DebugFight_UpdateAllMoves
	jr DebugFight_EnemyLevelJoypad

.DecrementLevel:
	dec c
	ld a, c
	cp MAX_LEVEL + 1
	jr nc, .invalid
	and a
	jr nz, .PrintLevel

.invalid
	ld c, MAX_LEVEL
	jr .PrintLevel

DebugFight_UpdateAllMoves:
	ld a, [wBattleMode]
	dec a
	ret nz
; Wild battle
	push bc
	ld a, b
	ld [wCurPartySpecies], a
; Clear out old moves
	hlcoord 0, 9
	lb bc, (SCREEN_HEIGHT / 2), SCREEN_WIDTH
	call ClearBox
	xor a
	ld [wListMovesLineSpacing], a
	ld hl, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call ByteFill
; Load new moves based on level?
	ld de, wListMoves_MoveIndicesBuffer
	predef FillMoves
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	hlcoord 5, 10
	predef ListMoves

; Print each move and its PP amount
	hlcoord 1, 10
	ld de, wListMoves_MoveIndicesBuffer
	ld b, NUM_MOVES
.next_move:
; Check if reached end of the move list
	ld a, [de]
	and a
	jr z, .exit
; Print move ID
	push bc
	push hl
	push de
	push hl
	ld de, wStringBuffer1
	ld [de], a
	lb bc, $01, 3
	push af
	call PrintNum
	pop af
; Get PP from current move
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld de, wStringBuffer1
	ld [de], a
	pop hl
; Switch to PP column and print
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
	lb bc, $01, 3
	call PrintNum
; Progress to next move
	pop de
	pop hl
	inc de
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop bc
	dec b
	jr nz, .next_move

.exit
	pop bc
	ret

DebugFight_EnemyMoves:
	hlcoord 0, 8
	ld [hl], " "
	hlcoord 15, 8
	ld [hl], " "
	ld a, [wBattleMode]
	dec a
	jp nz, DebugFight_EnemyParty

	push bc
	hlcoord 0, 10
	ld [hl], "▶"
	ld de, wListMoves_MoveIndicesBuffer
	ld b, 1

DebugFight_EnemyMovesJoypad:
	call DelayFrame
	call JoyTextDelay

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .IncrementMove
	bit B_BUTTON_F, a
	jr nz, .DecrementMove
	bit START_F, a
	jp nz, .TryStartBattle
	bit D_UP_F, a
	jp nz, .PreviousMove
	bit D_DOWN_F, a
	jp nz, .NextMove
	jr DebugFight_EnemyMovesJoypad

.IncrementMove:
	ld a, [de]
	inc a
	cp NUM_ATTACKS + 1
	jr c, .UpdateMove
	jr .empty_move

.DecrementMove:
	ld a, [de]
	and a
	ld a, NUM_ATTACKS ; Maximum move ID
	jr z, .UpdateMove
	ld a, [de]
	dec a
	jr nz, .UpdateMove

.empty_move:
; Design: While the move name and PP amount
; are cleared, the "PP" text still remains.

; Reset move to zero
	xor a
	ld [de], a
	push de
	push bc
	push hl
; Clear move ID and name
	ld bc, -1 * SCREEN_WIDTH + 1
	add hl, bc
	lb bc, 2, 11
	call ClearBox
	pop hl
; Clear move PP amount
	push hl
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	ld a, " "
	ld [hli], a
	ld [hl], a

	pop hl
	pop bc
	pop de
	jr DebugFight_EnemyMovesJoypad

.UpdateMove:
; Similar to UpdateAllMoves, but only works on a single move.

; Save current move ID
	ld [de], a
	ld [wCurSpecies], a
	push hl
	push de
	push bc
	push hl
; Clear move ID and name
	push hl
	ld bc, -1 * SCREEN_WIDTH + 1
	add hl, bc
	lb bc, 2, 16
	call ClearBox
	pop hl
; Clear move PP amount
	push hl
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	ld a, " "
	ld [hli], a
	ld [hl], a
; Print new move ID
	pop hl
	ld de, wCurSpecies
	lb bc, $01, 3
	inc hl ; skip cursor
	call PrintNum
; Print move name
	ld a, MOVE_NAME
	ld [wNamedObjectType], a
	call GetName
	ld de, wStringBuffer1
	inc hl ; space after move id
	call PlaceString
; Get move's max PP
	ld a, [wCurSpecies]
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
; Print max PP
	ld de, wStringBuffer1
	ld [de], a
	pop hl
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	lb bc, $01, 3
	call PrintNum

	pop bc
	pop de
	pop hl
	jp DebugFight_EnemyMovesJoypad

.PreviousMove:
; Clear out old cursor
	ld [hl], " "
; Check if exiting the move editor
	dec b
	jr z, .ReturnToEnemyParty
; Decrement "Move List"
	dec de
; Place new cursor
	push bc
	ld bc, -2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	ld [hl], "▶"
	jp DebugFight_EnemyMovesJoypad

.NextMove:
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jr nc, .last_move
; Increment "Move List"
	inc de
; Clear out old cursor
	ld [hl], " "
; Place new cursor
	push bc
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	ld [hl], "▶"
	jp DebugFight_EnemyMovesJoypad

.last_move
	ld b, NUM_MOVES
	jp DebugFight_EnemyMovesJoypad

.ReturnToEnemyParty:
	pop bc
	jp DebugFight_EnemyParty

.TryStartBattle:
	pop bc
	; fallthrough
DebugFight_TryStartBattle:
; c = Level
; b = ID
; Return to header if either are zero
	ld a, b
	and a
	jp z, DebugFight_EnemyHeader
	ld a, c
	and a
	jp z, DebugFight_EnemyHeader

	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld a, b
	ld [wOtherTrainerClass], a
	ld a, c
	ld [wOtherTrainerID], a
	jr .start_battle

.wild
	ld a, c
	ld [wCurPartyLevel], a
	ld a, b
	ld [wTempWildMonSpecies], a

.start_battle
	call SetPalettes
; Set player's name
	ld hl, DebugFight_GoldText
	ld de, wPlayerName
	ld bc, PLAYER_NAME_LENGTH
	call CopyBytes
; Set rival's name
	ld hl, DebugFight_RivalName
	ld de, wRivalName
	ld bc, PLAYER_NAME_LENGTH
	call CopyBytes

	predef StartBattle

	ld a, TRUE
	ldh [hBGMapMode], a
	ldh [hInMenu], a

	xor a
	ld hl, wPlayerSubStatus1
	ld bc, 5
	call ByteFill
;	ld hl, wEnemySubStatus1
	ld bc, 5
	call ByteFill

	farcall LoadStandardFont
	farcall StatsScreen_LoadFont
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTilemap
	call ClearSprites
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals

	hlcoord 0, 0
	lb bc, 1, SCREEN_WIDTH - 2
	call Textbox

	hlcoord 5, 1
	ld de, DebugFight_TestFightText
	call PlaceString
	hlcoord 1, 4
	ld de, DebugFight_PlayerPartyHeaderText
	call PlaceString
	hlcoord 0, 6
	ld [hl], "▶"
	hlcoord 1, 6
	ld de, DebugFight_DefaultPlayerPartyText
	call PlaceString

	ld de, wPartyCount
	xor a
	ld [de], a
	ld [wCurPartyMon], a
	inc de
	hlcoord 1, 6
	push de
	push hl

.reprint_party
	ld a, [wCurPartyMon]
	ld de, wPartySpecies
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [de]
	cp -1
	jr z, .finish

	ld [wTempByteValue], a
	push hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	inc hl
	ld de, DebugFight_EmptyText
	call PlaceString
	call GetPokemonName
	call PlaceString
	pop hl

	push hl
	ld bc, SCREEN_WIDTH - 5
	add hl, bc
	push hl
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, [de]
	ld [wCurPartyLevel], a
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum

	ld a, [wCurPartyMon]
	ld de, wDebugFightMonLevel
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	ld a, [wCurPartyLevel]
	ld [de], a
	ld hl, wCurPartyMon
	inc [hl]
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	jr .reprint_party

.finish
	pop hl
	pop de
	ld a, [wPartyMon1]
	ld b, a
	ld a, [wPartyMon1Level]
	ld c, a
	xor a
	ld [wCurPartyMon], a
	jp DebugFight_PlaceArrow

DebugFight_TestFightText:
	db "Test Fight@" ; Test Fight

DebugFight_PlayerPartyHeaderText:
    ;  No.   Name       LVL
	db "№．  Name       LVL@"

DebugFight_DefaultPlayerPartyText:
	db "000 ーーーーーーーーーー 001<NEXT>"
	db "000 ーーーーーーーーーー 001<NEXT>"
	db "000 ーーーーーーーーーー 001<NEXT>"
	db "000 ーーーーーーーーーー 001<NEXT>"
	db "000 ーーーーーーーーーー 001<NEXT>"
	db "000 ーーーーーーーーーー 001@"

DebugFight_EmptyText:
	db "          @"

DebugFight_DefaultSpeciesText:
	db "ーーーーーーーーーー@"

DebugFight_WildMonsterText:
	db "Wild Monster@" ; Wild Monster

DebugFight_TrainerText:
	db "Trainer@" ; Trainer

DebugFight_OpponentWildmonHeaderText:
    ;  No.   Name       LVL
	db "№．  Name       LVL<NEXT>"
	db "000 ーーーーーーーーーー 001@"

DebugFight_OpponentTrainerHeaderText:
    ;  No.   Class       ID
	db "№．  Class       ID<NEXT>"
	db "000 ーーーーーーーーーー 001@"

DebugFight_GoldText:
	db "GOLD@"

DebugFight_RivalName:
	db "SILVER@"
