Music_EcruteakCity: ; ef2d0
	channel_count 3
	channel 1, Music_EcruteakCity_Ch1
	channel 2, Music_EcruteakCity_Ch2
	channel 3, Music_EcruteakCity_Ch3
; ef2d9

Music_EcruteakCity_Ch1: ; ef2d9
	tempo 197
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 5
	duty_cycle $2
Music_EcruteakCity_branch_ef2e5: ; ef2e5
	sound_call Music_EcruteakCity_Ch1_Part1
	sound_call Music_EcruteakCity_branch_ef37f
	sound_call Music_EcruteakCity_Ch1_Part2
	sound_call Music_EcruteakCity_branch_ef391
	volume_envelope 5, 0
	duty_cycle $0
	note E_, 16
	note G_, 16
	duty_cycle $2
	sound_call Music_EcruteakCity_Ch1_Part3
	sound_call Music_EcruteakCity_branch_ef37f
	sound_call Music_EcruteakCity_Ch1_Part4
	sound_call Music_EcruteakCity_branch_ef391
	volume_envelope 5, 0
	duty_cycle $0
	note E_, 16
	note G_, 16
	duty_cycle $2
	sound_loop 0, Music_EcruteakCity_branch_ef2e5
; ef37f

Music_EcruteakCity_branch_ef37f: ; ef37f
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	note C_, 2
	sound_loop 2, Music_EcruteakCity_branch_ef37f
	sound_ret
; ef391

Music_EcruteakCity_branch_ef391: ; ef391
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	note F_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	note C_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
Music_EcruteakCity_branch_ef3be: ; ef3be
	octave 4
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note F_, 2
	sound_loop 2, Music_EcruteakCity_branch_ef3be
Music_EcruteakCity_branch_ef3d0: ; ef3d0
	octave 4
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note G_, 2
	sound_loop 2, Music_EcruteakCity_branch_ef3d0
	sound_ret

Music_EcruteakCity_Ch1_Part1:
	note_type 12, 5, 7
	rest 10
	octave 4
	note C_, 6
	rest 10
	note C_, 6
	rest 16
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note D_, 4
	volume_envelope 6, 0
	rest 4
	rest 16
	rest 10
	note G_, 2
	note A_, 2
	note A#, 2
	rest 8
	note G#, 2
	note G_, 2
	note F_, 2
	octave 5
	note C_, 6
	note_type 6, 6, 7
	note C#, 4
	note D_, 10
	rest 2
	stereo_panning TRUE, TRUE
	octave 4
	note B_, 8
	stereo_panning FALSE, TRUE
	octave 3
	note A#, 1
	note B_, 11
	octave 4
	note C_, 4
	note E_, 4
	note G_, 12
	note A#, 12
	note G_, 4
	rest 4
	note A#, 4
	octave 5
	note C#, 4
	note E_, 2
	rest 2
	octave 3
	note A_, 8
	octave 4
	note C_, 8
	note F_, 4
	rest 12
	note E_, 1
	note F_, 11
	note G_, 2
	rest 2
	note A_, 4
	note G_, 4
	rest 8
	volume_envelope 5, 2
	sound_ret

Music_EcruteakCity_Ch1_Part2:
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	sound_ret

Music_EcruteakCity_Ch1_Part3:
	volume_envelope 5, 2
	note A#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	octave 4
	note A#, 2
	octave 5
	note E_, 2
	note C#, 2
	octave 4
	note A#, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	sound_ret

Music_EcruteakCity_Ch1_Part4:
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	sound_ret

Music_EcruteakCity_Ch2: ; ef3eb
	vibrato 18, 2, 5
	duty_cycle $3
	stereo_panning TRUE, FALSE
Music_EcruteakCity_branch_ef3f2: ; ef3f2
	sound_call Music_EcruteakCity_Ch2_Part1
	duty_cycle $0
	sound_call Music_EcruteakCity_Ch2_Part2
	duty_cycle $1
	sound_call Music_EcruteakCity_Ch2_Part3
	sound_loop 0, Music_EcruteakCity_branch_ef3f2

Music_EcruteakCity_Ch2_Part1:
	note_type 6, 6, 7
	rest 16
	rest 5
	octave 4
	note G_, 1
	octave 5
	note D_, 1
	note E_, 9
	rest 16
	rest 5
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note F_, 9
	note_type 12, 7, 7
	rest 10
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	note G_, 4
	note A_, 4
	note B_, 4
	note_type 6, 9, 3
	volume_envelope 9, 7
	duty_cycle $2
	octave 3
	note G_, 7
	octave 4
	note C#, 1
	note D_, 11
	rest 1
	note C_, 2
	rest 2
	note C_, 16
	note F_, 8
	rest 4
	note E_, 4
	rest 4
	note E_, 4
	note F_, 4
	note G_, 4
	note E_, 4
	note C_, 2
	rest 2
	note C_, 4
	octave 3
	note A_, 2
	note F_, 1
	note A_, 1
	octave 4
	note C_, 16
	note E_, 4
	note G_, 2
	rest 2
	note E_, 4
	note D_, 10
	rest 1
	stereo_panning TRUE, TRUE
	note D#, 9
	stereo_panning TRUE, FALSE
	sound_ret

Music_EcruteakCity_Ch2_Part2:
	octave 5
	note C#, 1
	note D_, 11
	note C_, 2
	rest 2
	note C_, 16
	note F_, 12
	note E_, 4
	rest 4
	note E_, 4
	note F_, 4
	note G_, 2
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
	note A_, 3
	note E_, 2
	rest 2
	note E_, 4
	note C_, 2
	rest 2
	note C_, 4
	octave 4
	note A_, 2
	rest 2
	note B_, 4
	octave 5
	note C_, 2
	octave 4
	note G_, 1
	note B_, 1
	octave 5
	note D#, 1
	note E_, 11
	note D_, 2
	rest 2
	note D_, 8
	sound_ret

Music_EcruteakCity_Ch2_Part3:
	octave 4
	note E_, 4
	note G_, 3
	note G#, 1
	note A_, 16
	octave 3
	note A_, 4
	octave 4
	note C_, 2
	rest 2
	note E_, 4
	note D_, 12
	note C_, 4
	rest 4
	octave 3
	note B_, 4
	rest 4
	octave 4
	note F_, 8
	note G_, 12
	note F_, 8
	rest 4
	note E_, 8
	note D_, 4
	note C_, 2
	rest 2
	octave 3
	note B_, 4
	octave 4
	note C_, 2
	rest 6
	octave 3
	note B_, 4
	rest 4
	octave 4
	note C_, 4
	octave 3
	note A_, 16
	rest 4
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 12
	octave 3
	note B_, 4
	rest 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note_type 12, 8, 3
	note E_, 16
	volume_envelope 8, 0
	note D_, 4
	note C#, 4
	note F_, 4
	note_type 6, 8, 0
	note G_, 7
	note G#, 1
	volume_envelope 8, 7
	note A_, 12
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 3
	note G#, 1
	note A_, 4
	note E_, 2
	rest 2
	note E_, 4
	note D_, 2
	rest 2
	note C#, 4
	note D_, 12
	octave 3
	note B_, 4
	octave 4
	note F_, 4
	note G_, 12
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 4
	note G_, 4
	note D_, 2
	rest 1
	note A#, 1
	note B_, 12
	octave 5
	note C_, 4
	octave 4
	note A_, 8
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	note_type 12, 8, 7
	note F_, 10
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 8
	rest 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note E_, 16
	sound_ret

Music_EcruteakCity_Ch3: ; ef4e1
	stereo_panning TRUE, TRUE
Music_EcruteakCity_branch_ef4e3: ; ef4e3
	vibrato 18, 2, 5
	note_type 12, 2, 5
	sound_call Music_EcruteakCity_Ch3_Part1
	sound_call Music_EcruteakCity_branch_ef569
	note_type 6, 2, 5
	rest 1
	note B_, 1
	octave 4
	note C_, 8
	note E_, 8
	note G_, 8
	note B_, 8
	note A#, 8
	note G_, 8
	note E_, 8
	note C#, 8
	note_type 12, 2, 5
	sound_call Music_EcruteakCity_branch_ef569
	note_type 6, 2, 5
	rest 1
	note B_, 1
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	note E_, 8
	note D_, 8
	sound_loop 0, Music_EcruteakCity_branch_ef4e3
; ef569

Music_EcruteakCity_branch_ef569: ; ef569
	octave 3
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 4
	rest 2
	note C_, 1
	rest 1
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 2
	rest 2
	note B_, 1
	rest 1
	note A_, 4
	rest 2
	note A_, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 4
	rest 2
	octave 4
	note D_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	note A#, 1
	sound_ret

Music_EcruteakCity_Ch3_Part1:
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	octave 3
	note C_, 2
	note A_, 2
	octave 4
	note E_, 2
	note F_, 10
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	note G_, 4
	note F#, 4
	note F_, 4
	octave 3
	note B_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	octave 3
	note C#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	rest 2
	note C#, 2
	note D_, 2
	note E_, 2
	octave 3
	note D_, 2
	note A_, 1
	rest 1
	octave 4
	note E_, 2
	note F_, 1
	rest 1
	note G#, 8
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note F_, 2
	note G#, 2
	note B_, 2
	note G_, 1
	note G#, 5
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	octave 3
	note C#, 2
	note A#, 2
	octave 4
	note D_, 2
	note C#, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note G_, 1
	rest 1
	octave 3
	note F_, 8
	octave 4
	note A_, 2
	octave 5
	note C_, 1
	rest 1
	note D_, 2
	note E_, 1
	rest 1
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	sound_ret

; ============================================================================================================
; ============================================================================================================

Music_EcruteakCityNight: ; ef2d0
	channel_count 3
	channel 1, Music_EcruteakCityNight_Ch1
	channel 2, Music_EcruteakCityNight_Ch2
	channel 3, Music_EcruteakCityNight_Ch3
; ef2d9

Music_EcruteakCityNight_Ch1: ; ef2d9
	tempo 202
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 18, 1, 5
	duty_cycle $2
Music_EcruteakCityNight_Ch1_loop: ; ef2e5
	sound_call Music_EcruteakCity_Ch1_Part1
	sound_call Music_EcruteakCity_branch_ef37f
	sound_call Music_EcruteakCity_Ch1_Part2
	sound_call Music_EcruteakCity_branch_ef391
	volume_envelope 5, 0
	duty_cycle $0
	note E_, 16
	note G_, 16
	duty_cycle $2
	sound_call Music_EcruteakCity_Ch1_Part3
	sound_call Music_EcruteakCity_branch_ef37f
	sound_call Music_EcruteakCity_Ch1_Part4
	sound_call Music_EcruteakCity_branch_ef391
	volume_envelope 5, 0
	duty_cycle $0
	note E_, 16
	note G_, 16
	duty_cycle $2
	sound_loop 0, Music_EcruteakCityNight_Ch1_loop

Music_EcruteakCityNight_Ch2: ; ef3eb
	vibrato 18, 1, 5
	duty_cycle $2
	stereo_panning TRUE, FALSE
Music_EcruteakCityNight_Ch2_loop: ; ef3f2
	sound_call Music_EcruteakCity_Ch2_Part1
	duty_cycle $1
	sound_call Music_EcruteakCity_Ch2_Part2
	duty_cycle $2
	sound_call Music_EcruteakCity_Ch2_Part3
	sound_loop 0, Music_EcruteakCityNight_Ch2_loop

Music_EcruteakCityNight_Ch3: ; ef4e1
	stereo_panning TRUE, TRUE
Music_EcruteakCityNight_Ch3_loop: ; ef4e3
	vibrato 18, 1, 5
	note_type 12, 2, 4
	sound_call Music_EcruteakCity_Ch3_Part1
	sound_call Music_EcruteakCity_branch_ef569
	note_type 6, 2, 4
	rest 1
	note B_, 1
	octave 4
	note C_, 8
	note E_, 8
	note G_, 8
	note B_, 8
	note A#, 8
	note G_, 8
	note E_, 8
	note C#, 8
	note_type 12, 2, 4
	sound_call Music_EcruteakCity_branch_ef569
	note_type 6, 2, 4
	rest 1
	note B_, 1
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	note E_, 8
	note D_, 8
	sound_loop 0, Music_EcruteakCityNight_Ch3_loop