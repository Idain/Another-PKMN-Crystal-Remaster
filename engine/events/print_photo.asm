PhotoStudio:
	ld hl, .WhichMonPhotoText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, .HoldStillText
	call PrintText
	call DisableSpriteUpdates
	farcall PrintPartymon
	call ReturnToMapWithSpeechTextbox
	ldh a, [hPrinter]
	and a
	jr nz, .cancel
	ld hl, .PrestoAllDoneText
	jp PrintText

.cancel
	ld hl, .NoPhotoText
	jp PrintText

.egg
	ld hl, .EggPhotoText
	jp PrintText

.WhichMonPhotoText:
	text_far _WhichMonPhotoText
	text_end

.HoldStillText:
	text_far _HoldStillText
	text_end

.PrestoAllDoneText:
	text_far _PrestoAllDoneText
	text_end

.NoPhotoText:
	text_far _NoPhotoText
	text_end

.EggPhotoText:
	text_far _EggPhotoText
	text_end
