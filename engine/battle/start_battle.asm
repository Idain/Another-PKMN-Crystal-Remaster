ShowLinkBattleParticipants:
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	call _ShowLinkBattleParticipants
	ld c, 120
	call DelayFrames
	call ClearTilemap
	jp ClearSprites

FindFirstAliveMonAndStartBattle:
	xor a
	ldh [hMapAnims], a
	call DelayFrame
	predef DoBattleTransition
	farcall LoadBattleFontsHPBar
	ld a, 1
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hMapAnims], a
	ret

PlayBattleMusic:
	push hl
	push de
	push bc

	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	; Are we fighting a trainer?
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .trainermusic

	ld a, [wTempEnemyMonSpecies]
	ld hl, BattleMusic_Legendaries
	call .loadfromarray
	jr c, .done

	ld hl, BattleMusic_RegionalWilds
	call .getregionmusicfromarray
	jr .done

.trainermusic
	ld a, [wOtherTrainerClass]
	cp RIVAL2
	jr nz, .othertrainer
	ld a, [wOtherTrainerID]
	cp RIVAL2_2_CHIKORITA ; Rival in Indigo Plateau
	jr c, .othertrainer
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [wOtherTrainerClass]
	ld hl, BattleMusic_Trainers
	call .loadfromarray
	jr c, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	farcall IsKantoGymLeader
	jr c, .done

	; IsGymLeader also counts CHAMPION, RED, the Elite Four and
	; the Kanto gym leaders but they have been taken care of 
	; before this
	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	farcall IsGymLeader
	jr c, .done

	ld a, [wLinkMode]
	and a
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr nz, .done

	ld hl, BattleMusic_RegionalTrainers
	call .getregionmusicfromarray
	; fallthrough
.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret

.loadfromarray
	ld de, 2
	call IsInArray
	ret nc
	inc hl
	ld e, [hl]
	ld d, 0
	ret

.getregionmusicfromarray
	push hl
	farcall RegionCheck
	pop hl
	ld a, [wTimeOfDay]
	cp NITE
	; a = carry ? 0 : NUM_REGIONS
	ccf
	sbc a
	and NUM_REGIONS
	add e
	add a
	ld e, a
	ld d, 0
	add hl, de
.found
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

INCLUDE "data/battle/music.asm"

ClearBattleRAM:
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wForcedSwitch], a
	ld [wTimeOfDayPal], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callfar ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a ; LOW(vBGMap0)
	ld [hli], a
	ld [hl], HIGH(vBGMap0)
	ret
