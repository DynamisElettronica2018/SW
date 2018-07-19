
_d_antistall_handle:

;d_antistall.c,14 :: 		void d_antistall_handle(unsigned int antistallValue){
;d_antistall.c,15 :: 		switch (antistallValue){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_d_antistall_handle0
;d_antistall.c,16 :: 		case ANTISTALL_ON:
L_d_antistall_handle2:
;d_antistall.c,17 :: 		dd_GraphicController_fixNotification("ANTISTALL");
	MOV	#lo_addr(?lstr1_d_antistall), W10
	CALL	_dd_GraphicController_fixNotification
;d_antistall.c,18 :: 		d_antistall_flag = ANTISTALL_ON;
	MOV	#lo_addr(_d_antistall_flag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_antistall.c,19 :: 		break;
	GOTO	L_d_antistall_handle1
;d_antistall.c,20 :: 		case ANTISTALL_OFF:
L_d_antistall_handle3:
;d_antistall.c,21 :: 		d_antistall_flag = ANTISTALL_OFF;
	MOV	#lo_addr(_d_antistall_flag), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_antistall.c,22 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_antistall.c,23 :: 		if (d_UI_getOperatingMode() == ACC_MODE && dAcc_isTimeToGo()){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA Z	L__d_antistall_handle19
	GOTO	L__d_antistall_handle15
L__d_antistall_handle19:
	CALL	_dAcc_isTimeToGo
	CP0.B	W0
	BRA NZ	L__d_antistall_handle20
	GOTO	L__d_antistall_handle14
L__d_antistall_handle20:
L__d_antistall_handle13:
;d_antistall.c,24 :: 		dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr2_d_antistall), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_antistall.c,25 :: 		} else if(d_UI_getOperatingMode() == AUTOCROSS_MODE && dAutocross_isTimeToGo()){
	GOTO	L_d_antistall_handle7
;d_antistall.c,23 :: 		if (d_UI_getOperatingMode() == ACC_MODE && dAcc_isTimeToGo()){
L__d_antistall_handle15:
L__d_antistall_handle14:
;d_antistall.c,25 :: 		} else if(d_UI_getOperatingMode() == AUTOCROSS_MODE && dAutocross_isTimeToGo()){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA Z	L__d_antistall_handle21
	GOTO	L__d_antistall_handle17
L__d_antistall_handle21:
	CALL	_dAutocross_isTimeToGo
	CP0.B	W0
	BRA NZ	L__d_antistall_handle22
	GOTO	L__d_antistall_handle16
L__d_antistall_handle22:
L__d_antistall_handle12:
;d_antistall.c,26 :: 		dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr3_d_antistall), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_antistall.c,25 :: 		} else if(d_UI_getOperatingMode() == AUTOCROSS_MODE && dAutocross_isTimeToGo()){
L__d_antistall_handle17:
L__d_antistall_handle16:
;d_antistall.c,27 :: 		}
L_d_antistall_handle7:
;d_antistall.c,28 :: 		break;
	GOTO	L_d_antistall_handle1
;d_antistall.c,29 :: 		default:
L_d_antistall_handle11:
;d_antistall.c,30 :: 		break;
	GOTO	L_d_antistall_handle1
;d_antistall.c,31 :: 		}
L_d_antistall_handle0:
	CP	W10, #1
	BRA NZ	L__d_antistall_handle23
	GOTO	L_d_antistall_handle2
L__d_antistall_handle23:
	CP	W10, #0
	BRA NZ	L__d_antistall_handle24
	GOTO	L_d_antistall_handle3
L__d_antistall_handle24:
	GOTO	L_d_antistall_handle11
L_d_antistall_handle1:
;d_antistall.c,32 :: 		}
L_end_d_antistall_handle:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_antistall_handle
