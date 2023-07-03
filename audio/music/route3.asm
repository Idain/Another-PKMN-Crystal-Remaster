Music_Route3:
	channel_count 4
	channel 1, Music_Route3_Ch1
	channel 2, Music_Route3_Ch2
	channel 3, Music_Route3_Ch3
	channel 4, Music_Route3_Ch4

Music_Route3_Ch1:
	tempo 160
	duty_cycle $0
Music_Route3_Entry:
	stereo_panning FALSE, TRUE
	volume 7, 7
	note_type 12, 9, 1
	rest 10
	vibrato 20, 0, 6
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	sound_call Music_Route3_Ch1_CE
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
Music_Route3_branch_ec307: ; ec307
	sound_call Music_Route3_branch_ec3a4
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	sound_call Music_Route3_Ch1_CE
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	sound_call Music_Route3_Ch1_CE
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	volume_envelope 6, -7
	note G_, 1
	note D_, 1
	volume_envelope 7, 7
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 4
	volume_envelope 6, -7
	octave 3
	note G#, 2
	note E_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note E_, 8
	note D#, 1
	note E_, 1
	note G#, 2
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note A_, 1
	note G#, 1
	note F_, 3
	note E_, 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 2
	volume_envelope 9, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	sound_loop 0, Music_Route3_branch_ec307
; ec3a4

Music_Route3_branch_ec3a4: ; ec3a4
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	sound_loop 3, Music_Route3_branch_ec3a4
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3b1: ; ec3b1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	sound_loop 3, Music_Route3_branch_ec3b1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3bd: ; ec3bd
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	sound_loop 3, Music_Route3_branch_ec3bd
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	sound_ret
; ec3d0
Music_Route3_Ch1_CE:
rept 3
	note C#, 1
	note E_, 1
endr
	sound_ret

Music_Route3_Ch2: ; ec3d0
	sound_call Music_Route3_Ch2_Intro
Music_Route3_branch_ec3f5: ; ec3f5
	volume_envelope 7, -5
	sound_call Music_Route3_branch_ec443
	note G_, 1
	note B_, 10
	volume_envelope 11, 7
	note B_, 6
	volume_envelope 7, -5
	rest 4
	duty_cycle $3
	note G#, 4
	sound_call Music_Route3_branch_ec443
	note B_, 1
	volume_envelope 7, -5
	octave 5
	note D_, 5
	volume_envelope 11, 7
	octave 5
	note D_, 5
	duty_cycle $0
	sound_call Music_Route3_Ch2_Part2
	sound_loop 0, Music_Route3_branch_ec3f5
; ec443

Music_Route3_branch_ec443: ; ec443
	note A_, 6
	note E_, 1
	note A_, 1
	octave 5
	note C#, 7
	volume_envelope 11, 7
	octave 5
	note C#, 3
	volume_envelope 7, -5
	octave 4
	note E_, 2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 6
	note D_, 1
	sound_ret
; ec45b

Music_Route3_Ch2_Intro:
	duty_cycle $2
	vibrato 6, 0, 3
	stereo_panning TRUE, FALSE
	note_type 12, 5, -6
	octave 4
	note E_, 1
	note G_, 1
	note G#, 6
	volume_envelope 8, 7
	note F#, 1
	note G#, 1
	note A_, 1
	rest 7
	note C#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	volume_envelope 10, 7
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G#, 1
	sound_ret

Music_Route3_Ch2_Part2:
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	rest 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	volume_envelope 8, -7
	duty_cycle $2
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G#, 1
	note A_, 1
	note B_, 2
	note E_, 4
	octave 4
	note E_, 8
	note D_, 1
	note C#, 1
	note D_, 3
	note C#, 3
	octave 3
	note A_, 10
	octave 4
	note F#, 6
	note E_, 1
	note F#, 1
	note G#, 6
	note F#, 1
	note G#, 1
	sound_ret

Music_Route3_Ch3: ; ec45b
	stereo_panning TRUE, TRUE
	vibrato 6, 0, 3
	note_type 12, 1, 3
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	volume_envelope 1, 4
	sound_call Music_Route3_Ch3_Intro
	sound_call Music_Route3_branch_ec4bd
Music_Route3_branch_ec47f: ; ec47f
	sound_call Music_Route3_branch_ec4bd
	sound_call Music_Route3_branch_ec4bd
	sound_call Music_Route3_branch_ec4ce
	sound_call Music_Route3_branch_ec4bd
	sound_call Music_Route3_branch_ec4bd
	sound_call Music_Route3_branch_ec4ce
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note A_, 6
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 1
	rest 1
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 6
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note C#, 2
	note D_, 1
	rest 1
	note D_, 2
	rest 2
	note D_, 1
	note D_, 1
	note E_, 1
	rest 1
	note E_, 2
	rest 2
	note F#, 1
	note G#, 1
	sound_loop 0, Music_Route3_branch_ec47f
; ec4bd

Music_Route3_branch_ec4bd: ; ec4bd
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 2
	note G#, 2
	sound_ret
; ec4ce

Music_Route3_branch_ec4ce: ; ec4ce
	octave 3
	note G_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note D_, 2
	note G_, 2
	note G_, 1
	rest 1
	octave 2
	note G_, 2
	rest 2
	note G_, 1
	note G_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G#, 2
	note B_, 2
	sound_ret
; ec4eb
Music_Route3_Ch3_Intro:
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 2
	sound_ret

Music_Route3_Ch4: ; ec4eb
	toggle_noise $4
	drum_speed 12
	rest 10
Music_Route3_branch_ec4f0: ; ec4f0
	drum_speed 12
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 6
rept 8
	drum_note 2, 1
endr
	sound_loop 0, Music_Route3_branch_ec4f0

; ============================================================================================================
; ============================================================================================================

Music_Route3Night:
	channel_count 4
	channel 1, Music_Route3_Night_Ch1
	channel 2, Music_Route3_Night_Ch2
	channel 3, Music_Route3_Night_Ch3
	channel 4, Music_Route3_Night_Ch4

Music_Route3_Night_Ch1:
	tempo 168
	duty_cycle $1
	sound_call Music_Route3_Entry
	sound_ret

Music_Route3_Night_Ch2:
	sound_call Music_Route3_Ch2_Intro
Music_Route3_Night_Ch2_loop:
	volume_envelope 7, -5
	sound_call Music_Route3_branch_ec443
	note G_, 1
	note B_, 10
	volume_envelope 11, 7
	note B_, 6
	volume_envelope 7, -5
	rest 4
	duty_cycle $2
	note G#, 4
	sound_call Music_Route3_branch_ec443
	note B_, 1
	volume_envelope 7, -5
	octave 5
	note D_, 5
	volume_envelope 11, 7
	octave 5
	note D_, 5
	duty_cycle $1
	sound_call Music_Route3_Ch2_Part2
	sound_loop 0, Music_Route3_Night_Ch2_loop

Music_Route3_Night_Ch3: ; ec45b
	stereo_panning TRUE, TRUE
	vibrato 6, 0, 3
	note_type 12, 1, 0
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	volume_envelope 1, 2
	sound_call Music_Route3_Ch3_Intro
	sound_call Music_Route3_branch_ec4bd
	sound_call Music_Route3_branch_ec47f

Music_Route3_Night_Ch4: ; ec4eb
	toggle_noise $9
	drum_speed 12
	rest 10
	sound_call Music_Route3_branch_ec4f0