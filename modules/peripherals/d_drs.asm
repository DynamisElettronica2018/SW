
_d_drs_propagateChange:

;d_drs.c,17 :: 		void d_drs_propagateChange(void){
;d_drs.c,18 :: 		if(d_drs_status==DRS_OPEN){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_propagateChange6
	GOTO	L_d_drs_propagateChange0
L__d_drs_propagateChange6:
;d_drs.c,19 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_CLOSE);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,20 :: 		d_drs_status = FALSE;
	MOV	#lo_addr(_d_drs_status), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_drs.c,21 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,22 :: 		}else if(d_drs_status==DRS_CLOSE){
	GOTO	L_d_drs_propagateChange1
L_d_drs_propagateChange0:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_propagateChange7
	GOTO	L_d_drs_propagateChange2
L__d_drs_propagateChange7:
;d_drs.c,23 :: 		Can_writeByte(SW_DRS_GCU_ID, DRS_OPEN);
	MOV.B	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_drs.c,24 :: 		d_drs_status = TRUE;
	MOV	#lo_addr(_d_drs_status), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_drs.c,25 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_drs), W11
	MOV	#500, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_drs.c,26 :: 		}
L_d_drs_propagateChange2:
L_d_drs_propagateChange1:
;d_drs.c,27 :: 		}
L_end_d_drs_propagateChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_propagateChange

_d_drs_setValueFromCAN:

;d_drs.c,29 :: 		void d_drs_setValueFromCAN(unsigned int value){
;d_drs.c,30 :: 		if(d_drs_status==value){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN9
	GOTO	L_d_drs_setValueFromCAN3
L__d_drs_setValueFromCAN9:
;d_drs.c,31 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,32 :: 		}else
	GOTO	L_d_drs_setValueFromCAN4
L_d_drs_setValueFromCAN3:
;d_drs.c,33 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
L_d_drs_setValueFromCAN4:
;d_drs.c,34 :: 		}
L_end_d_drs_setValueFromCAN:
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_setValueFromCAN
