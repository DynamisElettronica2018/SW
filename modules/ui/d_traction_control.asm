
_d_traction_control_printNotification:

;d_traction_control.c,16 :: 		void d_traction_control_printNotification(void){
;d_traction_control.c,17 :: 		switch (d_tractionValue){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_d_traction_control_printNotification0
;d_traction_control.c,18 :: 		case 0:
L_d_traction_control_printNotification2:
;d_traction_control.c,19 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 0", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,20 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,21 :: 		case 1:
L_d_traction_control_printNotification3:
;d_traction_control.c,22 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,23 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,24 :: 		case 2:
L_d_traction_control_printNotification4:
;d_traction_control.c,25 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,26 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,27 :: 		case 3:
L_d_traction_control_printNotification5:
;d_traction_control.c,28 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,29 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,30 :: 		case 4:
L_d_traction_control_printNotification6:
;d_traction_control.c,31 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,32 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,33 :: 		case 5:
L_d_traction_control_printNotification7:
;d_traction_control.c,34 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr6_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,35 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,36 :: 		case 6:
L_d_traction_control_printNotification8:
;d_traction_control.c,37 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr7_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,38 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,39 :: 		case 7:
L_d_traction_control_printNotification9:
;d_traction_control.c,40 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr8_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,41 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,42 :: 		case 8:
L_d_traction_control_printNotification10:
;d_traction_control.c,43 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 8", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr9_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,44 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,45 :: 		case 9:
L_d_traction_control_printNotification11:
;d_traction_control.c,46 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 9", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr10_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,47 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,48 :: 		case 10:
L_d_traction_control_printNotification12:
;d_traction_control.c,49 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 10", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr11_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,50 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,51 :: 		default:
L_d_traction_control_printNotification13:
;d_traction_control.c,52 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,53 :: 		}
L_d_traction_control_printNotification0:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_traction_control_printNotification18
	GOTO	L_d_traction_control_printNotification2
L__d_traction_control_printNotification18:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_traction_control_printNotification19
	GOTO	L_d_traction_control_printNotification3
L__d_traction_control_printNotification19:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_traction_control_printNotification20
	GOTO	L_d_traction_control_printNotification4
L__d_traction_control_printNotification20:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_traction_control_printNotification21
	GOTO	L_d_traction_control_printNotification5
L__d_traction_control_printNotification21:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_traction_control_printNotification22
	GOTO	L_d_traction_control_printNotification6
L__d_traction_control_printNotification22:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_traction_control_printNotification23
	GOTO	L_d_traction_control_printNotification7
L__d_traction_control_printNotification23:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__d_traction_control_printNotification24
	GOTO	L_d_traction_control_printNotification8
L__d_traction_control_printNotification24:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__d_traction_control_printNotification25
	GOTO	L_d_traction_control_printNotification9
L__d_traction_control_printNotification25:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA NZ	L__d_traction_control_printNotification26
	GOTO	L_d_traction_control_printNotification10
L__d_traction_control_printNotification26:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA NZ	L__d_traction_control_printNotification27
	GOTO	L_d_traction_control_printNotification11
L__d_traction_control_printNotification27:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA NZ	L__d_traction_control_printNotification28
	GOTO	L_d_traction_control_printNotification12
L__d_traction_control_printNotification28:
	GOTO	L_d_traction_control_printNotification13
L_d_traction_control_printNotification1:
;d_traction_control.c,54 :: 		}
L_end_d_traction_control_printNotification:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_traction_control_printNotification

_d_traction_control_propagateValue:

;d_traction_control.c,56 :: 		void d_traction_control_propagateValue(signed char value){
;d_traction_control.c,57 :: 		Can_writeInt(SW_TRACTION_CONTROL_GCU_ID, (int) value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	PUSH	W10
	MOV	W0, W12
	MOV	#515, W10
	MOV	#0, W11
	CALL	_Can_writeInt
	POP	W10
;d_traction_control.c,58 :: 		sprintf(dstr, "value3 %d\r\n", value);
	MOV.B	W10, W0
	SE	W0, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_12_d_traction_control), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_traction_control.c,59 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_traction_control.c,60 :: 		d_traction_control_printNotification();
	CALL	_d_traction_control_printNotification
;d_traction_control.c,61 :: 		dSignalLed_switch(DSIGNAL_LED_BLUE);
	CLR	W10
	CALL	_dSignalLed_switch
;d_traction_control.c,62 :: 		}
L_end_d_traction_control_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_traction_control_propagateValue

_d_traction_control_move:
	LNK	#2

;d_traction_control.c,64 :: 		void d_traction_control_move(signed char movements){
;d_traction_control.c,66 :: 		value = d_tractionValue - movements;
	PUSH	W10
	MOV	#lo_addr(_d_tractionValue), W1
	ADD	W14, #0, W0
	SUBR.B	W10, [W1], [W0]
;d_traction_control.c,67 :: 		sprintf(dstr, "d_tractionvalue %d\r\n", d_tractionValue);
	MOV	#lo_addr(_d_tractionValue), W0
	SE	[W0], W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_13_d_traction_control), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_traction_control.c,68 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
	POP	W10
;d_traction_control.c,69 :: 		sprintf(dstr, "movements%d\r\n", movements);
	MOV.B	W10, W0
	SE	W0, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_14_d_traction_control), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_traction_control.c,70 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_traction_control.c,71 :: 		sprintf(dstr, "value1 %d\r\n", value);
	ADD	W14, #0, W0
	SE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_15_d_traction_control), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_traction_control.c,72 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_traction_control.c,73 :: 		if(value > TRACTION_MAX_VALUE){
	MOV.B	[W14+0], W0
	CP.B	W0, #7
	BRA GT	L__d_traction_control_move31
	GOTO	L_d_traction_control_move14
L__d_traction_control_move31:
;d_traction_control.c,74 :: 		value = TRACTION_MAX_VALUE;
	MOV.B	#7, W0
	MOV.B	W0, [W14+0]
;d_traction_control.c,75 :: 		} else if(value < TRACTION_MIN_VALUE){
	GOTO	L_d_traction_control_move15
L_d_traction_control_move14:
	MOV.B	[W14+0], W0
	CP.B	W0, #0
	BRA LT	L__d_traction_control_move32
	GOTO	L_d_traction_control_move16
L__d_traction_control_move32:
;d_traction_control.c,76 :: 		value = TRACTION_MIN_VALUE;
	CLR	W0
	MOV.B	W0, [W14+0]
;d_traction_control.c,77 :: 		}
L_d_traction_control_move16:
L_d_traction_control_move15:
;d_traction_control.c,78 :: 		d_tractionValue = value;
	MOV	#lo_addr(_d_tractionValue), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;d_traction_control.c,79 :: 		sprintf(dstr, "value2 %d\r\n", d_tractionValue);
	ADD	W14, #0, W0
	SE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_16_d_traction_control), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_traction_control.c,80 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_traction_control.c,81 :: 		d_traction_control_propagateValue(d_tractionValue);
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W10
	CALL	_d_traction_control_propagateValue
;d_traction_control.c,82 :: 		}
L_end_d_traction_control_move:
	POP	W10
	ULNK
	RETURN
; end of _d_traction_control_move

_d_traction_control_setValueFromCAN:

;d_traction_control.c,84 :: 		void d_traction_control_setValueFromCAN(unsigned int value){
;d_traction_control.c,86 :: 		dd_Indicator_setIntValueP(&ind_traction_control.base, d_tractionValue);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_d_tractionValue), W0
	SE	[W0], W11
	MOV	#lo_addr(_ind_traction_control), W10
	CALL	_dd_Indicator_setIntValueP
;d_traction_control.c,89 :: 		}
;d_traction_control.c,88 :: 		return;
;d_traction_control.c,89 :: 		}
L_end_d_traction_control_setValueFromCAN:
	POP	W11
	POP	W10
	RETURN
; end of _d_traction_control_setValueFromCAN

_d_traction_control_init:

;d_traction_control.c,91 :: 		void d_traction_control_init(void){
;d_traction_control.c,93 :: 		}
L_end_d_traction_control_init:
	RETURN
; end of _d_traction_control_init
