DEF MAP_NAME_SIGN_START EQU $c1

; wLandmarkSignTimer
DEF MAPSIGNSTAGE_1_SLIDEOLD EQU $63
DEF MAPSIGNSTAGE_2_LOADGFX  EQU $57
DEF MAPSIGNSTAGE_3_SLIDEIN  EQU $54
DEF MAPSIGNSTAGE_4_VISIBLE  EQU $48
DEF MAPSIGNSTAGE_5_SLIDEOUT EQU $0c

InitMapNameSign::
	xor a
	ldh [hBGMapMode], a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld [wCurLandmark], a
	call .CheckExcludedMaps
	jr z, .gate

	call GetMapEnvironment
	cp GATE
	jr nz, .not_gate

.gate
	ld a, -1
	ld [wCurLandmark], a

.not_gate
	ld hl, wEnteredMapFromContinue
	bit 1, [hl]
	res 1, [hl]
	jr nz, .dont_do_map_sign

	call .CheckMovingWithinLandmark
	jr z, .dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a

	call .CheckSpecialMap
	jr z, .dont_do_map_sign

; Landmark sign timer: descends $63-$00
; $62-$57: Sliding out (old sign)
; $56-$54: Loading new graphics
; $53-$48: Sliding in
; $47-$0c: Remains visible
; $0b-$00: Sliding out
	ld a, [wLandmarkSignTimer]
	sub MAPSIGNSTAGE_2_LOADGFX
	jr nc, .stage_1_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_1_sliding_out
	sub MAPSIGNSTAGE_4_VISIBLE
	jr c, .stage_4_visible
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_3_sliding_in
	; was in stage 2, loading new graphics; just reload them again
	ld a, MAPSIGNSTAGE_2_LOADGFX
	jr .value_ok

.stage_1_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	jr .value_ok

.stage_3_sliding_in
	cpl
	add MAPSIGNSTAGE_1_SLIDEOLD + 1 ; a = MAPSIGNSTAGE_1_SLIDEOLD - a
	jr .value_ok

.stage_4_visible
	ld a, MAPSIGNSTAGE_1_SLIDEOLD
.value_ok
	ld [wLandmarkSignTimer], a
	ret

.dont_do_map_sign
	ld a, [wCurLandmark]
	ld [wPrevLandmark], a
	ld a, SCREEN_HEIGHT_PX
	ldh [rWY], a
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ret

.CheckMovingWithinLandmark:
	ld a, [wCurLandmark]
	ld c, a
	ld a, [wPrevLandmark]
	cp c
	ret z
	cp LANDMARK_SPECIAL
	ret

.CheckSpecialMap:
; These landmarks do not get pop-up signs.
	cp -1
	ret z

	and a ; cp LANDMARK_SPECIAL
	ret z
	cp LANDMARK_RADIO_TOWER
	ret z
	cp LANDMARK_LAV_RADIO_TOWER
	ret z
	cp LANDMARK_UNDERGROUND_PATH
	ret z
	cp LANDMARK_INDIGO_PLATEAU
	ret z
	cp LANDMARK_POWER_PLANT
	ret z
	ld a, 1
	and a
	ret

.CheckExcludedMaps:
	ld a, [wMapGroup]
	assert GROUP_ROUTE_35_NATIONAL_PARK_GATE == GROUP_ROUTE_36_NATIONAL_PARK_GATE
	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
	jr nz, .not_national_park_gate
	ld a, [wMapNumber]
	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
	ret z
	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
	ret
.not_national_park_gate
	assert GROUP_OLIVINE_PORT == GROUP_VERMILION_PORT
	cp GROUP_OLIVINE_PORT
	ret nz
	ld a, [wMapNumber]
	cp MAP_OLIVINE_PORT
	ret z
	cp MAP_VERMILION_PORT
	ret

PlaceMapNameSign::
	; Sign is slightly delayed to move it away from the map connection setup
	ld hl, wLandmarkSignTimer
	ld a, [hl]
	and a
	jr z, .stage_5_sliding_out
	dec [hl]
	sub MAPSIGNSTAGE_2_LOADGFX
	jr nc, .stage_5_sliding_out
	add MAPSIGNSTAGE_2_LOADGFX
	cp MAPSIGNSTAGE_2_LOADGFX - 1
	ret nc
	sub MAPSIGNSTAGE_3_SLIDEIN
	jr c, .graphics_ok
	ret nz
	push hl
	call InitMapNameFrame
	call PlaceMapNameCenterAlign
	farcall HDMATransfer_OnlyTopFourRows
	pop hl

.graphics_ok
	ld a, [hl]
	cp MAPSIGNSTAGE_4_VISIBLE
	jr nc, .stage_3_sliding_in
	cp MAPSIGNSTAGE_5_SLIDEOUT
	jr c, .stage_5_sliding_out
	ld a, SCREEN_HEIGHT_PX - 3 * TILE_WIDTH
	jr .got_value

.stage_3_sliding_in
	sub MAPSIGNSTAGE_4_VISIBLE
	add a
	add SCREEN_HEIGHT_PX - 3 * TILE_WIDTH
	jr .got_value

.stage_5_sliding_out
	add a
	cpl
	add SCREEN_HEIGHT_PX + TILE_WIDTH + 1 ; a = SCREEN_HEIGHT_PX + TILE_WIDTH - a
.got_value
	ldh [rWY], a
	ldh [hWY], a
	sub SCREEN_HEIGHT_PX
	ret nz
	ldh [hLCDCPointer], a
	ret

InitMapNameFrame:
; InitMapSignAttrmap
	hlcoord 0, 0, wAttrmap
	ld a, PAL_BG_TEXT | PRIORITY
	; top row
	ld bc, SCREEN_WIDTH - 1
	call ByteFill
	or X_FLIP
	ld [hli], a
	; middle row
	and ~X_FLIP
	ld [hli], a
	ld bc, SCREEN_WIDTH - 2
	call ByteFill
	or X_FLIP
	ld [hli], a
	; bottom row
	and ~X_FLIP
	ld bc, SCREEN_WIDTH - 1
	call ByteFill
	or X_FLIP
	ld [hl], a
; PlaceMapNameFrame
	hlcoord 0, 0
	; top left
	ld a, MAP_NAME_SIGN_START
	ld [hli], a
	; top row
	inc a ; MAP_NAME_SIGN_START + 1
	call .FillTopBottom
	; top right
	dec a ; MAP_NAME_SIGN_START
	ld [hli], a
	; middle left
	ld a, MAP_NAME_SIGN_START + 3
	ld [hli], a
	; middle row
	ld c, SCREEN_WIDTH - 2
	ld a, MAP_NAME_SIGN_START + 8
.middleloop
	ld [hli], a
	dec c
	jr nz, .middleloop
	; middle right
	ld a, MAP_NAME_SIGN_START + 4
	ld [hli], a
	; bottom left
	inc a ; MAP_NAME_SIGN_START + 5
	ld [hli], a
	; bottom
	inc a ; MAP_NAME_SIGN_START + 6
	call .FillTopBottom
	; bottom right
	dec a ; MAP_NAME_SIGN_START + 5
	ld [hl], a
	ret

.FillTopBottom:
	ld c, (SCREEN_WIDTH - 2) / 4 + 1
	jr .enterloop

.continueloop
	ld [hli], a
	ld [hli], a

.enterloop
	inc a
	ld [hli], a
	ld [hli], a
	dec a
	dec c
	jr nz, .continueloop
	ret

PlaceMapNameCenterAlign:
	ld a, [wCurLandmark]
	ld e, a
	farcall GetLandmarkName
	call .GetNameLength
	ld a, SCREEN_WIDTH
	sub c
	srl a
	ld b, 0
	ld c, a
	hlcoord 0, 1
	add hl, bc
	ld de, wStringBuffer1
	jp PlaceString

.GetNameLength:
	ld c, 0
	push hl
	ld hl, wStringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr z, .stop
	cp "%"
	jr z, .loop
	inc c
	jr .loop
.stop
	pop hl
	ret
