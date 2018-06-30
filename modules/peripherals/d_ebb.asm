
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
	BRA GT	L__dEbb_move38
	GOTO	L_dEbb_move0
L__dEbb_move38:
;d_ebb.c,62 :: 		value = EBB_MAX_VALUE;
	MOV.B	#3, W1
;d_ebb.c,63 :: 		} else if(value < EBB_MIN_VALUE){
	GOTO	L_dEbb_move1
L_dEbb_move0:
	MOV.B	#253, W0
	CP.B	W1, W0
	BRA LT	L__dEbb_move39
	GOTO	L__dEbb_move29
L__dEbb_move39:
; value end address is: 2 (W1)
;d_ebb.c,64 :: 		value = EBB_MIN_VALUE;
; value start address is: 0 (W0)
	MOV.B	#253, W0
; value end address is: 0 (W0)
	MOV.B	W0, W1
;d_ebb.c,65 :: 		}
	GOTO	L_dEbb_move2
L__dEbb_move29:
;d_ebb.c,63 :: 		} else if(value < EBB_MIN_VALUE){
;d_ebb.c,65 :: 		}
L_dEbb_move2:
; value start address is: 2 (W1)
; value end address is: 2 (W1)
L_dEbb_move1:
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
	MOV	#lo_addr(?lstr_1_d_ebb), W0
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
	BRA Z	L__dEbb_calibrateSwitch42
	GOTO	L_dEbb_calibrateSwitch3
L__dEbb_calibrateSwitch42:
;d_ebb.c,84 :: 		dEbb_calibrateStop();
	CALL	_dEbb_calibrateStop
;d_ebb.c,85 :: 		calibrationState = FALSE;
	CLR	W0
	MOV	W0, _calibrationState
;d_ebb.c,86 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,87 :: 		} else if (dEbb_isCalibrateing() == FALSE) {
	GOTO	L_dEbb_calibrateSwitch4
L_dEbb_calibrateSwitch3:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrateSwitch43
	GOTO	L_dEbb_calibrateSwitch5
L__dEbb_calibrateSwitch43:
;d_ebb.c,88 :: 		calibrationState = TRUE;
	MOV	#1, W0
	MOV	W0, _calibrationState
;d_ebb.c,89 :: 		dSignalLed_switch(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_switch
;d_ebb.c,90 :: 		}
L_dEbb_calibrateSwitch5:
L_dEbb_calibrateSwitch4:
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
	BRA Z	L__dEbb_error45
	GOTO	L_dEbb_error6
L__dEbb_error45:
;d_ebb.c,95 :: 		dd_printMessage("EBB ERROR");
	MOV	#lo_addr(?lstr2_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,96 :: 		}
L_dEbb_error6:
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
	BRA Z	L__dEbb_calibrationState48
	GOTO	L__dEbb_calibrationState33
L__dEbb_calibrationState48:
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrationState49
	GOTO	L__dEbb_calibrationState32
L__dEbb_calibrationState49:
L__dEbb_calibrationState31:
;d_ebb.c,105 :: 		dd_printMessage("CALIBRATING EBB");
	MOV	#lo_addr(?lstr3_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	GOTO	L_dEbb_calibrationState10
;d_ebb.c,104 :: 		if( value == 1 && dEbb_isCalibrateing() == 1 ){
L__dEbb_calibrationState33:
L__dEbb_calibrationState32:
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
	CP	W10, #0
	BRA Z	L__dEbb_calibrationState50
	GOTO	L__dEbb_calibrationState35
L__dEbb_calibrationState50:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrationState51
	GOTO	L__dEbb_calibrationState34
L__dEbb_calibrationState51:
L__dEbb_calibrationState30:
;d_ebb.c,107 :: 		dd_printMessage("CALIBRATION DONE");
	MOV	#lo_addr(?lstr4_d_ebb), W10
	CALL	_dd_printMessage
;d_ebb.c,108 :: 		} else {
	GOTO	L_dEbb_calibrationState14
;d_ebb.c,106 :: 		} else if(value == 0 && dEbb_isCalibrateing() == 0 ){
L__dEbb_calibrationState35:
L__dEbb_calibrationState34:
;d_ebb.c,109 :: 		dEbb_error(1);
	MOV	#1, W10
	CALL	_dEbb_error
;d_ebb.c,110 :: 		}
L_dEbb_calibrationState14:
L_dEbb_calibrationState10:
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
	GOTO	L_dEbb_setEbbValueFromCAN15
;d_ebb.c,133 :: 		case EBB_IS_CALIBRATING:
L_dEbb_setEbbValueFromCAN17:
;d_ebb.c,134 :: 		dEbb_state = EBB_IS_CALIBRATING;
	MOV	#100, W0
	MOV	W0, _dEbb_state
;d_ebb.c,135 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,136 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_setEbbValueFromCAN18:
;d_ebb.c,137 :: 		dEbb_state = EBB_MOTOR_STOPPED;
	MOV	#122, W0
	MOV	W0, _dEbb_state
;d_ebb.c,138 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,139 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_setEbbValueFromCAN19:
;d_ebb.c,140 :: 		dEbb_state = EBB_LOW_VOLTAGE_STOP;
	MOV	#124, W0
	MOV	W0, _dEbb_state
;d_ebb.c,141 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,142 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_setEbbValueFromCAN20:
;d_ebb.c,143 :: 		dEbb_state = EBB_MOTOR_ROTATEING;
	MOV	#10, W0
	MOV	W0, _dEbb_state
;d_ebb.c,144 :: 		break;
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,145 :: 		default:
L_dEbb_setEbbValueFromCAN21:
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
	GOTO	L_dEbb_setEbbValueFromCAN16
;d_ebb.c,150 :: 		}
L_dEbb_setEbbValueFromCAN15:
	MOV	#100, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN57
	GOTO	L_dEbb_setEbbValueFromCAN17
L__dEbb_setEbbValueFromCAN57:
	MOV	#122, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN58
	GOTO	L_dEbb_setEbbValueFromCAN18
L__dEbb_setEbbValueFromCAN58:
	MOV	#124, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN59
	GOTO	L_dEbb_setEbbValueFromCAN19
L__dEbb_setEbbValueFromCAN59:
	CP	W10, #10
	BRA NZ	L__dEbb_setEbbValueFromCAN60
	GOTO	L_dEbb_setEbbValueFromCAN20
L__dEbb_setEbbValueFromCAN60:
	GOTO	L_dEbb_setEbbValueFromCAN21
L_dEbb_setEbbValueFromCAN16:
;d_ebb.c,151 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;d_ebb.c,152 :: 		}
L_end_dEbb_setEbbValueFromCAN:
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_setEbbMotorStateFromCAN:

;d_ebb.c,154 :: 		void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
;d_ebb.c,155 :: 		dEbb_motorState = motorState;
	MOV	W10, _dEbb_motorState
;d_ebb.c,156 :: 		}
L_end_dEbb_setEbbMotorStateFromCAN:
	RETURN
; end of _dEbb_setEbbMotorStateFromCAN

_dEbb_setEbbMotorSenseFromCAN:

;d_ebb.c,158 :: 		void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
;d_ebb.c,159 :: 		dEbb_motorSense = motorSense;
	MOV	W10, _dEbb_motorSense
;d_ebb.c,160 :: 		}
L_end_dEbb_setEbbMotorSenseFromCAN:
	RETURN
; end of _dEbb_setEbbMotorSenseFromCAN

_dEbb_propagateEbbChange:

;d_ebb.c,163 :: 		void dEbb_propagateEbbChange(void) {
;d_ebb.c,164 :: 		switch (dEbb_state){
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange22
;d_ebb.c,165 :: 		case EBB_IS_CALIBRATING:
L_dEbb_propagateEbbChange24:
;d_ebb.c,166 :: 		dd_Indicator_setStringValue(EBB, "=0=");
	MOV	#lo_addr(?lstr5_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,167 :: 		break;
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,168 :: 		case EBB_MOTOR_STOPPED:
L_dEbb_propagateEbbChange25:
;d_ebb.c,169 :: 		dd_Indicator_setStringValue(EBB, "/");
	MOV	#lo_addr(?lstr6_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,170 :: 		break;
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,171 :: 		case EBB_LOW_VOLTAGE_STOP:
L_dEbb_propagateEbbChange26:
;d_ebb.c,172 :: 		dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
	MOV	#lo_addr(?lstr7_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,173 :: 		break;
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,174 :: 		case EBB_MOTOR_ROTATEING:
L_dEbb_propagateEbbChange27:
;d_ebb.c,175 :: 		dd_Indicator_setStringValue(EBB, "...");
	MOV	#lo_addr(?lstr8_d_ebb), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,176 :: 		break;
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,177 :: 		default:
L_dEbb_propagateEbbChange28:
;d_ebb.c,178 :: 		dd_Indicator_setIntValueP(&ind_ebb.base, (int) dEbb_value);
	MOV	#lo_addr(_dEbb_value), W0
	SE	[W0], W0
	MOV	W0, W11
	MOV	#lo_addr(_ind_ebb), W10
	CALL	_dd_Indicator_setIntValueP
;d_ebb.c,179 :: 		break;
	GOTO	L_dEbb_propagateEbbChange23
;d_ebb.c,180 :: 		}
L_dEbb_propagateEbbChange22:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange64
	GOTO	L_dEbb_propagateEbbChange24
L__dEbb_propagateEbbChange64:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange65
	GOTO	L_dEbb_propagateEbbChange25
L__dEbb_propagateEbbChange65:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange66
	GOTO	L_dEbb_propagateEbbChange26
L__dEbb_propagateEbbChange66:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange67
	GOTO	L_dEbb_propagateEbbChange27
L__dEbb_propagateEbbChange67:
	GOTO	L_dEbb_propagateEbbChange28
L_dEbb_propagateEbbChange23:
;d_ebb.c,181 :: 		}
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_tick:

;d_ebb.c,183 :: 		void dEbb_tick(void) {
;d_ebb.c,210 :: 		}
L_end_dEbb_tick:
	RETURN
; end of _dEbb_tick
