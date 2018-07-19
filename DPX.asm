
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;DPX.c,41 :: 		void main(){
;DPX.c,43 :: 		setAllPinAsDigital();
	CALL	_setAllPinAsDigital
;DPX.c,44 :: 		Debug_UART_Init();
	CALL	_Debug_UART_Init
;DPX.c,46 :: 		if (!dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__main66
	GOTO	L_main0
L__main66:
;DPX.c,48 :: 		delay_ms(250);
	MOV	#26, W8
	MOV	#28274, W7
L_main1:
	DEC	W7
	BRA NZ	L_main1
	DEC	W8
	BRA NZ	L_main1
;DPX.c,49 :: 		}
L_main0:
;DPX.c,51 :: 		d_UIController_init();
	CALL	_d_UIController_init
;DPX.c,53 :: 		if(dHardReset_hasBeenReset()){
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA NZ	L__main67
	GOTO	L_main3
L__main67:
;DPX.c,54 :: 		dHardReset_handleReset();
	CALL	_dHardReset_handleReset
;DPX.c,55 :: 		dHardReset_unsetFlag();
	CALL	_dHardReset_unsetFlag
;DPX.c,56 :: 		}
L_main3:
;DPX.c,58 :: 		while(1){
L_main4:
;DPX.c,60 :: 		}
	GOTO	L_main4
;DPX.c,61 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_timer2_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;DPX.c,65 :: 		onTimer2Interrupt{
;DPX.c,66 :: 		clearTimer2();
	PUSH	W10
	BCLR	IFS0bits, #6
;DPX.c,68 :: 		dEfiSense_tick();
	CALL	_dEfiSense_tick
;DPX.c,69 :: 		timer2_counter0 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter0), W0
	ADD	W1, [W0], [W0]
;DPX.c,70 :: 		timer2_counter1 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter1), W0
	ADD	W1, [W0], [W0]
;DPX.c,71 :: 		timer2_counter2 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter2), W0
	ADD	W1, [W0], [W0]
;DPX.c,72 :: 		timer2_counter3 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter3), W0
	ADD	W1, [W0], [W0]
;DPX.c,73 :: 		timer2_counter4 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter4), W0
	ADD	W1, [W0], [W0]
;DPX.c,74 :: 		timer2_counter5 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter5), W0
	ADD	W1, [W0], [W0]
;DPX.c,75 :: 		timer2_EncoderTimer +=1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_EncoderTimer), W0
	ADD	W1, [W0], [W0]
;DPX.c,78 :: 		if (timer2_counter0 >= 5) {
	MOV	_timer2_counter0, W0
	CP	W0, #5
	BRA GE	L__timer2_interrupt70
	GOTO	L_timer2_interrupt6
L__timer2_interrupt70:
;DPX.c,79 :: 		dPaddle_readSample();
	CALL	_dPaddle_readSample
;DPX.c,80 :: 		timer2_counter0 = 0;
	CLR	W0
	MOV	W0, _timer2_counter0
;DPX.c,81 :: 		}
L_timer2_interrupt6:
;DPX.c,83 :: 		if (timer2_counter2 >= 10) {
	MOV	_timer2_counter2, W0
	CP	W0, #10
	BRA GE	L__timer2_interrupt71
	GOTO	L_timer2_interrupt7
L__timer2_interrupt71:
;DPX.c,84 :: 		dClutch_set(dPaddle_getValue());
	CALL	_dPaddle_getValue
	MOV.B	W0, W10
	CALL	_dClutch_set
;DPX.c,85 :: 		dClutch_send();
	CALL	_dClutch_send
;DPX.c,86 :: 		timer2_counter2 = 0;
	CLR	W0
	MOV	W0, _timer2_counter2
;DPX.c,87 :: 		}
L_timer2_interrupt7:
;DPX.c,89 :: 		if (timer2_counter1 >= 25) {
	MOV	_timer2_counter1, W0
	CP	W0, #25
	BRA GE	L__timer2_interrupt72
	GOTO	L_timer2_interrupt8
L__timer2_interrupt72:
;DPX.c,90 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt73
	GOTO	L_timer2_interrupt9
L__timer2_interrupt73:
;DPX.c,91 :: 		dStart_sendStartMessage();
	CALL	_dStart_sendStartMessage
;DPX.c,92 :: 		}
L_timer2_interrupt9:
;DPX.c,93 :: 		timer2_counter1 = 0;
	CLR	W0
	MOV	W0, _timer2_counter1
;DPX.c,94 :: 		}
L_timer2_interrupt8:
;DPX.c,96 :: 		if (timer2_counter3 >= 100) {
	MOV	#100, W1
	MOV	#lo_addr(_timer2_counter3), W0
	CP	W1, [W0]
	BRA LE	L__timer2_interrupt74
	GOTO	L_timer2_interrupt10
L__timer2_interrupt74:
;DPX.c,97 :: 		if (dRpm_canUpdateLedStripe()) {
	CALL	_dRpm_canUpdateLedStripe
	CP0.B	W0
	BRA NZ	L__timer2_interrupt75
	GOTO	L_timer2_interrupt11
L__timer2_interrupt75:
;DPX.c,98 :: 		dRpm_updateLedStripe();
	CALL	_dRpm_updateLedStripe
;DPX.c,99 :: 		}
L_timer2_interrupt11:
;DPX.c,101 :: 		timer2_counter3 = 0;
	CLR	W0
	MOV	W0, _timer2_counter3
;DPX.c,102 :: 		}
L_timer2_interrupt10:
;DPX.c,104 :: 		if(timer2_EncoderTimer == 100){
	MOV	#100, W1
	MOV	#lo_addr(_timer2_EncoderTimer), W0
	CP	W1, [W0]
	BRA Z	L__timer2_interrupt76
	GOTO	L_timer2_interrupt12
L__timer2_interrupt76:
;DPX.c,105 :: 		d_controls_EncoderRead();
	CALL	_d_controls_EncoderRead
;DPX.c,106 :: 		}
L_timer2_interrupt12:
;DPX.c,108 :: 		if (timer2_counter5 >= 1000) {
	MOV	_timer2_counter5, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GE	L__timer2_interrupt77
	GOTO	L_timer2_interrupt13
L__timer2_interrupt77:
;DPX.c,109 :: 		d_sensors_sendSWTemp();
	CALL	_d_sensors_sendSWTemp
;DPX.c,110 :: 		if(dDCU_isAcquiring()){
	CALL	_dDCU_isAcquiring
	CP0.B	W0
	BRA NZ	L__timer2_interrupt78
	GOTO	L_timer2_interrupt14
L__timer2_interrupt78:
;DPX.c,111 :: 		dDCU_tick();
	CALL	_dDCU_tick
;DPX.c,112 :: 		}
L_timer2_interrupt14:
;DPX.c,114 :: 		timer2_counter5 = 0;
	CLR	W0
	MOV	W0, _timer2_counter5
;DPX.c,115 :: 		}
L_timer2_interrupt13:
;DPX.c,116 :: 		}
L_end_timer2_interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer2_interrupt

_CAN_Interrupt:
	LNK	#24
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;DPX.c,120 :: 		onCanInterrupt{
;DPX.c,125 :: 		unsigned int dataLen = 0, flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+20]
	MOV	#0, W0
	MOV	W0, [W14+22]
;DPX.c,128 :: 		Can_clearInterrupt();         //la posizione del clear interrup deve essere per forza questa.
	CALL	_Can_clearInterrupt
;DPX.c,129 :: 		dSignalLed_switch(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_switch
;DPX.c,130 :: 		Can_read(&id, dataBuffer, &dataLen, &flags);
	ADD	W14, #22, W3
	ADD	W14, #20, W2
	ADD	W14, #12, W1
	ADD	W14, #8, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_Can_read
;DPX.c,139 :: 		if (dataLen >= 2) {
	MOV	[W14+20], W0
	CP	W0, #2
	BRA GEU	L__CAN_Interrupt80
	GOTO	L_CAN_Interrupt15
L__CAN_Interrupt80:
;DPX.c,140 :: 		firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
	ADD	W14, #12, W1
	MOV.B	[W1], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #1, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #0, W0
	IOR	W2, W1, [W0]
;DPX.c,141 :: 		}
L_CAN_Interrupt15:
;DPX.c,142 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt81
	GOTO	L_CAN_Interrupt16
L__CAN_Interrupt81:
;DPX.c,143 :: 		secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #3, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #2, W0
	IOR	W2, W1, [W0]
;DPX.c,144 :: 		}
L_CAN_Interrupt16:
;DPX.c,145 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt82
	GOTO	L_CAN_Interrupt17
L__CAN_Interrupt82:
;DPX.c,146 :: 		thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #4, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #5, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #4, W0
	IOR	W2, W1, [W0]
;DPX.c,147 :: 		}
L_CAN_Interrupt17:
;DPX.c,148 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt83
	GOTO	L_CAN_Interrupt18
L__CAN_Interrupt83:
;DPX.c,149 :: 		fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #6, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #7, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #6, W0
	IOR	W2, W1, [W0]
;DPX.c,150 :: 		}
L_CAN_Interrupt18:
;DPX.c,152 :: 		switch (id) {
	GOTO	L_CAN_Interrupt19
;DPX.c,153 :: 		case EFI_GEAR_RPM_TPS_APPS_ID:
L_CAN_Interrupt21:
;DPX.c,154 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DPX.c,155 :: 		dRpm_set(secondInt);
	MOV	[W14+2], W10
	CALL	_dRpm_set
;DPX.c,156 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,157 :: 		dEfiSense_getAccValue(dEfiSense_calculateTPS(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTPS
	MOV	W0, W10
	CALL	_dEfiSense_getAccValue
;DPX.c,158 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,159 :: 		case EFI_WATER_TEMPERATURE_ID:
L_CAN_Interrupt22:
;DPX.c,160 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,161 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,162 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,163 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,164 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,165 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,166 :: 		case EFI_OIL_T_ENGINE_BAT_ID:
L_CAN_Interrupt23:
;DPX.c,167 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateOilInTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,168 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateOilOutTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,169 :: 		if (dd_GraphicController_getRefreshTimerValue()>20 && (d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE)){
	CALL	_dd_GraphicController_getRefreshTimerValue
	CP	W0, #20
	BRA GTU	L__CAN_Interrupt84
	GOTO	L__CAN_Interrupt62
L__CAN_Interrupt84:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__CAN_Interrupt85
	GOTO	L__CAN_Interrupt61
L__CAN_Interrupt85:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__CAN_Interrupt86
	GOTO	L__CAN_Interrupt60
L__CAN_Interrupt86:
	GOTO	L_CAN_Interrupt28
L__CAN_Interrupt61:
L__CAN_Interrupt60:
L__CAN_Interrupt58:
;DPX.c,170 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,171 :: 		dd_GraphicController_resetRefreshTimerValue();
	CALL	_dd_GraphicController_resetRefreshTimerValue
;DPX.c,172 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
	GOTO	L_CAN_Interrupt29
L_CAN_Interrupt28:
;DPX.c,169 :: 		if (dd_GraphicController_getRefreshTimerValue()>20 && (d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE)){
L__CAN_Interrupt62:
;DPX.c,172 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__CAN_Interrupt87
	GOTO	L__CAN_Interrupt64
L__CAN_Interrupt87:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__CAN_Interrupt88
	GOTO	L__CAN_Interrupt63
L__CAN_Interrupt88:
L__CAN_Interrupt57:
;DPX.c,173 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,172 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
L__CAN_Interrupt64:
L__CAN_Interrupt63:
;DPX.c,174 :: 		}
L_CAN_Interrupt29:
;DPX.c,175 :: 		dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_vbat), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,176 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,177 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,178 :: 		case EFI_TRACTION_CONTROL_ID:
L_CAN_Interrupt33:
;DPX.c,179 :: 		if(dEfiSense_calculateSpeed(firstInt)>=EFI_SENSE_MIN_SPEED)
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateSpeed
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LT	L__CAN_Interrupt89
	INC.B	W0
L__CAN_Interrupt89:
	CP0.B	W0
	BRA NZ	L__CAN_Interrupt90
	GOTO	L_CAN_Interrupt34
L__CAN_Interrupt90:
;DPX.c,180 :: 		dControls_disableCentralSelector();
	CALL	_dControls_disableCentralSelector
L_CAN_Interrupt34:
;DPX.c,181 :: 		dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateSlip
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_efi_slip), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,182 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,183 :: 		case EFI_FUEL_FAN_H2O_LAUNCH_ID:
L_CAN_Interrupt35:
;DPX.c,184 :: 		dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt);
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_launch_control), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,185 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,186 :: 		case EFI_PRESSURES_LAMBDA_SMOT_ID:
L_CAN_Interrupt36:
;DPX.c,187 :: 		dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_fuel_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,188 :: 		dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,189 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,190 :: 		case GCU_CLUTCH_FB_SW_ID:
L_CAN_Interrupt37:
;DPX.c,191 :: 		dClutch_injectActualValue((unsigned char)secondInt);
	MOV.B	[W14+2], W10
	CALL	_dClutch_injectActualValue
;DPX.c,192 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,193 :: 		case EBB_BIAS_ID:
L_CAN_Interrupt38:
;DPX.c,194 :: 		dEbb_setEbbValueFromCAN(firstInt);
	MOV	[W14+0], W10
	CALL	_dEbb_setEbbValueFromCAN
;DPX.c,195 :: 		dEbb_calibrationState(secondInt);
	MOV	[W14+2], W10
	CALL	_dEbb_calibrationState
;DPX.c,196 :: 		dEbb_error(thirdInt);
	MOV	[W14+4], W10
	CALL	_dEbb_error
;DPX.c,197 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,198 :: 		case DAU_FR_DEBUG_ID:
L_CAN_Interrupt39:
;DPX.c,199 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fr_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fr_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,200 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,201 :: 		case DAU_FL_DEBUG_ID:
L_CAN_Interrupt40:
;DPX.c,202 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fl_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fl_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,203 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,204 :: 		case DAU_REAR_DEBUG_ID:
L_CAN_Interrupt41:
;DPX.c,205 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_r_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_r_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,206 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,207 :: 		case EBB_DEBUG_ID:
L_CAN_Interrupt42:
;DPX.c,208 :: 		dd_Indicator_setIntCoupleValueP(&ind_ebb_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_ebb_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,209 :: 		dd_Indicator_setFloatValueP(&ind_ebb_motor_curr.base, (thirdInt));
	MOV	[W14+4], W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_ebb_motor_curr), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,210 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,211 :: 		case GCU_DEBUG_1_ID:
L_CAN_Interrupt43:
;DPX.c,212 :: 		dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gcu_temp), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,213 :: 		dd_Indicator_setIntValueP(&ind_drs_curr.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_drs_curr), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,214 :: 		dd_Indicator_setIntValueP(&ind_fuel_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_fuel_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,215 :: 		break; //*/
	GOTO	L_CAN_Interrupt20
;DPX.c,216 :: 		case GCU_DEBUG_2_ID:
L_CAN_Interrupt44:
;DPX.c,217 :: 		dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gear_motor), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,218 :: 		dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_clutch), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,219 :: 		dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_H2O_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,220 :: 		dd_Indicator_setIntValueP(&ind_H2O_fans.base, (fourthInt));
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_H2O_fans), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,221 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,222 :: 		case DCU_DEBUG_ID:
L_CAN_Interrupt45:
;DPX.c,223 :: 		dd_Indicator_setIntCoupleValueP(&ind_dcu_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dcu_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,224 :: 		if(thirdInt == COMMAND_DCU_IS_ACQUIRING){
	MOV	[W14+4], W0
	CP	W0, #1
	BRA Z	L__CAN_Interrupt91
	GOTO	L_CAN_Interrupt46
L__CAN_Interrupt91:
;DPX.c,225 :: 		dDCU_isAcquiringSet();
	CALL	_dDCU_isAcquiringSet
;DPX.c,226 :: 		dDCU_sentAcquiringSignal();
	CALL	_dDCU_sentAcquiringSignal
;DPX.c,227 :: 		}
L_CAN_Interrupt46:
;DPX.c,228 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,229 :: 		case GCU_FEEDBACK_ID:
L_CAN_Interrupt47:
;DPX.c,230 :: 		dd_Indicator_setIntValueP(&ind_fb_code.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_fb_code), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,231 :: 		dd_Indicator_setIntValueP(&ind_fb_value.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_fb_value), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,232 :: 		switch (firstInt){
	GOTO	L_CAN_Interrupt48
;DPX.c,233 :: 		case ACC_CODE:
L_CAN_Interrupt50:
;DPX.c,234 :: 		dAcc_feedbackGCU(secondInt);
	MOV	[W14+2], W10
	CALL	_dAcc_feedbackGCU
;DPX.c,235 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,236 :: 		case AUTOX_CODE:
L_CAN_Interrupt51:
;DPX.c,237 :: 		dAutocross_feedbackGCU(secondInt);
	MOV	[W14+2], W10
	CALL	_dAutocross_feedbackGCU
;DPX.c,238 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,239 :: 		case TRACTION_CODE:
L_CAN_Interrupt52:
;DPX.c,240 :: 		d_traction_control_setValueFromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_d_traction_control_setValueFromCAN
;DPX.c,241 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,242 :: 		case DRS_CODE:
L_CAN_Interrupt53:
;DPX.c,243 :: 		d_drs_setValuefromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_d_drs_setValueFromCAN
;DPX.c,244 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,245 :: 		case ANTISTALL_CODE:
L_CAN_Interrupt54:
;DPX.c,246 :: 		d_antistall_handle(secondInt);
	MOV	[W14+2], W10
	CALL	_d_antistall_handle
;DPX.c,247 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,248 :: 		default:
L_CAN_Interrupt55:
;DPX.c,249 :: 		break;
	GOTO	L_CAN_Interrupt49
;DPX.c,250 :: 		}
L_CAN_Interrupt48:
	MOV	[W14+0], W0
	CP	W0, #1
	BRA NZ	L__CAN_Interrupt92
	GOTO	L_CAN_Interrupt50
L__CAN_Interrupt92:
	MOV	[W14+0], W0
	CP	W0, #2
	BRA NZ	L__CAN_Interrupt93
	GOTO	L_CAN_Interrupt51
L__CAN_Interrupt93:
	MOV	[W14+0], W0
	CP	W0, #3
	BRA NZ	L__CAN_Interrupt94
	GOTO	L_CAN_Interrupt52
L__CAN_Interrupt94:
	MOV	[W14+0], W0
	CP	W0, #4
	BRA NZ	L__CAN_Interrupt95
	GOTO	L_CAN_Interrupt53
L__CAN_Interrupt95:
	MOV	[W14+0], W0
	CP	W0, #5
	BRA NZ	L__CAN_Interrupt96
	GOTO	L_CAN_Interrupt54
L__CAN_Interrupt96:
	GOTO	L_CAN_Interrupt55
L_CAN_Interrupt49:
;DPX.c,251 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,252 :: 		default:
L_CAN_Interrupt56:
;DPX.c,253 :: 		break;
	GOTO	L_CAN_Interrupt20
;DPX.c,254 :: 		}
L_CAN_Interrupt19:
	MOV	#773, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt97
	GOTO	L_CAN_Interrupt21
L__CAN_Interrupt97:
	MOV	#780, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt98
	GOTO	L_CAN_Interrupt22
L__CAN_Interrupt98:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt99
	GOTO	L_CAN_Interrupt23
L__CAN_Interrupt99:
	MOV	#774, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt100
	GOTO	L_CAN_Interrupt33
L__CAN_Interrupt100:
	MOV	#782, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt101
	GOTO	L_CAN_Interrupt35
L__CAN_Interrupt101:
	MOV	#775, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt102
	GOTO	L_CAN_Interrupt36
L__CAN_Interrupt102:
	MOV	#784, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt103
	GOTO	L_CAN_Interrupt37
L__CAN_Interrupt103:
	MOV	#1805, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt104
	GOTO	L_CAN_Interrupt38
L__CAN_Interrupt104:
	MOV	#785, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt105
	GOTO	L_CAN_Interrupt39
L__CAN_Interrupt105:
	MOV	#786, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt106
	GOTO	L_CAN_Interrupt40
L__CAN_Interrupt106:
	MOV	#787, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt107
	GOTO	L_CAN_Interrupt41
L__CAN_Interrupt107:
	MOV	#789, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt108
	GOTO	L_CAN_Interrupt42
L__CAN_Interrupt108:
	MOV	#790, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt109
	GOTO	L_CAN_Interrupt43
L__CAN_Interrupt109:
	MOV	#791, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt110
	GOTO	L_CAN_Interrupt44
L__CAN_Interrupt110:
	MOV	#792, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt111
	GOTO	L_CAN_Interrupt45
L__CAN_Interrupt111:
	MOV	#793, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt112
	GOTO	L_CAN_Interrupt47
L__CAN_Interrupt112:
	GOTO	L_CAN_Interrupt56
L_CAN_Interrupt20:
;DPX.c,257 :: 		}
L_end_CAN_Interrupt:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	ULNK
	RETFIE
; end of _CAN_Interrupt
