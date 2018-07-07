
_dSignalLed_init:

;d_signalLed.c,11 :: 		void dSignalLed_init(void) {
;d_signalLed.c,12 :: 		DSIGNAL_0_Direction = OUTPUT;
	PUSH	W10
	BCLR	TRISB9_bit, BitPos(TRISB9_bit+0)
;d_signalLed.c,13 :: 		DSIGNAL_1_Direction = OUTPUT;
	BCLR	TRISB10_bit, BitPos(TRISB10_bit+0)
;d_signalLed.c,14 :: 		DSIGNAL_2_Direction = OUTPUT;
	BCLR	TRISB11_bit, BitPos(TRISB11_bit+0)
;d_signalLed.c,15 :: 		DSIGNAL_3_Direction = OUTPUT;
	BCLR	TRISB13_bit, BitPos(TRISB13_bit+0)
;d_signalLed.c,16 :: 		dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_signalLed.c,17 :: 		dSignalLed_set(DSIGNAL_LED_BLUE);
	CLR	W10
	CALL	_dSignalLed_set
;d_signalLed.c,18 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_set
;d_signalLed.c,19 :: 		dSignalLed_set(DSIGNAL_LED_RED_LEFT);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_signalLed.c,20 :: 		delay_ms(100);
	MOV	#11, W8
	MOV	#11309, W7
L_dSignalLed_init0:
	DEC	W7
	BRA NZ	L_dSignalLed_init0
	DEC	W8
	BRA NZ	L_dSignalLed_init0
;d_signalLed.c,21 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
;d_signalLed.c,22 :: 		dSignalLed_unset(DSIGNAL_LED_BLUE);
	CLR	W10
	CALL	_dSignalLed_unset
;d_signalLed.c,23 :: 		dSignalLed_unset(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
;d_signalLed.c,24 :: 		dSignalLed_unset(DSIGNAL_LED_RED_LEFT);
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_signalLed.c,25 :: 		}
L_end_dSignalLed_init:
	POP	W10
	RETURN
; end of _dSignalLed_init

_dSignalLed_switch:

;d_signalLed.c,27 :: 		void dSignalLed_switch(unsigned char led) {
;d_signalLed.c,28 :: 		switch (led) {
	GOTO	L_dSignalLed_switch2
;d_signalLed.c,29 :: 		case DSIGNAL_LED_0:
L_dSignalLed_switch4:
;d_signalLed.c,30 :: 		DSIGNAL_0_Pin = !DSIGNAL_0_Pin;
	BTG	RB9_bit, BitPos(RB9_bit+0)
;d_signalLed.c,31 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,32 :: 		case DSIGNAL_LED_1:
L_dSignalLed_switch5:
;d_signalLed.c,33 :: 		DSIGNAL_1_Pin = !DSIGNAL_1_Pin;
	BTG	RB10_bit, BitPos(RB10_bit+0)
;d_signalLed.c,34 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,35 :: 		case DSIGNAL_LED_2:
L_dSignalLed_switch6:
;d_signalLed.c,36 :: 		DSIGNAL_2_Pin = !DSIGNAL_2_Pin;
	BTG	RB11_bit, BitPos(RB11_bit+0)
;d_signalLed.c,37 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,38 :: 		case DSIGNAL_LED_3:
L_dSignalLed_switch7:
;d_signalLed.c,39 :: 		DSIGNAL_3_Pin = !DSIGNAL_3_Pin;
	BTG	RB13_bit, BitPos(RB13_bit+0)
;d_signalLed.c,40 :: 		break;
	GOTO	L_dSignalLed_switch3
;d_signalLed.c,41 :: 		}
L_dSignalLed_switch2:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_switch22
	GOTO	L_dSignalLed_switch4
L__dSignalLed_switch22:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_switch23
	GOTO	L_dSignalLed_switch5
L__dSignalLed_switch23:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_switch24
	GOTO	L_dSignalLed_switch6
L__dSignalLed_switch24:
	CP.B	W10, #3
	BRA NZ	L__dSignalLed_switch25
	GOTO	L_dSignalLed_switch7
L__dSignalLed_switch25:
L_dSignalLed_switch3:
;d_signalLed.c,42 :: 		}
L_end_dSignalLed_switch:
	RETURN
; end of _dSignalLed_switch

_dSignalLed_set:

;d_signalLed.c,44 :: 		void dSignalLed_set(unsigned char led) {
;d_signalLed.c,45 :: 		switch (led) {
	GOTO	L_dSignalLed_set8
;d_signalLed.c,46 :: 		case DSIGNAL_LED_0:
L_dSignalLed_set10:
;d_signalLed.c,47 :: 		DSIGNAL_0_Pin = DSIGNAL_LED_ON;
	BSET	RB9_bit, BitPos(RB9_bit+0)
;d_signalLed.c,48 :: 		break;
	GOTO	L_dSignalLed_set9
;d_signalLed.c,49 :: 		case DSIGNAL_LED_1:
L_dSignalLed_set11:
;d_signalLed.c,50 :: 		DSIGNAL_1_Pin = DSIGNAL_LED_ON;
	BSET	RB10_bit, BitPos(RB10_bit+0)
;d_signalLed.c,51 :: 		break;
	GOTO	L_dSignalLed_set9
;d_signalLed.c,52 :: 		case DSIGNAL_LED_2:
L_dSignalLed_set12:
;d_signalLed.c,53 :: 		DSIGNAL_2_Pin = DSIGNAL_LED_ON;
	BSET	RB11_bit, BitPos(RB11_bit+0)
;d_signalLed.c,54 :: 		break;
	GOTO	L_dSignalLed_set9
;d_signalLed.c,55 :: 		case DSIGNAL_LED_3:
L_dSignalLed_set13:
;d_signalLed.c,56 :: 		DSIGNAL_3_Pin = DSIGNAL_LED_ON;
	BSET	RB13_bit, BitPos(RB13_bit+0)
;d_signalLed.c,57 :: 		break;
	GOTO	L_dSignalLed_set9
;d_signalLed.c,58 :: 		}
L_dSignalLed_set8:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_set27
	GOTO	L_dSignalLed_set10
L__dSignalLed_set27:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_set28
	GOTO	L_dSignalLed_set11
L__dSignalLed_set28:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_set29
	GOTO	L_dSignalLed_set12
L__dSignalLed_set29:
	CP.B	W10, #3
	BRA NZ	L__dSignalLed_set30
	GOTO	L_dSignalLed_set13
L__dSignalLed_set30:
L_dSignalLed_set9:
;d_signalLed.c,59 :: 		}
L_end_dSignalLed_set:
	RETURN
; end of _dSignalLed_set

_dSignalLed_unset:

;d_signalLed.c,61 :: 		void dSignalLed_unset(unsigned char led) {
;d_signalLed.c,62 :: 		switch (led) {
	GOTO	L_dSignalLed_unset14
;d_signalLed.c,63 :: 		case DSIGNAL_LED_0:
L_dSignalLed_unset16:
;d_signalLed.c,64 :: 		DSIGNAL_0_Pin = DSIGNAL_LED_OFF;
	BCLR	RB9_bit, BitPos(RB9_bit+0)
;d_signalLed.c,65 :: 		break;
	GOTO	L_dSignalLed_unset15
;d_signalLed.c,66 :: 		case DSIGNAL_LED_1:
L_dSignalLed_unset17:
;d_signalLed.c,67 :: 		DSIGNAL_1_Pin = DSIGNAL_LED_OFF;
	BCLR	RB10_bit, BitPos(RB10_bit+0)
;d_signalLed.c,68 :: 		break;
	GOTO	L_dSignalLed_unset15
;d_signalLed.c,69 :: 		case DSIGNAL_LED_2:
L_dSignalLed_unset18:
;d_signalLed.c,70 :: 		DSIGNAL_2_Pin = DSIGNAL_LED_OFF;
	BCLR	RB11_bit, BitPos(RB11_bit+0)
;d_signalLed.c,71 :: 		break;
	GOTO	L_dSignalLed_unset15
;d_signalLed.c,72 :: 		case DSIGNAL_LED_3:
L_dSignalLed_unset19:
;d_signalLed.c,73 :: 		DSIGNAL_3_Pin = DSIGNAL_LED_OFF;
	BCLR	RB13_bit, BitPos(RB13_bit+0)
;d_signalLed.c,74 :: 		break;
	GOTO	L_dSignalLed_unset15
;d_signalLed.c,75 :: 		}
L_dSignalLed_unset14:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_unset32
	GOTO	L_dSignalLed_unset16
L__dSignalLed_unset32:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_unset33
	GOTO	L_dSignalLed_unset17
L__dSignalLed_unset33:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_unset34
	GOTO	L_dSignalLed_unset18
L__dSignalLed_unset34:
	CP.B	W10, #3
	BRA NZ	L__dSignalLed_unset35
	GOTO	L_dSignalLed_unset19
L__dSignalLed_unset35:
L_dSignalLed_unset15:
;d_signalLed.c,76 :: 		}
L_end_dSignalLed_unset:
	RETURN
; end of _dSignalLed_unset
