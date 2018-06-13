
_dRpm_init:

;d_rpm.c,13 :: 		void dRpm_init() {
;d_rpm.c,14 :: 		I2CExpander_init(I2C_ADDRESS_RPM_STRIPE, OUTPUT);
	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV.B	#64, W10
	CALL	_I2CExpander_init
;d_rpm.c,15 :: 		Debug_UART_Write("a\r\n");
	MOV	#lo_addr(?lstr1_d_rpm), W10
	CALL	_Debug_UART_Write
;d_rpm.c,16 :: 		dRpm = 0;
	CLR	W0
	MOV	W0, _dRpm
;d_rpm.c,17 :: 		dRpm_enableLedStripeOutput();
	CALL	_dRpm_enableLedStripeOutput
;d_rpm.c,18 :: 		Debug_UART_Write("b\r\n");
	MOV	#lo_addr(?lstr2_d_rpm), W10
	CALL	_Debug_UART_Write
;d_rpm.c,19 :: 		}
L_end_dRpm_init:
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_init

_dRpm_getDisplayValue:

;d_rpm.c,21 :: 		float dRpm_getDisplayValue(void) {
;d_rpm.c,22 :: 		return (dRpm / 10) / 100.0;
	MOV	_dRpm, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_rpm.c,23 :: 		}
L_end_dRpm_getDisplayValue:
	RETURN
; end of _dRpm_getDisplayValue

_dRpm_set:

;d_rpm.c,25 :: 		void dRpm_set(unsigned int rpm) {
;d_rpm.c,26 :: 		if (rpm < RPM_STRIPE_OFFSET){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#5000, W0
	CP	W10, W0
	BRA LTU	L__dRpm_set9
	GOTO	L_dRpm_set0
L__dRpm_set9:
;d_rpm.c,27 :: 		dRpm = RPM_STRIPE_OFFSET;
	MOV	#5000, W0
	MOV	W0, _dRpm
;d_rpm.c,28 :: 		} else if ( rpm > RPM_STRIPE_MAX){
	GOTO	L_dRpm_set1
L_dRpm_set0:
	MOV	#9500, W0
	CP	W10, W0
	BRA GTU	L__dRpm_set10
	GOTO	L_dRpm_set2
L__dRpm_set10:
;d_rpm.c,29 :: 		dRpm = RPM_STRIPE_MAX;
	MOV	#9500, W0
	MOV	W0, _dRpm
;d_rpm.c,30 :: 		} else {
	GOTO	L_dRpm_set3
L_dRpm_set2:
;d_rpm.c,31 :: 		dRpm = rpm;
	MOV	W10, _dRpm
;d_rpm.c,32 :: 		}
L_dRpm_set3:
L_dRpm_set1:
;d_rpm.c,33 :: 		dd_Indicator_setFloatValueP(&ind_rpm.base, dRpm_getDisplayValue());
	CALL	_dRpm_getDisplayValue
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_rpm), W10
	CALL	_dd_Indicator_setFloatValueP
;d_rpm.c,34 :: 		}
L_end_dRpm_set:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_set

_dRpm_canUpdateLedStripe:

;d_rpm.c,36 :: 		char dRpm_canUpdateLedStripe(void) {
;d_rpm.c,37 :: 		return dRpm_ledStripeOutputEnable;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W0
	MOV.B	[W0], W0
;d_rpm.c,38 :: 		}
L_end_dRpm_canUpdateLedStripe:
	RETURN
; end of _dRpm_canUpdateLedStripe

_dRpm_disableLedStripeOutput:

;d_rpm.c,40 :: 		void dRpm_disableLedStripeOutput(void) {
;d_rpm.c,41 :: 		dRpm_ledStripeOutputEnable = FALSE;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_rpm.c,42 :: 		}
L_end_dRpm_disableLedStripeOutput:
	RETURN
; end of _dRpm_disableLedStripeOutput

_dRpm_enableLedStripeOutput:

;d_rpm.c,44 :: 		void dRpm_enableLedStripeOutput(void) {
;d_rpm.c,45 :: 		dRpm_ledStripeOutputEnable = TRUE;
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_rpm.c,46 :: 		}
L_end_dRpm_enableLedStripeOutput:
	RETURN
; end of _dRpm_enableLedStripeOutput

_dRpm_updateLedStripe:

;d_rpm.c,48 :: 		void dRpm_updateLedStripe(void) {
;d_rpm.c,49 :: 		unsigned char dLedStripePort = 0;
	PUSH	W10
	PUSH	W11
; dLedStripePort start address is: 4 (W2)
	CLR	W2
;d_rpm.c,50 :: 		if (dRpm > RPM_STRIPE_OFFSET) {
	MOV	_dRpm, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__dRpm_updateLedStripe15
	GOTO	L__dRpm_updateLedStripe5
L__dRpm_updateLedStripe15:
; dLedStripePort end address is: 4 (W2)
;d_rpm.c,51 :: 		dLedStripePort = 0b11111111 >> (RPM_STRIPE_LED_COUNT - (unsigned int)ceil(((dRpm - RPM_STRIPE_OFFSET) / RPM_STRIPE_STEP)));
	MOV	_dRpm, W1
	MOV	#5000, W0
	SUB	W1, W0, W1
	MOV	#562, W2
	REPEAT	#17
	DIV.U	W1, W2
	CLR	W1
	CALL	__Long2Float
	MOV.D	W0, W10
	CALL	_ceil
	CALL	__Float2Longint
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
; dLedStripePort start address is: 2 (W1)
	MOV.B	W0, W1
; dLedStripePort end address is: 2 (W1)
	MOV.B	W1, W0
;d_rpm.c,52 :: 		}
	GOTO	L_dRpm_updateLedStripe4
L__dRpm_updateLedStripe5:
;d_rpm.c,50 :: 		if (dRpm > RPM_STRIPE_OFFSET) {
	MOV.B	W2, W0
;d_rpm.c,52 :: 		}
L_dRpm_updateLedStripe4:
;d_rpm.c,53 :: 		I2CExpander_setPort(I2C_ADDRESS_RPM_STRIPE, dLedStripePort);
; dLedStripePort start address is: 0 (W0)
	MOV.B	W0, W11
; dLedStripePort end address is: 0 (W0)
	MOV.B	#64, W10
	CALL	_I2CExpander_setPort
;d_rpm.c,54 :: 		}
L_end_dRpm_updateLedStripe:
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_updateLedStripe
