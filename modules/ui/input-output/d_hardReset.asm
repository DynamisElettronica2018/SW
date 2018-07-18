
_dHardReset_init:

;d_hardReset.c,19 :: 		void dHardReset_init(void) {
;d_hardReset.c,23 :: 		dHardReset_counter = dHardReset_getCounter();
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	MOV	W0, _dHardReset_counter
;d_hardReset.c,24 :: 		dd_Indicator_setIntValue(EFI_CRASH_COUNTER, dHardReset_counter);
	MOV	W0, W11
	MOV.B	#16, W10
	CALL	_dd_Indicator_setIntValue
;d_hardReset.c,25 :: 		}
L_end_dHardReset_init:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_init

_dHardReset_reset:

;d_hardReset.c,27 :: 		void dHardReset_reset(void) {
;d_hardReset.c,29 :: 		dHardReset_setFlag();
	PUSH	W10
	CALL	_dHardReset_setFlag
;d_hardReset.c,30 :: 		dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_hardReset.c,31 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_set
;d_hardReset.c,32 :: 		dSignalLed_set(DSIGNAL_LED_BLUE);
	CLR	W10
	CALL	_dSignalLed_set
;d_hardReset.c,34 :: 		reset
	RESET
;d_hardReset.c,36 :: 		}
L_end_dHardReset_reset:
	POP	W10
	RETURN
; end of _dHardReset_reset

_dHardReset_handleReset:

;d_hardReset.c,38 :: 		void dHardReset_handleReset(void){
;d_hardReset.c,39 :: 		dd_GraphicController_fireTimedNotification(HARD_RESET_NOTIFICATION_TIME, "RESET", WARNING);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr1_d_hardReset), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_hardReset.c,40 :: 		if (d_UI_getOperatingMode() == ACC_MODE){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA Z	L__dHardReset_handleReset6
	GOTO	L_dHardReset_handleReset0
L__dHardReset_handleReset6:
;d_hardReset.c,41 :: 		dAcc_restartAcc();
	CALL	_dAcc_restartAcc
;d_hardReset.c,42 :: 		}else if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
	GOTO	L_dHardReset_handleReset1
L_dHardReset_handleReset0:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA Z	L__dHardReset_handleReset7
	GOTO	L_dHardReset_handleReset2
L__dHardReset_handleReset7:
;d_hardReset.c,43 :: 		dAcc_restartAutocross();
	CALL	_dAcc_restartAutocross
;d_hardReset.c,44 :: 		}
L_dHardReset_handleReset2:
L_dHardReset_handleReset1:
;d_hardReset.c,45 :: 		d_hardResetOccurred = TRUE;
	MOV	#1, W0
	MOV	W0, _d_hardResetOccurred
;d_hardReset.c,46 :: 		}
L_end_dHardReset_handleReset:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_handleReset

_dHardReset_hasResetOccurred:

;d_hardReset.c,48 :: 		unsigned int dHardReset_hasResetOccurred(void){
;d_hardReset.c,49 :: 		return d_hardResetOccurred;
	MOV	_d_hardResetOccurred, W0
;d_hardReset.c,50 :: 		}
L_end_dHardReset_hasResetOccurred:
	RETURN
; end of _dHardReset_hasResetOccurred

_dHardReset_unsetHardResetOccurred:

;d_hardReset.c,52 :: 		void dHardReset_unsetHardResetOccurred(void){
;d_hardReset.c,53 :: 		d_hardResetOccurred = FALSE;
	CLR	W0
	MOV	W0, _d_hardResetOccurred
;d_hardReset.c,54 :: 		}
L_end_dHardReset_unsetHardResetOccurred:
	RETURN
; end of _dHardReset_unsetHardResetOccurred

_dHardReset_hasBeenReset:

;d_hardReset.c,56 :: 		char dHardReset_hasBeenReset(void) {
;d_hardReset.c,57 :: 		return HARDRESET_FLAG;
	CLR.B	W0
	BTSC	RCONbits, #6
	INC.B	W0
;d_hardReset.c,58 :: 		}
L_end_dHardReset_hasBeenReset:
	RETURN
; end of _dHardReset_hasBeenReset

_dHardReset_setFlag:

;d_hardReset.c,60 :: 		void dHardReset_setFlag(void) {
;d_hardReset.c,61 :: 		EEPROM_writeInt(HARDRESET_COUNTER_ADDRESS, dHardReset_getCounter() + 1);
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	INC	W0
	MOV	W0, W11
	MOV	#64932, W10
	CALL	_EEPROM_writeInt
;d_hardReset.c,62 :: 		}
L_end_dHardReset_setFlag:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_setFlag

_dHardReset_unsetFlag:

;d_hardReset.c,64 :: 		void dHardReset_unsetFlag(void) {
;d_hardReset.c,65 :: 		HARDRESET_FLAG = FALSE;
	BCLR	RCONbits, #6
;d_hardReset.c,66 :: 		}
L_end_dHardReset_unsetFlag:
	RETURN
; end of _dHardReset_unsetFlag

_dHardReset_getCounter:

;d_hardReset.c,68 :: 		unsigned int dHardReset_getCounter(void) {
;d_hardReset.c,69 :: 		return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
	PUSH	W10
	MOV	#64932, W10
	CALL	_EEPROM_readInt
;d_hardReset.c,70 :: 		}
;d_hardReset.c,69 :: 		return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
;d_hardReset.c,70 :: 		}
L_end_dHardReset_getCounter:
	POP	W10
	RETURN
; end of _dHardReset_getCounter
