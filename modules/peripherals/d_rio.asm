
_dRio_switchAcquisition:

;d_rio.c,14 :: 		void dRio_switchAcquisition(void) {
;d_rio.c,15 :: 		if (dRio_isAcquiring) {
	MOV	#lo_addr(_dRio_isAcquiring), W0
	CP0.B	[W0]
	BRA NZ	L__dRio_switchAcquisition5
	GOTO	L_dRio_switchAcquisition0
L__dRio_switchAcquisition5:
;d_rio.c,16 :: 		dRio_stopAcquisition();
	CALL	_dRio_stopAcquisition
;d_rio.c,17 :: 		} else {
	GOTO	L_dRio_switchAcquisition1
L_dRio_switchAcquisition0:
;d_rio.c,18 :: 		dRio_startAcquisition();
	CALL	_dRio_startAcquisition
;d_rio.c,19 :: 		}
L_dRio_switchAcquisition1:
;d_rio.c,20 :: 		}
L_end_dRio_switchAcquisition:
	RETURN
; end of _dRio_switchAcquisition

_dRio_startAcquisition:

;d_rio.c,22 :: 		void dRio_startAcquisition(void) {
;d_rio.c,23 :: 		dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Started ACQ.", MESSAGE);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#lo_addr(?lstr1_d_rio), W11
	MOV	#1, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_rio.c,24 :: 		Can_writeInt(DCU_AUX_ID, COMMAND_RIO_START_ACQUISITION);
	MOV	#1, W12
	MOV	#2039, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,25 :: 		}
L_end_dRio_startAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_startAcquisition

_dRio_stopAcquisition:

;d_rio.c,27 :: 		void dRio_stopAcquisition(void) {
;d_rio.c,28 :: 		dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Stopped ACQ.", MESSAGE);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#lo_addr(?lstr2_d_rio), W11
	MOV	#1, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_rio.c,29 :: 		Can_writeInt(DCU_AUX_ID, COMMAND_RIO_STOP_ACQUISITION);
	MOV	#2, W12
	MOV	#2039, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,30 :: 		}
L_end_dRio_stopAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_stopAcquisition

_dRio_zeroAcquisition:

;d_rio.c,32 :: 		void dRio_zeroAcquisition(void) {
;d_rio.c,33 :: 		dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Zeroed ACQ.", MESSAGE);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#lo_addr(?lstr3_d_rio), W11
	MOV	#1, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_rio.c,34 :: 		Can_writeInt(DCU_AUX_ID, COMMAND_RIO_ZERO_ACQUISITION);
	MOV	#3, W12
	MOV	#2039, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,35 :: 		}
L_end_dRio_zeroAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_zeroAcquisition

_dRio_heartBeat:

;d_rio.c,37 :: 		void dRio_heartBeat(void) {
;d_rio.c,38 :: 		dRio_isAliveCounter = RIO_DEAD_TIME;
	PUSH	W10
	PUSH	W11
	MOV	#2000, W0
	MOV	W0, _dRio_isAliveCounter
;d_rio.c,39 :: 		dd_Indicator_setBoolValue(RIO_ACQUISITION, TRUE);
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_dd_Indicator_setBoolValue
;d_rio.c,40 :: 		dRio_isAcquiring = TRUE;
	MOV	#lo_addr(_dRio_isAcquiring), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_rio.c,41 :: 		}
L_end_dRio_heartBeat:
	POP	W11
	POP	W10
	RETURN
; end of _dRio_heartBeat

_dRio_die:

;d_rio.c,43 :: 		void dRio_die(void) {
;d_rio.c,44 :: 		dd_Indicator_setBoolValue(RIO_ACQUISITION, FALSE);
	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV.B	#8, W10
	CALL	_dd_Indicator_setBoolValue
;d_rio.c,45 :: 		dRio_isAcquiring = FALSE;
	MOV	#lo_addr(_dRio_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_rio.c,46 :: 		}
L_end_dRio_die:
	POP	W11
	POP	W10
	RETURN
; end of _dRio_die

_dRio_tick:

;d_rio.c,48 :: 		void dRio_tick(void) {
;d_rio.c,49 :: 		if (dRio_isAliveCounter > 0) {
	MOV	_dRio_isAliveCounter, W0
	CP	W0, #0
	BRA GTU	L__dRio_tick12
	GOTO	L_dRio_tick2
L__dRio_tick12:
;d_rio.c,50 :: 		dRio_isAliveCounter -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_dRio_isAliveCounter), W0
	SUBR	W1, [W0], [W0]
;d_rio.c,51 :: 		if (dRio_isAliveCounter == 0) {
	MOV	_dRio_isAliveCounter, W0
	CP	W0, #0
	BRA Z	L__dRio_tick13
	GOTO	L_dRio_tick3
L__dRio_tick13:
;d_rio.c,52 :: 		dRio_die();
	CALL	_dRio_die
;d_rio.c,53 :: 		}
L_dRio_tick3:
;d_rio.c,54 :: 		}
L_dRio_tick2:
;d_rio.c,55 :: 		}
L_end_dRio_tick:
	RETURN
; end of _dRio_tick
