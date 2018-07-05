
_dAcc_init:

;d_acceleration.c,19 :: 		void dAcc_init(void) {
;d_acceleration.c,20 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,21 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,22 :: 		dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
	CLR	W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,23 :: 		}
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,30 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,31 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration26
	GOTO	L_dAcc_startAutoAcceleration0
L__dAcc_startAutoAcceleration26:
;d_acceleration.c,32 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,33 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,34 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
	MOV	#1, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,35 :: 		dd_printMessage("STEADY");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,36 :: 		}
L_dAcc_startAutoAcceleration0:
;d_acceleration.c,37 :: 		}
L_end_dAcc_startAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,39 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,40 :: 		dd_GraphicController_clearPrompt();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,41 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_CLUTCH_RELEASE);
	MOV	#2, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,42 :: 		dAcc_readyToGo = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,43 :: 		dd_printMessage("GO");
	MOV	#lo_addr(?lstr2_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,44 :: 		}
L_end_dAcc_startClutchRelease:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_feedbackGCU:

;d_acceleration.c,46 :: 		void dAcc_feedbackGCU(unsigned int value){
;d_acceleration.c,47 :: 		if(value == COMMAND_START_ACCELERATION){
	CP	W10, #1
	BRA Z	L__dAcc_feedbackGCU29
	GOTO	L_dAcc_feedbackGCU1
L__dAcc_feedbackGCU29:
;d_acceleration.c,48 :: 		dAcc_GCUConfirmed = COMMAND_START_ACCELERATION;
	MOV	#1, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,49 :: 		} else if (value == COMMAND_START_CLUTCH_RELEASE){
	GOTO	L_dAcc_feedbackGCU2
L_dAcc_feedbackGCU1:
	CP	W10, #2
	BRA Z	L__dAcc_feedbackGCU30
	GOTO	L_dAcc_feedbackGCU3
L__dAcc_feedbackGCU30:
;d_acceleration.c,50 :: 		dAcc_GCUConfirmed = COMMAND_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,51 :: 		} else if (value == COMMAND_STOP_ACCELERATION){
	GOTO	L_dAcc_feedbackGCU4
L_dAcc_feedbackGCU3:
	CP	W10, #0
	BRA Z	L__dAcc_feedbackGCU31
	GOTO	L_dAcc_feedbackGCU5
L__dAcc_feedbackGCU31:
;d_acceleration.c,52 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,53 :: 		}
L_dAcc_feedbackGCU5:
L_dAcc_feedbackGCU4:
L_dAcc_feedbackGCU2:
;d_acceleration.c,54 :: 		}
L_end_dAcc_feedbackGCU:
	RETURN
; end of _dAcc_feedbackGCU

_dAcc_getAccValue:

;d_acceleration.c,56 :: 		void dAcc_getAccValue(int accValue){    //% di acc
;d_acceleration.c,57 :: 		dd_Indicator_setintValueP(&ind_tps.base, accValue);
	PUSH	W11
	PUSH	W10
	MOV	W10, W11
	MOV	#lo_addr(_ind_tps), W10
	CALL	_dd_Indicator_setIntValueP
;d_acceleration.c,58 :: 		if(d_UI_getOperatingMode() == ACC_MODE){
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA Z	L__dAcc_getAccValue33
	GOTO	L_dAcc_getAccValue6
L__dAcc_getAccValue33:
;d_acceleration.c,59 :: 		if(accValue >= MIN_ACC_VALUE && dAcc_GCUConfirmed == COMMAND_START_ACCELERATION){
	MOV	#50, W0
	CP	W10, W0
	BRA GE	L__dAcc_getAccValue34
	GOTO	L__dAcc_getAccValue20
L__dAcc_getAccValue34:
	MOV	_dAcc_GCUConfirmed, W0
	CP	W0, #1
	BRA Z	L__dAcc_getAccValue35
	GOTO	L__dAcc_getAccValue19
L__dAcc_getAccValue35:
L__dAcc_getAccValue18:
;d_acceleration.c,60 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;d_acceleration.c,59 :: 		if(accValue >= MIN_ACC_VALUE && dAcc_GCUConfirmed == COMMAND_START_ACCELERATION){
L__dAcc_getAccValue20:
L__dAcc_getAccValue19:
;d_acceleration.c,62 :: 		}
L_dAcc_getAccValue6:
;d_acceleration.c,63 :: 		}
L_end_dAcc_getAccValue:
	POP	W11
	RETURN
; end of _dAcc_getAccValue

_dAcc_stopAutoAcceleration:

;d_acceleration.c,65 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,66 :: 		if(dAcc_releasingClutch){
	PUSH	W10
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration37
	GOTO	L_dAcc_stopAutoAcceleration10
L__dAcc_stopAutoAcceleration37:
;d_acceleration.c,67 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,68 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,69 :: 		dd_printMessage("STOP");
	MOV	#lo_addr(?lstr3_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,70 :: 		delay_ms(2000);
	MOV	#204, W8
	MOV	#29592, W7
L_dAcc_stopAutoAcceleration11:
	DEC	W7
	BRA NZ	L_dAcc_stopAutoAcceleration11
	DEC	W8
	BRA NZ	L_dAcc_stopAutoAcceleration11
;d_acceleration.c,71 :: 		d_UI_AccModeInit();
	CALL	_d_UI_AccModeInit
;d_acceleration.c,72 :: 		}
L_dAcc_stopAutoAcceleration10:
;d_acceleration.c,73 :: 		}
L_end_dAcc_stopAutoAcceleration:
	POP	W10
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_requestAction:

;d_acceleration.c,75 :: 		void dAcc_requestAction(){
;d_acceleration.c,76 :: 		if(!dAcc_autoAcceleration){
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction39
	GOTO	L_dAcc_requestAction13
L__dAcc_requestAction39:
;d_acceleration.c,77 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,78 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,79 :: 		}
	GOTO	L_dAcc_requestAction14
L_dAcc_requestAction13:
;d_acceleration.c,80 :: 		else if (dAcc_readyToGo && dAcc_GCUConfirmed == COMMAND_START_CLUTCH_RELEASE)
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_requestAction40
	GOTO	L__dAcc_requestAction23
L__dAcc_requestAction40:
	MOV	_dAcc_GCUConfirmed, W0
	CP	W0, #2
	BRA Z	L__dAcc_requestAction41
	GOTO	L__dAcc_requestAction22
L__dAcc_requestAction41:
L__dAcc_requestAction21:
;d_acceleration.c,82 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,83 :: 		dAcc_readyToGo = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,84 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,80 :: 		else if (dAcc_readyToGo && dAcc_GCUConfirmed == COMMAND_START_CLUTCH_RELEASE)
L__dAcc_requestAction23:
L__dAcc_requestAction22:
;d_acceleration.c,85 :: 		}
L_dAcc_requestAction14:
;d_acceleration.c,86 :: 		}
L_end_dAcc_requestAction:
	RETURN
; end of _dAcc_requestAction

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,88 :: 		char dAcc_isAutoAccelerationActive(void) {
;d_acceleration.c,89 :: 		return dAcc_autoAcceleration;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,90 :: 		}
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_isReleasingClutch:

;d_acceleration.c,92 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,93 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,94 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
