GetCrystalCGBLayout:
	ld a, b
	cp SCGB_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultSGBLayout]
.not_default
	push af
	farcall ResetBGPals
	pop af
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw _CrystalCGB_MobileLayout0
	dw _CrystalCGB_MobileLayout1
	dw _CrystalCGB_NameCard

Crystal_WipeAttrmap:
; This is a copy of WipeAttrmap.
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	jp ByteFill

MG_Mobile_Layout_LoadPals:
	ld de, wBGPals1
	ld hl, Palette_MysteryGiftMobile
	ld bc, 5 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, Palette_TextBG7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

_CrystalCGB_MobileLayout0:
	call MG_Mobile_Layout_LoadPals
	call Crystal_WipeAttrmap
	call MG_Mobile_Layout_CreatePalBoxes
	farcall ApplyAttrmap
	farjp ApplyPals

MG_Mobile_Layout_CreatePalBoxes:
	hlcoord 0, 0, wAttrmap
	lb bc, 4, 1
	ld a, $1
	call FillBoxWithByte
	lb bc, 2, 1
	ld a, $2
	call FillBoxWithByte
	lb bc, 6, 1
	ld a, $3
	call FillBoxWithByte
	hlcoord 1, 0, wAttrmap
	ld a, $1
	lb bc, 3, 18
	call FillBoxWithByte
	lb bc, 2, 18
	ld a, $2
	call FillBoxWithByte
	lb bc, 12, 18
	ld a, $3
	call FillBoxWithByte
	hlcoord 19, 0, wAttrmap
	lb bc, 4, 1
	ld a, $1
	call FillBoxWithByte
	lb bc, 2, 1
	ld a, $2
	call FillBoxWithByte
	lb bc, 6, 1
	ld a, $3
	call FillBoxWithByte
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7
	jp ByteFill

Palette_MysteryGiftMobile:
INCLUDE "gfx/mystery_gift/mg_mobile.pal"

LoadOW_BGPal7::
	ld hl, Palette_TextBG7
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

Palette_TextBG7:
INCLUDE "gfx/font/bg_text.pal"

Function49420::
	ld hl, MansionPalette1 + 8 palettes
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

_CrystalCGB_MobileLayout1:
	call MG_Mobile_Layout_LoadPals
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld hl, .TextPalette
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call Crystal_WipeAttrmap
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 14, wAttrmap
	ld bc, 4 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ld a, [wd002]
	bit 6, a
	jr z, .asm_49464
	call .Function49480
	jr .done

.asm_49464
	call .Function49496
.done
	farcall ApplyAttrmap
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.TextPalette:
INCLUDE "gfx/mystery_gift/mobile_text.pal"

.Function49480:
	hlcoord 0, 0, wAttrmap
	lb bc, 4, SCREEN_WIDTH
	ld a, $7
	call FillBoxWithByte
	hlcoord 0, 2, wAttrmap
	ld [hl], $4
	hlcoord 19, 2, wAttrmap
	ld [hl], $4
	ret

.Function49496:
	hlcoord 0, 0, wAttrmap
	lb bc, 2, SCREEN_WIDTH
	ld a, $7
	call FillBoxWithByte
	hlcoord 0, 1, wAttrmap
	ld [hl], $4
	hlcoord 19, 1, wAttrmap
	ld [hl], $4
	ret

INCLUDE "engine/tilesets/tileset_palettes.asm"

_CrystalCGB_NameCard:
	ld hl, .BGPalette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	call Crystal_WipeAttrmap
	farcall ApplyAttrmap
	ld hl, .OBPalette
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	jp FarCopyWRAM

.BGPalette:
INCLUDE "gfx/mystery_gift/name_card_bg.pal"

.OBPalette:
INCLUDE "gfx/mystery_gift/name_card_ob.pal"

Function49742:
	ld hl, .MobileBorderPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farjp ApplyPals

.MobileBorderPalettes:
INCLUDE "gfx/trade/mobile_border.pal"

_InitMG_Mobile_LinkTradePalMap:
	hlcoord 0, 0, wAttrmap
	lb bc, 16, 2
	ld a, $4
	call FillBoxWithByte
	ld a, $3
	ldcoord_a 0, 1, wAttrmap
	ldcoord_a 0, 14, wAttrmap
	hlcoord 2, 0, wAttrmap
	lb bc, 8, 18
	ld a, $5
	call FillBoxWithByte
	hlcoord 2, 8, wAttrmap
	lb bc, 8, 18
	ld a, $6
	call FillBoxWithByte
	hlcoord 0, 16, wAttrmap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call FillBoxWithByte
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrmap
	call FillBoxWithByte
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrmap
	call FillBoxWithByte
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrmap
	call FillBoxWithByte
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrmap
	call FillBoxWithByte
	ld a, $2
	hlcoord 2, 16, wAttrmap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], 2
	hlcoord 2, 17, wAttrmap
	ld a, 3
	ld bc, 6
	jp ByteFill

_LoadTradeRoomBGPals:
	ld hl, TradeRoomPalette
	ld de, wBGPals1 palette PAL_BG_GREEN
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farjp ApplyPals

TradeRoomPalette:
INCLUDE "gfx/trade/border.pal"
