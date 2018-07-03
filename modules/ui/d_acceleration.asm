
_dAcc_init:

;d_acceleration.c,24 :: 		void dAcc_init(void) {
;d_acceleration.c,25 :: 		dAcc_autoAcceleration = FALSE;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,26 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,27 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_STOP_ACCELERATION);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,28 :: 		}
L_end_dAcc_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,95 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,96 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration8
	GOTO	L_dAcc_startAutoAcceleration0
L__dAcc_startAutoAcceleration8:
;d_acceleration.c,97 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,98 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,99 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_START_ACCELERATION);
	MOV	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,100 :: 		dd_printMessage("ACCELERATE");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,101 :: 		}
L_dAcc_startAutoAcceleration0:
;d_acceleration.c,102 :: 		}//*/
L_end_dAcc_startAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,104 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,106 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,109 :: 		}
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_stopAutoAcceleration:

;d_acceleration.c,111 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,112 :: 		if(dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration11
	GOTO	L_dAcc_stopAutoAcceleration1
L__dAcc_stopAutoAcceleration11:
;d_acceleration.c,113 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,114 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,115 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_STOP_ACCELERATION);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,116 :: 		}
L_dAcc_stopAutoAcceleration1:
;d_acceleration.c,117 :: 		}
L_end_dAcc_stopAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_requestAction:

;d_acceleration.c,119 :: 		void dAcc_requestAction(){
;d_acceleration.c,120 :: 		if(!dAcc_autoAcceleration){            // send start acceleration
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction13
	GOTO	L_dAcc_requestAction2
L__dAcc_requestAction13:
;d_acceleration.c,121 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,122 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,123 :: 		}
	GOTO	L_dAcc_requestAction3
L_dAcc_requestAction2:
;d_acceleration.c,124 :: 		else if (!dAcc_releasingClutch)
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction14
	GOTO	L_dAcc_requestAction4
L__dAcc_requestAction14:
;d_acceleration.c,126 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,127 :: 		dd_GraphicController_fireTimedNotification(1000, "GRN TO GO", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_acceleration), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,128 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;d_acceleration.c,129 :: 		}
	GOTO	L_dAcc_requestAction5
L_dAcc_requestAction4:
;d_acceleration.c,132 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,133 :: 		dd_GraphicController_fireTimedNotification(2000, "ACC STOP", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_acceleration), W11
	MOV	#2000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,134 :: 		}
L_dAcc_requestAction5:
L_dAcc_requestAction3:
;d_acceleration.c,135 :: 		}
L_end_dAcc_requestAction:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_requestAction

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,137 :: 		char dAcc_isAutoAccelerationActive(void) {
;d_acceleration.c,138 :: 		return dAcc_autoAcceleration;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,139 :: 		}
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_isReleasingClutch:

;d_acceleration.c,141 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,142 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,143 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
