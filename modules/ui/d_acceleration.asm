
_dAcc_init:

;d_acceleration.c,23 :: 		void dAcc_init(void) {
;d_acceleration.c,24 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,25 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,31 :: 		}
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,98 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,100 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,101 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,104 :: 		}//*/
L_end_dAcc_startAutoAcceleration:
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,106 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,108 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,112 :: 		}
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_stopAutoAcceleration:

;d_acceleration.c,114 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,115 :: 		if(dAcc_autoAcceleration){
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration9
	GOTO	L_dAcc_stopAutoAcceleration0
L__dAcc_stopAutoAcceleration9:
;d_acceleration.c,116 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,117 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,119 :: 		}
L_dAcc_stopAutoAcceleration0:
;d_acceleration.c,120 :: 		}
L_end_dAcc_stopAutoAcceleration:
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_requestAction:

;d_acceleration.c,122 :: 		void dAcc_requestAction(){
;d_acceleration.c,123 :: 		if(!dAcc_autoAcceleration){            // send start acceleration
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction11
	GOTO	L_dAcc_requestAction1
L__dAcc_requestAction11:
;d_acceleration.c,124 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,125 :: 		Debug_UART_Write("Acc: cleared start prompt.\r\n");
	MOV	#lo_addr(?lstr1_d_acceleration), W10
	CALL	_Debug_UART_Write
;d_acceleration.c,126 :: 		dd_GraphicController_firePromptNotification("Press AUX1 to rel. clut.");
	MOV	#lo_addr(?lstr2_d_acceleration), W10
	CALL	_dd_GraphicController_firePromptNotification
;d_acceleration.c,127 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;d_acceleration.c,128 :: 		}
	GOTO	L_dAcc_requestAction2
L_dAcc_requestAction1:
;d_acceleration.c,129 :: 		else if (!dAcc_releasingClutch)
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_requestAction12
	GOTO	L_dAcc_requestAction3
L__dAcc_requestAction12:
;d_acceleration.c,131 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_acceleration.c,132 :: 		Debug_UART_Write("Acc: cleared release clutch prompt.\r\n");
	MOV	#lo_addr(?lstr3_d_acceleration), W10
	CALL	_Debug_UART_Write
;d_acceleration.c,133 :: 		dd_GraphicController_fireTimedNotification(2000, "Press AUX1 to stop acc.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_acceleration), W11
	MOV	#2000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,134 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;d_acceleration.c,135 :: 		}
	GOTO	L_dAcc_requestAction4
L_dAcc_requestAction3:
;d_acceleration.c,138 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;d_acceleration.c,139 :: 		dd_GraphicController_fireTimedNotification(2000, "Accel. stopped.", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_acceleration), W11
	MOV	#2000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_acceleration.c,140 :: 		Debug_UART_Write("Acc: stopped by request.\r\n");
	MOV	#lo_addr(?lstr6_d_acceleration), W10
	CALL	_Debug_UART_Write
;d_acceleration.c,141 :: 		}
L_dAcc_requestAction4:
L_dAcc_requestAction2:
;d_acceleration.c,142 :: 		}
L_end_dAcc_requestAction:
	POP	W12
	POP	W11
	POP	W10
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
