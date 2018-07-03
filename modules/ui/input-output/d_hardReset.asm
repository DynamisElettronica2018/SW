
_dHardReset_init:

;d_hardReset.c,16 :: 		void dHardReset_init(void) {
;d_hardReset.c,20 :: 		dHardReset_counter = dHardReset_getCounter();
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	MOV	W0, _dHardReset_counter
;d_hardReset.c,21 :: 		dd_Indicator_setIntValue(EFI_CRASH_COUNTER, dHardReset_counter);
	MOV	W0, W11
	MOV.B	#14, W10
	CALL	_dd_Indicator_setIntValue
;d_hardReset.c,22 :: 		}
L_end_dHardReset_init:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_init

_dHardReset_reset:

;d_hardReset.c,24 :: 		void dHardReset_reset(void) {
;d_hardReset.c,26 :: 		dHardReset_setFlag();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dHardReset_setFlag
;d_hardReset.c,27 :: 		dd_GraphicController_fireTimedNotification(HARD_RESET_NOTIFICATION_TIME, "RESET", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr1_d_hardReset), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_hardReset.c,28 :: 		dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_hardReset.c,29 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_set
;d_hardReset.c,30 :: 		dSignalLed_set(DSIGNAL_LED_BLUE);
	CLR	W10
	CALL	_dSignalLed_set
;d_hardReset.c,32 :: 		reset
	RESET
;d_hardReset.c,34 :: 		}
L_end_dHardReset_reset:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_reset

_dHardReset_hasBeenReset:

;d_hardReset.c,36 :: 		char dHardReset_hasBeenReset(void) {
;d_hardReset.c,37 :: 		return HARDRESET_FLAG;
	CLR.B	W0
	BTSC	RCONbits, #6
	INC.B	W0
;d_hardReset.c,38 :: 		}
L_end_dHardReset_hasBeenReset:
	RETURN
; end of _dHardReset_hasBeenReset

_dHardReset_setFlag:

;d_hardReset.c,40 :: 		void dHardReset_setFlag(void) {
;d_hardReset.c,41 :: 		EEPROM_writeInt(HARDRESET_COUNTER_ADDRESS, dHardReset_getCounter() + 1);
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	INC	W0
	MOV	W0, W11
	MOV	#64932, W10
	CALL	_EEPROM_writeInt
;d_hardReset.c,42 :: 		}
L_end_dHardReset_setFlag:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_setFlag

_dHardReset_unsetFlag:

;d_hardReset.c,44 :: 		void dHardReset_unsetFlag(void) {
;d_hardReset.c,45 :: 		HARDRESET_FLAG = FALSE;
	BCLR	RCONbits, #6
;d_hardReset.c,46 :: 		}
L_end_dHardReset_unsetFlag:
	RETURN
; end of _dHardReset_unsetFlag

_dHardReset_getCounter:

;d_hardReset.c,48 :: 		unsigned int dHardReset_getCounter(void) {
;d_hardReset.c,49 :: 		return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
	PUSH	W10
	MOV	#64932, W10
	CALL	_EEPROM_readInt
;d_hardReset.c,50 :: 		}
;d_hardReset.c,49 :: 		return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
;d_hardReset.c,50 :: 		}
L_end_dHardReset_getCounter:
	POP	W10
	RETURN
; end of _dHardReset_getCounter
