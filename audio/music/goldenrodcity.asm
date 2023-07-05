Music_GoldenrodCity: ; eb453
	channel_count 4
	channel 1, Music_GoldenrodCity_Ch1
	channel 2, Music_GoldenrodCity_Ch2
	channel 3, Music_GoldenrodCity_Ch3
	channel 4, Music_GoldenrodCity_Ch4
; eb45f

Music_GoldenrodCity_Ch1: ; eb45f
	stereo_panning FALSE, TRUE
	tempo 176
	volume 7, 7
	note_type 12, 9, 7
	rest 16
	rest 16
	rest 16
	rest 16
Music_GoldenrodCity_branch_eb46d: ; eb46d
	duty_cycle $0
	sound_call Music_GoldenrodCity_branch_eb4a9
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	volume_envelope 7, 1
	duty_cycle $0
	sound_call Music_GoldenrodCity_branch_eb4d1
	volume_envelope 7, 7
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 4
	volume_envelope 7, 1
	sound_call Music_GoldenrodCity_branch_eb4d1
	note D#, 1
	note F#, 1
	volume_envelope 7, 7
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note D#, 2
	duty_cycle $2
	volume_envelope 9, 7
	sound_call Music_GoldenrodCity_branch_eb4a9
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	sound_loop 0, Music_GoldenrodCity_branch_eb46d
; eb4a9

Music_GoldenrodCity_branch_eb4a9: ; eb4a9
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	rest 3
	note G#, 1
	rest 1
	octave 4
	note C_, 2
	octave 3
	note G#, 1
	rest 3
	note G#, 1
	rest 1
	note A#, 2
	note F_, 1
	rest 1
	note C#, 2
	note F_, 1
	rest 1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note F#, 2
	note C#, 1
	rest 3
	note C#, 1
	rest 1
	note F#, 2
	note C#, 1
	rest 1
	note F#, 2
	note A#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	octave 4
	note C#, 2
	sound_ret
; eb4d1

Music_GoldenrodCity_branch_eb4d1: ; eb4d1
	octave 4
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	sound_ret
; eb519

Music_GoldenrodCity_Ch2: ; eb519
	stereo_panning TRUE, FALSE
	vibrato 18, 2, 3
	duty_cycle $2
	note_type 12, 9, 7
Music_GoldenrodCity_branch_eb523: ; eb523
	volume_envelope 9, 7
	sound_call Music_GoldenrodCity_branch_eb555
	duty_cycle $1
	octave 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note D#, 8
	sound_call Music_GoldenrodCity_branch_eb555
	duty_cycle $1
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note D#, 8
	duty_cycle $2
	volume_envelope 7, 7
	sound_call Music_GoldenrodCity_branch_eb572
	octave 4
	note G#, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	duty_cycle $3
	volume_envelope 7, 7
	sound_call Music_GoldenrodCity_branch_eb572
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 2
	sound_loop 0, Music_GoldenrodCity_branch_eb523
; eb555

Music_GoldenrodCity_branch_eb555: ; eb555
	octave 4
	note F_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 6
	octave 3
	note G#, 1
	octave 3
	note A_, 1
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	octave 4
	note A#, 2
	note G#, 2
	note F#, 2
	sound_ret
; eb572

Music_GoldenrodCity_branch_eb572: ; eb572
	note C#, 6
	note F_, 6
	note C#, 4
	note C_, 6
	note D#, 6
	note C_, 2
	octave 4
	note G#, 1
	note A_, 1
	note A#, 6
	octave 5
	note C#, 6
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D#, 2
	sound_ret
; eb584

Music_GoldenrodCity_Ch3: ; eb584
	stereo_panning TRUE, TRUE
	vibrato 8, 2, 3
	note_type 12, 2, 5
Music_GoldenrodCity_branch_eb58c: ; eb58c
	sound_call Music_GoldenrodCity_branch_eb5aa
	sound_call Music_GoldenrodCity_branch_eb5aa
	sound_call Music_GoldenrodCity_branch_eb5d2
	rest 3
	octave 3
	note C_, 1
	note D#, 1
	note G_, 1
	note G#, 1
	note D#, 2
	sound_call Music_GoldenrodCity_branch_eb5d2
	rest 1
	octave 3
	note G#, 2
	note F#, 2
	note D#, 2
	octave 2
	note G#, 2
	sound_loop 0, Music_GoldenrodCity_branch_eb58c
; eb5aa

Music_GoldenrodCity_branch_eb5aa: ; eb5aa
	octave 3
	note C#, 4
	rest 2
	note C#, 1
	rest 1
	note C_, 4
	rest 2
	note C_, 1
	rest 1
	octave 2
	note A#, 4
	rest 2
	note A#, 1
	rest 1
	note G#, 4
	rest 2
	note G#, 1
	rest 1
	note F#, 4
	rest 2
	note F#, 1
	rest 1
	octave 3
	note D#, 4
	rest 2
	note D#, 1
	rest 1
	note G#, 4
	rest 2
	note G#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	note G#, 3
	rest 1
	octave 3
	note G#, 1
	rest 1
	sound_ret
; eb5d2

Music_GoldenrodCity_branch_eb5d2: ; eb5d2
	note C#, 1
	rest 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	rest 2
	note C#, 1
	rest 5
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 2
	note C_, 1
	rest 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	rest 2
	note C_, 1
	rest 5
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	rest 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	rest 2
	note A#, 1
	rest 5
	octave 3
	note A_, 1
	note A#, 1
	note F#, 2
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 1
	octave 2
	note G#, 1
	rest 2
	note G#, 1
	sound_ret
; eb606

Music_GoldenrodCity_Ch4: ; eb606
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 8
	drum_note 3, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
Music_GoldenrodCity_branch_eb613: ; eb613
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, Music_GoldenrodCity_branch_eb613
	sound_call Music_GoldenrodCity_branch_eb663
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 8, 1
	drum_note 8, 1
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 2
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 8, 1
	drum_note 8, 1
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 2
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_call Music_GoldenrodCity_branch_eb66d
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
Music_GoldenrodCity_branch_eb650: ; eb650
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, Music_GoldenrodCity_branch_eb650
	sound_call Music_GoldenrodCity_branch_eb663
	sound_loop 0, Music_GoldenrodCity_branch_eb613
; eb663

Music_GoldenrodCity_branch_eb663: ; eb663
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_ret
; eb66d

Music_GoldenrodCity_branch_eb66d: ; eb66d
	drum_note 4, 2
	drum_note 3, 1
	drum_note 4, 3
	drum_note 4, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	sound_ret
; eb676

; ============================================================================================================
; ============================================================================================================

Music_GoldenrodCityNight:
	channel_count 4
	channel 1, Music_GoldenrodCityNight_Ch1
	channel 2, Music_GoldenrodCityNight_Ch2
	channel 3, Music_GoldenrodCityNight_Ch3
	channel 4, Music_GoldenrodCityNight_Ch4

; ============================================================================================================
Music_GoldenrodCityNight_Ch1:
	stereo_panning FALSE, TRUE
	tempo 187
	volume 7, 7
	note_type 12, 9, 7
	rest 16
	rest 16
	rest 16
	rest 16
Music_GoldenrodCityNight_branch_eb46d: ; eb46d
	duty_cycle $1
	sound_call Music_GoldenrodCity_branch_eb4a9
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	volume_envelope 7, 1
	duty_cycle $1
	sound_call Music_GoldenrodCity_branch_eb4d1
	volume_envelope 7, 7
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 4
	volume_envelope 7, 1
	sound_call Music_GoldenrodCity_branch_eb4d1
	note D#, 1
	note F#, 1
	volume_envelope 7, 7
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note D#, 2
	duty_cycle $2
	volume_envelope 9, 7
	sound_call Music_GoldenrodCity_branch_eb4a9
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	sound_loop 0, Music_GoldenrodCityNight_branch_eb46d
; eb4a9

; ============================================================================================================
Music_GoldenrodCityNight_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 18, 1, 3
	duty_cycle $2
	note_type 12, 9, 7
Music_GoldenrodCityNight_branch_eb523: ; eb523
	volume_envelope 9, 7
	sound_call Music_GoldenrodCity_branch_eb555
	octave 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note D#, 8
	sound_call Music_GoldenrodCity_branch_eb555
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note D#, 8
	duty_cycle $2
	volume_envelope 7, 7
	sound_call Music_GoldenrodCity_branch_eb572
	octave 4
	note G#, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	duty_cycle $2
	volume_envelope 7, 7
	sound_call Music_GoldenrodCity_branch_eb572
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 2
	sound_loop 0, Music_GoldenrodCityNight_branch_eb523
; eb555

; ============================================================================================================
Music_GoldenrodCityNight_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 8, 1, 3
	note_type 12, 2, 4
	
	sound_loop 0, Music_GoldenrodCity_branch_eb58c
	
; ============================================================================================================
Music_GoldenrodCityNight_Ch4:
	toggle_noise 9
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 8
	drum_note 3, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_loop 0, Music_GoldenrodCity_branch_eb613 ; eb613
