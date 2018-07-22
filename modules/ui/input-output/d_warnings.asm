
_dWarnings_init:

;d_warnings.c,34 :: 		void dWarnings_init(void){
;d_warnings.c,36 :: 		for(ii = 0; ii < WARNINGS_TOTAL_COUNT; ii += 1){
; ii start address is: 4 (W2)
	CLR	W2
; ii end address is: 4 (W2)
L_dWarnings_init0:
; ii start address is: 4 (W2)
	CP	W2, #3
	BRA LTU	L__dWarnings_init4
	GOTO	L_dWarnings_init1
L__dWarnings_init4:
;d_warnings.c,37 :: 		WARNINGS_FLAG[ii] = 0;
	SL	W2, #1, W1
	MOV	#lo_addr(d_warnings_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,36 :: 		for(ii = 0; ii < WARNINGS_TOTAL_COUNT; ii += 1){
	INC	W2
;d_warnings.c,38 :: 		}
; ii end address is: 4 (W2)
	GOTO	L_dWarnings_init0
L_dWarnings_init1:
;d_warnings.c,39 :: 		}
L_end_dWarnings_init:
	RETURN
; end of _dWarnings_init

_dWarnings_check:

;d_warnings.c,41 :: 		void dWarnings_check(void){
;d_warnings.c,100 :: 		}
L_end_dWarnings_check:
	RETURN
; end of _dWarnings_check

d_warnings____?ag:

L_end_d_warnings___?ag:
	RETURN
; end of d_warnings____?ag
