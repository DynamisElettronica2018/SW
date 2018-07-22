
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
	BRA Z	L__main69
	GOTO	L_main0
L__main69:
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
	BRA NZ	L__main70
	GOTO	L_main3
L__main70:
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
	BRA GE	L__timer2_interrupt73
	GOTO	L_timer2_interrupt6
L__timer2_interrupt73:
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
	BRA GE	L__timer2_interrupt74
	GOTO	L_timer2_interrupt7
L__timer2_interrupt74:
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
	BRA GE	L__timer2_interrupt75
	GOTO	L_timer2_interrupt8
L__timer2_interrupt75:
;DPX.c,90 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt76
	GOTO	L_timer2_interrupt9
L__timer2_interrupt76:
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
	BRA LE	L__timer2_interrupt77
	GOTO	L_timer2_interrupt10
L__timer2_interrupt77:
;DPX.c,97 :: 		if (dRpm_canUpdateLedStripe()) {
	CALL	_dRpm_canUpdateLedStripe
	CP0.B	W0
	BRA NZ	L__timer2_interrupt78
	GOTO	L_timer2_interrupt11
L__timer2_interrupt78:
;DPX.c,98 :: 		dRpm_updateLedStripe();
	CALL	_dRpm_updateLedStripe
;DPX.c,99 :: 		}
L_timer2_interrupt11:
;DPX.c,101 :: 		timer2_counter3 = 0;
	CLR	W0
	MOV	W0, _timer2_counter3
;DPX.c,102 :: 		}
L_timer2_interrupt10:
;DPX.c,104 :: 		if(timer2_counter4 >= 100){
	MOV	#100, W1
	MOV	#lo_addr(_timer2_counter4), W0
	CP	W1, [W0]
	BRA LE	L__timer2_interrupt79
	GOTO	L_timer2_interrupt12
L__timer2_interrupt79:
;DPX.c,105 :: 		if(d_drs_isOpen()){
	CALL	_d_drs_isOpen
	CP0.B	W0
	BRA NZ	L__timer2_interrupt80
	GOTO	L_timer2_interrupt13
L__timer2_interrupt80:
;DPX.c,106 :: 		dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;DPX.c,107 :: 		} else
	GOTO	L_timer2_interrupt14
L_timer2_interrupt13:
;DPX.c,108 :: 		dSignalLed_unset(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
L_timer2_interrupt14:
;DPX.c,109 :: 		}
L_timer2_interrupt12:
;DPX.c,111 :: 		if(timer2_EncoderTimer == 100){
	MOV	#100, W1
	MOV	#lo_addr(_timer2_EncoderTimer), W0
	CP	W1, [W0]
	BRA Z	L__timer2_interrupt81
	GOTO	L_timer2_interrupt15
L__timer2_interrupt81:
;DPX.c,112 :: 		d_controls_EncoderRead();
	CALL	_d_controls_EncoderRead
;DPX.c,113 :: 		}
L_timer2_interrupt15:
;DPX.c,115 :: 		if (timer2_counter5 >= 1000) {
	MOV	_timer2_counter5, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GE	L__timer2_interrupt82
	GOTO	L_timer2_interrupt16
L__timer2_interrupt82:
;DPX.c,116 :: 		d_sensors_sendSWTemp();
	CALL	_d_sensors_sendSWTemp
;DPX.c,117 :: 		if(dDCU_isAcquiring()){
	CALL	_dDCU_isAcquiring
	CP0.B	W0
	BRA NZ	L__timer2_interrupt83
	GOTO	L_timer2_interrupt17
L__timer2_interrupt83:
;DPX.c,118 :: 		dDCU_tick();
	CALL	_dDCU_tick
;DPX.c,119 :: 		}
L_timer2_interrupt17:
;DPX.c,121 :: 		timer2_counter5 = 0;
	CLR	W0
	MOV	W0, _timer2_counter5
;DPX.c,122 :: 		}
L_timer2_interrupt16:
;DPX.c,123 :: 		}
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

;DPX.c,127 :: 		onCanInterrupt{
;DPX.c,132 :: 		unsigned int dataLen = 0, flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+20]
	MOV	#0, W0
	MOV	W0, [W14+22]
;DPX.c,135 :: 		Can_clearInterrupt();         //la posizione del clear interrup deve essere per forza questa.
	CALL	_Can_clearInterrupt
;DPX.c,136 :: 		Can_read(&id, dataBuffer, &dataLen, &flags);
	ADD	W14, #22, W3
	ADD	W14, #20, W2
	ADD	W14, #12, W1
	ADD	W14, #8, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_Can_read
;DPX.c,145 :: 		if (dataLen >= 2) {
	MOV	[W14+20], W0
	CP	W0, #2
	BRA GEU	L__CAN_Interrupt85
	GOTO	L_CAN_Interrupt18
L__CAN_Interrupt85:
;DPX.c,146 :: 		firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
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
;DPX.c,147 :: 		}
L_CAN_Interrupt18:
;DPX.c,148 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt86
	GOTO	L_CAN_Interrupt19
L__CAN_Interrupt86:
;DPX.c,149 :: 		secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
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
;DPX.c,150 :: 		}
L_CAN_Interrupt19:
;DPX.c,151 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt87
	GOTO	L_CAN_Interrupt20
L__CAN_Interrupt87:
;DPX.c,152 :: 		thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
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
;DPX.c,153 :: 		}
L_CAN_Interrupt20:
;DPX.c,154 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt88
	GOTO	L_CAN_Interrupt21
L__CAN_Interrupt88:
;DPX.c,155 :: 		fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
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
;DPX.c,156 :: 		}
L_CAN_Interrupt21:
;DPX.c,158 :: 		switch (id) {
	GOTO	L_CAN_Interrupt22
;DPX.c,159 :: 		case EFI_GEAR_RPM_TPS_APPS_ID:
L_CAN_Interrupt24:
;DPX.c,160 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DPX.c,161 :: 		dRpm_set(secondInt);
	MOV	[W14+2], W10
	CALL	_dRpm_set
;DPX.c,162 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,163 :: 		dEfiSense_getAccValue(dEfiSense_calculateTPS(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTPS
	MOV	W0, W10
	CALL	_dEfiSense_getAccValue
;DPX.c,164 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,165 :: 		case EFI_WATER_TEMPERATURE_ID:
L_CAN_Interrupt25:
;DPX.c,166 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,167 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,168 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,169 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,170 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,171 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,172 :: 		case EFI_OIL_T_ENGINE_BAT_ID:
L_CAN_Interrupt26:
;DPX.c,173 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateOilInTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,174 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateOilOutTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,175 :: 		if (dd_GraphicController_getRefreshTimerValue()>20 && (d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE)){
	CALL	_dd_GraphicController_getRefreshTimerValue
	CP	W0, #20
	BRA GTU	L__CAN_Interrupt89
	GOTO	L__CAN_Interrupt65
L__CAN_Interrupt89:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__CAN_Interrupt90
	GOTO	L__CAN_Interrupt64
L__CAN_Interrupt90:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__CAN_Interrupt91
	GOTO	L__CAN_Interrupt63
L__CAN_Interrupt91:
	GOTO	L_CAN_Interrupt31
L__CAN_Interrupt64:
L__CAN_Interrupt63:
L__CAN_Interrupt61:
;DPX.c,176 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,177 :: 		dd_GraphicController_resetRefreshTimerValue();
	CALL	_dd_GraphicController_resetRefreshTimerValue
;DPX.c,178 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
	GOTO	L_CAN_Interrupt32
L_CAN_Interrupt31:
;DPX.c,175 :: 		if (dd_GraphicController_getRefreshTimerValue()>20 && (d_UI_getOperatingMode() == ACC_MODE || d_UI_getOperatingMode() == AUTOCROSS_MODE)){
L__CAN_Interrupt65:
;DPX.c,178 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #4
	BRA NZ	L__CAN_Interrupt92
	GOTO	L__CAN_Interrupt67
L__CAN_Interrupt92:
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA NZ	L__CAN_Interrupt93
	GOTO	L__CAN_Interrupt66
L__CAN_Interrupt93:
L__CAN_Interrupt60:
;DPX.c,179 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,178 :: 		}else if((d_UI_getOperatingMode() != ACC_MODE && d_UI_getOperatingMode() != AUTOCROSS_MODE)){
L__CAN_Interrupt67:
L__CAN_Interrupt66:
;DPX.c,180 :: 		}
L_CAN_Interrupt32:
;DPX.c,181 :: 		dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_vbat), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,182 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,183 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,184 :: 		case EFI_TRACTION_CONTROL_ID:
L_CAN_Interrupt36:
;DPX.c,185 :: 		if(dEfiSense_calculateSpeed(firstInt)>=EFI_SENSE_MIN_SPEED)
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateSpeed
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LT	L__CAN_Interrupt94
	INC.B	W0
L__CAN_Interrupt94:
	CP0.B	W0
	BRA NZ	L__CAN_Interrupt95
	GOTO	L_CAN_Interrupt37
L__CAN_Interrupt95:
;DPX.c,186 :: 		dControls_disableCentralSelector();
	CALL	_dControls_disableCentralSelector
L_CAN_Interrupt37:
;DPX.c,187 :: 		dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateSlip
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_efi_slip), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,188 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,189 :: 		case EFI_FUEL_FAN_H2O_LAUNCH_ID:
L_CAN_Interrupt38:
;DPX.c,190 :: 		dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt);
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_launch_control), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,191 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,192 :: 		case EFI_PRESSURES_LAMBDA_SMOT_ID:
L_CAN_Interrupt39:
;DPX.c,193 :: 		dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_fuel_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,194 :: 		dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,195 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,196 :: 		case GCU_CLUTCH_FB_SW_ID:
L_CAN_Interrupt40:
;DPX.c,197 :: 		dClutch_injectActualValue((unsigned char)secondInt);
	MOV.B	[W14+2], W10
	CALL	_dClutch_injectActualValue
;DPX.c,198 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,199 :: 		case EBB_BIAS_ID:
L_CAN_Interrupt41:
;DPX.c,200 :: 		dEbb_setEbbValueFromCAN(firstInt);
	MOV	[W14+0], W10
	CALL	_dEbb_setEbbValueFromCAN
;DPX.c,201 :: 		dEbb_calibrationState(secondInt);
	MOV	[W14+2], W10
	CALL	_dEbb_calibrationState
;DPX.c,202 :: 		dEbb_error(thirdInt);
	MOV	[W14+4], W10
	CALL	_dEbb_error
;DPX.c,203 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,204 :: 		case DAU_FR_DEBUG_ID:
L_CAN_Interrupt42:
;DPX.c,205 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fr_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fr_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,206 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,207 :: 		case DAU_FL_DEBUG_ID:
L_CAN_Interrupt43:
;DPX.c,208 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fl_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fl_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,209 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,210 :: 		case DAU_REAR_DEBUG_ID:
L_CAN_Interrupt44:
;DPX.c,211 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_r_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_r_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,212 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,213 :: 		case EBB_DEBUG_ID:
L_CAN_Interrupt45:
;DPX.c,214 :: 		dd_Indicator_setIntCoupleValueP(&ind_ebb_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_ebb_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,215 :: 		dd_Indicator_setFloatValueP(&ind_ebb_motor_curr.base, (thirdInt));
	MOV	[W14+4], W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_ebb_motor_curr), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,216 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,217 :: 		case GCU_DEBUG_1_ID:
L_CAN_Interrupt46:
;DPX.c,218 :: 		dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gcu_temp), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,219 :: 		dd_Indicator_setIntValueP(&ind_drs_curr.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_drs_curr), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,220 :: 		dd_Indicator_setIntValueP(&ind_fuel_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_fuel_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,221 :: 		break; //*/
	GOTO	L_CAN_Interrupt23
;DPX.c,222 :: 		case GCU_DEBUG_2_ID:
L_CAN_Interrupt47:
;DPX.c,223 :: 		dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gear_motor), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,224 :: 		dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_clutch), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,225 :: 		dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_H2O_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,226 :: 		dd_Indicator_setIntValueP(&ind_H2O_fans.base, (fourthInt));
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_H2O_fans), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,227 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,228 :: 		case DCU_DEBUG_ID:
L_CAN_Interrupt48:
;DPX.c,229 :: 		dd_Indicator_setIntCoupleValueP(&ind_dcu_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dcu_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,230 :: 		if(thirdInt == COMMAND_DCU_IS_ACQUIRING){
	MOV	[W14+4], W0
	CP	W0, #1
	BRA Z	L__CAN_Interrupt96
	GOTO	L_CAN_Interrupt49
L__CAN_Interrupt96:
;DPX.c,231 :: 		dDCU_isAcquiringSet();
	CALL	_dDCU_isAcquiringSet
;DPX.c,232 :: 		dDCU_sentAcquiringSignal();
	CALL	_dDCU_sentAcquiringSignal
;DPX.c,233 :: 		}
L_CAN_Interrupt49:
;DPX.c,234 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,235 :: 		case GCU_FEEDBACK_ID:
L_CAN_Interrupt50:
;DPX.c,236 :: 		dd_Indicator_setIntValueP(&ind_fb_code.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_fb_code), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,237 :: 		dd_Indicator_setIntValueP(&ind_fb_value.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_fb_value), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,238 :: 		switch (firstInt){
	GOTO	L_CAN_Interrupt51
;DPX.c,239 :: 		case ACC_CODE:
L_CAN_Interrupt53:
;DPX.c,240 :: 		dAcc_feedbackGCU(secondInt);
	MOV	[W14+2], W10
	CALL	_dAcc_feedbackGCU
;DPX.c,241 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,242 :: 		case AUTOX_CODE:
L_CAN_Interrupt54:
;DPX.c,243 :: 		dAutocross_feedbackGCU(secondInt);
	MOV	[W14+2], W10
	CALL	_dAutocross_feedbackGCU
;DPX.c,244 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,245 :: 		case TRACTION_CODE:
L_CAN_Interrupt55:
;DPX.c,246 :: 		d_traction_control_setValueFromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_d_traction_control_setValueFromCAN
;DPX.c,247 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,248 :: 		case DRS_CODE:
L_CAN_Interrupt56:
;DPX.c,249 :: 		d_drs_setValuefromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_d_drs_setValueFromCAN
;DPX.c,250 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,251 :: 		case ANTISTALL_CODE:
L_CAN_Interrupt57:
;DPX.c,252 :: 		d_antistall_handle(secondInt);
	MOV	[W14+2], W10
	CALL	_d_antistall_handle
;DPX.c,253 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,254 :: 		default:
L_CAN_Interrupt58:
;DPX.c,255 :: 		break;
	GOTO	L_CAN_Interrupt52
;DPX.c,256 :: 		}
L_CAN_Interrupt51:
	MOV	[W14+0], W0
	CP	W0, #1
	BRA NZ	L__CAN_Interrupt97
	GOTO	L_CAN_Interrupt53
L__CAN_Interrupt97:
	MOV	[W14+0], W0
	CP	W0, #2
	BRA NZ	L__CAN_Interrupt98
	GOTO	L_CAN_Interrupt54
L__CAN_Interrupt98:
	MOV	[W14+0], W0
	CP	W0, #3
	BRA NZ	L__CAN_Interrupt99
	GOTO	L_CAN_Interrupt55
L__CAN_Interrupt99:
	MOV	[W14+0], W0
	CP	W0, #4
	BRA NZ	L__CAN_Interrupt100
	GOTO	L_CAN_Interrupt56
L__CAN_Interrupt100:
	MOV	[W14+0], W0
	CP	W0, #5
	BRA NZ	L__CAN_Interrupt101
	GOTO	L_CAN_Interrupt57
L__CAN_Interrupt101:
	GOTO	L_CAN_Interrupt58
L_CAN_Interrupt52:
;DPX.c,257 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,258 :: 		default:
L_CAN_Interrupt59:
;DPX.c,259 :: 		break;
	GOTO	L_CAN_Interrupt23
;DPX.c,260 :: 		}
L_CAN_Interrupt22:
	MOV	#773, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt102
	GOTO	L_CAN_Interrupt24
L__CAN_Interrupt102:
	MOV	#780, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt103
	GOTO	L_CAN_Interrupt25
L__CAN_Interrupt103:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt104
	GOTO	L_CAN_Interrupt26
L__CAN_Interrupt104:
	MOV	#774, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt105
	GOTO	L_CAN_Interrupt36
L__CAN_Interrupt105:
	MOV	#782, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt106
	GOTO	L_CAN_Interrupt38
L__CAN_Interrupt106:
	MOV	#775, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt107
	GOTO	L_CAN_Interrupt39
L__CAN_Interrupt107:
	MOV	#784, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt108
	GOTO	L_CAN_Interrupt40
L__CAN_Interrupt108:
	MOV	#1805, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt109
	GOTO	L_CAN_Interrupt41
L__CAN_Interrupt109:
	MOV	#785, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt110
	GOTO	L_CAN_Interrupt42
L__CAN_Interrupt110:
	MOV	#786, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt111
	GOTO	L_CAN_Interrupt43
L__CAN_Interrupt111:
	MOV	#787, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt112
	GOTO	L_CAN_Interrupt44
L__CAN_Interrupt112:
	MOV	#789, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt113
	GOTO	L_CAN_Interrupt45
L__CAN_Interrupt113:
	MOV	#790, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt114
	GOTO	L_CAN_Interrupt46
L__CAN_Interrupt114:
	MOV	#791, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt115
	GOTO	L_CAN_Interrupt47
L__CAN_Interrupt115:
	MOV	#792, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt116
	GOTO	L_CAN_Interrupt48
L__CAN_Interrupt116:
	MOV	#793, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt117
	GOTO	L_CAN_Interrupt50
L__CAN_Interrupt117:
	GOTO	L_CAN_Interrupt59
L_CAN_Interrupt23:
;DPX.c,263 :: 		}
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
