; Pokémon Center (Night)
; Demixed by TriteHexagon

; dw Drum00
; dw Drum00
; dw Kick1 
; dw Crash1 
; dw Snare6
; dw HiHat2
; dw HiHat3 
; dw Snare14
; dw Drum27 
; dw Snare10
; dw Drum00 
; dw Snare13 
; dw Snare11

Music_PKMN_Center_Night:
	channel_count 4
	channel 1, Music_PKMN_Center_Night_Ch1
	channel 2, Music_PKMN_Center_Night_Ch2
	channel 3, Music_PKMN_Center_Night_Ch3
	channel 4, Music_PKMN_Center_Night_Ch4

; ============================================================================================================
Music_PKMN_Center_Night_Ch1:
	tempo 196
	volume 6, 6
	duty_cycle $3
	stereo_panning TRUE, TRUE
	vibrato 18, 1, 4
	pitch_offset 1

Music_PKMN_Center_Night_Ch1_master:
	note_type 8, 8, 7
	rest 4
	octave 2
	note G_, 14
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
;Ch1_Bar2:
	note G_, 6
	note A#, 6
	note A_, 6
	note E_, 6
;Ch1_Bar3:
	rest 4
Music_PKMN_Center_Night_Ch1_Bar3_4:
	volume_envelope 8, 8
	note F_, 3
	volume_envelope 8, 7
	note F_, 13

	octave 2
	note A_, 2
	octave 3
	note D_, 2
	volume_envelope 5, 7
	note D_, 4
	volume_envelope 8, 7
	sound_loop 2, Music_PKMN_Center_Night_Ch1_Bar3_4
;Ch1_Bar5:
	octave 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 6
	note G_, 6
;Ch1_Bar6:
	note G#, 6
	note E_, 6
	note D_, 6
	octave 2
	note G#, 6
;Ch1_Bar7:
	note A_, 8
	volume_envelope 5, 7
	note A_, 2
	volume_envelope 8, 7
	note A_, 2
	octave 3
	note C_, 4
	octave 2
	note B_, 4
	note A#, 4
;Ch1_Bar8:
	note A_, 2
	octave 3
	note C_, 2
	note F_, 6
	octave 2
	note A_, 2
	note B_, 8
	note A_, 2
	note B_, 2
	rest 4
;Ch1_Bar9:
	octave 3
	note G_, 6
	note C_, 14
	octave 2
	note A#, 10
;Ch1_Bar10:
	octave 3
	note C_, 14
	rest 4
;Ch1_Bar11:
	note A_, 4
	note G_, 2
	note F_, 2
	note E_, 6
	note D_, 6
	volume_envelope 5, 7
	note D_, 4
	volume_envelope 8, 7
	note G#, 4
;Ch1_Bar12:
	note G_, 2
	note F_, 2
	note C_, 6
	note D_, 6
;Ch1_Bar13:
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note D_, 6
	note G_, 12
;Ch1_Bar14:
	octave 2
	note B_, 12
	note G_, 6
	octave 3
;Ch1_Bar15:
	note E_, 8
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 8
	octave 2
	note A_, 2
	octave 3
	note C_, 2
;Ch1_Bar16:
	note G_, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note F_, 8
	octave 2
	note A_, 2
	octave 3
	note C_, 2
;Ch1_Bar17-18:
	octave 4
	duty_cycle $3
	volume_envelope 6, 7
	note C_, 12
	octave 3
	note D_, 1
	note B_, 2
	note C#, 1
	note A#, 2
	note C_, 1
	note A_, 2
	octave 2
	note B_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	octave 3
	note G_, 2
	octave 2
	note A_, 1
	octave 3
	note F#, 2
	octave 2
	note G#, 1
	octave 3
	note F_, 2
	octave 2
	note G_, 1
	octave 3
	note E_, 14
;Ch1_Bar19:
	octave 4
	duty_cycle $1
	volume_envelope 6, 7
	note D_, 12
	octave 3
	note A_, 1
	octave 4
	note G_, 3
	octave 3
	note A_, 1
	octave 4
	note F_, 3
	octave 3
	note A_, 1
	octave 4
	note E_, 3
	octave 3
;Ch1_Bar20:
	volume_envelope 8, 7
	note D_, 1
	octave 4
	note D_, 7
	octave 3
	duty_cycle $3
	note F_, 2
	note A_, 2
	octave 4
	note F_, 4
	note E_, 4
	note D_, 2
	octave 3
	note A_, 2
;Ch1_Bar21:
	octave 4
	duty_cycle $3
	volume_envelope 6, 7
	note D_, 12
	octave 3
	note C_, 1
	note A_, 2
	octave 2
	note B_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	octave 3
	note G_, 2
	octave 2
	note A_, 1
	octave 3
	note F#, 2
	octave 2
	note G#, 1
	octave 3
	note F_, 2
	octave 2
	note G_, 1
	octave 3
	note E_, 2
	octave 2
	note F#, 1
	octave 3
	note D#, 2
	octave 2
	note F_, 1
	octave 3
	note D_, 14
;Ch1_Bar23:
	octave 4
	duty_cycle $1
	volume_envelope 6, 7
	note C_, 12
	octave 3
	note A_, 1
	octave 4
	note F_, 3
	octave 3
	note G_, 1
	octave 4
	note E_, 3
	octave 3
	note F_, 1
	octave 4
	note D_, 3
;Ch1_Bar24:
	volume_envelope 8, 7
	octave 3
	note C_, 1
	octave 4
	note C_, 7
	octave 3
	duty_cycle $3
	note E_, 2
	note G_, 2
	octave 4
	note F_, 4
	note E_, 4
	note C_, 2
	octave 3
	note G_, 2
;Ch1_Bar25:
	octave 2
 	note G_, 8
	volume_envelope 5, 7
	note G_, 2
	octave 3
	volume_envelope 8, 7
	note C_, 6
	note E_, 6
	volume_envelope 5, 7
	note E_, 2
	volume_envelope 8, 7
;Ch1_Bar26:
	octave 2
	note A#, 8
	volume_envelope 5, 7
	note A#, 2
	volume_envelope 8, 7
	octave 3
	note C_, 6
	note E_, 6
	volume_envelope 5, 7
	note E_, 2
;Ch1_Bar27:
	volume_envelope 8, 7
	note C_, 4
	note C_, 2
	volume_envelope 5, 7
	note C_, 4
	volume_envelope 8, 7
	octave 2
	note A_, 2
	note A_, 4
	volume_envelope 5, 7
	note A_, 2
	volume_envelope 8, 7
	octave 3
	note C_, 4
	note C_, 2
;Ch1_Bar28:
	volume_envelope 5, 7
	note C_, 4
	volume_envelope 8, 7
	note C_, 2
	note C_, 4
	volume_envelope 5, 7
	note C_, 2
	volume_envelope 8, 7
	note F_, 4
	note F_, 8
;Ch1_Bar29:
	duty_cycle $1
	volume_envelope 7, 7
	octave 5
	rest 6
	note C_, 6
	note F_, 6
	octave 6
	note C_, 6
;Ch1_Bar30:
	octave 5
	note G_, 6
	note D_, 6
	note C_, 6
	octave 4
	note G_, 6
;Ch1_Bar31:
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	note D_, 6
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	note B_, 6
;Ch1_Bar32:
	octave 3
	note C_, 2
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	note F_, 2
	note G#, 2
	octave 5
	note C_, 12
;Ch1_Bar33:
	octave 2
	note G_, 6
	octave 3
	note C_, 6
	note B_, 6
	note G_, 6
;Ch1_Bar34:
	octave 2
	note E_, 6
	octave 3
	note C_, 6
	note B_, 6
	note G_, 6
	sound_loop 0, Music_PKMN_Center_Night_Ch1_master

; ============================================================================================================
Music_PKMN_Center_Night_Ch2:
	stereo_panning TRUE, TRUE
	vibrato 18, 1, 4
	duty_cycle $2
	
Music_PKMN_Center_Night_Ch2_master:
	note_type 12, 11, 7
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	note G_, 8
;Bar3
	note F_, 8
	note E_, 4
	note D_, 16
;Ch2_Bar4:
	rest 16
;Ch2_Bar5:
	octave 3
	note B_, 4
;Ch2_Bar6:
	note G_, 4
	note B_, 4
	octave 4
	note E_, 8
;Ch2_Bar7:
	note D_, 8
	octave 3
	note B_, 4
	octave 4
	note_type 8, 11, 7
	note C_, 16
;Ch2_Bar8:
	octave 3
	note B_, 4
	note A#, 4
	note_type 12, 11, 7
	note A_, 8
;Ch2_Bar9:
	note B_, 8
	octave 4
	note C_, 4
;Ch2_Bar10:
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	note G_, 8
;Ch2_Bar11:
	note F_, 8
	note E_, 4
	note D_, 16
;Ch2_Bar12:
	rest 16
;Ch2_Bar13:
	octave 3
	note B_, 4
;Ch2_Bar14:
	note G_, 4
	note B_, 4
	octave 4
	note E_, 8
;Ch2_Bar15:
	note D_, 8
	octave 3
	note B_, 4
	octave 4
	note C_, 16
;Bar16
	rest 16
;Bar17
	vibrato 8, 2, 8
	duty_cycle $1
	volume_envelope 10, 8
	note E_, 10
	volume_envelope 10, 7
	note E_, 6
	volume_envelope 10, 8
;Bar18
	note G_, 10
	volume_envelope 10, 7
	note G_, 6
	volume_envelope 10, 8
;Bar19
	note F_, 10
	volume_envelope 10, 7
	note F_, 6
	volume_envelope 10, 8
;Bar20
	octave 3
	note A_, 10
	volume_envelope 10, 7
	note A_, 6
	volume_envelope 10, 8
;Bar21
	note B_, 10
	volume_envelope 10, 7
	note B_, 6
	volume_envelope 10, 8
;Bar22
	octave 4
	note D_, 10
	volume_envelope 10, 7
	note D_, 6
	volume_envelope 10, 8
;Bar23
	note E_, 10
	volume_envelope 10, 7
	note E_, 6
	volume_envelope 10, 8
;Bar 24
	octave 3
	note G_, 10
	volume_envelope 10, 7
	note G_, 6
;Bar25
	vibrato 18, 1, 4
	note_type 8, 7, 7
	duty_cycle $2
	note E_, 4
	duty_cycle $3
	volume_envelope 7, 3
	note G_, 2
	octave 5
	note F_, 2
	note E_, 2
	note C_, 2
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	octave 5
	note F_, 2
	note E_, 2
	octave 4
	note G_, 2
;Bar26
	duty_cycle $2
	volume_envelope 7, 7
	note E_, 4
	duty_cycle $3
	volume_envelope 7, 3
	note G_, 2
	octave 5
	note F_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note G_, 2
	octave 5
	note F_, 2
	note E_, 2
	octave 4
	note G_, 2
;Bar27
	sound_call Music_PKMN_Center_Night_Ch2_setupb
	note F_, 4
	sound_call Music_PKMN_Center_Night_Ch2_setup9
	note C_, 2
	sound_call Music_PKMN_Center_Night_Ch2_setupb
	note E_, 4
	sound_call Music_PKMN_Center_Night_Ch2_setup9
	note C_, 2
	sound_call Music_PKMN_Center_Night_Ch2_setupb
	note F_, 4
	sound_call Music_PKMN_Center_Night_Ch2_setup9
	note C_, 2
	sound_call Music_PKMN_Center_Night_Ch2_setupb
	note G_, 4
	sound_call Music_PKMN_Center_Night_Ch2_setup9
	note C_, 2
;Bar28
	octave 4
	duty_cycle $2
	volume_envelope 6, 4
	note G#, 4
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	note F_, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	note F_, 2
	note G#, 2
	octave 5
	note C_, 2
;Bar29
	note_type 12, 9, 7
	octave 4
	note G_, 8
	note F_, 4
	note E_, 4
;Ch2_Bar32:
	volume_envelope 9, 8
	note F_, 6
	volume_envelope 9, 7
	note F_, 10
;Ch2_Bar33:
	note E_, 4
	note F_, 4
	note E_, 4
	note D_, 4
;Ch2_Bar34:
	note C_, 16
;Ch2_Bar35:
	note_type 8, 9, 7
	rest 4
	note D_, 6
	note D_, 16
	rest 2
;Ch2_Bar36:
	note C_, 2
	note D_, 2
	note E_, 2
	octave 3
	note B_, 14
	sound_loop 0, Music_PKMN_Center_Night_Ch2_master
	sound_ret

Music_PKMN_Center_Night_Ch2_setupb:
	octave 4
	volume_envelope 7, 7
	duty_cycle $2
	sound_ret

Music_PKMN_Center_Night_Ch2_setup9:
	octave 5
	volume_envelope 7, 4
	duty_cycle $3
	sound_ret

; ============================================================================================================
Music_PKMN_Center_Night_Ch3:
	stereo_panning TRUE, TRUE
	note_type 12, 2, 1
	vibrato 18, 2, 4
	pitch_offset 2

Music_PKMN_Center_Night_Ch3_master:
;Ch3_Bar1:
	octave 3
	note C_, 12
	octave 2
	note G_, 4
;Ch3_Bar2:
	octave 3
	note C#, 12
	octave 2
	note A_, 4
;Ch3_Bar3:
	octave 3
	note D_, 12
	octave 2
	note A_, 4
;Ch3_Bar4:
	octave 3
	note C#, 12
	octave 2
	note A_, 4
;Ch3_Bar5:
	note G_, 12
	octave 3
	note D_, 4
;Ch3_Bar6:
	octave 2
	note G#, 12
	octave 3
	note D_, 4
;Ch3_Bar7:
	octave 2
	note A_, 8
	note_type 8, 2, 1
	note A_, 4
	note G#, 4
	note G_, 4
;Ch3_Bar8:
	note F_, 7
	rest 1
	note F_, 4
	note G_, 12
;Ch3_Bar9:
	note C_, 8
	rest 2
	note C_, 14
;Ch3_Bar10:
	note E_, 8
	rest 2
	note E_, 14
Music_PKMN_Center_Night_Ch3_F:
	note F_, 8
	rest 2
	note F_, 12
	rest 2
	sound_loop 2, Music_PKMN_Center_Night_Ch3_F
;Bar13:
	note D_, 16
	rest 8
;Bar14:
	note G_, 8
	rest 2
	note G_, 14
;Bar15:
	note C_, 8
	rest 2
	note C_, 2
	note D_, 8
	rest 2
	note D_, 2
	note G_, 8
	rest 2
	note G_, 2
	note F_, 8
	rest 2
	note F_, 2
;Ch3_Bar17:
	note_type 12, 2, 1
	note C_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note C_, 4
;Ch3_Bar18:
	note E_, 4
	note G_, 4
	note C_, 4
	note D_, 4
;Ch3_Bar19:
	note F_, 4
	note A_, 4
	note F_, 4
	note D_, 4
;Ch3_Bar20:
	note F_, 4
	note A_, 4
	note D_, 4
	note G_, 4
;Ch3_Bar21:
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	note G_, 4
;Ch3_Bar22:
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	note G_, 4
	note C_, 3
	rest 1
;Ch3_Bar23:
	note C_, 3
	rest 1
	note D_, 3
	rest 1
	note D_, 3
	rest 1
	note E_, 3
	rest 1
;Ch3_Bar24:
	note E_, 3
	rest 1
	note G_, 3
	rest 1
	note G_, 3
	rest 1
;Ch3_Bar25:
	note_type 8, 2, 1
Music_PKMN_Center_Night_Ch3_C:
	note C_, 8
	rest 2
	note C_, 2
	rest 4
	note C_, 8
	sound_loop 2, Music_PKMN_Center_Night_Ch3_C
;Bar27
	note F_, 4
	note F_, 2
	rest 4
	note C_, 2
	note C_, 4
	rest 2
	note F_, 4
	note F_, 2
;Bar28
	rest 4
	note G#, 2
	note G#, 4
	rest 2
	note C_, 12
;Ch3_Bar29:
	note_type 12, 2, 1
	note G_, 12
	note G_, 4
	note G_, 12
;Ch3_Bar30:
	note D_, 4
	note G_, 4
	note F_, 4
;Ch3_Bar31:
	note G_, 4
	note B_, 4
	note C_, 12
;Ch3_Bar32:
	note F_, 4
Music_PKMN_Center_Night_Ch3_end:
	octave 3
	note C_, 12
	octave 2
	note G_, 4
	sound_loop 2, Music_PKMN_Center_Night_Ch3_end
	sound_loop 0, Music_PKMN_Center_Night_Ch3_master
	sound_ret

; ============================================================================================================
Music_PKMN_Center_Night_Ch4:
	drum_speed 8
	stereo_panning TRUE, TRUE
	toggle_noise 1

Music_PKMN_Center_Night_Ch4_master:
;Ch4_Bar1:
	sound_call Music_PKMN_Center_Night_Ch4_Bar1
;Ch4_Bar7:
	drum_note 6, 6
	drum_note 5, 4
	drum_note 5, 2
	drum_note 6, 4
	drum_note 5, 4
	drum_note 5, 4
;Ch4_Bar8:
	drum_note 6, 6
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 4
	drum_note 6, 2
	drum_note 5, 4
;Ch4_Bar9:
	noisesampleset 3
	drum_note 4, 2
	drum_note 4, 6
	noisesampleset 1
	drum_note 6, 2
	drum_note 5, 4
	drum_note 5, 10
;Ch4_Bar10:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
	drum_note 5, 6
	drum_note 5, 4
	drum_note 5, 2
	drum_note 5, 4
;Ch4_Bar11:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
	drum_note 6, 2
	drum_note 5, 4
	drum_note 5, 10
;Ch4_Bar12:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
	drum_note 5, 6
	drum_note 5, 4
	drum_note 5, 2
	drum_note 5, 4
;Ch4_Bar13:
	noisesampleset 3
	drum_note 4, 2
	drum_note 4, 6
	noisesampleset 1
	drum_note 5, 4
	drum_note 5, 2
	drum_note 5, 6
	drum_note 5, 4
;Ch4_Bar14:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 4
	drum_note 5, 2
	drum_note 5, 6
	drum_note 5, 6
	drum_note 5, 4
;Ch4_Bar15:
Music_PKMN_Center_Night_Ch4_loop1:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 5, 4
	drum_note 5, 2
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 5, 4
	drum_note 5, 2
	drum_note 5, 4
	sound_loop 2, Music_PKMN_Center_Night_Ch4_loop1
;Ch4_Bar17:
	sound_call Music_PKMN_Center_Night_Ch4_Bar17_18
;Ch4_Bar18:
;Ch4_Bar19:
	noisesampleset 3
	drum_note 4, 2
	drum_note 4, 4
	noisesampleset 1
	drum_note 12, 2
	drum_note 5, 6
	drum_note 6, 4
	drum_note 6, 4
	drum_note 6, 4
;Ch4_Bar20:
	drum_note 5, 4
	drum_note 12, 2
	drum_note 6, 6
	drum_note 5, 4
	drum_note 5, 2
	drum_note 12, 4
;Ch4_Bar21:
	sound_call Music_PKMN_Center_Night_Ch4_Bar17_18
;Ch4_Bar22:
;Ch4_Bar23:
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 12, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
	drum_note 12, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
;Ch4_Bar24:
	noisesampleset 3
	drum_note 4, 4
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 4
	drum_note 5, 2
	drum_note 12, 2
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 12, 2
	drum_note 6, 4
;Ch4_Bar25:
	drum_note 5, 2
	noisesampleset 3
	drum_note 4, 4
	noisesampleset 1
	drum_note 12, 2
	drum_note 6, 4
	drum_note 5, 2
	drum_note 6, 4
	drum_note 5, 2
	drum_note 12, 2
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 12, 2
;Ch4_Bar26:
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 5, 4
	drum_note 12, 2
	drum_note 6, 4
	drum_note 5, 2
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
;Ch4_Bar27:
	noisesampleset 3
	drum_note 4, 4
	noisesampleset 1
	drum_note 12, 2
	drum_note 6, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 12, 4
	drum_note 5, 2
	noisesampleset 3
	drum_note 4, 4
	noisesampleset 1
	drum_note 12, 2
;Ch4_Bar28:
	drum_note 6, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 12, 4
	drum_note 6, 2
	drum_note 5, 2
	drum_note 5, 2
	drum_note 12, 2
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 5, 2
	noisesampleset 3
	drum_note 4, 2
	drum_note 4, 6
	noisesampleset 1
;Ch4_Bar29:
	drum_note 6, 4
	drum_note 5, 2
	drum_note 6, 6
	drum_note 6, 4
	drum_note 5, 2
	drum_note 6, 6
;Ch4_Bar30:
	drum_note 6, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
	drum_note 5, 4
	drum_note 5, 2
	noisesampleset 3
	drum_note 4, 4
	noisesampleset 1
;Ch4_Bar31:
	drum_note 5, 2
	drum_note 5, 6
	noisesampleset 3
	drum_note 4, 4
	noisesampleset 1
	drum_note 5, 2
	drum_note 5, 6
	drum_note 6, 6
;Ch4_Bar32:
	drum_note 6, 4
	drum_note 5, 2
	drum_note 5, 6
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	drum_note 6, 6
;Ch4_Bar33:
	drum_note 5, 6
	drum_note 5, 10
	noisesampleset 3
	drum_note 4, 8
	noisesampleset 1
;Ch4_Bar34:
	drum_note 5, 6
	drum_note 5, 10
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	sound_loop 0, Music_PKMN_Center_Night_Ch4_master
	sound_ret

Music_PKMN_Center_Night_Ch4_Bar1:
	drum_note 6, 6
	drum_note 5, 6
	drum_note 5, 10
	noisesampleset 3
	drum_note 4, 8

	noisesampleset 1
	drum_note 5, 6
	drum_note 5, 6
	drum_note 5, 4
	noisesampleset 3
	drum_note 4, 2
	noisesampleset 1
	sound_loop 3, Music_PKMN_Center_Night_Ch4_Bar1
	sound_ret

Music_PKMN_Center_Night_Ch4_Bar17_18:
	noisesampleset 3
	drum_note 4, 2
	drum_note 4, 4
	noisesampleset 1
	drum_note 12, 2
	drum_note 6, 6
	drum_note 6, 4
	drum_note 12, 2
	drum_note 5, 4
;Ch4_Bar18:
	drum_note 12, 2
	drum_note 5, 4
	drum_note 12, 2
	drum_note 6, 6
	drum_note 5, 4
	drum_note 5, 2
	drum_note 12, 4
	sound_ret
