
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;DPX.c,25 :: 		void main(){
;DPX.c,28 :: 		setAllPinAsDigital();
	PUSH	W10
	CALL	_setAllPinAsDigital
;DPX.c,29 :: 		Debug_UART_Init();
	CALL	_Debug_UART_Init
;DPX.c,31 :: 		if (!dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__main26
	GOTO	L_main0
L__main26:
;DPX.c,33 :: 		delay_ms(250);
	MOV	#26, W8
	MOV	#28274, W7
L_main1:
	DEC	W7
	BRA NZ	L_main1
	DEC	W8
	BRA NZ	L_main1
;DPX.c,34 :: 		}
L_main0:
;DPX.c,36 :: 		Debug_UART_Write("ON\r\n");
	MOV	#lo_addr(?lstr1_DPX), W10
	CALL	_Debug_UART_Write
;DPX.c,37 :: 		d_UIController_init();
	CALL	_d_UIController_init
;DPX.c,39 :: 		while(1){
L_main3:
;DPX.c,41 :: 		}
	GOTO	L_main3
;DPX.c,42 :: 		}
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

;DPX.c,44 :: 		onTimer2Interrupt{
;DPX.c,45 :: 		clearTimer2();
	PUSH	W10
	BCLR	IFS0bits, #6
;DPX.c,46 :: 		Buttons_tick();
	CALL	_Buttons_tick
;DPX.c,48 :: 		dEfiSense_tick();
	CALL	_dEfiSense_tick
;DPX.c,49 :: 		timer2_counter0 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter0), W0
	ADD	W1, [W0], [W0]
;DPX.c,50 :: 		timer2_counter1 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter1), W0
	ADD	W1, [W0], [W0]
;DPX.c,51 :: 		timer2_counter2 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter2), W0
	ADD	W1, [W0], [W0]
;DPX.c,52 :: 		timer2_counter3 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter3), W0
	ADD	W1, [W0], [W0]
;DPX.c,54 :: 		timer2_counter5 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter5), W0
	ADD	W1, [W0], [W0]
;DPX.c,56 :: 		if (timer2_counter0 >= 5) {
	MOV	_timer2_counter0, W0
	CP	W0, #5
	BRA GE	L__timer2_interrupt29
	GOTO	L_timer2_interrupt5
L__timer2_interrupt29:
;DPX.c,57 :: 		dPaddle_readSample();
	CALL	_dPaddle_readSample
;DPX.c,58 :: 		timer2_counter0 = 0;
	CLR	W0
	MOV	W0, _timer2_counter0
;DPX.c,59 :: 		}
L_timer2_interrupt5:
;DPX.c,60 :: 		if (timer2_counter1 >= 25) {
	MOV	_timer2_counter1, W0
	CP	W0, #25
	BRA GE	L__timer2_interrupt30
	GOTO	L_timer2_interrupt6
L__timer2_interrupt30:
;DPX.c,61 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt31
	GOTO	L_timer2_interrupt7
L__timer2_interrupt31:
;DPX.c,62 :: 		dStart_sendStartMessage();
	CALL	_dStart_sendStartMessage
;DPX.c,63 :: 		}
L_timer2_interrupt7:
;DPX.c,65 :: 		timer2_counter1 = 0;
	CLR	W0
	MOV	W0, _timer2_counter1
;DPX.c,66 :: 		}
L_timer2_interrupt6:
;DPX.c,76 :: 		if (timer2_counter2 >= 10) {
	MOV	_timer2_counter2, W0
	CP	W0, #10
	BRA GE	L__timer2_interrupt32
	GOTO	L_timer2_interrupt8
L__timer2_interrupt32:
;DPX.c,77 :: 		dClutch_set(dPaddle_getValue());
	CALL	_dPaddle_getValue
	MOV.B	W0, W10
	CALL	_dClutch_set
;DPX.c,78 :: 		dClutch_send();
	CALL	_dClutch_send
;DPX.c,79 :: 		timer2_counter2 = 0;
	CLR	W0
	MOV	W0, _timer2_counter2
;DPX.c,80 :: 		}//*/
L_timer2_interrupt8:
;DPX.c,88 :: 		}
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

;DPX.c,92 :: 		onCanInterrupt{
;DPX.c,97 :: 		unsigned int dataLen = 0, flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+20]
	MOV	#0, W0
	MOV	W0, [W14+22]
;DPX.c,104 :: 		Can_clearInterrupt();         //la posizione del clear interrup deve essere per forza questa.
	CALL	_Can_clearInterrupt
;DPX.c,105 :: 		dSignalLed_switch(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_switch
;DPX.c,106 :: 		Can_read(&id, dataBuffer, &dataLen, &flags);
	ADD	W14, #22, W3
	ADD	W14, #20, W2
	ADD	W14, #12, W1
	ADD	W14, #8, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_Can_read
;DPX.c,115 :: 		if (dataLen >= 2) {
	MOV	[W14+20], W0
	CP	W0, #2
	BRA GEU	L__CAN_Interrupt34
	GOTO	L_CAN_Interrupt9
L__CAN_Interrupt34:
;DPX.c,116 :: 		firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
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
;DPX.c,117 :: 		}
L_CAN_Interrupt9:
;DPX.c,118 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt35
	GOTO	L_CAN_Interrupt10
L__CAN_Interrupt35:
;DPX.c,119 :: 		secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
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
;DPX.c,120 :: 		}
L_CAN_Interrupt10:
;DPX.c,121 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt36
	GOTO	L_CAN_Interrupt11
L__CAN_Interrupt36:
;DPX.c,122 :: 		thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
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
;DPX.c,123 :: 		}
L_CAN_Interrupt11:
;DPX.c,124 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt37
	GOTO	L_CAN_Interrupt12
L__CAN_Interrupt37:
;DPX.c,125 :: 		fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
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
;DPX.c,126 :: 		}                                                        //noi quando mandiamo sw temp e curr?? come lo mostriamo a schermo??
L_CAN_Interrupt12:
;DPX.c,128 :: 		switch (id) {
	GOTO	L_CAN_Interrupt13
;DPX.c,129 :: 		case EFI_GEAR_RPM_TPS_APPS_ID:
L_CAN_Interrupt15:
;DPX.c,130 :: 		dRpm_set(secondInt*10);
	MOV	[W14+2], W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, W10
	CALL	_dRpm_set
;DPX.c,131 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DPX.c,132 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DPX.c,133 :: 		break;
	GOTO	L_CAN_Interrupt14
;DPX.c,134 :: 		case EFI_WATER_TEMPERATURE_ID:
L_CAN_Interrupt16:
;DPX.c,135 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,136 :: 		dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_sx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,137 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,138 :: 		dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateWaterTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o_dx_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,139 :: 		break;//*/
	GOTO	L_CAN_Interrupt14
;DPX.c,140 :: 		case EFI_OIL_T_ENGINE_BAT_ID:
L_CAN_Interrupt17:
;DPX.c,141 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculateOilInTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_in), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,142 :: 		dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateOilOutTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_temp_out), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,143 :: 		dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_th2o), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,144 :: 		dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_vbat), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,146 :: 		break;
	GOTO	L_CAN_Interrupt14
;DPX.c,147 :: 		case EFI_TRACTION_CONTROL_ID:
L_CAN_Interrupt18:
;DPX.c,148 :: 		dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateSlip
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_efi_slip), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,149 :: 		break; //*/
	GOTO	L_CAN_Interrupt14
;DPX.c,150 :: 		case EFI_FUEL_FAN_H2O_LAUNCH_ID:
L_CAN_Interrupt19:
;DPX.c,151 :: 		dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt); //è un flag
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_launch_control), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,152 :: 		break;//*/
	GOTO	L_CAN_Interrupt14
;DPX.c,153 :: 		case EFI_PRESSURES_LAMBDA_SMOT_ID:
L_CAN_Interrupt20:
;DPX.c,154 :: 		dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_fuel_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,155 :: 		dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV	#lo_addr(_ind_oil_press), W10
	CALL	_dd_Indicator_setFloatValueP
;DPX.c,156 :: 		break;
	GOTO	L_CAN_Interrupt14
;DPX.c,157 :: 		case GCU_CLUTCH_FB_SW_ID:
L_CAN_Interrupt21:
;DPX.c,158 :: 		dClutch_injectActualValue(firstInt, (unsigned char)secondInt);
	MOV.B	[W14+2], W11
	MOV	[W14+0], W10
	CALL	_dClutch_injectActualValue
;DPX.c,159 :: 		break;
	GOTO	L_CAN_Interrupt14
;DPX.c,179 :: 		case GCU_DEBUG_1_ID:
L_CAN_Interrupt22:
;DPX.c,180 :: 		dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gcu_temp), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,181 :: 		dd_Indicator_setIntValueP(&ind_H2O_fans.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_H2O_fans), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,182 :: 		dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_H2O_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,183 :: 		dd_Indicator_setIntValueP(&ind_fuel_pump.base, (fourthInt)); //*/
	MOV	[W14+6], W11
	MOV	#lo_addr(_ind_fuel_pump), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,184 :: 		break; //*/
	GOTO	L_CAN_Interrupt14
;DPX.c,185 :: 		case GCU_DEBUG_2_ID:
L_CAN_Interrupt23:
;DPX.c,186 :: 		dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_gear_motor), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,187 :: 		dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
	MOV	[W14+2], W11
	MOV	#lo_addr(_ind_clutch), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,188 :: 		dd_Indicator_setIntValueP(&ind_drs.base, (thirdInt)); // */
	MOV	[W14+4], W11
	MOV	#lo_addr(_ind_drs), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,189 :: 		dd_Indicator_setIntValueP(&ind_sw_board.base, d_SWTemp_getTempValue());
	CALL	_d_SWTemp_getTempValue
	MOV	W0, W11
	MOV	#lo_addr(_ind_sw_board), W10
	CALL	_dd_Indicator_setIntValueP
;DPX.c,190 :: 		break;  //*/
	GOTO	L_CAN_Interrupt14
;DPX.c,194 :: 		default:
L_CAN_Interrupt24:
;DPX.c,195 :: 		break;
	GOTO	L_CAN_Interrupt14
;DPX.c,196 :: 		}
L_CAN_Interrupt13:
	MOV	#773, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt38
	GOTO	L_CAN_Interrupt15
L__CAN_Interrupt38:
	MOV	#780, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt39
	GOTO	L_CAN_Interrupt16
L__CAN_Interrupt39:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt40
	GOTO	L_CAN_Interrupt17
L__CAN_Interrupt40:
	MOV	#774, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt41
	GOTO	L_CAN_Interrupt18
L__CAN_Interrupt41:
	MOV	#782, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt42
	GOTO	L_CAN_Interrupt19
L__CAN_Interrupt42:
	MOV	#775, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt43
	GOTO	L_CAN_Interrupt20
L__CAN_Interrupt43:
	MOV	#784, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt44
	GOTO	L_CAN_Interrupt21
L__CAN_Interrupt44:
	MOV	#790, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt45
	GOTO	L_CAN_Interrupt22
L__CAN_Interrupt45:
	MOV	#791, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt46
	GOTO	L_CAN_Interrupt23
L__CAN_Interrupt46:
	GOTO	L_CAN_Interrupt24
L_CAN_Interrupt14:
;DPX.c,200 :: 		}
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
