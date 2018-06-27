
_dPaddle_init:

;d_paddle.c,11 :: 		void dPaddle_init(void) {
;d_paddle.c,12 :: 		setupAnalogSampling();
	PUSH	W10
	CALL	_setupAnalogSampling
;d_paddle.c,13 :: 		setAnalogPIN(CLUTCH_PADDLE_PIN);
	MOV.B	#14, W10
	CALL	_setAnalogPIN
;d_paddle.c,14 :: 		turnOnAnalogModule();
	CALL	_turnOnAnalogModule
;d_paddle.c,15 :: 		}
L_end_dPaddle_init:
	POP	W10
	RETURN
; end of _dPaddle_init

_dPaddle_getValue:

;d_paddle.c,18 :: 		unsigned char dPaddle_getValue(void) {
;d_paddle.c,19 :: 		return (unsigned char) (dPaddle_value / 38);
	MOV	#38, W2
	MOV	_dPaddle_value, W0
	REPEAT	#17
	DIV.U	W0, W2
;d_paddle.c,20 :: 		}
L_end_dPaddle_getValue:
	RETURN
; end of _dPaddle_getValue

_dPaddle_readSample:
	LNK	#4

;d_paddle.c,22 :: 		void dPaddle_readSample(void) {
;d_paddle.c,24 :: 		analogValue = ADC1_Read(CLUTCH_PADDLE_PIN) /*getAnalogValue()*/;
	PUSH	W10
	MOV	#14, W10
	CALL	_ADC1_Read
; analogValue start address is: 4 (W2)
	MOV	W0, W2
;d_paddle.c,25 :: 		if (analogValue <= 0) {
	CP	W0, #0
	BRA LEU	L__dPaddle_readSample7
	GOTO	L_dPaddle_readSample0
L__dPaddle_readSample7:
; analogValue end address is: 4 (W2)
;d_paddle.c,26 :: 		dPaddle_value = 0;
	CLR	W0
	MOV	W0, _dPaddle_value
;d_paddle.c,27 :: 		} else if (analogValue > CLUTCH_MAX_ANALOG_VALUE) {
	GOTO	L_dPaddle_readSample1
L_dPaddle_readSample0:
; analogValue start address is: 4 (W2)
	MOV	#3800, W0
	CP	W2, W0
	BRA GTU	L__dPaddle_readSample8
	GOTO	L_dPaddle_readSample2
L__dPaddle_readSample8:
; analogValue end address is: 4 (W2)
;d_paddle.c,28 :: 		dPaddle_value = CLUTCH_MAX_ANALOG_VALUE;
	MOV	#3800, W0
	MOV	W0, _dPaddle_value
;d_paddle.c,29 :: 		} else {
	GOTO	L_dPaddle_readSample3
L_dPaddle_readSample2:
;d_paddle.c,30 :: 		dPaddle_value = (unsigned int) ((analogValue * 0.8) + (dPaddle_value * 0.2));   /// strano.. il valore letto della posizione
; analogValue start address is: 4 (W2)
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
; analogValue end address is: 4 (W2)
	MOV	#52429, W2
	MOV	#16204, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_dPaddle_value, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15948, W3
	CALL	__Mul_FP
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	W0, _dPaddle_value
;d_paddle.c,33 :: 		}
L_dPaddle_readSample3:
L_dPaddle_readSample1:
;d_paddle.c,34 :: 		}
L_end_dPaddle_readSample:
	POP	W10
	ULNK
	RETURN
; end of _dPaddle_readSample
