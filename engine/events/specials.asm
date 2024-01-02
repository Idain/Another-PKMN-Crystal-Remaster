Special::
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	jp FarCall_hl

INCLUDE "data/events/special_pointers.asm"

SetPlayerPalette:
	ld a, [wScriptVar]
	ld d, a
	farjp _SetPlayerPalette

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wNamedObjectIndex], a
	farcall NewPokedexEntry
	jp ExitAllMenus

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	; fallthrough
FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	ld hl, wRivalName
	ld de, .DefaultName
	jp InitName

.DefaultName:
	db "Silver@"

NameRater:
	farjp _NameRater

OverworldTownMap:
	call FadeToMenu
	farcall _TownMap
	jp ExitAllMenus

UnownPrinter:
	call FadeToMenu
	farcall _UnownPrinter
	jp ExitAllMenus

DisplayLinkRecord:
	call FadeToMenu
	farcall _DisplayLinkRecord
	jp ExitAllMenus

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret

CheckMysteryGift:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a
.no
	ld [wScriptVar], a
	jp CloseSRAM

GetMysteryGiftItem:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret

.ReceiveItemText:
	text_far _ReceiveItemText
	text_end

BugContestJudging:
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farjp PlayRadio

UnownPuzzle:
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	jp ExitAllMenus

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	jr StartGameCornerGame

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	jr StartGameCornerGame

UnusedMemoryGame:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_MemoryGame)
	ld hl, _MemoryGame
	; fallthrough
StartGameCornerGame:
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	call FarCall_hl
	jp ExitAllMenus

CheckCoinsAndCoinCase:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret

.NoCoinsText:
	text_far _NoCoinsText
	text_end

.NoCoinCaseText:
	text_far _NoCoinCaseText
	text_end

ScriptReturnCarry:
	sbc a
	and TRUE
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	ret

StoreSwarmMapIndices::
	ld a, c
	and a
	jr nz, .yanma
; swarm dark cave violet entrance
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
	ret

.yanma
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jr ScriptReturnCarry

ResetLuckyNumberShowFlag:
	farjp LoadOrRegenerateLuckyIDNumber

CheckLuckyNumberShowFlag:
	ld hl, wLuckyNumberShowFlag
	bit LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	ret

SnorlaxAwake:
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, TRUE
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [wScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db -1

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret

Diploma:
	call FadeToMenu
	farcall _Diploma
	jp ExitAllMenus

PrintDiploma:
	call FadeToMenu
	farcall _PrintDiploma
	jp ExitAllMenus

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM

RespawnOneOffs:
	; Set CHECK_FLAG once to be used multiple times
	ld b, CHECK_FLAG
	ld de, ENGINE_PLAYER_CAUGHT_SUDOWOODO
	farcall EngineFlagAction
	jr nz, .CaughtSudowoodo
	eventflagreset EVENT_ROUTE_36_SUDOWOODO
.CaughtSudowoodo
	ld de, ENGINE_PLAYER_CAUGHT_SNORLAX
	farcall EngineFlagAction
	jr nz, .CaughtSnorlax
	eventflagreset EVENT_VERMILION_CITY_SNORLAX
.CaughtSnorlax
	ld de, ENGINE_PLAYER_CAUGHT_RAIKOU
	farcall EngineFlagAction
	jr nz, .CaughtRaikou
	ld hl, wRoamMon1Species
	ld a, [hl]
	and a
	call z, RespawnRoamingRaikou
.CaughtRaikou
	ld de, ENGINE_PLAYER_CAUGHT_ENTEI
	farcall EngineFlagAction
	jr nz, .CaughtEntei
	ld hl, wRoamMon2Species
	ld a, [hl]
	and a
	call z, RespawnRoamingEntei
.CaughtEntei
	eventflagcheck EVENT_FOUGHT_SUICUNE
	jr z, .CaughtOrNeverFoughtSuicune
	ld de, ENGINE_PLAYER_CAUGHT_SUICUNE
	farcall EngineFlagAction
	jr nz, .CaughtOrNeverFoughtSuicune
	ld hl, wRoamMon3Species
	ld a, [hl]
	and a
	call z, RespawnRoamingSuicune
.CaughtOrNeverFoughtSuicune
	ld de, ENGINE_PLAYER_CAUGHT_LUGIA
	farcall EngineFlagAction
	jr nz, .CaughtLugia
	eventflagreset EVENT_FOUGHT_LUGIA
.CaughtLugia
	ld de, ENGINE_PLAYER_CAUGHT_HO_OH
	farcall EngineFlagAction
	ret nz
	eventflagreset EVENT_FOUGHT_HO_OH
	ret

RespawnRoamingRaikou:
	ld a, RAIKOU
	ld [wRoamMon1Species], a
	ld a, 40
	ld [wRoamMon1Level], a
	ld a, GROUP_ROUTE_42
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [wRoamMon1MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ret

RespawnRoamingEntei:
	ld a, ENTEI
	ld [wRoamMon2Species], a
	ld a, 40
	ld [wRoamMon2Level], a
	ld a, GROUP_ROUTE_37
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [wRoamMon2MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon2HP], a
	ret

RespawnRoamingSuicune:
	ld a, SUICUNE
	ld [wRoamMon3Species], a
	ld a, 40
	ld [wRoamMon3Level], a
	ld a, GROUP_ROUTE_38
	ld [wRoamMon3MapGroup], a
	ld a, MAP_ROUTE_38
	ld [wRoamMon3MapNumber], a
	xor a ; generate new stats
	ld [wRoamMon3HP], a
	ret
