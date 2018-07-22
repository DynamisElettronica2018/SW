
_dDCU_init:

;d_dcu.c,22 :: 		void dDCU_init(){
;d_dcu.c,23 :: 		d_DCU_isAcquiring = FALSE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,24 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,25 :: 		}
L_end_dDCU_init:
	RETURN
; end of _dDCU_init

_dDCU_switchAcquisition:

;d_dcu.c,27 :: 		void dDCU_switchAcquisition(void) {
;d_dcu.c,28 :: 		if (d_DCU_isAcquiring) {
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W0
	CP0.B	[W0]
	BRA NZ	L__dDCU_switchAcquisition21
	GOTO	L_dDCU_switchAcquisition0
L__dDCU_switchAcquisition21:
;d_dcu.c,29 :: 		dDCU_stopAcquisition();
	CALL	_dDCU_stopAcquisition
;d_dcu.c,30 :: 		} else {
	GOTO	L_dDCU_switchAcquisition1
L_dDCU_switchAcquisition0:
;d_dcu.c,31 :: 		dDCU_startAcquisition();
	CALL	_dDCU_startAcquisition
;d_dcu.c,32 :: 		}
L_dDCU_switchAcquisition1:
;d_dcu.c,33 :: 		}
L_end_dDCU_switchAcquisition:
	RETURN
; end of _dDCU_switchAcquisition

_dDCU_startAcquisition:

;d_dcu.c,35 :: 		void dDCU_startAcquisition(void) {
;d_dcu.c,37 :: 		d_DCU_isAliveCounter = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,39 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,40 :: 		d_DCU_previousState = COMMAND_DCU_START_ACQUISITION;
	MOV	#lo_addr(d_dcu_d_DCU_previousState), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_dcu.c,41 :: 		Can_writeInt(SW_AUX_ID, COMMAND_DCU_START_ACQUISITION);
	MOV	#1, W12
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_dcu.c,42 :: 		}
L_end_dDCU_startAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_startAcquisition

_dDCU_stopAcquisition:

;d_dcu.c,44 :: 		void dDCU_stopAcquisition(void) {
;d_dcu.c,45 :: 		d_DCU_isAcquiring = FALSE;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,46 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,47 :: 		d_DCU_previousState = COMMAND_DCU_STOP_ACQUISITION;
	MOV	#lo_addr(d_dcu_d_DCU_previousState), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;d_dcu.c,48 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_dcu.c,49 :: 		Can_addIntToWritePacket(COMMAND_DCU_STOP_ACQUISITION);
	MOV	#2, W10
	CALL	_Can_addIntToWritePacket
;d_dcu.c,50 :: 		Can_addIntToWritePacket(dAutocross_isActive());
	CALL	_dAutocross_isActive
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_dcu.c,51 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_dcu.c,52 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
;d_dcu.c,53 :: 		}
L_end_dDCU_stopAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_stopAcquisition

_dDCU_tick:

;d_dcu.c,55 :: 		void dDCU_tick(void){
;d_dcu.c,56 :: 		d_DCU_isAliveCounter += DCU_TICK_PERIOD;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	d_dcu_d_DCU_isAliveCounter, W1
	MOV	#1000, W0
	ADD	W1, W0, W1
	MOV	W1, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,57 :: 		if(d_DCU_isAliveCounter >= DCU_DEAD_TIME){
	MOV	#5000, W0
	CP	W1, W0
	BRA GEU	L__dDCU_tick25
	GOTO	L_dDCU_tick2
L__dDCU_tick25:
;d_dcu.c,58 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "DCU DEAD", ERROR);
	MOV.B	#2, W12
	MOV	#lo_addr(?lstr3_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,59 :: 		d_DCU_isAcquiring = 0;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,60 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,61 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
;d_dcu.c,62 :: 		}
L_dDCU_tick2:
;d_dcu.c,63 :: 		}
L_end_dDCU_tick:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_tick

_dDCU_isAcquiringSet:

;d_dcu.c,65 :: 		void dDCU_isAcquiringSet(){
;d_dcu.c,66 :: 		d_DCU_isAcquiring = TRUE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_dcu.c,67 :: 		}
L_end_dDCU_isAcquiringSet:
	RETURN
; end of _dDCU_isAcquiringSet

_dDCU_isAcquiring:

;d_dcu.c,69 :: 		char dDCU_isAcquiring(){
;d_dcu.c,70 :: 		return d_DCU_isAcquiring;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W0
	MOV.B	[W0], W0
;d_dcu.c,71 :: 		}
L_end_dDCU_isAcquiring:
	RETURN
; end of _dDCU_isAcquiring

_dDCU_sentAcquiringSignal:

;d_dcu.c,73 :: 		void dDCU_sentAcquiringSignal(){
;d_dcu.c,74 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	PUSH	W10
	MOV.B	#3, W10
	CALL	_dSignalLed_set
;d_dcu.c,75 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,76 :: 		}
L_end_dDCU_sentAcquiringSignal:
	POP	W10
	RETURN
; end of _dDCU_sentAcquiringSignal

_dDCU_handleMessage:

;d_dcu.c,78 :: 		void dDCU_handleMessage(unsigned int acquisitionState){
;d_dcu.c,79 :: 		if(acquisitionState == COMMAND_DCU_IS_ACQUIRING){
	PUSH	W11
	PUSH	W12
	CP	W10, #1
	BRA Z	L__dDCU_handleMessage30
	GOTO	L_dDCU_handleMessage3
L__dDCU_handleMessage30:
;d_dcu.c,80 :: 		dDCU_isAcquiringSet();
	CALL	_dDCU_isAcquiringSet
;d_dcu.c,81 :: 		dDCU_sentAcquiringSignal();
	PUSH	W10
	CALL	_dDCU_sentAcquiringSignal
	POP	W10
;d_dcu.c,82 :: 		}else if(acquisitionState == COMMAND_DCU_STOP_ACQUISITION){
	GOTO	L_dDCU_handleMessage4
L_dDCU_handleMessage3:
	CP	W10, #2
	BRA Z	L__dDCU_handleMessage31
	GOTO	L_dDCU_handleMessage5
L__dDCU_handleMessage31:
;d_dcu.c,83 :: 		d_DCU_isAcquiring = FALSE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,84 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	PUSH	W10
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
	POP	W10
;d_dcu.c,85 :: 		}else if(acquisitionState == COMMAND_DCU_CLOSE){
	GOTO	L_dDCU_handleMessage6
L_dDCU_handleMessage5:
	CP	W10, #2
	BRA Z	L__dDCU_handleMessage32
	GOTO	L_dDCU_handleMessage7
L__dDCU_handleMessage32:
;d_dcu.c,86 :: 		d_DCU_isAcquiring = FALSE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,87 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	PUSH	W10
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
	POP	W10
;d_dcu.c,88 :: 		}
L_dDCU_handleMessage7:
L_dDCU_handleMessage6:
L_dDCU_handleMessage4:
;d_dcu.c,89 :: 		if(acquisitionState != d_DCU_previousState){
	MOV	#lo_addr(d_dcu_d_DCU_previousState), W0
	ZE	[W0], W0
	CP	W10, W0
	BRA NZ	L__dDCU_handleMessage33
	GOTO	L_dDCU_handleMessage8
L__dDCU_handleMessage33:
;d_dcu.c,90 :: 		if(acquisitionState == COMMAND_DCU_IS_ACQUIRING && !dHardReset_hasResetOccurred2()){
	CP	W10, #1
	BRA Z	L__dDCU_handleMessage34
	GOTO	L__dDCU_handleMessage18
L__dDCU_handleMessage34:
	PUSH	W10
	CALL	_dHardReset_hasResetOccurred2
	POP	W10
	CP0	W0
	BRA Z	L__dDCU_handleMessage35
	GOTO	L__dDCU_handleMessage17
L__dDCU_handleMessage35:
L__dDCU_handleMessage16:
;d_dcu.c,91 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
	PUSH	W10
	CLR	W12
	MOV	#lo_addr(?lstr4_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
	POP	W10
;d_dcu.c,92 :: 		}else if (acquisitionState == COMMAND_DCU_STOP_ACQUISITION){
	GOTO	L_dDCU_handleMessage12
;d_dcu.c,90 :: 		if(acquisitionState == COMMAND_DCU_IS_ACQUIRING && !dHardReset_hasResetOccurred2()){
L__dDCU_handleMessage18:
L__dDCU_handleMessage17:
;d_dcu.c,92 :: 		}else if (acquisitionState == COMMAND_DCU_STOP_ACQUISITION){
	CP	W10, #2
	BRA Z	L__dDCU_handleMessage36
	GOTO	L_dDCU_handleMessage13
L__dDCU_handleMessage36:
;d_dcu.c,93 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
	PUSH	W10
	CLR	W12
	MOV	#lo_addr(?lstr5_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
	POP	W10
;d_dcu.c,94 :: 		}else if (acquisitionState == COMMAND_DCU_CLOSE){
	GOTO	L_dDCU_handleMessage14
L_dDCU_handleMessage13:
	CP	W10, #2
	BRA Z	L__dDCU_handleMessage37
	GOTO	L_dDCU_handleMessage15
L__dDCU_handleMessage37:
;d_dcu.c,95 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
	PUSH	W10
	CLR	W12
	MOV	#lo_addr(?lstr6_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,96 :: 		dHardReset_unsetHardResetOccurred2();
	CALL	_dHardReset_unsetHardResetOccurred2
	POP	W10
;d_dcu.c,97 :: 		}
L_dDCU_handleMessage15:
L_dDCU_handleMessage14:
L_dDCU_handleMessage12:
;d_dcu.c,98 :: 		d_DCU_previousState = acquisitionState;
	MOV	#lo_addr(d_dcu_d_DCU_previousState), W0
	MOV.B	W10, [W0]
;d_dcu.c,99 :: 		}
L_dDCU_handleMessage8:
;d_dcu.c,100 :: 		}
L_end_dDCU_handleMessage:
	POP	W12
	POP	W11
	RETURN
; end of _dDCU_handleMessage
