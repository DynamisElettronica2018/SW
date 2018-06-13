
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
	BRA NZ	L__log210
	GOTO	L_log21
L__log210:
;basic.c,13 :: 		if (byte >>= shift_positions) {
	ZE	W10, W0
	ZE	W1, W2
	LSR	W0, W2, W0
	MOV.B	W0, W10
	CP0.B	W0
	BRA NZ	L__log211
	GOTO	L_log23
L__log211:
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

_unsignedIntToString:

;basic.c,24 :: 		void unsignedIntToString(unsigned int number, char *text) {
;basic.c,25 :: 		emptyString(text);
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,26 :: 		sprintf(text, "%u", number);
	MOV	#lo_addr(?lstr_1_basic), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,27 :: 		}
L_end_unsignedIntToString:
	RETURN
; end of _unsignedIntToString

_signedIntToString:

;basic.c,29 :: 		void signedIntToString(int number, char *text) {
;basic.c,30 :: 		emptyString(text);
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,31 :: 		sprintf(text, "%d", number);
	MOV	#lo_addr(?lstr_2_basic), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,32 :: 		}
L_end_signedIntToString:
	RETURN
; end of _signedIntToString

_emptyString:

;basic.c,34 :: 		void emptyString(char *myString) {
;basic.c,35 :: 		myString[0] = '\0';
	CLR	W0
	MOV.B	W0, [W10]
;basic.c,39 :: 		}
L_end_emptyString:
	RETURN
; end of _emptyString

_getNumberDigitCount:

;basic.c,41 :: 		unsigned char getNumberDigitCount(unsigned char number) {
;basic.c,42 :: 		if (number >= 100) {
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GEU	L__getNumberDigitCount16
	GOTO	L_getNumberDigitCount5
L__getNumberDigitCount16:
;basic.c,43 :: 		return 3;
	MOV.B	#3, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,44 :: 		} else if (number >= 10) {
L_getNumberDigitCount5:
	CP.B	W10, #10
	BRA GEU	L__getNumberDigitCount17
	GOTO	L_getNumberDigitCount7
L__getNumberDigitCount17:
;basic.c,45 :: 		return 2;
	MOV.B	#2, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,46 :: 		} else {
L_getNumberDigitCount7:
;basic.c,47 :: 		return 1;
	MOV.B	#1, W0
;basic.c,49 :: 		}
L_end_getNumberDigitCount:
	RETURN
; end of _getNumberDigitCount
