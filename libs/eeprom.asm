
_EEPROM_writeInt:

;eeprom.c,7 :: 		void EEPROM_writeInt(unsigned int address, unsigned int value) {
;eeprom.c,11 :: 		EEPROM_write(address, value);
	PUSH	W12
	MOV	W11, W12
	CLR	W11
	CALL	_EEPROM_Write
;eeprom.c,12 :: 		while(WR_bit);
L_EEPROM_writeInt0:
	BTSS	WR_bit, BitPos(WR_bit+0)
	GOTO	L_EEPROM_writeInt1
	GOTO	L_EEPROM_writeInt0
L_EEPROM_writeInt1:
;eeprom.c,15 :: 		}
L_end_EEPROM_writeInt:
	POP	W12
	RETURN
; end of _EEPROM_writeInt

_EEPROM_readInt:

;eeprom.c,17 :: 		unsigned int EEPROM_readInt(unsigned int address) {
;eeprom.c,18 :: 		return EEPROM_read(address);
	CLR	W11
	CALL	_EEPROM_Read
;eeprom.c,19 :: 		}
L_end_EEPROM_readInt:
	RETURN
; end of _EEPROM_readInt

_EEPROM_writeArray:

;eeprom.c,21 :: 		void EEPROM_writeArray(unsigned int address, unsigned int *values) {
;eeprom.c,23 :: 		for (i = 0; i < sizeof(values); i += 1) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_EEPROM_writeArray2:
; i start address is: 2 (W1)
	CP	W1, #2
	BRA LTU	L__EEPROM_writeArray11
	GOTO	L_EEPROM_writeArray3
L__EEPROM_writeArray11:
;eeprom.c,24 :: 		EEPROM_writeInt(address, values[i]);
	SL	W1, #1, W0
	ADD	W11, W0, W0
	PUSH	W11
	MOV	[W0], W11
	CALL	_EEPROM_writeInt
	POP	W11
;eeprom.c,23 :: 		for (i = 0; i < sizeof(values); i += 1) {
	INC	W1
;eeprom.c,25 :: 		}
; i end address is: 2 (W1)
	GOTO	L_EEPROM_writeArray2
L_EEPROM_writeArray3:
;eeprom.c,26 :: 		}
L_end_EEPROM_writeArray:
	RETURN
; end of _EEPROM_writeArray

_EEPROM_readArray:
	LNK	#2

;eeprom.c,28 :: 		void EEPROM_readArray(unsigned int address, unsigned int *values) {
;eeprom.c,30 :: 		for (i = 0; i < sizeof(values); i += 1) {
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_EEPROM_readArray5:
; i start address is: 4 (W2)
	CP	W2, #2
	BRA LTU	L__EEPROM_readArray13
	GOTO	L_EEPROM_readArray6
L__EEPROM_readArray13:
;eeprom.c,31 :: 		values[i] = EEPROM_read(address + i);
	SL	W2, #1, W0
	ADD	W11, W0, W0
	MOV	W0, [W14+0]
	ADD	W10, W2, W0
	PUSH.D	W10
	MOV	W0, W10
	CLR	W11
	CALL	_EEPROM_Read
	POP.D	W10
	MOV	[W14+0], W1
	MOV	W0, [W1]
;eeprom.c,30 :: 		for (i = 0; i < sizeof(values); i += 1) {
	INC	W2
;eeprom.c,32 :: 		}
; i end address is: 4 (W2)
	GOTO	L_EEPROM_readArray5
L_EEPROM_readArray6:
;eeprom.c,33 :: 		}
L_end_EEPROM_readArray:
	ULNK
	RETURN
; end of _EEPROM_readArray
