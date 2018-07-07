
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
	BRA NZ	L__dEbb_printNotification48
	GOTO	L_dEbb_printNotification2
L__dEbb_printNotification48:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#250, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification49
	GOTO	L_dEbb_printNotification3
L__dEbb_printNotification49:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#251, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification50
	GOTO	L_dEbb_printNotification4
L__dEbb_printNotification50:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification51
	GOTO	L_dEbb_printNotification5
L__dEbb_printNotification51:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification52
	GOTO	L_dEbb_printNotification6
L__dEbb_printNotification52:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#254, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification53
	GOTO	L_dEbb_printNotification7
L__dEbb_printNotification53:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification54
	GOTO	L_dEbb_printNotification8
L__dEbb_printNotification54:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dEbb_printNotification55
	GOTO	L_dEbb_printNotification9
L__dEbb_printNotification55:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dEbb_printNotification56
	GOTO	L_dEbb_printNotification10
L__dEbb_printNotification56:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dEbb_printNotification57
	GOTO	L_dEbb_printNotification11
L__dEbb_printNotification57:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__dEbb_printNotification58
	GOTO	L_dEbb_printNotification12
L__dEbb_printNotification58:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dEbb_printNotification59
	GOTO	L_dEbb_printNotification13
L__dEbb_printNotification59:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__dEbb_printNotification60
	GOTO	L_dEbb_printNotification14
L__dEbb_printNotification60:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__dEbb_printNotification61
	GOTO	L_dEbb_printNotification15
L__dEbb_printNotification61:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__dEbb_printNotification62
	GOTO	L_dEbb_printNotification16
L__dEbb_printNotification62:
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
;d_ebb.c,85 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,86 :: 		}
L_end_dEbb_setPositionZero:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_setPositionZero

_dEbb_propagateEbbChange:

;d_ebb.c,88 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,89 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange18
;d_ebb.c,90 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange20:
;d_ebb.c,91 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr16_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,92 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,93 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange21:
;d_ebb.c,94 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr17_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,95 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,96 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange22:
;d_ebb.c,97 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr18_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,98 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,99 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange23:
;d_ebb.c,100 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr19_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,101 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,102 :: 		default:
L_dEbb_propagateEbbChange24:
;d_ebb.c,103 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,104 :: 		break;
	GOTO	L_dEbb_propagateEbbChange19
;d_ebb.c,105 :: 		}
L_dEbb_propagateEbbChange18:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange66
	GOTO	L_dEbb_propagateEbbChange20
L__dEbb_propagateEbbChange66:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange67
	GOTO	L_dEbb_propagateEbbChange21
L__dEbb_propagateEbbChange67:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange68
	GOTO	L_dEbb_propagateEbbChange22
L__dEbb_propagateEbbChange68:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange69
	GOTO	L_dEbb_propagateEbbChange23
L__dEbb_propagateEbbChange69:
	GOTO	L_dEbb_propagateEbbChange24
L_dEbb_propagateEbbChange19:
;d_ebb.c,106 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_propagateValue:

;d_ebb.c,108 :: 		void dEbb_propagateValue(signed char value){
;d_ebb.c,109 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, (int)(value + EBB_DAGO_OFFSET));
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	ADD	W0, #8, W0
	MOV	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,110 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,111 :: 		}
L_end_dEbb_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateValue

_dEbb_move:

;d_ebb.c,113 :: 		void dEbb_move(signed char movements){
;d_ebb.c,115 :: 		value = dEbb_value + movements;
	PUSH	W10
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W1
	SE	W10, W0
	ADD	W1, W0, W1
; value start address is: 4 (W2)
	MOV.B	W1, W2
;d_ebb.c,116 :: 		if(value > EBB_MAX_VALUE){
	MOV.B	#249, W0
	CP.B	W1, W0
	BRA GT	L__dEbb_move72
	GOTO	L_dEbb_move25
L__dEbb_move72:
; value end address is: 4 (W2)
;d_ebb.c,117 :: 		value = EBB_MAX_VALUE;
; value start address is: 2 (W1)
	MOV.B	#249, W1
;d_ebb.c,118 :: 		} else if(value < EBB_MIN_VALUE){
; value end address is: 2 (W1)
	GOTO	L_dEbb_move26
L_dEbb_move25:
; value start address is: 4 (W2)
	CP.B	W2, #7
	BRA LT	L__dEbb_move73
	GOTO	L__dEbb_move40
L__dEbb_move73:
; value end address is: 4 (W2)
;d_ebb.c,119 :: 		value = EBB_MIN_VALUE;
; value start address is: 0 (W0)
	MOV.B	#7, W0
; value end address is: 0 (W0)
	MOV.B	W0, W1
;d_ebb.c,120 :: 		}
	GOTO	L_dEbb_move27
L__dEbb_move40:
;d_ebb.c,118 :: 		} else if(value < EBB_MIN_VALUE){
	MOV.B	W2, W1
;d_ebb.c,120 :: 		}
L_dEbb_move27:
; value start address is: 2 (W1)
; value end address is: 2 (W1)
L_dEbb_move26:
;d_ebb.c,121 :: 		dEbb_Value = value;
; value start address is: 2 (W1)
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	W1, [W0]
;d_ebb.c,122 :: 		dEbb_propagateValue(value);
	MOV.B	W1, W10
; value end address is: 2 (W1)
	CALL	_dEbb_propagateValue
;d_ebb.c,123 :: 		}
L_end_dEbb_move:
	POP	W10
	RETURN
; end of _dEbb_move

_dEbb_init:

;d_ebb.c,125 :: 		void dEbb_init(void){
;d_ebb.c,127 :: 		}
L_end_dEbb_init:
	RETURN
; end of _dEbb_init

_dEbb_calibrateSwitch:

;d_ebb.c,132 :: 		void dEbb_calibrateSwitch(void) {
;d_ebb.c,133 :: 		if (dEbb_isCalibrateing() == TRUE){
	PUSH	W10
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrateSwitch76
	GOTO	L_dEbb_calibrateSwitch28
L__dEbb_calibrateSwitch76:
;d_ebb.c,134 :: 		dEbb_calibrateStop();
	CALL	_dEbb_calibrateStop
;d_ebb.c,135 :: 		calibrationState = FALSE;
	CLR	W0
	MOV	W0, _calibrationState
;d_ebb.c,136 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,137 :: 		} else if (dEbb_isCalibrateing() == FALSE) {
	GOTO	L_dEbb_calibrateSwitch29
L_dEbb_calibrateSwitch28:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrateSwitch77
	GOTO	L_dEbb_calibrateSwitch30
L__dEbb_calibrateSwitch77:
;d_ebb.c,138 :: 		calibrationState = TRUE;
	MOV	#1, W0
	MOV	W0, _calibrationState
;d_ebb.c,139 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,140 :: 		}
L_dEbb_calibrateSwitch30:
L_dEbb_calibrateSwitch29:
;d_ebb.c,141 :: 		}
L_end_dEbb_calibrateSwitch:
	POP	W10
	RETURN
; end of _dEbb_calibrateSwitch

_dEbb_error:

;d_ebb.c,143 :: 		void dEbb_error(int value){
;d_ebb.c,144 :: 		if( value ==  1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_error79
	GOTO	L_dEbb_error31
L__dEbb_error79:
;d_ebb.c,145 :: 		dd_printMessage("EBB ERROR");
	MOV	#lo_addr(?lstr20_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,146 :: 		}
L_dEbb_error31:
;d_ebb.c,147 :: 		}
L_end_dEbb_error:
	POP	W10
	RETURN
; end of _dEbb_error

_dEbb_isCalibrateing:

;d_ebb.c,149 :: 		int dEbb_isCalibrateing(void) {
;d_ebb.c,150 :: 		return calibrationState;
	MOV	_calibrationState, W0
;d_ebb.c,151 :: 		}
L_end_dEbb_isCalibrateing:
	RETURN
; end of _dEbb_isCalibrateing

_dEbb_calibrationState:

;d_ebb.c,153 :: 		void dEbb_calibrationState(int value){
;d_ebb.c,154 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_calibrationState82
	GOTO	L__dEbb_calibrationState44
L__dEbb_calibrationState82:
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrationState83
	GOTO	L__dEbb_calibrationState43
L__dEbb_calibrationState83:
L__dEbb_calibrationState42:
;d_ebb.c,155 :: 		dd_printMessage("CALIBRATING EBB");
	MOV	#lo_addr(?lstr21_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,156 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	GOTO	L_dEbb_calibrationState35
;d_ebb.c,154 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
L__dEbb_calibrationState44:
L__dEbb_calibrationState43:
;d_ebb.c,156 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	CP	W10, #0
	BRA Z	L__dEbb_calibrationState84
	GOTO	L__dEbb_calibrationState46
L__dEbb_calibrationState84:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrationState85
	GOTO	L__dEbb_calibrationState45
L__dEbb_calibrationState85:
L__dEbb_calibrationState41:
;d_ebb.c,157 :: 		dd_printMessage("CALIBRATION DONE");
	MOV	#lo_addr(?lstr22_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,158 :: 		} else {
	GOTO	L_dEbb_calibrationState39
;d_ebb.c,156 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
L__dEbb_calibrationState46:
L__dEbb_calibrationState45:
;d_ebb.c,159 :: 		dEbb_error(1);
	MOV	#1, W10
	CALL	_dEbb_error
;d_ebb.c,160 :: 		}
L_dEbb_calibrationState39:
L_dEbb_calibrationState35:
;d_ebb.c,161 :: 		}
L_end_dEbb_calibrationState:
	POP	W10
	RETURN
; end of _dEbb_calibrationState

_dEbb_calibrateUp:

;d_ebb.c,163 :: 		void dEbb_calibrateUp(void) {
;d_ebb.c,164 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_UP);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#101, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,165 :: 		}
L_end_dEbb_calibrateUp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateUp

_dEbb_calibrateDown:

;d_ebb.c,167 :: 		void dEbb_calibrateDown(void) {
;d_ebb.c,168 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_DOWN);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#99, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,169 :: 		}
L_end_dEbb_calibrateDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateDown

_dEbb_calibratePause:

;d_ebb.c,171 :: 		void dEbb_calibratePause(void) {
;d_ebb.c,172 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#100, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,173 :: 		}
L_end_dEbb_calibratePause:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibratePause

_dEbb_calibrateStop:

;d_ebb.c,175 :: 		void dEbb_calibrateStop(void) {
;d_ebb.c,176 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_DAGO_OFFSET);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#8, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,177 :: 		dEbb_localValue = 0;
	CLR	W0
	MOV	W0, _dEbb_localValue
;d_ebb.c,179 :: 		}
L_end_dEbb_calibrateStop:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateStop

_dEbb_setEbbMotorStateFromCAN:

;d_ebb.c,181 :: 		void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
;d_ebb.c,182 :: 		dEbb_motorState = motorState;
	MOV	W10, _dEbb_motorState
;d_ebb.c,183 :: 		}
L_end_dEbb_setEbbMotorStateFromCAN:
	RETURN
; end of _dEbb_setEbbMotorStateFromCAN

_dEbb_setEbbMotorSenseFromCAN:

;d_ebb.c,185 :: 		void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
;d_ebb.c,186 :: 		dEbb_motorSense = motorSense;
	MOV	W10, _dEbb_motorSense
;d_ebb.c,187 :: 		}
L_end_dEbb_setEbbMotorSenseFromCAN:
	RETURN
; end of _dEbb_setEbbMotorSenseFromCAN

_dEbb_tick:

;d_ebb.c,191 :: 		void dEbb_tick(void) {
;d_ebb.c,218 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
