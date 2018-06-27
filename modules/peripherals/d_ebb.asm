
_dEbb_printNotification:

;d_ebb.c,25 :: 		void dEbb_printNotification(void){
;d_ebb.c,26 :: 		switch (dEbb_value){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_dEbb_printNotification0
;d_ebb.c,27 :: 		case -3:
L_dEbb_printNotification2:
;d_ebb.c,28 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,29 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,30 :: 		case -2:
L_dEbb_printNotification3:
;d_ebb.c,31 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,32 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,33 :: 		case -1:
L_dEbb_printNotification4:
;d_ebb.c,34 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB -1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,35 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,36 :: 		case 0:
L_dEbb_printNotification5:
;d_ebb.c,37 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 0", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,38 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,39 :: 		case 1:
L_dEbb_printNotification6:
;d_ebb.c,40 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,41 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,42 :: 		case 2:
L_dEbb_printNotification7:
;d_ebb.c,43 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr6_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,44 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,45 :: 		case 3:
L_dEbb_printNotification8:
;d_ebb.c,46 :: 		dd_GraphicController_fireTimedNotification(EBB_NOTIFICATION_TIME, "EBB 3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr7_d_ebb), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_ebb.c,47 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,48 :: 		default:
L_dEbb_printNotification9:
;d_ebb.c,49 :: 		break;
	GOTO	L_dEbb_printNotification1
;d_ebb.c,50 :: 		}
L_dEbb_printNotification0:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification47
	GOTO	L_dEbb_printNotification2
L__dEbb_printNotification47:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#254, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification48
	GOTO	L_dEbb_printNotification3
L__dEbb_printNotification48:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L__dEbb_printNotification49
	GOTO	L_dEbb_printNotification4
L__dEbb_printNotification49:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dEbb_printNotification50
	GOTO	L_dEbb_printNotification5
L__dEbb_printNotification50:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dEbb_printNotification51
	GOTO	L_dEbb_printNotification6
L__dEbb_printNotification51:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dEbb_printNotification52
	GOTO	L_dEbb_printNotification7
L__dEbb_printNotification52:
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__dEbb_printNotification53
	GOTO	L_dEbb_printNotification8
L__dEbb_printNotification53:
	GOTO	L_dEbb_printNotification9
L_dEbb_printNotification1:
;d_ebb.c,51 :: 		} //*/
L_end_dEbb_printNotification:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_printNotification

_dEbb_propagateValue:

;d_ebb.c,53 :: 		void dEbb_propagateValue(signed char value){
;d_ebb.c,54 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, (int)(value + EBB_DAGO_OFFSET));
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	ADD	W0, #4, W0
	MOV	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,55 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,56 :: 		}
L_end_dEbb_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateValue

_dEbb_move:

;d_ebb.c,58 :: 		void dEbb_move(signed char movements){
;d_ebb.c,60 :: 		value = dEbb_value - movements;
	PUSH	W10
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W1
	SE	W10, W0
	SUB	W1, W0, W0
; value start address is: 2 (W1)
	MOV.B	W0, W1
;d_ebb.c,61 :: 		if(value > EBB_MAX_VALUE){
	CP.B	W0, #3
	BRA GT	L__dEbb_move56
	GOTO	L_dEbb_move10
L__dEbb_move56:
;d_ebb.c,62 :: 		value = EBB_MAX_VALUE;
	MOV.B	#3, W1
;d_ebb.c,63 :: 		} else if(value < EBB_MIN_VALUE){
	GOTO	L_dEbb_move11
L_dEbb_move10:
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA LT	L__dEbb_move57
	GOTO	L__dEbb_move39
L__dEbb_move57:
; value end address is: 2 (W1)
;d_ebb.c,64 :: 		value = EBB_MIN_VALUE;
; value start address is: 0 (W0)
	MOV.B	#253, W0
; value end address is: 0 (W0)
	MOV.B	W0, W1
;d_ebb.c,65 :: 		}
	GOTO	L_dEbb_move12
L__dEbb_move39:
;d_ebb.c,63 :: 		} else if(value < EBB_MIN_VALUE){
;d_ebb.c,65 :: 		}
L_dEbb_move12:
; value start address is: 2 (W1)
; value end address is: 2 (W1)
L_dEbb_move11:
;d_ebb.c,66 :: 		dEbb_Value = value;
; value start address is: 2 (W1)
	MOV	#lo_addr(_dEbb_value), W0
	MOV.B	W1, [W0]
;d_ebb.c,67 :: 		dEbb_propagateValue(value);
	MOV.B	W1, W10
; value end address is: 2 (W1)
	CALL	_dEbb_propagateValue
;d_ebb.c,68 :: 		}
L_end_dEbb_move:
	POP	W10
	RETURN
; end of _dEbb_move

_dEbb_init:

;d_ebb.c,70 :: 		void dEbb_init(void){
;d_ebb.c,71 :: 		Can_writeInt(SW_BRAKE_BIAS_EBB_ID, (int) dEbb_value);      //se si vuole partire sempre da zero
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_ebb.c,72 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,73 :: 		sprintf(dstr, "Traction Control Value: %d\r\n", (int) dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_8_d_ebb), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_ebb.c,74 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_ebb.c,76 :: 		}
L_end_dEbb_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_init

_dEbb_calibrateSwitch:

;d_ebb.c,82 :: 		void dEbb_calibrateSwitch(void) {
;d_ebb.c,83 :: 		if (dEbb_isCalibrateing() == TRUE){
	PUSH	W10
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrateSwitch60
	GOTO	L_dEbb_calibrateSwitch13
L__dEbb_calibrateSwitch60:
;d_ebb.c,84 :: 		dEbb_calibrateStop();
	CALL	_dEbb_calibrateStop
;d_ebb.c,85 :: 		calibrationState = FALSE;
	CLR	W0
	MOV	W0, _calibrationState
;d_ebb.c,86 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,87 :: 		} else if (dEbb_isCalibrateing() == FALSE) {
	GOTO	L_dEbb_calibrateSwitch14
L_dEbb_calibrateSwitch13:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrateSwitch61
	GOTO	L_dEbb_calibrateSwitch15
L__dEbb_calibrateSwitch61:
;d_ebb.c,88 :: 		calibrationState = TRUE;
	MOV	#1, W0
	MOV	W0, _calibrationState
;d_ebb.c,89 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,90 :: 		}
L_dEbb_calibrateSwitch15:
L_dEbb_calibrateSwitch14:
;d_ebb.c,91 :: 		}
L_end_dEbb_calibrateSwitch:
	POP	W10
	RETURN
; end of _dEbb_calibrateSwitch

_dEbb_error:

;d_ebb.c,93 :: 		void dEbb_error(int value){
;d_ebb.c,94 :: 		if( value ==  1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_error63
	GOTO	L_dEbb_error16
L__dEbb_error63:
;d_ebb.c,95 :: 		dd_printMessage("EBB ERROR");
	MOV	#lo_addr(?lstr9_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,96 :: 		}
L_dEbb_error16:
;d_ebb.c,97 :: 		}
L_end_dEbb_error:
	POP	W10
	RETURN
; end of _dEbb_error

_dEbb_isCalibrateing:

;d_ebb.c,99 :: 		int dEbb_isCalibrateing(void) {
;d_ebb.c,100 :: 		return calibrationState;
	MOV	_calibrationState, W0
;d_ebb.c,101 :: 		}
L_end_dEbb_isCalibrateing:
	RETURN
; end of _dEbb_isCalibrateing

_dEbb_calibrationState:

;d_ebb.c,103 :: 		void dEbb_calibrationState(int value){
;d_ebb.c,104 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_calibrationState66
	GOTO	L__dEbb_calibrationState43
L__dEbb_calibrationState66:
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrationState67
	GOTO	L__dEbb_calibrationState42
L__dEbb_calibrationState67:
L__dEbb_calibrationState41:
;d_ebb.c,105 :: 		dd_printMessage("CALIBRATING EBB");
	MOV	#lo_addr(?lstr10_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	GOTO	L_dEbb_calibrationState20
;d_ebb.c,104 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
L__dEbb_calibrationState43:
L__dEbb_calibrationState42:
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	CP	W10, #0
	BRA Z	L__dEbb_calibrationState68
	GOTO	L__dEbb_calibrationState45
L__dEbb_calibrationState68:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrationState69
	GOTO	L__dEbb_calibrationState44
L__dEbb_calibrationState69:
L__dEbb_calibrationState40:
;d_ebb.c,107 :: 		dd_printMessage("CALIBRATION DONE");
	MOV	#lo_addr(?lstr11_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,108 :: 		} else {
	GOTO	L_dEbb_calibrationState24
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
L__dEbb_calibrationState45:
L__dEbb_calibrationState44:
;d_ebb.c,109 :: 		dEbb_error(1);
	MOV	#1, W10
	CALL	_dEbb_error
;d_ebb.c,110 :: 		}
L_dEbb_calibrationState24:
L_dEbb_calibrationState20:
;d_ebb.c,111 :: 		}
L_end_dEbb_calibrationState:
	POP	W10
	RETURN
; end of _dEbb_calibrationState

_dEbb_calibrateUp:

;d_ebb.c,113 :: 		void dEbb_calibrateUp(void) {
;d_ebb.c,114 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_UP);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#101, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,115 :: 		}
L_end_dEbb_calibrateUp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateUp

_dEbb_calibrateDown:

;d_ebb.c,117 :: 		void dEbb_calibrateDown(void) {
;d_ebb.c,118 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_DOWN);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#99, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,119 :: 		}
L_end_dEbb_calibrateDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateDown

_dEbb_calibratePause:

;d_ebb.c,121 :: 		void dEbb_calibratePause(void) {
;d_ebb.c,122 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#100, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,123 :: 		}
L_end_dEbb_calibratePause:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibratePause

_dEbb_calibrateStop:

;d_ebb.c,125 :: 		void dEbb_calibrateStop(void) {
;d_ebb.c,126 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_DAGO_OFFSET);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#4, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,127 :: 		dEbb_localValue = 0;
	CLR	W0
	MOV	W0, _dEbb_localValue
;d_ebb.c,129 :: 		}
L_end_dEbb_calibrateStop:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateStop

_dEbb_setEbbValueFromCAN:

;d_ebb.c,131 :: 		void dEbb_setEbbValueFromCAN(unsigned int value) {
;d_ebb.c,132 :: 		switch (value){
	GOTO	L_dEbb_setEbbValueFromCAN25
;d_ebb.c,133 :: 		case EBB_IS_CALIBRATING:
L_dEbb_setEbbValueFromCAN27:
;d_ebb.c,134 :: 		dEbb_state = EBB_IS_CALIBRATING;
	MOV	#100, W0
	MOV	W0, _dEbb_state
;d_ebb.c,135 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN26
;d_ebb.c,136 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_setEbbValueFromCAN28:
;d_ebb.c,137 :: 		dEbb_state = EBB_MOTOR_STOPPED;
	MOV	#122, W0
	MOV	W0, _dEbb_state
;d_ebb.c,138 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN26
;d_ebb.c,139 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_setEbbValueFromCAN29:
;d_ebb.c,140 :: 		dEbb_state = EBB_LOW_VOLTAGE_STOP;
	MOV	#124, W0
	MOV	W0, _dEbb_state
;d_ebb.c,141 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN26
;d_ebb.c,142 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_setEbbValueFromCAN30:
;d_ebb.c,143 :: 		dEbb_state = EBB_MOTOR_ROTATEING;
	MOV	#10, W0
	MOV	W0, _dEbb_state
;d_ebb.c,144 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN26
;d_ebb.c,145 :: 		default:
L_dEbb_setEbbValueFromCAN31:
;d_ebb.c,146 :: 		dEbb_state = EBB_OK;
	MOV	#112, W0
	MOV	W0, _dEbb_state
;d_ebb.c,147 :: 		dEbb_value = value - EBB_DAGO_OFFSET;
	MOV	#lo_addr(_dEbb_value), W0
	SUB.B	W10, #4, [W0]
;d_ebb.c,148 :: 		dEbb_localValue = dEbb_value;
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, _dEbb_localValue
;d_ebb.c,149 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN26
;d_ebb.c,150 :: 		}
L_dEbb_setEbbValueFromCAN25:
	MOV	#100, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN75
	GOTO	L_dEbb_setEbbValueFromCAN27
L__dEbb_setEbbValueFromCAN75:
	MOV	#122, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN76
	GOTO	L_dEbb_setEbbValueFromCAN28
L__dEbb_setEbbValueFromCAN76:
	MOV	#124, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN77
	GOTO	L_dEbb_setEbbValueFromCAN29
L__dEbb_setEbbValueFromCAN77:
	CP	W10, #10
	BRA NZ	L__dEbb_setEbbValueFromCAN78
	GOTO	L_dEbb_setEbbValueFromCAN30
L__dEbb_setEbbValueFromCAN78:
	GOTO	L_dEbb_setEbbValueFromCAN31
L_dEbb_setEbbValueFromCAN26:
;d_ebb.c,151 :: 		}
L_end_dEbb_setEbbValueFromCAN:
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_setEbbMotorStateFromCAN:

;d_ebb.c,153 :: 		void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
;d_ebb.c,154 :: 		dEbb_motorState = motorState;
	MOV	W10, _dEbb_motorState
;d_ebb.c,155 :: 		}
L_end_dEbb_setEbbMotorStateFromCAN:
	RETURN
; end of _dEbb_setEbbMotorStateFromCAN

_dEbb_setEbbMotorSenseFromCAN:

;d_ebb.c,157 :: 		void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
;d_ebb.c,158 :: 		dEbb_motorSense = motorSense;
	MOV	W10, _dEbb_motorSense
;d_ebb.c,159 :: 		}
L_end_dEbb_setEbbMotorSenseFromCAN:
	RETURN
; end of _dEbb_setEbbMotorSenseFromCAN

_dEbb_propagateEbbChange:

;d_ebb.c,162 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,163 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange32
;d_ebb.c,164 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange34:
;d_ebb.c,165 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr12_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,166 :: 		break;
	GOTO	L_dEbb_propagateEbbChange33
;d_ebb.c,167 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange35:
;d_ebb.c,168 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr13_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,169 :: 		break;
	GOTO	L_dEbb_propagateEbbChange33
;d_ebb.c,170 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange36:
;d_ebb.c,171 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr14_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,172 :: 		break;
	GOTO	L_dEbb_propagateEbbChange33
;d_ebb.c,173 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange37:
;d_ebb.c,174 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr15_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,175 :: 		break;
	GOTO	L_dEbb_propagateEbbChange33
;d_ebb.c,176 :: 		default:
L_dEbb_propagateEbbChange38:
;d_ebb.c,177 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,178 :: 		break;
	GOTO	L_dEbb_propagateEbbChange33
;d_ebb.c,179 :: 		}
L_dEbb_propagateEbbChange32:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange82
	GOTO	L_dEbb_propagateEbbChange34
L__dEbb_propagateEbbChange82:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange83
	GOTO	L_dEbb_propagateEbbChange35
L__dEbb_propagateEbbChange83:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange84
	GOTO	L_dEbb_propagateEbbChange36
L__dEbb_propagateEbbChange84:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange85
	GOTO	L_dEbb_propagateEbbChange37
L__dEbb_propagateEbbChange85:
	GOTO	L_dEbb_propagateEbbChange38
L_dEbb_propagateEbbChange33:
;d_ebb.c,180 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_tick:

;d_ebb.c,182 :: 		void dEbb_tick(void) {
;d_ebb.c,209 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
