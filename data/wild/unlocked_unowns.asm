MACRO unown_set
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .Set_A_J ; ENGINE_UNLOCKED_UNOWNS_A_TO_J
	dw .Set_K_Q ; ENGINE_UNLOCKED_UNOWNS_K_TO_Q
	dw .Set_R_V ; ENGINE_UNLOCKED_UNOWNS_R_TO_V
	dw .Set_W_Z ; ENGINE_UNLOCKED_UNOWNS_W_TO_Z
.End

.Set_A_J:
	unown_set A, B, C, D, E, F, G, H, I, J
.Set_K_Q:
	unown_set K, L, M, N, O, P, Q
.Set_R_V:
	unown_set R, S, T, U, V
.Set_W_Z:
	unown_set W, X, Y, Z
