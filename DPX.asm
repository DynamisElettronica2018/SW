
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
	BRA Z	L__main37
	GOTO	L_main0
L__main37:
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

;DPX.c,48 :: 		onTimer2Interrupt{
;DPX.c,49 :: 		clearTimer2();
	PUSH	W10
	BCLR	IFS0bits, #6
;DPX.c,52 :: 		timer2_counter0 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter0), W0
	ADD	W1, [W0], [W0]
;DPX.c,53 :: 		timer2_counter1 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter1), W0
	ADD	W1, [W0], [W0]
;DPX.c,54 :: 		timer2_counter2 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter2), W0
	ADD	W1, [W0], [W0]
;DPX.c,55 :: 		timer2_counter3 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter3), W0
	ADD	W1, [W0], [W0]
;DPX.c,56 :: 		timer2_counter4 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter4), W0
	ADD	W1, [W0], [W0]
;DPX.c,57 :: 		timer2_counter5 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter5), W0
	ADD	W1, [W0], [W0]
;DPX.c,63 :: 		if (timer2_counter0 >= 5) {
	MOV	_timer2_counter0, W0
	CP	W0, #5
	BRA GE	L__timer2_interrupt40
	GOTO	L_timer2_interrupt5
L__timer2_interrupt40:
;DPX.c,64 :: 		dPaddle_readSample();
	CALL	_dPaddle_readSample
;DPX.c,65 :: 		timer2_counter0 = 0;
	CLR	W0
	MOV	W0, _timer2_counter0
;DPX.c,66 :: 		}
L_timer2_interrupt5:
;DPX.c,68 :: 		if (timer2_counter2 >= 10) {
	MOV	_timer2_counter2, W0
	CP	W0, #10
	BRA GE	L__timer2_interrupt41
	GOTO	L_timer2_interrupt6
L__timer2_interrupt41:
;DPX.c,69 :: 		dClutch_set(dPaddle_getValue());
	CALL	_dPaddle_getValue
	MOV.B	W0, W10
	CALL	_dClutch_set
;DPX.c,70 :: 		dClutch_send();
	CALL	_dClutch_send
;DPX.c,71 :: 		timer2_counter2 = 0;
	CLR	W0
	MOV	W0, _timer2_counter2
;DPX.c,72 :: 		}
L_timer2_interrupt6:
;DPX.c,74 :: 		if (timer2_counter1 >= 25) {
	MOV	_timer2_counter1, W0
	CP	W0, #25
	BRA GE	L__timer2_interrupt42
	GOTO	L_timer2_interrupt7
L__timer2_interrupt42:
;DPX.c,75 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt43
	GOTO	L_timer2_interrupt8
L__timer2_interrupt43:
;DPX.c,76 :: 		dStart_sendStartMessage();
	CALL	_dStart_sendStartMessage
;DPX.c,77 :: 		}
L_timer2_interrupt8:
;DPX.c,78 :: 		timer2_counter1 = 0;
	CLR	W0
	MOV	W0, _timer2_counter1
;DPX.c,79 :: 		}
L_timer2_interrupt7:
;DPX.c,81 :: 		if (timer2_counter3 >= 100) {
	MOV	#100, W1
	MOV	#lo_addr(_timer2_counter3), W0
	CP	W1, [W0]
	BRA LE	L__timer2_interrupt44
	GOTO	L_timer2_interrupt9
L__timer2_interrupt44:
;DPX.c,82 :: 		if (dRpm_canUpdateLedStripe()) {
	CALL	_dRpm_canUpdateLedStripe
	CP0.B	W0
	BRA NZ	L__timer2_interrupt45
	GOTO	L_timer2_interrupt10
L__timer2_interrupt45:
;DPX.c,83 :: 		dRpm_updateLedStripe();
	CALL	_dRpm_updateLedStripe
;DPX.c,84 :: 		}
L_timer2_interrupt10:
;DPX.c,86 :: 		timer2_counter3 = 0;
	CLR	W0
	MOV	W0, _timer2_counter3
;DPX.c,87 :: 		}
L_timer2_interrupt9:
;DPX.c,89 :: 		if (timer2_counter5 >= 1000) {
	MOV	_timer2_counter5, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GE	L__timer2_interrupt46
	GOTO	L_timer2_interrupt11
L__timer2_interrupt46:
;DPX.c,90 :: 		d_sensors_sendSWTemp();
	CALL	_d_sensors_sendSWTemp
;DPX.c,91 :: 		if(dDCU_isAcquiring())
	CALL	_dDCU_isAcquiring
	CP0.B	W0
	BRA NZ	L__timer2_interrupt47
	GOTO	L_timer2_interrupt12
L__timer2_interrupt47:
;DPX.c,93 :: 		Debug_UART_Write("DCU Tick\r\n");
	MOV	#lo_addr(?lstr2_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,94 :: 		dDCU_tick();
	CALL	_dDCU_tick
;DPX.c,95 :: 		}
L_timer2_interrupt12:
;DPX.c,97 :: 		timer2_counter5 = 0;
	CLR	W0
	MOV	W0, _timer2_counter5
;DPX.c,98 :: 		}
L_timer2_interrupt11:
;DPX.c,99 :: 		}
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

;DPX.c,103 :: 		onCanInterrupt{
;DPX.c,108 :: 		unsigned int dataLen = 0, flags = 0;
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
	BRA GEU	L__CAN_Interrupt49
	GOTO	L_CAN_Interrupt13
L__CAN_Interrupt49:
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
L_CAN_Interrupt13:
;DPX.c,129 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt50
	GOTO	L_CAN_Interrupt14
L__CAN_Interrupt50:
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
L_CAN_Interrupt14:
;DPX.c,132 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt51
	GOTO	L_CAN_Interrupt15
L__CAN_Interrupt51:
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
L_CAN_Interrupt15:
;DPX.c,135 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt52
	GOTO	L_CAN_Interrupt16
L__CAN_Interrupt52:
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
L_CAN_Interrupt16:
;DPX.c,139 :: 		switch (id) {
	GOTO	L_CAN_Interrupt17
;DPX.c,140 :: 		case EFI_GEAR_RPM_TPS_APPS_ID:
L_CAN_Interrupt19:
;DPX.c,141 :: 		dRpm_set(secondInt);
	MOV	[W14+2], W10
	CALL	_dRpm_set
;DPX.c,142 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,143 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DPX.c,144 :: 		dAcc_getAccValue(dEfiSense_calculateTPS(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTPS
	MOV	W0, W10
	CALL	_dAcc_getAccValue
;DPX.c,145 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,146 :: 		case EFI_WATER_TEMPERATURE_ID:
L_CAN_Interrupt20:
;DPX.c,147 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,148 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,149 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,150 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,151 :: 		break;//*/
	GOTO	L_CAN_Interrupt18
;DPX.c,152 :: 		case EFI_OIL_T_ENGINE_BAT_ID:
L_CAN_Interrupt21:
;DPX.c,154 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateOilInTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,155 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateOilOutTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,156 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,157 :: 		dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_vbat), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,159 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,160 :: 		case EFI_TRACTION_CONTROL_ID:
L_CAN_Interrupt22:
;DPX.c,161 :: 		dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateSlip
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_efi_slip), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,162 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,163 :: 		case EFI_FUEL_FAN_H2O_LAUNCH_ID:
L_CAN_Interrupt23:
;DPX.c,164 :: 		dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt); //� un flag
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_launch_control), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,165 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,166 :: 		case EFI_PRESSURES_LAMBDA_SMOT_ID:
L_CAN_Interrupt24:
;DPX.c,167 :: 		dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_fuel_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,168 :: 		dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,169 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,170 :: 		case GCU_CLUTCH_FB_SW_ID:
L_CAN_Interrupt25:
;DPX.c,171 :: 		dClutch_injectActualValue(firstInt, (unsigned char)secondInt);
	MOV.B	[W14+2], W11
	MOV	[W14+0], W10
	CALL	_dClutch_injectActualValue
;DPX.c,172 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,173 :: 		case DCU_AUX_ID:
L_CAN_Interrupt26:
;DPX.c,174 :: 		Debug_UART_Write("DCU sent MESSAGE\r\n");
	MOV	#lo_addr(?lstr3_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,175 :: 		if(firstInt == COMMAND_DCU_IS_ACQUIRING)
	MOV	[W14+0], W0
	CP	W0, #1
	BRA Z	L__CAN_Interrupt53
	GOTO	L_CAN_Interrupt27
L__CAN_Interrupt53:
;DPX.c,176 :: 		dDCU_sentAcquiringSignal();
	CALL	_dDCU_sentAcquiringSignal
L_CAN_Interrupt27:
;DPX.c,177 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,184 :: 		case DAU_FR_DEBUG_ID:
L_CAN_Interrupt28:
;DPX.c,185 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fr_board.base, (int)firstInt, (int)secondInt); //� da capire come gestire questi perch� la temp � nel primo byte e la curr nel secondo e se ci sono conversioni da fare
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fr_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,186 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,187 :: 		case DAU_FL_DEBUG_ID:
L_CAN_Interrupt29:
;DPX.c,188 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_fl_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_fl_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,189 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,190 :: 		case DAU_REAR_DEBUG_ID:
L_CAN_Interrupt30:
;DPX.c,191 :: 		dd_Indicator_setIntCoupleValueP(&ind_dau_r_board.base, (int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dau_r_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,192 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,197 :: 		case GCU_DEBUG_1_ID:
L_CAN_Interrupt31:
;DPX.c,198 :: 		dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gcu_temp), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,199 :: 		dd_Indicator_setIntValueP(&ind_H2O_fans.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_H2O_fans), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,200 :: 		dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_H2O_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,201 :: 		dd_Indicator_setIntValueP(&ind_fuel_pump.base, (fourthInt));
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_fuel_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,202 :: 		break; //*/
	GOTO	L_CAN_Interrupt18
;DPX.c,203 :: 		case GCU_DEBUG_2_ID:
L_CAN_Interrupt32:
;DPX.c,204 :: 		dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gear_motor), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,205 :: 		dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_clutch), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,206 :: 		dd_Indicator_setIntValueP(&ind_drs.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,207 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,208 :: 		case DCU_DEBUG_ID:
L_CAN_Interrupt33:
;DPX.c,209 :: 		dd_Indicator_setIntCoupleValueP(&ind_dcu_board.base,(int)firstInt, (int)secondInt);
	MOV	[W14+2], W12
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_dcu_board), W10
	CALL	_dd_Indicator_setIntCoupleValueP
;DPX.c,210 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,211 :: 		case GCU_AUX_ID:
L_CAN_Interrupt34:
;DPX.c,213 :: 		dAcc_feedbackGCU(secondInt);
	MOV	[W14+2], W10
	CALL	_dAcc_feedbackGCU
;DPX.c,215 :: 		default:
L_CAN_Interrupt35:
;DPX.c,216 :: 		break;
	GOTO	L_CAN_Interrupt18
;DPX.c,217 :: 		}
L_CAN_Interrupt17:
	MOV	#773, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt54
	GOTO	L_CAN_Interrupt19
L__CAN_Interrupt54:
	MOV	#780, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt55
	GOTO	L_CAN_Interrupt20
L__CAN_Interrupt55:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt56
	GOTO	L_CAN_Interrupt21
L__CAN_Interrupt56:
	MOV	#774, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt57
	GOTO	L_CAN_Interrupt22
L__CAN_Interrupt57:
	MOV	#782, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt58
	GOTO	L_CAN_Interrupt23
L__CAN_Interrupt58:
	MOV	#775, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt59
	GOTO	L_CAN_Interrupt24
L__CAN_Interrupt59:
	MOV	#784, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt60
	GOTO	L_CAN_Interrupt25
L__CAN_Interrupt60:
	MOV	#2039, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt61
	GOTO	L_CAN_Interrupt26
L__CAN_Interrupt61:
	MOV	#785, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt62
	GOTO	L_CAN_Interrupt28
L__CAN_Interrupt62:
	MOV	#786, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt63
	GOTO	L_CAN_Interrupt29
L__CAN_Interrupt63:
	MOV	#787, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt64
	GOTO	L_CAN_Interrupt30
L__CAN_Interrupt64:
	MOV	#790, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt65
	GOTO	L_CAN_Interrupt31
L__CAN_Interrupt65:
	MOV	#791, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt66
	GOTO	L_CAN_Interrupt32
L__CAN_Interrupt66:
	MOV	#792, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt67
	GOTO	L_CAN_Interrupt33
L__CAN_Interrupt67:
	MOV	#2033, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt68
	GOTO	L_CAN_Interrupt34
L__CAN_Interrupt68:
	GOTO	L_CAN_Interrupt35
L_CAN_Interrupt18:
;DPX.c,221 :: 		}
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
