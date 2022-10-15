MACRO anim_obj_gfx
; # tiles, gfx pointer
	db \1
	dba \2
ENDM

AnimObjGFX:
; entries correspond to ANIM_GFX_* constants
	table_width 4, AnimObjGFX
	anim_obj_gfx  0, AnimObj00GFX
	anim_obj_gfx 21, AnimObjHitGFX
	anim_obj_gfx  6, AnimObjCutGFX
	anim_obj_gfx  6, AnimObjFireGFX
	anim_obj_gfx 20, AnimObjWaterGFX
	anim_obj_gfx 26, AnimObjLightningGFX
	anim_obj_gfx 18, AnimObjPlantGFX
	anim_obj_gfx 12, AnimObjSmokeGFX
	anim_obj_gfx  9, AnimObjExplosionGFX
	anim_obj_gfx 17, AnimObjRocksGFX
	anim_obj_gfx  6, AnimObjIceGFX
	anim_obj_gfx 10, NULL ; use AnimBallObjGFX
	anim_obj_gfx 10, AnimObjPokeBallBGGFX
	anim_obj_gfx  9, AnimObjPoisonGFX
	anim_obj_gfx 13, AnimObjBubbleGFX
	anim_obj_gfx 16, AnimObjNoiseGFX
	anim_obj_gfx  2, AnimObjPowderGFX
	anim_obj_gfx 11, AnimObjBeamGFX
	anim_obj_gfx  9, AnimObjSpeedGFX
	anim_obj_gfx  9, AnimObjChargeGFX
	anim_obj_gfx 19, AnimObjWindGFX
	anim_obj_gfx 10, AnimObjWhipGFX
	anim_obj_gfx 12, AnimObjEggGFX
	anim_obj_gfx 18, AnimObjRopeGFX
	anim_obj_gfx 13, AnimObjPsychicGFX
	anim_obj_gfx 10, AnimObjReflectGFX
	anim_obj_gfx 27, AnimObjStatusGFX
	anim_obj_gfx 12, AnimObjSandGFX
	anim_obj_gfx 14, AnimObjWebGFX
	anim_obj_gfx 16, AnimObjHazeGFX
	anim_obj_gfx  7, AnimObjHornGFX
	anim_obj_gfx  8, AnimObjFlowerGFX
	anim_obj_gfx 40, AnimObjMiscGFX
	anim_obj_gfx 36, AnimObjSkyAttackGFX
	anim_obj_gfx 16, AnimObjGlobeGFX
	anim_obj_gfx 48, AnimObjShapesGFX
	anim_obj_gfx 18, AnimObjObjectsGFX
	anim_obj_gfx 38, AnimObjShineGFX
	anim_obj_gfx 35, AnimObjAngelsGFX
	anim_obj_gfx 18, AnimObjWaveGFX
	anim_obj_gfx 24, AnimObjAeroblastGFX
	anim_obj_gfx 16, AnimObjMoonGFX
	anim_obj_gfx  1, NULL
	anim_obj_gfx  1, NULL
	assert_table_length NUM_ANIM_GFX + 1

	
AnimBallObjGFX:
	dbw POKE_BALL, 		AnimObjPokeBallGFX
	dbw GREAT_BALL, 	AnimObjGreatBallGFX
	dbw ULTRA_BALL, 	AnimObjUltraBallGFX
	dbw MASTER_BALL, 	AnimObjMasterBallGFX
	dbw LEVEL_BALL, 	AnimObjLevelBallGFX
	dbw LURE_BALL, 		AnimObjLureBallGFX
	dbw MOON_BALL, 		AnimObjMoonBallGFX
	dbw FRIEND_BALL, 	AnimObjFriendBallGFX
	dbw FAST_BALL, 		AnimObjFastBallGFX
	dbw HEAVY_BALL, 	AnimObjHeavyBallGFX
	dbw LOVE_BALL, 		AnimObjLoveBallGFX
	dbw PARK_BALL, 		AnimObjParkBallGFX
	dbw -1, 			AnimObjPokeBallGFX ; failsafe
