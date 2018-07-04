
_dDCU_init:

;d_dcu.c,18 :: 		void dDCU_init(){
;d_dcu.c,19 :: 		d_DCU_isAcquiring = FALSE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,20 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,21 :: 		}
L_end_dDCU_init:
	RETURN
; end of _dDCU_init

_dDCU_switchAcquisition:

;d_dcu.c,23 :: 		void dDCU_switchAcquisition(void) {
;d_dcu.c,24 :: 		if (d_DCU_isAcquiring) {
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W0
	CP0.B	[W0]
	BRA NZ	L__dDCU_switchAcquisition7
	GOTO	L_dDCU_switchAcquisition0
L__dDCU_switchAcquisition7:
;d_dcu.c,25 :: 		dDCU_stopAcquisition();
	CALL	_dDCU_stopAcquisition
;d_dcu.c,26 :: 		} else {
	GOTO	L_dDCU_switchAcquisition1
L_dDCU_switchAcquisition0:
;d_dcu.c,27 :: 		dDCU_startAcquisition();
	CALL	_dDCU_startAcquisition
;d_dcu.c,28 :: 		}
L_dDCU_switchAcquisition1:
;d_dcu.c,29 :: 		}
L_end_dDCU_switchAcquisition:
	RETURN
; end of _dDCU_switchAcquisition

_dDCU_startAcquisition:

;d_dcu.c,31 :: 		void dDCU_startAcquisition(void) {
;d_dcu.c,32 :: 		Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#2, W12
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_dcu.c,33 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,34 :: 		d_DCU_isAcquiring = TRUE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_dcu.c,35 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,36 :: 		delay_ms(500);
	MOV	#51, W8
	MOV	#56549, W7
L_dDCU_startAcquisition2:
	DEC	W7
	BRA NZ	L_dDCU_startAcquisition2
	DEC	W8
	BRA NZ	L_dDCU_startAcquisition2
;d_dcu.c,37 :: 		Can_writeInt(SW_AUX_ID, COMMAND_DCU_START_ACQUISITION);
	MOV	#1, W12
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_dcu.c,38 :: 		}
L_end_dDCU_startAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_startAcquisition

_dDCU_stopAcquisition:

;d_dcu.c,40 :: 		void dDCU_stopAcquisition(void) {
;d_dcu.c,41 :: 		d_DCU_isAcquiring = FALSE;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,42 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,43 :: 		Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
	MOV	#2, W12
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_dcu.c,44 :: 		}
L_end_dDCU_stopAcquisition:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_stopAcquisition

_dDCU_tick:

;d_dcu.c,46 :: 		void dDCU_tick(void){
;d_dcu.c,47 :: 		d_DCU_isAliveCounter += DCU_TICK_PERIOD;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	d_dcu_d_DCU_isAliveCounter, W1
	MOV	#1000, W0
	ADD	W1, W0, W1
	MOV	W1, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,48 :: 		if(d_DCU_isAliveCounter >= DCU_DEAD_TIME)
	MOV	#5000, W0
	CP	W1, W0
	BRA GEU	L__dDCU_tick11
	GOTO	L_dDCU_tick4
L__dDCU_tick11:
;d_dcu.c,51 :: 		dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "DCU DEAD", ERROR);
	MOV.B	#2, W12
	MOV	#lo_addr(?lstr3_d_dcu), W11
	MOV	#1500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_dcu.c,52 :: 		d_DCU_isAcquiring = 0;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_dcu.c,53 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,54 :: 		}
L_dDCU_tick4:
;d_dcu.c,55 :: 		}
L_end_dDCU_tick:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dDCU_tick

_dDCU_isAcquiringSet:

;d_dcu.c,57 :: 		void dDCU_isAcquiringSet(){
;d_dcu.c,58 :: 		d_DCU_isAcquiring = TRUE;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_dcu.c,59 :: 		}
L_end_dDCU_isAcquiringSet:
	RETURN
; end of _dDCU_isAcquiringSet

_dDCU_isAcquiring:

;d_dcu.c,61 :: 		char dDCU_isAcquiring()
;d_dcu.c,63 :: 		return d_DCU_isAcquiring;
	MOV	#lo_addr(d_dcu_d_DCU_isAcquiring), W0
	MOV.B	[W0], W0
;d_dcu.c,64 :: 		}
L_end_dDCU_isAcquiring:
	RETURN
; end of _dDCU_isAcquiring

_dDCU_sentAcquiringSignal:

;d_dcu.c,66 :: 		void dDCU_sentAcquiringSignal(){
;d_dcu.c,67 :: 		Debug_UART_Write("DCU sent acquiring signal.\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr4_d_dcu), W10
	CALL	_Debug_UART_Write
;d_dcu.c,69 :: 		d_DCU_isAliveCounter = 0;
	CLR	W0
	MOV	W0, d_dcu_d_DCU_isAliveCounter
;d_dcu.c,70 :: 		}
L_end_dDCU_sentAcquiringSignal:
	POP	W10
	RETURN
; end of _dDCU_sentAcquiringSignal
