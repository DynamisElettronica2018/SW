
_dEbb_init:

;d_ebb.c,16 :: 		void dEbb_init(void) {
;d_ebb.c,17 :: 		dd_Indicator_setIntValue(EBB, dEbb_value);
	PUSH	W10
	PUSH	W11
	MOV	_dEbb_value, W11
	CLR	W10
	CALL	_dd_Indicator_setIntValue
;d_ebb.c,18 :: 		}
L_end_dEbb_init:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_init

_dEbb_calibrateSwitch:

;d_ebb.c,20 :: 		void dEbb_calibrateSwitch(void) {
;d_ebb.c,21 :: 		if (dEbb_isCalibrateing() == TRUE){
	PUSH	W10
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrateSwitch38
	GOTO	L_dEbb_calibrateSwitch0
L__dEbb_calibrateSwitch38:
;d_ebb.c,22 :: 		dEbb_calibrateStop();
	CALL	_dEbb_calibrateStop
;d_ebb.c,23 :: 		calibrationState = FALSE;
	CLR	W0
	MOV	W0, _calibrationState
;d_ebb.c,24 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,25 :: 		} else if (dEbb_isCalibrateing() == FALSE) {
	GOTO	L_dEbb_calibrateSwitch1
L_dEbb_calibrateSwitch0:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrateSwitch39
	GOTO	L_dEbb_calibrateSwitch2
L__dEbb_calibrateSwitch39:
;d_ebb.c,26 :: 		calibrationState = TRUE;
	MOV	#1, W0
	MOV	W0, _calibrationState
;d_ebb.c,27 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,28 :: 		}
L_dEbb_calibrateSwitch2:
L_dEbb_calibrateSwitch1:
;d_ebb.c,29 :: 		}
L_end_dEbb_calibrateSwitch:
	POP	W10
	RETURN
; end of _dEbb_calibrateSwitch

_dEbb_error:

;d_ebb.c,31 :: 		void dEbb_error(int value){
;d_ebb.c,32 :: 		if( value ==  1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_error41
	GOTO	L_dEbb_error3
L__dEbb_error41:
;d_ebb.c,33 :: 		dd_printMessage("EBB ERROR");
	MOV	#lo_addr(?lstr1_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,34 :: 		}
L_dEbb_error3:
;d_ebb.c,35 :: 		}
L_end_dEbb_error:
	POP	W10
	RETURN
; end of _dEbb_error

_dEbb_isCalibrateing:

;d_ebb.c,37 :: 		int dEbb_isCalibrateing(void) {
;d_ebb.c,38 :: 		return calibrationState;
	MOV	_calibrationState, W0
;d_ebb.c,39 :: 		}
L_end_dEbb_isCalibrateing:
	RETURN
; end of _dEbb_isCalibrateing

_dEbb_calibrationState:

;d_ebb.c,41 :: 		void dEbb_calibrationState(int value){
;d_ebb.c,42 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
	PUSH	W10
	CP	W10, #1
	BRA Z	L__dEbb_calibrationState44
	GOTO	L__dEbb_calibrationState33
L__dEbb_calibrationState44:
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrationState45
	GOTO	L__dEbb_calibrationState32
L__dEbb_calibrationState45:
L__dEbb_calibrationState31:
;d_ebb.c,43 :: 		dd_printMessage("CALIBRATING EBB");
	MOV	#lo_addr(?lstr2_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,44 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	GOTO	L_dEbb_calibrationState7
;d_ebb.c,42 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
L__dEbb_calibrationState33:
L__dEbb_calibrationState32:
;d_ebb.c,44 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	CP	W10, #0
	BRA Z	L__dEbb_calibrationState46
	GOTO	L__dEbb_calibrationState35
L__dEbb_calibrationState46:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrationState47
	GOTO	L__dEbb_calibrationState34
L__dEbb_calibrationState47:
L__dEbb_calibrationState30:
;d_ebb.c,45 :: 		dd_printMessage("CALIBRATION DONE");
	MOV	#lo_addr(?lstr3_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,46 :: 		} else {
	GOTO	L_dEbb_calibrationState11
;d_ebb.c,44 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
L__dEbb_calibrationState35:
L__dEbb_calibrationState34:
;d_ebb.c,47 :: 		dEbb_error(1);
	MOV	#1, W10
	CALL	_dEbb_error
;d_ebb.c,48 :: 		}
L_dEbb_calibrationState11:
L_dEbb_calibrationState7:
;d_ebb.c,49 :: 		}
L_end_dEbb_calibrationState:
	POP	W10
	RETURN
; end of _dEbb_calibrationState

_dEbb_calibrateUp:

;d_ebb.c,51 :: 		void dEbb_calibrateUp(void) {
;d_ebb.c,52 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_UP);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#101, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,53 :: 		}
L_end_dEbb_calibrateUp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateUp

_dEbb_calibrateDown:

;d_ebb.c,55 :: 		void dEbb_calibrateDown(void) {
;d_ebb.c,56 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_DOWN);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#99, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,57 :: 		}
L_end_dEbb_calibrateDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateDown

_dEbb_calibratePause:

;d_ebb.c,59 :: 		void dEbb_calibratePause(void) {
;d_ebb.c,60 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATION);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#100, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,61 :: 		}
L_end_dEbb_calibratePause:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibratePause

_dEbb_calibrateStop:

;d_ebb.c,63 :: 		void dEbb_calibrateStop(void) {
;d_ebb.c,64 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_DAGO_OFFSET);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#4, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,65 :: 		dEbb_localValue = 0;
	CLR	W0
	MOV	W0, _dEbb_localValue
;d_ebb.c,67 :: 		}
L_end_dEbb_calibrateStop:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateStop

_dEbb_increase:

;d_ebb.c,69 :: 		void dEbb_increase(void) {
;d_ebb.c,70 :: 		if (dEbb_state != EBB_IS_CALIBRATING) {
	PUSH	W10
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_increase53
	GOTO	L_dEbb_increase12
L__dEbb_increase53:
;d_ebb.c,71 :: 		if (dEbb_localValue > EBB_MIN_VALUE) {
	MOV	#65533, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	CP	W1, [W0]
	BRA LT	L__dEbb_increase54
	GOTO	L_dEbb_increase13
L__dEbb_increase54:
;d_ebb.c,72 :: 		dEbb_localValue -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	SUBR	W1, [W0], [W0]
;d_ebb.c,73 :: 		dEbb_propagateSteeringWheelChange(EBB_INCREASED_ACTION);
	MOV.B	#1, W10
	CALL	_dEbb_propagateSteeringWheelChange
;d_ebb.c,74 :: 		}
L_dEbb_increase13:
;d_ebb.c,75 :: 		}
L_dEbb_increase12:
;d_ebb.c,76 :: 		}
L_end_dEbb_increase:
	POP	W10
	RETURN
; end of _dEbb_increase

_dEbb_decrease:

;d_ebb.c,78 :: 		void dEbb_decrease(void) {
;d_ebb.c,79 :: 		if (dEbb_state != EBB_IS_CALIBRATING) {
	PUSH	W10
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_decrease56
	GOTO	L_dEbb_decrease14
L__dEbb_decrease56:
;d_ebb.c,80 :: 		if (dEbb_localValue < EBB_MAX_VALUE) {
	MOV	_dEbb_localValue, W0
	CP	W0, #3
	BRA LT	L__dEbb_decrease57
	GOTO	L_dEbb_decrease15
L__dEbb_decrease57:
;d_ebb.c,81 :: 		dEbb_localValue += 1;
	MOV	#1, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	ADD	W1, [W0], [W0]
;d_ebb.c,82 :: 		dEbb_propagateSteeringWheelChange(EBB_DECREASED_ACTION);
	CLR	W10
	CALL	_dEbb_propagateSteeringWheelChange
;d_ebb.c,83 :: 		}
L_dEbb_decrease15:
;d_ebb.c,84 :: 		}
L_dEbb_decrease14:
;d_ebb.c,85 :: 		}
L_end_dEbb_decrease:
	POP	W10
	RETURN
; end of _dEbb_decrease

_dEbb_setEbbValueFromCAN:

;d_ebb.c,87 :: 		void dEbb_setEbbValueFromCAN(unsigned int value) {
;d_ebb.c,88 :: 		switch (value){
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,89 :: 		case EBB_IS_CALIBRATING:
L_dEbb_setEbbValueFromCAN18:
;d_ebb.c,90 :: 		dEbb_state = EBB_IS_CALIBRATING;
	MOV	#100, W0
	MOV	W0, _dEbb_state
;d_ebb.c,91 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN17
;d_ebb.c,92 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_setEbbValueFromCAN19:
;d_ebb.c,93 :: 		dEbb_state = EBB_MOTOR_STOPPED;
	MOV	#122, W0
	MOV	W0, _dEbb_state
;d_ebb.c,94 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN17
;d_ebb.c,95 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_setEbbValueFromCAN20:
;d_ebb.c,96 :: 		dEbb_state = EBB_LOW_VOLTAGE_STOP;
	MOV	#124, W0
	MOV	W0, _dEbb_state
;d_ebb.c,97 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN17
;d_ebb.c,98 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_setEbbValueFromCAN21:
;d_ebb.c,99 :: 		dEbb_state = EBB_MOTOR_ROTATEING;
	MOV	#10, W0
	MOV	W0, _dEbb_state
;d_ebb.c,100 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN17
;d_ebb.c,101 :: 		default:
L_dEbb_setEbbValueFromCAN22:
;d_ebb.c,102 :: 		dEbb_state = EBB_OK;
	MOV	#112, W0
	MOV	W0, _dEbb_state
;d_ebb.c,103 :: 		dEbb_value = value - EBB_DAGO_OFFSET;
	SUB	W10, #4, W0
	MOV	W0, _dEbb_value
;d_ebb.c,104 :: 		dEbb_localValue = dEbb_value;
	MOV	W0, _dEbb_localValue
;d_ebb.c,105 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN17
;d_ebb.c,106 :: 		}
L_dEbb_setEbbValueFromCAN16:
	MOV	#100, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN59
	GOTO	L_dEbb_setEbbValueFromCAN18
L__dEbb_setEbbValueFromCAN59:
	MOV	#122, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN60
	GOTO	L_dEbb_setEbbValueFromCAN19
L__dEbb_setEbbValueFromCAN60:
	MOV	#124, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN61
	GOTO	L_dEbb_setEbbValueFromCAN20
L__dEbb_setEbbValueFromCAN61:
	CP	W10, #10
	BRA NZ	L__dEbb_setEbbValueFromCAN62
	GOTO	L_dEbb_setEbbValueFromCAN21
L__dEbb_setEbbValueFromCAN62:
	GOTO	L_dEbb_setEbbValueFromCAN22
L_dEbb_setEbbValueFromCAN17:
;d_ebb.c,107 :: 		}
L_end_dEbb_setEbbValueFromCAN:
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_setEbbMotorStateFromCAN:

;d_ebb.c,109 :: 		void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
;d_ebb.c,110 :: 		dEbb_motorState = motorState;
	MOV	W10, _dEbb_motorState
;d_ebb.c,111 :: 		}
L_end_dEbb_setEbbMotorStateFromCAN:
	RETURN
; end of _dEbb_setEbbMotorStateFromCAN

_dEbb_setEbbMotorSenseFromCAN:

;d_ebb.c,113 :: 		void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
;d_ebb.c,114 :: 		dEbb_motorSense = motorSense;
	MOV	W10, _dEbb_motorSense
;d_ebb.c,115 :: 		}
L_end_dEbb_setEbbMotorSenseFromCAN:
	RETURN
; end of _dEbb_setEbbMotorSenseFromCAN

_dEbb_propagateSteeringWheelChange:

;d_ebb.c,117 :: 		void dEbb_propagateSteeringWheelChange(unsigned char action) {
;d_ebb.c,118 :: 		Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) (dEbb_localValue + EBB_DAGO_OFFSET));
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	_dEbb_localValue, W0
	ADD	W0, #4, W0
	MOV.B	W0, W12
	MOV	#1024, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,119 :: 		}
L_end_dEbb_propagateSteeringWheelChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateSteeringWheelChange

_dEbb_propagateEbbChange:

;d_ebb.c,121 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,122 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,123 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange25:
;d_ebb.c,124 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr4_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,125 :: 		break;
	GOTO	L_dEbb_propagateEbbChange24
;d_ebb.c,126 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange26:
;d_ebb.c,127 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr5_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,128 :: 		break;
	GOTO	L_dEbb_propagateEbbChange24
;d_ebb.c,129 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange27:
;d_ebb.c,130 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr6_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,131 :: 		break;
	GOTO	L_dEbb_propagateEbbChange24
;d_ebb.c,132 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange28:
;d_ebb.c,133 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr7_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,134 :: 		break;
	GOTO	L_dEbb_propagateEbbChange24
;d_ebb.c,135 :: 		default:
L_dEbb_propagateEbbChange29:
;d_ebb.c,136 :: 		dd_Indicator_setIntValue(EBB, -dEbb_value);
	MOV	_dEbb_value, W0
	SUBR	W0, #0, W0
	MOV	W0, W11
	CLR	W10
	CALL	_dd_Indicator_setIntValue
;d_ebb.c,137 :: 		break;
	GOTO	L_dEbb_propagateEbbChange24
;d_ebb.c,138 :: 		}
L_dEbb_propagateEbbChange23:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange67
	GOTO	L_dEbb_propagateEbbChange25
L__dEbb_propagateEbbChange67:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange68
	GOTO	L_dEbb_propagateEbbChange26
L__dEbb_propagateEbbChange68:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange69
	GOTO	L_dEbb_propagateEbbChange27
L__dEbb_propagateEbbChange69:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange70
	GOTO	L_dEbb_propagateEbbChange28
L__dEbb_propagateEbbChange70:
	GOTO	L_dEbb_propagateEbbChange29
L_dEbb_propagateEbbChange24:
;d_ebb.c,139 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_tick:

;d_ebb.c,141 :: 		void dEbb_tick(void) {
;d_ebb.c,168 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
