
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;DPX.c,27 :: 		void main(){
;DPX.c,30 :: 		setAllPinAsDigital();
	PUSH	W10
	CALL	_setAllPinAsDigital
;DPX.c,31 :: 		Debug_UART_Init();
	CALL	_Debug_UART_Init
;DPX.c,33 :: 		if (!dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__main43
	GOTO	L_main0
L__main43:
;DPX.c,35 :: 		delay_ms(250);
	MOV	#26, W8
	MOV	#28274, W7
L_main1:
	DEC	W7
	BRA NZ	L_main1
	DEC	W8
	BRA NZ	L_main1
;DPX.c,36 :: 		}
L_main0:
;DPX.c,38 :: 		Debug_UART_Write("ON\r\n");
	MOV	#lo_addr(?lstr1_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,39 :: 		d_UIController_init();
	CALL	_d_UIController_init
;DPX.c,41 :: 		while(1){
L_main3:
;DPX.c,43 :: 		}
	GOTO	L_main3
;DPX.c,44 :: 		}
L_end_main:
	POP	W10
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

;DPX.c,49 :: 		onTimer2Interrupt{
;DPX.c,50 :: 		clearTimer2();
	PUSH	W10
	BCLR	IFS0bits, #6
;DPX.c,53 :: 		timer2_counter0 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter0), W0
	ADD	W1, [W0], [W0]
;DPX.c,54 :: 		timer2_counter1 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter1), W0
	ADD	W1, [W0], [W0]
;DPX.c,55 :: 		timer2_counter2 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter2), W0
	ADD	W1, [W0], [W0]
;DPX.c,56 :: 		timer2_counter3 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter3), W0
	ADD	W1, [W0], [W0]
;DPX.c,57 :: 		timer2_counter4 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter4), W0
	ADD	W1, [W0], [W0]
;DPX.c,58 :: 		timer2_counter5 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter5), W0
	ADD	W1, [W0], [W0]
;DPX.c,60 :: 		if(timer2_counter4 == 1000 && value <=7){
	MOV	_timer2_counter4, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA Z	L__timer2_interrupt46
	GOTO	L__timer2_interrupt41
L__timer2_interrupt46:
	MOV	#lo_addr(_value), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA LE	L__timer2_interrupt47
	GOTO	L__timer2_interrupt40
L__timer2_interrupt47:
L__timer2_interrupt39:
;DPX.c,61 :: 		d_traction_control_propagateValue(value);
	MOV	#lo_addr(_value), W0
	MOV.B	[W0], W10
	CALL	_d_traction_control_propagateValue
;DPX.c,62 :: 		timer2_counter4 = 0;
	CLR	W0
	MOV	W0, _timer2_counter4
;DPX.c,63 :: 		value++;
	MOV.B	#1, W1
	MOV	#lo_addr(_value), W0
	ADD.B	W1, [W0], [W0]
;DPX.c,60 :: 		if(timer2_counter4 == 1000 && value <=7){
L__timer2_interrupt41:
L__timer2_interrupt40:
;DPX.c,67 :: 		if (timer2_counter0 >= 5) {
	MOV	_timer2_counter0, W0
	CP	W0, #5
	BRA GE	L__timer2_interrupt48
	GOTO	L_timer2_interrupt8
L__timer2_interrupt48:
;DPX.c,68 :: 		dPaddle_readSample();
	CALL	_dPaddle_readSample
;DPX.c,69 :: 		timer2_counter0 = 0;
	CLR	W0
	MOV	W0, _timer2_counter0
;DPX.c,70 :: 		}
L_timer2_interrupt8:
;DPX.c,72 :: 		if (timer2_counter2 >= 10) {
	MOV	_timer2_counter2, W0
	CP	W0, #10
	BRA GE	L__timer2_interrupt49
	GOTO	L_timer2_interrupt9
L__timer2_interrupt49:
;DPX.c,73 :: 		dClutch_set(dPaddle_getValue());
	CALL	_dPaddle_getValue
	MOV.B	W0, W10
	CALL	_dClutch_set
;DPX.c,74 :: 		dClutch_send();
	CALL	_dClutch_send
;DPX.c,75 :: 		timer2_counter2 = 0;
	CLR	W0
	MOV	W0, _timer2_counter2
;DPX.c,76 :: 		}
L_timer2_interrupt9:
;DPX.c,78 :: 		if (timer2_counter1 >= 25) {
	MOV	_timer2_counter1, W0
	CP	W0, #25
	BRA GE	L__timer2_interrupt50
	GOTO	L_timer2_interrupt10
L__timer2_interrupt50:
;DPX.c,79 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt51
	GOTO	L_timer2_interrupt11
L__timer2_interrupt51:
;DPX.c,81 :: 		}
L_timer2_interrupt11:
;DPX.c,82 :: 		timer2_counter1 = 0;
	CLR	W0
	MOV	W0, _timer2_counter1
;DPX.c,83 :: 		}
L_timer2_interrupt10:
;DPX.c,85 :: 		if (timer2_counter3 >= 100) {
	MOV	#100, W1
	MOV	#lo_addr(_timer2_counter3), W0
	CP	W1, [W0]
	BRA LE	L__timer2_interrupt52
	GOTO	L_timer2_interrupt12
L__timer2_interrupt52:
;DPX.c,86 :: 		if (dRpm_canUpdateLedStripe()) {
	CALL	_dRpm_canUpdateLedStripe
	CP0.B	W0
	BRA NZ	L__timer2_interrupt53
	GOTO	L_timer2_interrupt13
L__timer2_interrupt53:
;DPX.c,87 :: 		dRpm_updateLedStripe();
	CALL	_dRpm_updateLedStripe
;DPX.c,88 :: 		}
L_timer2_interrupt13:
;DPX.c,90 :: 		timer2_counter3 = 0;
	CLR	W0
	MOV	W0, _timer2_counter3
;DPX.c,91 :: 		}
L_timer2_interrupt12:
;DPX.c,93 :: 		if (timer2_counter5 >= 1000) {
	MOV	_timer2_counter5, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GE	L__timer2_interrupt54
	GOTO	L_timer2_interrupt14
L__timer2_interrupt54:
;DPX.c,94 :: 		d_sensors_sendSWTemp();
	CALL	_d_sensors_sendSWTemp
;DPX.c,95 :: 		if(dDCU_isAcquiring())
	CALL	_dDCU_isAcquiring
	CP0.B	W0
	BRA NZ	L__timer2_interrupt55
	GOTO	L_timer2_interrupt15
L__timer2_interrupt55:
;DPX.c,97 :: 		Debug_UART_Write("DCU Tick\r\n");
	MOV	#lo_addr(?lstr2_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,98 :: 		dDCU_tick();
	CALL	_dDCU_tick
;DPX.c,99 :: 		}
L_timer2_interrupt15:
;DPX.c,101 :: 		timer2_counter5 = 0;
	CLR	W0
	MOV	W0, _timer2_counter5
;DPX.c,102 :: 		}
L_timer2_interrupt14:
;DPX.c,103 :: 		}
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

;DPX.c,107 :: 		onCanInterrupt{
;DPX.c,112 :: 		unsigned int dataLen = 0, flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+20]
	MOV	#0, W0
	MOV	W0, [W14+22]
;DPX.c,115 :: 		Can_clearInterrupt();         //la posizione del clear interrup deve essere per forza questa.
	CALL	_Can_clearInterrupt
;DPX.c,116 :: 		dSignalLed_switch(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_switch
;DPX.c,117 :: 		Can_read(&id, dataBuffer, &dataLen, &flags);
	ADD	W14, #22, W3
	ADD	W14, #20, W2
	ADD	W14, #12, W1
	ADD	W14, #8, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_Can_read
;DPX.c,126 :: 		if (dataLen >= 2) {
	MOV	[W14+20], W0
	CP	W0, #2
	BRA GEU	L__CAN_Interrupt57
	GOTO	L_CAN_Interrupt16
L__CAN_Interrupt57:
;DPX.c,127 :: 		firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
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
;DPX.c,128 :: 		}
L_CAN_Interrupt16:
;DPX.c,129 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt58
	GOTO	L_CAN_Interrupt17
L__CAN_Interrupt58:
;DPX.c,130 :: 		secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
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
;DPX.c,131 :: 		}
L_CAN_Interrupt17:
;DPX.c,132 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt59
	GOTO	L_CAN_Interrupt18
L__CAN_Interrupt59:
;DPX.c,133 :: 		thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
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
;DPX.c,134 :: 		}
L_CAN_Interrupt18:
;DPX.c,135 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt60
	GOTO	L_CAN_Interrupt19
L__CAN_Interrupt60:
;DPX.c,136 :: 		fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
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
;DPX.c,137 :: 		}                                                        //noi quando mandiamo sw temp e curr?? come lo mostriamo a schermo??
L_CAN_Interrupt19:
;DPX.c,139 :: 		switch (id) {
	GOTO	L_CAN_Interrupt20
;DPX.c,140 :: 		case EFI_GEAR_RPM_TPS_APPS_ID:
L_CAN_Interrupt22:
;DPX.c,141 :: 		dRpm_set(secondInt);
	MOV	[W14+2], W10
	CALL	_dRpm_set
;DPX.c,142 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,143 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DPX.c,144 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,145 :: 		case EFI_WATER_TEMPERATURE_ID:
L_CAN_Interrupt23:
;DPX.c,146 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,147 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,148 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,149 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,150 :: 		break;//*/
	GOTO	L_CAN_Interrupt21
;DPX.c,151 :: 		case EFI_OIL_T_ENGINE_BAT_ID:
L_CAN_Interrupt24:
;DPX.c,153 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateOilInTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,154 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateOilOutTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,155 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,156 :: 		dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_vbat), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,158 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,159 :: 		case EFI_TRACTION_CONTROL_ID:
L_CAN_Interrupt25:
;DPX.c,160 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,164 :: 		case EFI_PRESSURES_LAMBDA_SMOT_ID:
L_CAN_Interrupt26:
;DPX.c,165 :: 		dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_fuel_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,166 :: 		dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,167 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,168 :: 		case GCU_CLUTCH_FB_SW_ID:
L_CAN_Interrupt27:
;DPX.c,169 :: 		dClutch_injectActualValue((unsigned char)firstInt);
	MOV.B	[W14+0], W10
	CALL	_dClutch_injectActualValue
;DPX.c,170 :: 		d_traction_control_setValueFromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_d_traction_control_setValueFromCAN
;DPX.c,171 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,172 :: 		case DCU_AUX_ID:
L_CAN_Interrupt28:
;DPX.c,173 :: 		Debug_UART_Write("DCU sent MESSAGE\r\n");
	MOV	#lo_addr(?lstr3_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,174 :: 		if(firstInt == COMMAND_DCU_IS_ACQUIRING)
	MOV	[W14+0], W0
	CP	W0, #1
	BRA Z	L__CAN_Interrupt61
	GOTO	L_CAN_Interrupt29
L__CAN_Interrupt61:
;DPX.c,175 :: 		dDCU_sentAcquiringSignal();
	CALL	_dDCU_sentAcquiringSignal
L_CAN_Interrupt29:
;DPX.c,176 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,177 :: 		case EBB_BIAS_ID:
L_CAN_Interrupt30:
;DPX.c,178 :: 		dEbb_setEbbValueFromCAN(firstInt);
	MOV	[W14+0], W10
	CALL	_dEbb_setEbbValueFromCAN
;DPX.c,180 :: 		dEbb_calibrationState(secondInt);
	MOV	[W14+2], W10
	CALL	_dEbb_calibrationState
;DPX.c,181 :: 		dEbb_error(thirdInt);
	MOV	[W14+4], W10
	CALL	_dEbb_error
;DPX.c,182 :: 		break; //  */
	GOTO	L_CAN_Interrupt21
;DPX.c,183 :: 		case DAU_FR_DEBUG_ID:
L_CAN_Interrupt31:
;DPX.c,184 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fr_board.base, (int)firstInt, (int)secondInt); //è da capire come gestire questi perchè la temp è nel primo byte e la curr nel secondo e se ci sono conversioni da fare
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fr_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,185 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,186 :: 		case DAU_FL_DEBUG_ID:
L_CAN_Interrupt32:
;DPX.c,187 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fl_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fl_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,188 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,189 :: 		case DAU_REAR_DEBUG_ID:
L_CAN_Interrupt33:
;DPX.c,190 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_r_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_r_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,191 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,196 :: 		case GCU_DEBUG_1_ID:
L_CAN_Interrupt34:
;DPX.c,197 :: 		dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gcu_temp), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,198 :: 		dd_Indicator_setIntValueP(&ind_H2O_fans.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_H2O_fans), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,199 :: 		dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_H2O_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,200 :: 		dd_Indicator_setIntValueP(&ind_fuel_pump.base, (fourthInt));
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_fuel_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,201 :: 		break; //*/
	GOTO	L_CAN_Interrupt21
;DPX.c,202 :: 		case GCU_DEBUG_2_ID:
L_CAN_Interrupt35:
;DPX.c,203 :: 		dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gear_motor), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,204 :: 		dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_clutch), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,205 :: 		dd_Indicator_setIntValueP(&ind_drs.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,206 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,207 :: 		case DCU_DEBUG_ID:
L_CAN_Interrupt36:
;DPX.c,208 :: 		dd_Indicator_setIntCoupleValueP(&ind_dcu_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dcu_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,209 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,210 :: 		case GCU_AUX_ID:
L_CAN_Interrupt37:
;DPX.c,211 :: 		d_traction_control_setValueFromCAN(firstInt);
	MOV	[W14+0], W10
	CALL	_d_traction_control_setValueFromCAN
;DPX.c,212 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
;DPX.c,215 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,216 :: 		default:
L_CAN_Interrupt38:
;DPX.c,217 :: 		break;
	GOTO	L_CAN_Interrupt21
;DPX.c,218 :: 		}
L_CAN_Interrupt20:
	MOV	#773, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt62
	GOTO	L_CAN_Interrupt22
L__CAN_Interrupt62:
	MOV	#780, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt63
	GOTO	L_CAN_Interrupt23
L__CAN_Interrupt63:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt64
	GOTO	L_CAN_Interrupt24
L__CAN_Interrupt64:
	MOV	#774, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt65
	GOTO	L_CAN_Interrupt25
L__CAN_Interrupt65:
	MOV	#775, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt66
	GOTO	L_CAN_Interrupt26
L__CAN_Interrupt66:
	MOV	#784, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt67
	GOTO	L_CAN_Interrupt27
L__CAN_Interrupt67:
	MOV	#2039, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt68
	GOTO	L_CAN_Interrupt28
L__CAN_Interrupt68:
	MOV	#1805, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt69
	GOTO	L_CAN_Interrupt30
L__CAN_Interrupt69:
	MOV	#785, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt70
	GOTO	L_CAN_Interrupt31
L__CAN_Interrupt70:
	MOV	#786, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt71
	GOTO	L_CAN_Interrupt32
L__CAN_Interrupt71:
	MOV	#787, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt72
	GOTO	L_CAN_Interrupt33
L__CAN_Interrupt72:
	MOV	#790, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt73
	GOTO	L_CAN_Interrupt34
L__CAN_Interrupt73:
	MOV	#791, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt74
	GOTO	L_CAN_Interrupt35
L__CAN_Interrupt74:
	MOV	#792, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt75
	GOTO	L_CAN_Interrupt36
L__CAN_Interrupt75:
	MOV	#2033, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt76
	GOTO	L_CAN_Interrupt37
L__CAN_Interrupt76:
	GOTO	L_CAN_Interrupt38
L_CAN_Interrupt21:
;DPX.c,222 :: 		}
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
