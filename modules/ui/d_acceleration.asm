
_dAcc_init:

;d_acceleration.c,26 :: 		void dAcc_init(void) {
;d_acceleration.c,27 :: 		dAcc_autoAcceleration = FALSE;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,28 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,29 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_STOP_ACCELERATION);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,30 :: 		}
L_end_dAcc_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,98 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,99 :: 		if(!dAcc_autoAcceleration){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration9
	GOTO	L_dAcc_startAutoAcceleration0
L__dAcc_startAutoAcceleration9:
;d_acceleration.c,100 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,101 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,102 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_START_ACCELERATION);
	MOV	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,103 :: 		dd_printMessage("STEADY");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,104 :: 		}
L_dAcc_startAutoAcceleration0:
;d_acceleration.c,105 :: 		}//*/
L_end_dAcc_startAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,107 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,108 :: 		dd_GraphicController_clearPrompt();
	PUSH	W10
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,109 :: 		dd_printMessage("GREEN & GO");
	MOV	#lo_addr(?lstr2_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,110 :: 		dAcc_readyToGo = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,111 :: 		}
L_end_dAcc_startClutchRelease:
	POP	W10
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_getAccValue:

;d_acceleration.c,113 :: 		void dAcc_getAccValue(int accValue){    //% di acc
;d_acceleration.c,114 :: 		dd_Indicator_setintValueP(&ind_tps.base, accValue);
	PUSH	W11
	PUSH	W10
	MOV	W10, W11
	MOV	#lo_addr(_ind_tps), W10
	CALL	_dd_Indicator_setIntValueP
;d_acceleration.c,115 :: 		if(d_UI_getOperatingMode() == ACC_MODE){
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA Z	L__dAcc_getAccValue12
	GOTO	L_dAcc_getAccValue1
L__dAcc_getAccValue12:
;d_acceleration.c,116 :: 		if(accValue >= MIN_ACC_VALUE){
	MOV	#50, W0
	CP	W10, W0
	BRA GE	L__dAcc_getAccValue13
	GOTO	L_dAcc_getAccValue2
L__dAcc_getAccValue13:
;d_acceleration.c,117 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;d_acceleration.c,118 :: 		}
L_dAcc_getAccValue2:
;d_acceleration.c,119 :: 		}
L_dAcc_getAccValue1:
;d_acceleration.c,120 :: 		}
L_end_dAcc_getAccValue:
	POP	W11
	RETURN
; end of _dAcc_getAccValue

_dAcc_stopAutoAcceleration:

;d_acceleration.c,122 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,123 :: 		if(dAcc_releasingClutch){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration15
	GOTO	L_dAcc_stopAutoAcceleration3
L__dAcc_stopAutoAcceleration15:
;d_acceleration.c,124 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,125 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,126 :: 		Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_STOP_ACCELERATION);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_acceleration.c,127 :: 		dd_printMessage("STOP");
	MOV	#lo_addr(?lstr3_d_acceleration), W10
	CALL	_dd_printMessage
;d_acceleration.c,128 :: 		}
L_dAcc_stopAutoAcceleration3:
;d_acceleration.c,129 :: 		}
L_end_dAcc_stopAutoAcceleration:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_requestAction:

;d_acceleration.c,131 :: 		void dAcc_requestAction(){
;d_acceleration.c,132 :: 		if(!dAcc_autoAcceleration){            // send start acceleration
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction17
	GOTO	L_dAcc_requestAction4
L__dAcc_requestAction17:
;d_acceleration.c,133 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,134 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,135 :: 		}
	GOTO	L_dAcc_requestAction5
L_dAcc_requestAction4:
;d_acceleration.c,136 :: 		else if (dAcc_readyToGo)
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_requestAction18
	GOTO	L_dAcc_requestAction6
L__dAcc_requestAction18:
;d_acceleration.c,138 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,139 :: 		dAcc_readyToGo = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,140 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,141 :: 		}
L_dAcc_requestAction6:
L_dAcc_requestAction5:
;d_acceleration.c,142 :: 		}
L_end_dAcc_requestAction:
	RETURN
; end of _dAcc_requestAction

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,144 :: 		char dAcc_isAutoAccelerationActive(void) {
;d_acceleration.c,145 :: 		return dAcc_autoAcceleration;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,146 :: 		}
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_isReleasingClutch:

;d_acceleration.c,148 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,149 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,150 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
