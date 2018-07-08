
_d_drs_propagateChange:

;d_drs.c,17 :: 		void d_drs_propagateChange(void){
;d_drs.c,18 :: 		if(d_drs_status == DRS_OPEN){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_propagateChange18
	GOTO	L_d_drs_propagateChange0
L__d_drs_propagateChange18:
;d_drs.c,19 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_CLOSE);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,20 :: 		d_drs_status = FALSE;
	MOV	#lo_addr(_d_drs_status), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_drs.c,21 :: 		}else if(d_drs_status == DRS_CLOSE){
	GOTO	L_d_drs_propagateChange1
L_d_drs_propagateChange0:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_propagateChange19
	GOTO	L_d_drs_propagateChange2
L__d_drs_propagateChange19:
;d_drs.c,22 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_OPEN);
	MOV.B	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,23 :: 		d_drs_status = TRUE;
	MOV	#lo_addr(_d_drs_status), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_drs.c,24 :: 		}
L_d_drs_propagateChange2:
L_d_drs_propagateChange1:
;d_drs.c,25 :: 		}
L_end_d_drs_propagateChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_propagateChange

_d_drs_setValueFromCAN:

;d_drs.c,27 :: 		void d_drs_setValueFromCAN(unsigned int value){
;d_drs.c,28 :: 		if(d_drs_status == value && d_drs_status == DRS_OPEN){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN21
	GOTO	L__d_drs_setValueFromCAN14
L__d_drs_setValueFromCAN21:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_setValueFromCAN22
	GOTO	L__d_drs_setValueFromCAN13
L__d_drs_setValueFromCAN22:
L__d_drs_setValueFromCAN12:
;d_drs.c,29 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,30 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,31 :: 		}else if(d_drs_status == value && d_drs_status == DRS_CLOSE){
	GOTO	L_d_drs_setValueFromCAN6
;d_drs.c,28 :: 		if(d_drs_status == value && d_drs_status == DRS_OPEN){
L__d_drs_setValueFromCAN14:
L__d_drs_setValueFromCAN13:
;d_drs.c,31 :: 		}else if(d_drs_status == value && d_drs_status == DRS_CLOSE){
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN23
	GOTO	L__d_drs_setValueFromCAN16
L__d_drs_setValueFromCAN23:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_setValueFromCAN24
	GOTO	L__d_drs_setValueFromCAN15
L__d_drs_setValueFromCAN24:
L__d_drs_setValueFromCAN11:
;d_drs.c,32 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,33 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,34 :: 		}else
	GOTO	L_d_drs_setValueFromCAN10
;d_drs.c,31 :: 		}else if(d_drs_status == value && d_drs_status == DRS_CLOSE){
L__d_drs_setValueFromCAN16:
L__d_drs_setValueFromCAN15:
;d_drs.c,35 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
L_d_drs_setValueFromCAN10:
L_d_drs_setValueFromCAN6:
;d_drs.c,36 :: 		}
L_end_d_drs_setValueFromCAN:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_setValueFromCAN
