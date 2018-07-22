
_d_drs_propagateChange:

;d_drs.c,21 :: 		void d_drs_propagateChange(void){
;d_drs.c,22 :: 		if(d_drs_status == DRS_OPEN && d_drs_feedback == DRS_OPEN){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_propagateChange28
	GOTO	L__d_drs_propagateChange18
L__d_drs_propagateChange28:
	MOV	#lo_addr(_d_drs_feedback), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_propagateChange29
	GOTO	L__d_drs_propagateChange17
L__d_drs_propagateChange29:
L__d_drs_propagateChange16:
;d_drs.c,23 :: 		Can_writeInt(SW_DRS_GCU_ID, DRS_CLOSE);
	CLR	W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_drs.c,24 :: 		d_drs_status = DRS_CLOSE;
	MOV	#lo_addr(_d_drs_status), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_drs.c,25 :: 		}else if(d_drs_status == DRS_CLOSE && d_drs_feedback == DRS_CLOSE){
	GOTO	L_d_drs_propagateChange3
;d_drs.c,22 :: 		if(d_drs_status == DRS_OPEN && d_drs_feedback == DRS_OPEN){
L__d_drs_propagateChange18:
L__d_drs_propagateChange17:
;d_drs.c,25 :: 		}else if(d_drs_status == DRS_CLOSE && d_drs_feedback == DRS_CLOSE){
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_propagateChange30
	GOTO	L__d_drs_propagateChange20
L__d_drs_propagateChange30:
	MOV	#lo_addr(_d_drs_feedback), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_propagateChange31
	GOTO	L__d_drs_propagateChange19
L__d_drs_propagateChange31:
L__d_drs_propagateChange15:
;d_drs.c,26 :: 		Can_writeInt(SW_DRS_GCU_ID, DRS_OPEN);
	MOV	#1, W12
	MOV	#517, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_drs.c,27 :: 		d_drs_status = DRS_OPEN;
	MOV	#lo_addr(_d_drs_status), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_drs.c,25 :: 		}else if(d_drs_status == DRS_CLOSE && d_drs_feedback == DRS_CLOSE){
L__d_drs_propagateChange20:
L__d_drs_propagateChange19:
;d_drs.c,29 :: 		Can_writeByte(SW_DRS_GCU_ID, d_drs_lastValue);*/
L_d_drs_propagateChange3:
;d_drs.c,30 :: 		}
L_end_d_drs_propagateChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_drs_propagateChange

_d_drs_setValueFromCAN:

;d_drs.c,32 :: 		void d_drs_setValueFromCAN(unsigned int value){
;d_drs.c,33 :: 		if(d_UI_getOperatingMode() != ACC_MODE){
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA NZ	L__d_drs_setValueFromCAN33
	GOTO	L_d_drs_setValueFromCAN7
L__d_drs_setValueFromCAN33:
;d_drs.c,34 :: 		if(d_drs_status==value && d_drs_status==DRS_OPEN){
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN34
	GOTO	L__d_drs_setValueFromCAN24
L__d_drs_setValueFromCAN34:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__d_drs_setValueFromCAN35
	GOTO	L__d_drs_setValueFromCAN23
L__d_drs_setValueFromCAN35:
L__d_drs_setValueFromCAN22:
;d_drs.c,35 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	PUSH	W10
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,36 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_drs), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
	POP	W10
;d_drs.c,37 :: 		}else if(d_drs_status==value && d_drs_status==DRS_CLOSE){
	GOTO	L_d_drs_setValueFromCAN11
;d_drs.c,34 :: 		if(d_drs_status==value && d_drs_status==DRS_OPEN){
L__d_drs_setValueFromCAN24:
L__d_drs_setValueFromCAN23:
;d_drs.c,37 :: 		}else if(d_drs_status==value && d_drs_status==DRS_CLOSE){
	MOV	#lo_addr(_d_drs_status), W0
	ZE	[W0], W0
	CP	W0, W10
	BRA Z	L__d_drs_setValueFromCAN36
	GOTO	L__d_drs_setValueFromCAN26
L__d_drs_setValueFromCAN36:
	MOV	#lo_addr(_d_drs_status), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__d_drs_setValueFromCAN37
	GOTO	L__d_drs_setValueFromCAN25
L__d_drs_setValueFromCAN37:
L__d_drs_setValueFromCAN21:
;d_drs.c,38 :: 		dd_Indicator_setIntValueP(&ind_drs.base, value);
	PUSH	W10
	MOV	W10, W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;d_drs.c,39 :: 		dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_drs), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
	POP	W10
;d_drs.c,37 :: 		}else if(d_drs_status==value && d_drs_status==DRS_CLOSE){
L__d_drs_setValueFromCAN26:
L__d_drs_setValueFromCAN25:
;d_drs.c,40 :: 		}
L_d_drs_setValueFromCAN11:
;d_drs.c,41 :: 		d_drs_feedback = value;
	MOV	#lo_addr(_d_drs_feedback), W0
	MOV.B	W10, [W0]
;d_drs.c,42 :: 		}
L_d_drs_setValueFromCAN7:
;d_drs.c,43 :: 		}
L_end_d_drs_setValueFromCAN:
	POP	W12
	POP	W11
	RETURN
; end of _d_drs_setValueFromCAN

_d_drs_isOpen:

;d_drs.c,45 :: 		char d_drs_isOpen(void){
;d_drs.c,46 :: 		return d_drs_feedback;
	MOV	#lo_addr(_d_drs_feedback), W0
	MOV.B	[W0], W0
;d_drs.c,47 :: 		}
L_end_d_drs_isOpen:
	RETURN
; end of _d_drs_isOpen
