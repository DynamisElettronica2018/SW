
_d_drs_propagateChange:

;d_drs.c,18 :: 		void d_drs_propagateChange(void){
;d_drs.c,19 :: 		if(d_drs_status==DRS_OPEN){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_propagateChange7
	GOTO	L_d_drs_propagateChange0
L__d_drs_propagateChange7:
;d_drs.c,20 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_CLOSE);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,21 :: 		d_drs_status = FALSE;
	MOV	#lo_addr(_d_drs_status), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_drs.c,22 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,23 :: 		}else if(d_drs_status==DRS_CLOSE){
	GOTO	L_d_drs_propagateChange1
L_d_drs_propagateChange0:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_propagateChange8
	GOTO	L_d_drs_propagateChange2
L__d_drs_propagateChange8:
;d_drs.c,24 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_OPEN);
	MOV.B	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,25 :: 		d_drs_status = TRUE;
	MOV	#lo_addr(_d_drs_status), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_drs.c,26 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,27 :: 		}
L_d_drs_propagateChange2:
L_d_drs_propagateChange1:
;d_drs.c,28 :: 		}
L_end_d_drs_propagateChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_propagateChange

_d_drs_setValueFromCAN:

;d_drs.c,30 :: 		void d_drs_setValueFromCAN(unsigned int value){
;d_drs.c,31 :: 		if(d_UI_getOperatingMode() != ACC_MODE){
	PUSH	W10
	PUSH	W11
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA NZ	L__d_drs_setValueFromCAN10
	GOTO	L_d_drs_setValueFromCAN3
L__d_drs_setValueFromCAN10:
;d_drs.c,32 :: 		if(d_drs_status==value){
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN11
	GOTO	L_d_drs_setValueFromCAN4
L__d_drs_setValueFromCAN11:
;d_drs.c,33 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,34 :: 		}else
	GOTO	L_d_drs_setValueFromCAN5
L_d_drs_setValueFromCAN4:
;d_drs.c,35 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
L_d_drs_setValueFromCAN5:
;d_drs.c,36 :: 		}
L_d_drs_setValueFromCAN3:
;d_drs.c,37 :: 		}
L_end_d_drs_setValueFromCAN:
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_setValueFromCAN
