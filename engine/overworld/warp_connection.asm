HandleNewMap:
	call ResetMapBufferEventFlags
	call ResetFlashIfOutOfCave
	call GetCurrentMapSceneID
	call ResetBikeFlags
	ld a, MAPCALLBACK_NEWMAP
	call RunMapCallback
	; fallthrough
HandleContinueMap:
	xor a
	ld [wStoneTableAddress], a
	ld [wStoneTableAddress+1], a
	ld a, MAPCALLBACK_STONETABLE
	call RunMapCallback
	call GetMapTimeOfDay
	ld [wMapTimeOfDay], a
	ret

EnterMapConnection:
; Return carry if a connection has been entered.
	ld a, [wPlayerStepDirection]
	and a ; DOWN
	jp z, .south
	dec a ; UP
	jp z, .north
	dec a ; LEFT
	jr z, .west
	dec a ; RIGHT
	ret nz
	; fallthrough
.east
	ld a, [wEastConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wEastConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wEastConnectionStripXOffset]
	ld [wXCoord], a
	ld a, [wEastConnectionStripYOffset]
	ld hl, wYCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wEastConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load
	ld a, [wEastConnectedMapWidth]

.before_loop
	add 6
	ld e, a
	ld d, 0
.loop
	add hl, de
	dec c
	jr nz, .loop

.skip_to_load
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp .done

.west
	ld a, [wWestConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wWestConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wWestConnectionStripXOffset]
	ld [wXCoord], a
	ld a, [wWestConnectionStripYOffset]
	ld hl, wYCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wWestConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load
	ld a, [wWestConnectedMapWidth]
	jr .before_loop

.north
	ld a, [wNorthConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wNorthConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wNorthConnectionStripYOffset]
	ld [wYCoord], a
	ld a, [wNorthConnectionStripXOffset]
	ld hl, wXCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wNorthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jr .done

.south
	ld a, [wSouthConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wSouthConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wSouthConnectionStripYOffset]
	ld [wYCoord], a
	ld a, [wSouthConnectionStripXOffset]
	ld hl, wXCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wSouthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
.done
	scf
	ret

EnterMapWarp:
	call .SaveDigWarp
	call .SetSpawn
	ld a, [wNextWarp]
	ld [wWarpNumber], a
	ld a, [wNextMapGroup]
	ld [wMapGroup], a
	ld a, [wNextMapNumber]
	ld [wMapNumber], a
	ret

.SaveDigWarp:
	call GetMapEnvironment
	call CheckOutdoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a
	call GetAnyMapEnvironment
	call CheckIndoorMap
	ret nz

; MOUNT_MOON_SQUARE and TIN_TOWER_ROOF are outdoor maps within indoor maps.
; Dig and Escape Rope should not take you to them.
	ld a, [wPrevMapGroup]
	cp GROUP_MOUNT_MOON_SQUARE
	jr nz, .not_mt_moon_square_or_tin_tower_roof
	assert GROUP_MOUNT_MOON_SQUARE == GROUP_TIN_TOWER_ROOF
	ld a, [wPrevMapNumber]
	cp MAP_MOUNT_MOON_SQUARE
	ret z
	cp MAP_TIN_TOWER_ROOF
	ret z

.not_mt_moon_square_or_tin_tower_roof
	ld a, [wPrevWarp]
	ld [wDigWarpNumber], a
	ld a, [wPrevMapGroup]
	ld [wDigMapGroup], a
	ld a, [wPrevMapNumber]
	ld [wDigMapNumber], a
	ret

.SetSpawn:
	call GetMapEnvironment
	call CheckOutdoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a
	call GetAnyMapEnvironment
	call CheckIndoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a

; Respawn in Pokémon Centers.
	call GetAnyMapTileset
	ld a, c
	cp TILESET_POKECENTER
	jr z, .pokecenter_pokecom
	cp TILESET_POKECOM_CENTER
	ret nz
.pokecenter_pokecom
	ld a, [wPrevMapGroup]
	ld [wLastSpawnMapGroup], a
	ld a, [wPrevMapNumber]
	ld [wLastSpawnMapNumber], a
	ret

LoadMapTimeOfDay:
	ld hl, wVramState
	res 6, [hl]
	ld a, 1
	ld [wSpriteUpdatesEnabled], a
	farcall ReplaceTimeOfDayPals
	farcall UpdateTimeOfDayPal
	call LoadMapPart
	call .ClearBGMap
	jr .PushAttrmap

.ClearBGMap:
	ld a, HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
	xor a ; LOW(vBGMap0)
	ld [wBGMapAnchor], a
	ldh [hSCY], a
	ldh [hSCX], a
	farcall ApplyBGMapAnchorToObjects

	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	xor a
	ld bc, vBGMap1 - vBGMap0
	hlbgcoord 0, 0
	call ByteFill

	pop af
	ldh [rVBK], a

	ld a, "■"
	ld bc, vBGMap1 - vBGMap0
	hlbgcoord 0, 0
	jp ByteFill

.PushAttrmap:
	decoord 0, 0
	call .copy
	ldh a, [hCGB]
	and a
	ret z

	decoord 0, 0, wAttrmap
	ld a, $1
	ldh [rVBK], a
.copy
	hlbgcoord 0, 0
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
.row
	push bc
.column
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .column
	ld bc, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld a, $0
	ldh [rVBK], a
	ret

LoadMapGraphics:
	call LoadMapTileset
	call LoadTilesetGFX
	xor a
	ldh [hMapAnims], a
	xor a
	ldh [hTileAnimFrame], a
	farcall RefreshSprites
	farcall LoadFontsExtra
	jp LoadOverworldFont

LoadMapPalettes:
	ld b, SCGB_MAPPALS
	jp GetSGBLayout

RefreshMapSprites:
	call ClearSprites
	farcall InitMapNameSign
	call GetMovementPermissions
	farcall RefreshPlayerSprite
	farcall CheckUpdatePlayerSprite
	ld hl, wPlayerSpriteSetupFlags
	bit PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F, [hl]
	jr nz, .skip
	ld hl, wVramState
	set 0, [hl]
	call SafeUpdateSprites
.skip
	ld a, [wPlayerSpriteSetupFlags]
	and (1 << PLAYERSPRITESETUP_FEMALE_TO_MALE_F) | (1 << 3) | (1 << 4)
	ld [wPlayerSpriteSetupFlags], a
	ret

CheckMovingOffEdgeOfMap::
	ld a, [wPlayerStepDirection]
	and a ; DOWN
	jr z, .down
	dec a ; UP
	jr z, .up
	dec a ; LEFT
	jr z, .left
	dec a ; RIGHT
	ret nz 

.right
	ld a, [wPlayerMapX]
	sub 4
	ld b, a
	ld a, [wMapWidth]
	add a
	cp b
	jr z, .ok
	and a
	ret

.down
	ld a, [wPlayerMapY]
	sub 4
	ld b, a
	ld a, [wMapHeight]
	add a
	cp b
	jr z, .ok
	and a
	ret

.up
	ld a, [wPlayerMapY]
	sub 4
	cp -1
	jr z, .ok
	and a
	ret

.left
	ld a, [wPlayerMapX]
	sub 4
	cp -1
	jr z, .ok
	and a
	ret

.ok
	scf
	ret

GetMapScreenCoords::
	ld hl, wOverworldMapBlocks
	ld a, [wXCoord]
	bit 0, a
	jr nz, .odd_x
; even x
	srl a
	inc a
	jr .got_block_x
.odd_x
	inc a
	srl a
.got_block_x
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wMapWidth]
	add MAP_CONNECTION_PADDING_WIDTH * 2
	ld c, a
	ld b, 0
	ld a, [wYCoord]
	bit 0, a
	jr nz, .odd_y
; even y
	srl a
	inc a
	jr .got_block_y
.odd_y
	inc a
	srl a
.got_block_y
	call AddNTimes
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	ld a, [wYCoord]
	and 1
	ld [wPlayerMetatileY], a
	ld a, [wXCoord]
	and 1
	ld [wPlayerMetatileX], a
	ret
