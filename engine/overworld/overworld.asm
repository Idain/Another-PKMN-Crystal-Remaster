GetEmote2bpp:
	ld a, $1
	ldh [rVBK], a
	call Get2bpp
	xor a
	ldh [rVBK], a
	ret

UpdatePlayerSprite::
	call GetPlayerSprite
	ld a, [wUsedSprites]
	ldh [hUsedSpriteIndex], a
	ld a, [wUsedSprites + 1]
	ldh [hUsedSpriteTile], a
	jp GetUsedSprite

_RefreshSprites: ; mobile
	ld hl, wSpriteFlags
	ld a, [hl]
	push af
	res 7, [hl]
	set 6, [hl]
	call LoadUsedSpritesGFX
	pop af
	ld [wSpriteFlags], a
	ret

_ClearSprites: ; mobile
	ld hl, wSpriteFlags
	ld a, [hl]
	push af
	set 7, [hl]
	res 6, [hl]
	call LoadUsedSpritesGFX
	pop af
	ld [wSpriteFlags], a
	ret

RefreshSprites::
	xor a
	ld bc, wUsedSpritesEnd - wUsedSprites
	ld hl, wUsedSprites
	call ByteFill
	call GetPlayerSprite
	call AddMapSprites
	call LoadSpriteGFX
	call ArrangeUsedSprites
	jr LoadUsedSpritesGFX

GetPlayerSprite:
; Get Chris or Kris's sprite.
	ld hl, ChrisStateSprites
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .go
	ld a, [wPlayerGender]
	and a
	jr z, .go
	ld hl, KrisStateSprites

.go
	ld a, [wPlayerState]
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .good
	inc hl
	inc a
	jr nz, .loop

; Any player state not in the array defaults to Chris's sprite.
	xor a ; ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	ld a, SPRITE_CHRIS
	jr .finish

.good
	ld a, [hl]

.finish
	ld [wUsedSprites + 0], a
	ld [wPlayerSprite], a
	ld [wPlayerObjectSprite], a
	ret

INCLUDE "data/sprites/player_sprites.asm"

AddMapSprites:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, AddOutdoorSprites
	; fallthrough
AddIndoorSprites:
	ld hl, wMap1ObjectSprite
	ld a, 1
.loop
	push af
	ld a, [hl]
	call AddSpriteGFX
	ld de, MAPOBJECT_LENGTH
	add hl, de
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

AddOutdoorSprites:
	ld a, [wMapGroup]
	dec a
	ld c, a
	ld b, 0
	ld hl, OutdoorSprites
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

.loop
	ld a, [hli]
	and a
	ret z
	call AddSpriteGFX
	jr .loop
	ret

LoadUsedSpritesGFX:
	ld a, MAPCALLBACK_SPRITES
	call RunMapCallback
	call GetUsedSprites
	; fallthrough
LoadMiscTiles:
	ld a, [wSpriteFlags]
	bit 6, a
	ret nz

	ld c, EMOTE_SHADOW
	call LoadEmote
	call GetMapEnvironment
	call CheckOutdoorMap
	jr z, .outdoor
	ld c, EMOTE_BOULDER_DUST
	jp LoadEmote
	
.outdoor
	ld c, EMOTE_GRASS_RUSTLE
	call LoadEmote
	ld c, EMOTE_PUDDLE_SPLASH
	jp LoadEmote

SafeGetSprite:
	push hl
	call GetSprite
	pop hl
	ret

GetSprite:
	call GetMonSprite
	ret c

	ld hl, (OverworldSprites + SPRITEDATA_ADDR) - NUM_SPRITEDATA_FIELDS
	ld bc, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	; load the address into de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; load the length into c
	ld a, [hli]
	swap a
	ld c, a
	; load the sprite bank into both b and h
	ld b, [hl]
	ld a, [hli]
	; load the sprite type into l
	ld l, [hl]
	ld h, a
	ret

GetMonSprite:
; Return carry if a monster sprite was loaded.

	cp SPRITE_POKEMON
	jr c, .Normal
	cp SPRITE_DAY_CARE_MON_1
	jr z, .BreedMon1
	cp SPRITE_DAY_CARE_MON_2
	jr z, .BreedMon2
	cp SPRITE_VARS
	jr nc, .Variable
	jr .Icon

.Normal:
	and a
	ret

.Icon:
	sub SPRITE_POKEMON
	ld e, a
	ld d, 0
	ld hl, SpriteMons
	add hl, de
	ld a, [hl]
	jr .Mon

.BreedMon1
	ld a, [wBreedMon1Species]
	ld d, 1
	jr .Mon

.BreedMon2
	ld a, [wBreedMon2Species]
	ld d, 2

.Mon:
	ld e, a
	and a
	jr z, .NoBreedmon

	farcall LoadOverworldMonIcon

	lb hl, 0, WALKING_SPRITE
	scf
	ret

.Variable:
	sub SPRITE_VARS
	ld e, a
	ld d, 0
	ld hl, wVariableSprites
	add hl, de
	ld a, [hl]
	and a
	jr nz, GetMonSprite

.NoBreedmon:
	ld a, WALKING_SPRITE
	lb hl, 0, WALKING_SPRITE
	and a
	ret

_DoesSpriteHaveFacings::
; Checks to see whether we can apply a facing to a sprite.
; Returns carry unless the sprite is a Pokemon or a Still Sprite.
	cp SPRITE_POKEMON
	jr nc, .only_down

	push hl
	push bc
	ld hl, (OverworldSprites + SPRITEDATA_TYPE) - NUM_SPRITEDATA_FIELDS
	ld bc, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	ld a, [hl]
	pop bc
	pop hl
	cp STILL_SPRITE
	jr nz, .only_down
	scf
	ret

.only_down
	and a
	ret

_GetSpritePalette::
	ld a, c
	call GetMonSprite
	jr c, .is_pokemon

	ld hl, (OverworldSprites + SPRITEDATA_PALETTE) - NUM_SPRITEDATA_FIELDS
	ld bc, NUM_SPRITEDATA_FIELDS
	call AddNTimes
	ld c, [hl]
	ret

.is_pokemon
	xor a
	ld c, a
	ret

AddSpriteGFX:
; Add any new sprite ids to a list of graphics to be loaded.
; Return carry if the list is full.

	push hl
	push bc
	ld b, a
	ld hl, wUsedSprites + 2
	ld c, SPRITE_GFX_LIST_CAPACITY - 1
.loop
	ld a, [hl]
	cp b
	jr z, .exists
	and a
	jr z, .new
	inc hl
	inc hl
	dec c
	jr nz, .loop

	pop bc
	pop hl
	scf
	ret

.exists
	pop bc
	pop hl
	and a
	ret

.new
	ld [hl], b
	pop bc
	pop hl
	and a
	ret

LoadSpriteGFX:
	ld hl, wUsedSprites
	ld b, SPRITE_GFX_LIST_CAPACITY
.loop
	ld a, [hli]
	and a
	ret z
	push hl
	call .LoadSprite
	pop hl
	ld [hli], a
	dec b
	jr nz, .loop
	ret

.LoadSprite:
	push bc
	call GetSprite
	pop bc
	ld a, l
	ret

ArrangeUsedSprites:
; Get the length of each sprite and space them out in VRAM.
; Crystal introduces a second table in VRAM bank 0.

	ld hl, wUsedSprites
	lb bc, 0, SPRITE_GFX_LIST_CAPACITY
.FirstTableLength:
; Keep going until the end of the list.
	ld a, [hli]
	and a
	ret z

	ld a, [hl]
	call GetSpriteLength

; Spill over into the second table after $80 tiles.
	add b
	cp $80
	jr z, .loop
	jr nc, .SecondTable

.loop
	ld [hl], b
	inc hl
	ld b, a

; Assumes the next table will be reached before c hits 0.
	dec c
	jr nz, .FirstTableLength

.SecondTable:
; The second tile table starts at tile $80.
	ld b, $80
	dec hl
.SecondTableLength:
; Keep going until the end of the list.
	ld a, [hli]
	and a
	ret z

	ld a, [hl]
	call GetSpriteLength

; There are only two tables, so don't go any further than that.
	add b
	ret c

	ld [hl], b
	ld b, a
	inc hl

	dec c
	jr nz, .SecondTableLength
	ret

GetSpriteLength:
; Return the length of sprite type a in tiles.

	cp WALKING_SPRITE
	jr z, .AnyDirection
	cp STANDING_SPRITE
	jr z, .AnyDirection
	cp STILL_SPRITE
	jr z, .OneDirection
.AnyDirection:
	ld a, 12
	ret

.OneDirection:
	ld a, 4
	ret

GetUsedSprites:
	ld hl, wUsedSprites
	ld c, SPRITE_GFX_LIST_CAPACITY

.loop
	ld a, [wSpriteFlags]
	res 5, a
	ld [wSpriteFlags], a

	ld a, [hli]
	and a
	ret z
	ldh [hUsedSpriteIndex], a

	ld a, [hli]
	ldh [hUsedSpriteTile], a

	bit 7, a
	jr z, .dont_set

	ld a, [wSpriteFlags]
	set 5, a ; load VBank0
	ld [wSpriteFlags], a

.dont_set
	push bc
	push hl
	call GetUsedSprite
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetUsedSprite:
	ldh a, [hUsedSpriteIndex]
	call SafeGetSprite
	ldh a, [hUsedSpriteTile]
	call .GetTileAddr
	push hl
	push de
	push bc
	ld a, [wSpriteFlags]
	bit 7, a
	call z, .CopyToVram
	pop bc
	ld l, c
	ld h, $0
rept 4
	add hl, hl
endr
	pop de
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, [wSpriteFlags]
	bit 5, a
	ret nz
	bit 6, a
	ret nz

	ldh a, [hUsedSpriteIndex]
	call _DoesSpriteHaveFacings
	ret c

	ld a, h
	add HIGH(vTiles1 - vTiles0)
	ld h, a
	jr .CopyToVram

.GetTileAddr:
; Return the address of tile (a) in (hl).
	and $7f
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld a, l
	add LOW(vTiles0)
	ld l, a
	ld a, h
	adc HIGH(vTiles0)
	ld h, a
	ret

.CopyToVram:
	ldh a, [rVBK]
	push af
	ld a, [wSpriteFlags]
	bit 5, a
	ld a, $1
	jr z, .bankswitch
	ld a, $0

.bankswitch
	ldh [rVBK], a
	call Get2bpp
	pop af
	ldh [rVBK], a
	ret

LoadEmote::
; Get the address of the pointer to emote c.
	ld a, c
	ld bc, EMOTE_LENGTH
	ld hl, Emotes
	call AddNTimes
; Load the emote address into de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
; load the length of the emote (in tiles) into c
	ld c, [hl]
	swap c
; load the emote pointer bank into b
	inc hl
	ld a, [hli]
	ld b, a
; load the VRAM destination into hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
; if the emote has a length of 0, do not proceed (error handling)
	ld a, c
	and a
	ret z
	jp GetEmote2bpp

INCLUDE "data/sprites/emotes.asm"

INCLUDE "data/sprites/sprite_mons.asm"

INCLUDE "data/maps/outdoor_sprites.asm"

INCLUDE "data/sprites/sprites.asm"
