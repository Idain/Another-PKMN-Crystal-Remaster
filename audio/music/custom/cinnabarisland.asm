;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 4.0 (17-Jun-2020)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_CinnabarIslandGBS:
	channel_count 2
	channel 1, Music_CinnabarIslandGBS_Ch1
	channel 2, Music_CinnabarIslandGBS_Ch2

Music_CinnabarIslandGBS_Ch1:
	volume 7, 7
	duty_cycle $3
	note_type 12, 12, 7
	vibrato 8, 1, 6
	tempo 277
	stereo_panning FALSE, TRUE
;Bar 1
	rest 4
	volume_envelope 10, 7
	octave 3
	note D_, 4
	note E_, 6
	note C#, 2
;Bar 2
	note D_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Bar 3
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
;Bar 4
	note G_, 8
	note F#, 4
	volume_envelope 9, 7
	note E_, 4
;Bar 5
	volume_envelope 10, 7
	note D_, 4
	note E_, 4
	note F#, 6
	note A_, 2
;Bar 6
	note G_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Bar 7
	note B_, 4
	note G_, 4
	note F#, 3
	note E_, 1
	note F#, 2
	note A_, 2
;Bar 8
	note G_, 4
	volume_envelope 9, 7
	octave 4
rept 2
	note D_, 1
	note E_, 1
	note D_, 4
endr
;Bar 9
	volume_envelope 10, 7
	octave 3
	note B_, 6
	volume_envelope 9, 7
	note G_, 2
	note E_, 8
;Bar 10
	volume_envelope 10, 7
	octave 4
	note C_, 6
	volume_envelope 9, 7
	octave 3
	note A_, 2
	note F#, 8
;Bar 11
	volume_envelope 10, 7
	octave 4
	note F#, 6
	volume_envelope 9, 7
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
;Bar 12
	volume_envelope 10, 7
	note G_, 8
	volume_envelope 9, 7
	note F#, 4
	note E_, 4
	sound_loop 0, Music_CinnabarIslandGBS_Ch1

; ============================================================================================================

Music_CinnabarIslandGBS_Ch2:
	duty_cycle $2
	note_type 12, 11, 7
	vibrato 8, 1, 6
	stereo_panning TRUE, FALSE
;Bar 1
	sound_call Music_CinnabarIslandGBS_Ch2_Main
	note E_, 2
;Bar 4
	note D_, 4
	octave 3
	note B_, 8
	volume_envelope 10, 7
	note A_, 4
;Bar 5
	volume_envelope 11, 7
	sound_call Music_CinnabarIslandGBS_Ch2_Main
	
	note D_, 1
	note E_, 1
;Bar 8
	note D_, 4
	octave 3
	note A_, 4
	note G_, 4
	note F#, 4
;Bar 9
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	note G_, 8
;Bar 10
	octave 4
	note E_, 6
	note C_, 2
	octave 3
	note A_, 8
;Bar 11
	octave 4
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
;Bar 12
	note B_, 4
	octave 4
	note D_, 4
	octave 3
	note B_, 2
	note A_, 6
	sound_loop 0, Music_CinnabarIslandGBS_Ch2

Music_CinnabarIslandGBS_Ch2_Main:
	octave 3
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
;Bar 2
	note D_, 4
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
;Bar 3
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	sound_ret

; ============================================================================================================
