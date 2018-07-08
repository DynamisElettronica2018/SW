
_dEbb_printNotification:

;d_ebb.c,25 :: 		void dEbb_printNotification(void){
;d_ebb.c,26 :: 		switch (dEbb_value){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_dEbb_printNotification0
;d_ebb.c,27 :: 		case -7:
L_dEbb_printNotification2:
;d_ebb.c,28 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,29 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,30 :: 		case -6:
L_dEbb_printNotification3:
;d_ebb.c,31 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,32 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,33 :: 		case -5:
L_dEbb_printNotification4:
;d_ebb.c,34 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,35 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,36 :: 		case -4:
L_dEbb_printNotification5:
;d_ebb.c,37 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,38 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,39 :: 		case -3:
L_dEbb_printNotification6:
;d_ebb.c,40 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,41 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,42 :: 		case -2:
L_dEbb_printNotification7:
;d_ebb.c,43 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr6_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,44 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,45 :: 		case -1:
L_dEbb_printNotification8:
;d_ebb.c,46 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr7_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,47 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,48 :: 		case 0:
L_dEbb_printNotification9:
;d_ebb.c,49 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 0", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr8_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,50 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,51 :: 		case 1:
L_dEbb_printNotification10:
;d_ebb.c,52 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr9_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,53 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,54 :: 		case 2:
L_dEbb_printNotification11:
;d_ebb.c,55 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr10_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,56 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,57 :: 		case 3:
L_dEbb_printNotification12:
;d_ebb.c,58 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr11_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,59 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,60 :: 		case 4:
L_dEbb_printNotification13:
;d_ebb.c,61 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr12_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,62 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,63 :: 		case 5:
L_dEbb_printNotification14:
;d_ebb.c,64 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr13_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,65 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,66 :: 		case 6:
L_dEbb_printNotification15:
;d_ebb.c,67 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr14_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,68 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,69 :: 		case 7:
L_dEbb_printNotification16:
;d_ebb.c,70 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr15_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,71 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,72 :: 		default:
L_dEbb_printNotification17:
;d_ebb.c,73 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,74 :: 		}
L_dEbb_printNotification0:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#249, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification29
	GOTO	L_dEbb_printNotification2
L__dEbb_printNotification29:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#250, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification30
	GOTO	L_dEbb_printNotification3
L__dEbb_printNotification30:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#251, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification31
	GOTO	L_dEbb_printNotification4
L__dEbb_printNotification31:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification32
	GOTO	L_dEbb_printNotification5
L__dEbb_printNotification32:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification33
	GOTO	L_dEbb_printNotification6
L__dEbb_printNotification33:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#254, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification34
	GOTO	L_dEbb_printNotification7
L__dEbb_printNotification34:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification35
	GOTO	L_dEbb_printNotification8
L__dEbb_printNotification35:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dEbb_printNotification36
	GOTO	L_dEbb_printNotification9
L__dEbb_printNotification36:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dEbb_printNotification37
	GOTO	L_dEbb_printNotification10
L__dEbb_printNotification37:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dEbb_printNotification38
	GOTO	L_dEbb_printNotification11
L__dEbb_printNotification38:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__dEbb_printNotification39
	GOTO	L_dEbb_printNotification12
L__dEbb_printNotification39:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dEbb_printNotification40
	GOTO	L_dEbb_printNotification13
L__dEbb_printNotification40:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__dEbb_printNotification41
	GOTO	L_dEbb_printNotification14
L__dEbb_printNotification41:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__dEbb_printNotification42
	GOTO	L_dEbb_printNotification15
L__dEbb_printNotification42:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__dEbb_printNotification43
	GOTO	L_dEbb_printNotification16
L__dEbb_printNotification43:
	GOTO	L_dEbb_printNotification17
L_dEbb_printNotification1:
;d_ebb.c,75 :: 		}
L_end_dEbb_printNotification:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_printNotification

_dEbb_setEbbValueFromCAN:

;d_ebb.c,77 :: 		void dEbb_setEbbValueFromCAN(unsigned int value){
;d_ebb.c,78 :: 		dEbb_Value = (int)(value - EBB_DAGO_OFFSET);
	SUB	W10, #8, W1
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	W1, [W0]
;d_ebb.c,79 :: 		dEbb_printNotification();
	CALL	_dEbb_printNotification
;d_ebb.c,80 :: 		}
L_end_dEbb_setEbbValueFromCAN:
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_setPositionZero:

;d_ebb.c,82 :: 		void dEbb_setPositionZero(void){
;d_ebb.c,83 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, EBB_SET_ZERO);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#100, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,84 :: 		dEbb_Value = 0;
	MOV	#lo_addr(_dEbb_value), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_ebb.c,85 :: 		dd_GraphicController_fireTimedNotification(1000, "CALIBRATION", ERROR);
	MOV.B	#2, W12
	MOV	#lo_addr(?lstr16_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,86 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,87 :: 		}
L_end_dEbb_setPositionZero:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_setPositionZero

_dEbb_propagateEbbChange:

;d_ebb.c,89 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,90 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange18
;d_ebb.c,91 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange20:
;d_ebb.c,92 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr17_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,93 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,94 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange21:
;d_ebb.c,95 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr18_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,96 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,97 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange22:
;d_ebb.c,98 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr19_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,99 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,100 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange23:
;d_ebb.c,101 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr20_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,102 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,103 :: 		default:
L_dEbb_propagateEbbChange24:
;d_ebb.c,104 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) (dEbb_value+EBB_DAGO_OFFSET));
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	ADD	W0, #8, W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,105 :: 		sprintf(dstr, "indicator value %d\r\n", dEbb_value+EBB_DAGO_OFFSET);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	ADD	W0, #8, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_21_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,106 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_ebb.c,107 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,108 :: 		}
L_dEbb_propagateEbbChange18:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange47
	GOTO	L_dEbb_propagateEbbChange20
L__dEbb_propagateEbbChange47:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange48
	GOTO	L_dEbb_propagateEbbChange21
L__dEbb_propagateEbbChange48:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange49
	GOTO	L_dEbb_propagateEbbChange22
L__dEbb_propagateEbbChange49:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange50
	GOTO	L_dEbb_propagateEbbChange23
L__dEbb_propagateEbbChange50:
	GOTO	L_dEbb_propagateEbbChange24
L_dEbb_propagateEbbChange19:
;d_ebb.c,109 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_propagateValue:

;d_ebb.c,111 :: 		void dEbb_propagateValue(signed char value){
;d_ebb.c,112 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, (int)(value + EBB_DAGO_OFFSET));
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	ADD	W0, #8, W0
	MOV	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,113 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,114 :: 		}
L_end_dEbb_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateValue

_dEbb_move:
	LNK	#2

;d_ebb.c,116 :: 		void dEbb_move(signed char movements){
;d_ebb.c,118 :: 		value = dEbb_value - movements;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEbb_value), W1
	ADD	W14, #0, W0
	SUBR.B	W10, [W1], [W0]
;d_ebb.c,119 :: 		sprintf(dstr, "DEbb_value %d\r\n", dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_22_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,120 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
	POP	W10
;d_ebb.c,121 :: 		sprintf(dstr, "movements%d\r\n", movements);
	MOV.B	W10, W0
	SE	W0, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_23_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,122 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_ebb.c,123 :: 		sprintf(dstr, "value1 %d\r\n", value);
	ADD	W14, #0, W0
	SE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_24_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,124 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_ebb.c,125 :: 		if(value > EBB_MAX_VALUE){
	MOV.B	[W14+0], W0
	CP.B	W0, #7
	BRA GT	L__dEbb_move53
	GOTO	L_dEbb_move25
L__dEbb_move53:
;d_ebb.c,126 :: 		value = EBB_MAX_VALUE;
	MOV.B	#7, W0
	MOV.B	W0, [W14+0]
;d_ebb.c,127 :: 		} else if(value < EBB_MIN_VALUE){
	GOTO	L_dEbb_move26
L_dEbb_move25:
	MOV.B	[W14+0], W1
	MOV.B	#249, W0
	CP.B	W1, W0
	BRA LT	L__dEbb_move54
	GOTO	L_dEbb_move27
L__dEbb_move54:
;d_ebb.c,128 :: 		value = EBB_MIN_VALUE;
	MOV.B	#249, W0
	MOV.B	W0, [W14+0]
;d_ebb.c,129 :: 		}
L_dEbb_move27:
L_dEbb_move26:
;d_ebb.c,130 :: 		dEbb_Value = value;
	MOV	#lo_addr(_dEbb_value), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;d_ebb.c,131 :: 		sprintf(dstr, "value %d\r\n", value);
	ADD	W14, #0, W0
	SE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_25_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,132 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_ebb.c,133 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) (dEbb_value));
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,134 :: 		dEbb_propagateValue(value);
	MOV.B	[W14+0], W10
	CALL	_dEbb_propagateValue
;d_ebb.c,135 :: 		}
L_end_dEbb_move:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dEbb_move

_dEbb_init:

;d_ebb.c,137 :: 		void dEbb_init(void){
;d_ebb.c,139 :: 		}
L_end_dEbb_init:
	RETURN
; end of _dEbb_init

_dEbb_tick:

;d_ebb.c,203 :: 		void dEbb_tick(void) {
;d_ebb.c,230 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
