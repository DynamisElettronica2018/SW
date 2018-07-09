
_dAcc_init:

;d_acceleration.c,31 :: 		void dAcc_init(void) {
;d_acceleration.c,32 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,33 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,34 :: 		dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
	CLR	W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,35 :: 		}
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,37 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,38 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration12
	GOTO	L_dAcc_startAutoAcceleration0
L__dAcc_startAutoAcceleration12:
;d_acceleration.c,39 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,40 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,41 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
	MOV	#1, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,42 :: 		}
L_dAcc_startAutoAcceleration0:
;d_acceleration.c,43 :: 		}
L_end_dAcc_startAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,45 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,46 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,47 :: 		dAcc_readyToGo = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,48 :: 		}
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_feedbackGCU:

;d_acceleration.c,50 :: 		void dAcc_feedbackGCU(unsigned int value){
;d_acceleration.c,51 :: 		Buzzer_bip();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_Buzzer_bip
;d_acceleration.c,52 :: 		if(d_UI_getOperatingMode() == ACC_MODE){
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA Z	L__dAcc_feedbackGCU15
	GOTO	L_dAcc_feedbackGCU1
L__dAcc_feedbackGCU15:
;d_acceleration.c,53 :: 		if(value == COMMAND_START_ACCELERATION){
	CP	W10, #1
	BRA Z	L__dAcc_feedbackGCU16
	GOTO	L_dAcc_feedbackGCU2
L__dAcc_feedbackGCU16:
;d_acceleration.c,54 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,55 :: 		dAcc_GCUConfirmed = COMMAND_START_ACCELERATION;
	MOV	#1, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,56 :: 		dd_printMessage("STEADY");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,57 :: 		} else if (value == COMMAND_START_CLUTCH_RELEASE){
	GOTO	L_dAcc_feedbackGCU3
L_dAcc_feedbackGCU2:
	CP	W10, #2
	BRA Z	L__dAcc_feedbackGCU17
	GOTO	L_dAcc_feedbackGCU4
L__dAcc_feedbackGCU17:
;d_acceleration.c,58 :: 		dAcc_GCUConfirmed = COMMAND_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAcc_GCUConfirmed
;d_acceleration.c,59 :: 		dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr2_d_acceleration), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,60 :: 		} else if (value == COMMAND_STOP_ACCELERATION){
	GOTO	L_dAcc_feedbackGCU5
L_dAcc_feedbackGCU4:
	CP	W10, #0
	BRA Z	L__dAcc_feedbackGCU18
	GOTO	L_dAcc_feedbackGCU6
L__dAcc_feedbackGCU18:
;d_acceleration.c,61 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,62 :: 		}
L_dAcc_feedbackGCU6:
L_dAcc_feedbackGCU5:
L_dAcc_feedbackGCU3:
;d_acceleration.c,63 :: 		}
L_dAcc_feedbackGCU1:
;d_acceleration.c,64 :: 		}
L_end_dAcc_feedbackGCU:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_feedbackGCU

_dAcc_stopAutoAcceleration:

;d_acceleration.c,66 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,67 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,68 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,69 :: 		d_UI_AccModeInit();
	CALL	_d_UI_AccModeInit
;d_acceleration.c,70 :: 		}
L_end_dAcc_stopAutoAcceleration:
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_stopAutoAccelerationFromSW:

;d_acceleration.c,72 :: 		void dAcc_stopAutoAccelerationFromSW(void){
;d_acceleration.c,73 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,74 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,75 :: 		}
L_end_dAcc_stopAutoAccelerationFromSW:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_stopAutoAccelerationFromSW

_dAcc_requestAction:

;d_acceleration.c,77 :: 		void dAcc_requestAction(){
;d_acceleration.c,78 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction22
	GOTO	L_dAcc_requestAction7
L__dAcc_requestAction22:
;d_acceleration.c,79 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,80 :: 		}
	GOTO	L_dAcc_requestAction8
L_dAcc_requestAction7:
;d_acceleration.c,81 :: 		else if (dAcc_readyToGo){
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_requestAction23
	GOTO	L_dAcc_requestAction9
L__dAcc_requestAction23:
;d_acceleration.c,82 :: 		Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_CLUTCH_RELEASE);
	MOV	#2, W12
	MOV	#514, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,83 :: 		dAcc_readyToGo = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,84 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,85 :: 		}
L_dAcc_requestAction9:
L_dAcc_requestAction8:
;d_acceleration.c,86 :: 		}
L_end_dAcc_requestAction:
	POP	W12
	POP	W11
	POP	W10
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

_dAcc_hasGCUConfirmed:

;d_acceleration.c,92 :: 		unsigned int dAcc_hasGCUConfirmed (void){
;d_acceleration.c,93 :: 		return dAcc_GCUConfirmed;
	MOV	_dAcc_GCUConfirmed, W0
;d_acceleration.c,94 :: 		}
L_end_dAcc_hasGCUConfirmed:
	RETURN
; end of _dAcc_hasGCUConfirmed

_dAcc_isReleasingClutch:

;d_acceleration.c,96 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,97 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,98 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
