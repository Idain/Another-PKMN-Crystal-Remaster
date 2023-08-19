DEF SPECIALCELEBIEVENT_CELEBI EQU $84

CelebiShrineEvent:
	call DelayFrame
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call LoadCelebiGFX
	depixel 0, 10, 7, 0
	ld a, SPRITE_ANIM_INDEX_CELEBI
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], SPECIALCELEBIEVENT_CELEBI
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_CELEBI
	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, $80
	ld [hl], a
	ld a, 160 ; frame count
	ld [wFrameCounter], a
	ld d, $0
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	push bc
	call GetCelebiSpriteTile
	inc d
	push de
	ld a, 36 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	farcall DoNextFrameForAllSprites
	call CelebiEvent_CountDown
	ld c, 2
	call DelayFrames
	pop de
	pop bc
	jr .loop

.done
	pop af
	ld [wVramState], a

;RestorePlayerSprite_DespawnLeaves:
	ld hl, wShadowOAMSprite00TileID
	xor a
	ld c, 4
.OAMloop:
	ld [hli], a ; tile id
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	inc a
	dec c
	jr nz, .OAMloop
	ld hl, wShadowOAMSprite04
	ld bc, wShadowOAMEnd - wShadowOAMSprite04
	xor a
	call ByteFill

	ld a, BATTLETYPE_LEGENDARY
	ld [wBattleType], a
	ret

LoadCelebiGFX:
	farcall ClearSpriteAnims
	ld de, SpecialCelebiLeafGFX
	ld hl, vTiles1
	lb bc, BANK(SpecialCelebiLeafGFX), 4
	call Request2bpp
	ld de, SpecialCelebiGFX
	ld hl, vTiles0 tile SPECIALCELEBIEVENT_CELEBI
	lb bc, BANK(SpecialCelebiGFX), 4 * 4
	call Request2bpp
	xor a
	ld [wJumptableIndex], a
	ret

CelebiEvent_CountDown:
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret

.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

SpecialCelebiLeafGFX:
INCBIN "gfx/overworld/cut_grass.2bpp"

SpecialCelebiGFX:
INCBIN "gfx/overworld/celebi.2bpp"

UpdateCelebiPosition:
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	push af
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 8 * 10 + 2
	jp nc, .FreezeCelebiPosition
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $3a
	jr c, .skip
	jr z, .skip
	sub $3
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld d, a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 11 + 4
	jr nc, .ShiftY
	cp 8 *  8 + 4
	jr nc, .ReinitSpriteAnimFrame
.ShiftY:
	pop af
	push af
	cp d
	jr nc, .moving_left
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr c, .float_up
	jr .float_down

.moving_left
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr nc, .float_up
.float_down
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub 2
	ld [hl], a
	jr .ReinitSpriteAnimFrame

.float_up
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
.ReinitSpriteAnimFrame:
	pop af
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr c, .left
	cp -(8 * 3 + 2)
	jr nc, .left
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_RIGHT
	jp ReinitSpriteAnimFrame

.left
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_LEFT
	jp ReinitSpriteAnimFrame

.FreezeCelebiPosition:
	pop af
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_LEFT
	jp ReinitSpriteAnimFrame

GetCelebiSpriteTile:
	push hl
	push bc
	push de
	ld a, d
	ld d, $3
	ld e, d
	and a
	jr z, .Frame1
	cp d
	jr z, .Frame2
	call .AddE
	cp d
	jr z, .Frame3
	call .AddE
	cp d
	jr z, .Frame4
	call .AddE
	cp d
	jr c, .done
	jr .restart

.Frame1:
	ld a, SPECIALCELEBIEVENT_CELEBI
	jr .load_tile

.Frame2:
	ld a, SPECIALCELEBIEVENT_CELEBI + 4
	jr .load_tile

.Frame3:
	ld a, SPECIALCELEBIEVENT_CELEBI + 8
	jr .load_tile

.Frame4:
	ld a, SPECIALCELEBIEVENT_CELEBI + 12

.load_tile
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	jr .done

.restart
	pop de
	ld d, $ff
	push de

.done
	pop de
	pop bc
	pop hl
	ret

.AddE:
	push af
	ld a, d
	add e
	ld d, a
	pop af
	ret
