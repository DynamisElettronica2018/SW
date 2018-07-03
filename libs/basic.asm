
_log2:

;basic.c,8 :: 		char log2(unsigned char byte) {
;basic.c,9 :: 		unsigned char original = byte;
; original start address is: 6 (W3)
	MOV.B	W10, W3
;basic.c,10 :: 		unsigned char shift_positions = 4;
; shift_positions start address is: 2 (W1)
	MOV.B	#4, W1
;basic.c,11 :: 		char result = 0;
; result start address is: 8 (W4)
	CLR	W4
; original end address is: 6 (W3)
; result end address is: 8 (W4)
; shift_positions end address is: 2 (W1)
;basic.c,12 :: 		for (; shift_positions; shift_positions>>=1) {
L_log20:
; result start address is: 8 (W4)
; shift_positions start address is: 2 (W1)
; original start address is: 6 (W3)
	CP0.B	W1
	BRA NZ	L__log212
	GOTO	L_log21
L__log212:
;basic.c,13 :: 		if (byte >>= shift_positions) {
	ZE	W10, W0
	ZE	W1, W2
	LSR	W0, W2, W0
	MOV.B	W0, W10
	CP0.B	W0
	BRA NZ	L__log213
	GOTO	L_log23
L__log213:
; original end address is: 6 (W3)
;basic.c,14 :: 		result += shift_positions;
; result start address is: 8 (W4)
	ADD.B	W4, W1, W4
; result end address is: 8 (W4)
;basic.c,15 :: 		original = byte;
; original start address is: 6 (W3)
	MOV.B	W10, W3
;basic.c,16 :: 		}
	GOTO	L_log24
L_log23:
;basic.c,18 :: 		byte = original;
	MOV.B	W3, W10
; original end address is: 6 (W3)
; result end address is: 8 (W4)
;basic.c,19 :: 		}
L_log24:
;basic.c,12 :: 		for (; shift_positions; shift_positions>>=1) {
; original start address is: 6 (W3)
; result start address is: 8 (W4)
	ZE	W1, W0
; shift_positions end address is: 2 (W1)
	LSR	W0, #1, W0
; shift_positions start address is: 2 (W1)
	MOV.B	W0, W1
;basic.c,20 :: 		}
; original end address is: 6 (W3)
; shift_positions end address is: 2 (W1)
	GOTO	L_log20
L_log21:
;basic.c,21 :: 		return result;
	MOV.B	W4, W0
; result end address is: 8 (W4)
;basic.c,22 :: 		}
L_end_log2:
	RETURN
; end of _log2

_round:
	LNK	#2

;basic.c,24 :: 		int round(double number){
;basic.c,25 :: 		int a = floor(number);
	PUSH.D	W10
	CALL	_floor
	CALL	__Float2Longint
	MOV	W0, [W14+0]
;basic.c,26 :: 		if( number - a < 0.5 )
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	POP.D	W10
	PUSH.D	W10
	MOV.D	W0, W2
	MOV.D	W10, W0
	CALL	__Sub_FP
	MOV	#0, W2
	MOV	#16128, W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__round15
	INC.B	W0
L__round15:
	POP.D	W10
	CP0.B	W0
	BRA NZ	L__round16
	GOTO	L_round5
L__round16:
;basic.c,27 :: 		return a;
	MOV	[W14+0], W0
	GOTO	L_end_round
L_round5:
;basic.c,28 :: 		else return ceil(number);
	CALL	_ceil
	CALL	__Float2Longint
;basic.c,29 :: 		}
L_end_round:
	ULNK
	RETURN
; end of _round

_unsignedIntToString:

;basic.c,31 :: 		void unsignedIntToString(unsigned int number, char *text) {
;basic.c,32 :: 		emptyString(text);
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,33 :: 		sprintf(text, "%u", number);
	MOV	#lo_addr(?lstr_1_basic), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,34 :: 		}
L_end_unsignedIntToString:
	RETURN
; end of _unsignedIntToString

_signedIntToString:

;basic.c,36 :: 		void signedIntToString(int number, char *text) {
;basic.c,37 :: 		emptyString(text);
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,38 :: 		sprintf(text, "%d", number);
	MOV	#lo_addr(?lstr_2_basic), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,39 :: 		}
L_end_signedIntToString:
	RETURN
; end of _signedIntToString

_emptyString:

;basic.c,41 :: 		void emptyString(char *myString) {
;basic.c,42 :: 		myString[0] = '\0';
	CLR	W0
	MOV.B	W0, [W10]
;basic.c,46 :: 		}
L_end_emptyString:
	RETURN
; end of _emptyString

_getNumberDigitCount:

;basic.c,48 :: 		unsigned char getNumberDigitCount(unsigned char number) {
;basic.c,49 :: 		if (number >= 100) {
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GEU	L__getNumberDigitCount21
	GOTO	L_getNumberDigitCount7
L__getNumberDigitCount21:
;basic.c,50 :: 		return 3;
	MOV.B	#3, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,51 :: 		} else if (number >= 10) {
L_getNumberDigitCount7:
	CP.B	W10, #10
	BRA GEU	L__getNumberDigitCount22
	GOTO	L_getNumberDigitCount9
L__getNumberDigitCount22:
;basic.c,52 :: 		return 2;
	MOV.B	#2, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,53 :: 		} else {
L_getNumberDigitCount9:
;basic.c,54 :: 		return 1;
	MOV.B	#1, W0
;basic.c,56 :: 		}
L_end_getNumberDigitCount:
	RETURN
; end of _getNumberDigitCount
