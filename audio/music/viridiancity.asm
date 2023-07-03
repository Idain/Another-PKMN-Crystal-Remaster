Music_ViridianCity:
	channel_count 4
	channel 1, Music_GSCViridianCity_Ch1
	channel 2, Music_GSCViridianCity_Ch2
	channel 3, Music_GSCViridianCity_Ch3
	channel 4, Music_GSCViridianCity_Ch4

Music_GSCViridianCity_Ch1:
	tempo 157
	vibrato 18, 3, 4
Music_GSCViridianCity_Ch1_Entry:
	volume 7, 7
	duty_cycle $2
	stereo_panning FALSE, TRUE
	note_type 12, 10, 7
	octave 3
	note F#, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note F#, 1
	rest 1
	note F#, 4
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	note F#, 1
	rest 1
	note F#, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note G_, 1
	rest 1
	rest 4
	note G_, 8
	rest 4
Music_GSCViridianCity_branch_f4039: ; f4039
	sound_call Music_GSCViridianCity_branch_f40c5
	rest 4
	sound_call Music_GSCViridianCity_branch_f40c5
	octave 4
	note C_, 4
	sound_call Music_GSCViridianCity_branch_f410f
	octave 4
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note F#, 2
	note E_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 3
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	rest 2
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note F#, 1
	rest 1
	volume_envelope 8, 7
	octave 5
	note F#, 4
	note F_, 4
	volume_envelope 10, 7
	octave 3
	note G_, 6
	note B_, 8
	octave 4
	note E_, 2
	rest 2
	note E_, 2
	octave 3
	note B_, 4
	note G_, 2
	note F#, 2
	note E_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	rest 1
	note F#, 1
	rest 3
	note D_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	rest 2
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D#, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	sound_call Music_GSCViridianCity_branch_f410f
	octave 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note F#, 2
	note E_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 3
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	rest 2
	note E_, 2
	rest 2
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	note F#, 2
	note G_, 6
	note B_, 1
	rest 1
	octave 4
	note E_, 4
	note F#, 2
	note G_, 6
	note E_, 2
	rest 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	rest 2
	note F#, 6
	note D_, 4
	octave 3
	note A_, 4
	note F#, 4
	note G_, 1
	rest 3
	note G_, 8
	note A#, 4
	sound_loop 0, Music_GSCViridianCity_branch_f4039
; f40c5

Music_GSCViridianCity_branch_f40c5: ; f40c5
	octave 3
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	note A_, 1
	rest 1
	octave 4
	note C_, 4
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note B_, 1
	rest 3
	note G_, 2
	rest 4
	note G_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	note G_, 1
	rest 1
	note G_, 4
	rest 2
	note B_, 1
	rest 1
	octave 4
	note D_, 1
	rest 3
	note D_, 2
	rest 4
	note D_, 2
	rest 2
	note D_, 1
	rest 1
	octave 3
	note G_, 4
	rest 2
	octave 4
	note C#, 1
	rest 1
	note E_, 1
	rest 1
	note D_, 4
	note C#, 1
	rest 1
	octave 3
	note A_, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note G_, 1
	rest 1
	rest 4
	note G_, 8
	sound_ret
; f410f

Music_GSCViridianCity_branch_f410f: ; f410f
	octave 3
	note B_, 2
	note D_, 2
	note G_, 1
	rest 1
	note B_, 1
	rest 3
	note G_, 2
	note B_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	rest 2
	octave 3
	note B_, 2
	octave 4
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret
; f4125

Music_GSCViridianCity_Ch2: ; f4125
	duty_cycle $1
	vibrato 16, 4, 6
Music_GSCViridianCity_Ch2_Entry:
	note_type 12, 11, 7
	stereo_panning TRUE, FALSE
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 4
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note C#, 4
	octave 2
	note A_, 1
	rest 1
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note E_, 1
	rest 1
	rest 4
	note E_, 8
	rest 4
Music_GSCViridianCity_branch_f414c: ; f414c
	sound_call Music_GSCViridianCity_branch_f41c0
	rest 4
	sound_call Music_GSCViridianCity_branch_f41c0
	octave 2
	note F#, 4
	sound_call Music_GSCViridianCity_branch_f4201
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	sound_call Music_GSCViridianCity_branch_f420b
	rest 2
	note F#, 2
	rest 2
	octave 3
	note C#, 1
	rest 1
	note C#, 4
	note C_, 4
	sound_call Music_GSCViridianCity_branch_f4215
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note E_, 2
	note B_, 2
	note G_, 4
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	note C_, 2
	note C#, 2
	rest 2
	note D#, 2
	note A_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note D#, 2
	note C_, 2
	octave 2
	note A_, 2
	note F#, 2
	sound_call Music_GSCViridianCity_branch_f4201
	note G_, 4
	rest 2
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 4
	note G_, 2
	sound_call Music_GSCViridianCity_branch_f420b
	rest 2
	note F#, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note C_, 2
	rest 2
	octave 2
	note D#, 2
	sound_call Music_GSCViridianCity_branch_f4215
	note E_, 4
	rest 2
	note A#, 1
	rest 1
	note A#, 4
	rest 2
	note G_, 1
	rest 1
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note D_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 8
	octave 1
	note A_, 4
	sound_loop 0, Music_GSCViridianCity_branch_f414c
; f41c0

Music_GSCViridianCity_branch_f41c0: ; f41c0
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 4
	note D#, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note C_, 4
	octave 2
	note A_, 1
	rest 1
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 4
	rest 4
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	octave 3
	note D_, 4
	octave 2
	note B_, 1
	rest 1
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	note D_, 4
	rest 4
	octave 2
	note A_, 4
	rest 2
	octave 3
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G_, 4
	note E_, 1
	rest 1
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note E_, 1
	rest 1
	rest 4
	note E_, 8
	sound_ret
; f4201

Music_GSCViridianCity_branch_f4201: ; f4201
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	note D_, 4
	octave 2
	note F_, 2
	note F#, 2
	sound_ret
; f420b

Music_GSCViridianCity_branch_f420b: ; f420b
	note F#, 4
	rest 2
	octave 3
	note C#, 1
	rest 1
	note C#, 4
	octave 2
	note E_, 2
	note F_, 2
	sound_ret
; f4215

Music_GSCViridianCity_branch_f4215: ; f4215
	octave 2
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 4
	note D_, 2
	note D#, 2
	sound_ret
; f421e

Music_GSCViridianCity_Ch3: ; f421e
	vibrato 18, 2, 4
	note_type 12, 1, 3
	stereo_panning TRUE, TRUE
	sound_call Music_GSCViridianCity_Ch3_Branch2
Music_GSCViridianCity_branch_f4246: ; f4246
	volume_envelope 1, 3
	sound_call Music_GSCViridianCity_branch_f42a2
	octave 5
	note F#, 2
	note G_, 2
	sound_call Music_GSCViridianCity_branch_f42a2
	note E_, 4
	vibrato 24, 2, 5
	volume_envelope 2, 5
	sound_call Music_GSCViridianCity_Ch3_Branch1
	sound_loop 0, Music_GSCViridianCity_branch_f4246
; f42a2

Music_GSCViridianCity_branch_f42a2: ; f42a2
	octave 5
	note A_, 2
	rest 2
	note G_, 2
	rest 2
	note F#, 2
	rest 6
	rest 2
	note F#, 2
	note G_, 2
	note A_, 2
	rest 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	octave 4
	note B_, 2
	rest 4
	note B_, 2
	rest 2
	octave 5
	note G_, 2
	rest 2
	note D_, 2
	rest 2
	octave 4
	note B_, 1
	rest 1
	note B_, 4
	octave 5
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note F#, 2
	rest 2
	note E_, 2
	rest 6
	rest 2
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note D_, 2
	octave 4
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	octave 5
	note D_, 1
	rest 1
	rest 4
	note D_, 8
	sound_ret
; f42df

Music_GSCViridianCity_Ch3_Branch1:
	note B_, 12
	note G_, 4
	octave 6
	note D_, 8
	note E_, 2
	note D_, 2
	note C#, 2
	octave 5
	note B_, 2
	note A_, 12
	note F#, 4
	note A_, 8
	note A_, 4
	note G#, 4
	note E_, 10
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note G_, 2
	note F#, 4
	note E_, 4
	note G_, 4
	note F#, 12
	note D_, 4
	note A_, 4
	rest 4
	octave 6
	note C_, 8
	octave 5
	note B_, 12
	octave 6
	note C#, 2
	note D_, 2
	note E_, 2
	rest 2
	note D_, 2
	rest 2
	note C#, 2
	rest 2
	octave 5
	note B_, 2
	rest 2
	note A_, 10
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	rest 2
	octave 5
	note B_, 2
	rest 2
	note A_, 2
	rest 2
	note F#, 2
	rest 2
	note G_, 12
	note G_, 2
	note A_, 2
	note A#, 6
	note A_, 2
	rest 2
	note G_, 2
	note A#, 2
	rest 2
	note A_, 14
	rest 4
	note D_, 1
	rest 3
	note D_, 8
	note E_, 4
	sound_ret

Music_GSCViridianCity_Ch3_Branch2:
	octave 4
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	octave 5
	note F#, 2
	rest 2
	note C#, 2
	rest 2
	octave 4
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	octave 5
	note D_, 1
	rest 1
	rest 4
	note D_, 8
	note F#, 2
	note G_, 2
	sound_ret

Music_GSCViridianCity_Ch4: ; f42df
	toggle_noise $3
	drum_speed 12
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f432c
Music_GSCViridianCity_branch_f42e9: ; f42e9
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f432c
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f432c
	sound_call Music_GSCViridianCity_branch_f433b
	sound_call Music_GSCViridianCity_branch_f434b
	sound_call Music_GSCViridianCity_branch_f433b
	sound_call Music_GSCViridianCity_branch_f433b
	sound_call Music_GSCViridianCity_branch_f433b
	sound_call Music_GSCViridianCity_branch_f434b
	sound_call Music_GSCViridianCity_branch_f433b
	sound_call Music_GSCViridianCity_branch_f433b
	sound_loop 0, Music_GSCViridianCity_branch_f42e9
; f431d

Music_GSCViridianCity_branch_f431d: ; f431d
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 4
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 4
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	sound_ret
; f432c

Music_GSCViridianCity_branch_f432c: ; f432c
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 4
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	drum_note 5, 2
	drum_note 5, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 11, 2
	drum_note 11, 2
	sound_ret
; f433b

Music_GSCViridianCity_branch_f433b: ; f433b
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 4
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	sound_ret
; f434b

Music_GSCViridianCity_branch_f434b: ; f434b
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 4
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_ret
; f435b

; ============================================================================================================
; ============================================================================================================

Music_GSCViridianCity_Night:
	channel_count 4
	channel 1, Music_GSCViridianCity_Night_Ch1
	channel 2, Music_GSCViridianCity_Night_Ch2
	channel 3, Music_GSCViridianCity_Night_Ch3
	channel 4, Music_GSCViridianCity_Night_Ch4

Music_GSCViridianCity_Night_Ch1:
	tempo 164
	vibrato 18, 2, 4
	sound_call Music_GSCViridianCity_Ch1_Entry
	sound_ret

Music_GSCViridianCity_Night_Ch2:
	duty_cycle $2
	vibrato 16, 3, 6
	sound_call Music_GSCViridianCity_Ch2_Entry
	sound_ret

Music_GSCViridianCity_Night_Ch3: ; f421e
	vibrato 18, 1, 4
	note_type 12, 1, 2
	stereo_panning TRUE, TRUE
	sound_call Music_GSCViridianCity_Ch3_Branch2
Music_GSCViridianCity_Night_loop: ; f4246
	volume_envelope 1, 2
	sound_call Music_GSCViridianCity_branch_f42a2
	octave 5
	note F#, 2
	note G_, 2
	sound_call Music_GSCViridianCity_branch_f42a2
	note E_, 4
	vibrato 24, 1, 5
	volume_envelope 1, 10
	sound_call Music_GSCViridianCity_Ch3_Branch1
	sound_loop 0, Music_GSCViridianCity_Night_loop

Music_GSCViridianCity_Night_Ch4:
	toggle_noise $8
	drum_speed 12
	sound_call Music_GSCViridianCity_branch_f431d
	sound_call Music_GSCViridianCity_branch_f432c
	sound_call Music_GSCViridianCity_branch_f42e9
	sound_ret