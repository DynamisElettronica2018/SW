
_dWarnings_init:

;d_warnings.c,34 :: 		void dWarnings_init(void){
;d_warnings.c,36 :: 		for(ii = 0; ii < WARNINGS_TOTAL_COUNT; ii += 1){
; ii start address is: 4 (W2)
	CLR	W2
; ii end address is: 4 (W2)
L_dWarnings_init0:
; ii start address is: 4 (W2)
	CP	W2, #3
	BRA LTU	L__dWarnings_init8
	GOTO	L_dWarnings_init1
L__dWarnings_init8:
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

_dWarnings_flash:

;d_warnings.c,102 :: 		void dWarnings_flash(unsigned int ii){
;d_warnings.c,103 :: 		Buzzer_bip();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_Buzzer_bip
	POP	W10
;d_warnings.c,104 :: 		dd_GraphicController_fireTimedNotification(0.7, LIMITS_DESCRIPTIONS[ii], WARNING);
	SL	W10, #1, W1
	MOV	#lo_addr(d_warnings_LIMITS_DESCRIPTIONS), W0
	ADD	W0, W1, W0
	MOV.B	#1, W12
	MOV	[W0], W11
	CLR	W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_warnings.c,105 :: 		}
L_end_dWarnings_flash:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dWarnings_flash

_dWarnings_setParameter:

;d_warnings.c,107 :: 		void dWarnings_setParameter(unsigned int ii){
;d_warnings.c,108 :: 		WARNINGS_FLAG[ii] = 1;
	SL	W10, #1, W1
	MOV	#lo_addr(d_warnings_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	MOV	#1, W0
	MOV	W0, [W1]
;d_warnings.c,109 :: 		dSignalLed_set(DSIGNAL_LED_RED);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_dSignalLed_set
	POP	W10
;d_warnings.c,110 :: 		dWarnings_flash(ii);
	CALL	_dWarnings_flash
;d_warnings.c,111 :: 		}
L_end_dWarnings_setParameter:
	RETURN
; end of _dWarnings_setParameter

_dWarnings_unsetParameter:

;d_warnings.c,113 :: 		void dWarnings_unsetParameter(unsigned int ii){
;d_warnings.c,114 :: 		int nn, or = 0;
; or start address is: 4 (W2)
	CLR	W2
;d_warnings.c,115 :: 		WARNINGS_FLAG[ii] = 0;
	SL	W10, #1, W1
	MOV	#lo_addr(d_warnings_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,116 :: 		for(nn = 0; nn < WARNINGS_TOTAL_COUNT; nn += 1){
; nn start address is: 0 (W0)
	CLR	W0
; or end address is: 4 (W2)
; nn end address is: 0 (W0)
	MOV	W2, W3
	MOV	W0, W2
L_dWarnings_unsetParameter3:
; nn start address is: 4 (W2)
; or start address is: 6 (W3)
	CP	W2, #3
	BRA LT	L__dWarnings_unsetParameter13
	GOTO	L_dWarnings_unsetParameter4
L__dWarnings_unsetParameter13:
;d_warnings.c,117 :: 		or += WARNINGS_FLAG[nn];
	SL	W2, #1, W1
	MOV	#lo_addr(d_warnings_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	ADD	W3, [W0], W3
;d_warnings.c,116 :: 		for(nn = 0; nn < WARNINGS_TOTAL_COUNT; nn += 1){
	INC	W2
;d_warnings.c,118 :: 		}
; nn end address is: 4 (W2)
	GOTO	L_dWarnings_unsetParameter3
L_dWarnings_unsetParameter4:
;d_warnings.c,119 :: 		if(or == 0){
	CP	W3, #0
	BRA Z	L__dWarnings_unsetParameter14
	GOTO	L_dWarnings_unsetParameter6
L__dWarnings_unsetParameter14:
; or end address is: 6 (W3)
;d_warnings.c,120 :: 		dSignalLed_unset(DSIGNAL_LED_RED);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
	POP	W10
;d_warnings.c,121 :: 		}
L_dWarnings_unsetParameter6:
;d_warnings.c,122 :: 		}
L_end_dWarnings_unsetParameter:
	RETURN
; end of _dWarnings_unsetParameter

d_warnings____?ag:

L_end_d_warnings___?ag:
	RETURN
; end of d_warnings____?ag
