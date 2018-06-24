
_d_SWTemp_getTempValue:

;d_sensors.c,7 :: 		unsigned int d_SWTemp_getTempValue(){
;d_sensors.c,9 :: 		analogValue = ADC1_Read(TEMP_SENSOR_PIN);  //LSB
	PUSH	W10
	MOV	#12, W10
	CALL	_ADC1_Read
;d_sensors.c,10 :: 		voltage = ( (float)( analogValue * VDD ) / N_LEVEL ) * 1000.0; //mV
	MOV	#5, W1
	MUL.UU	W0, W1, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#61440, W2
	MOV	#17791, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
;d_sensors.c,11 :: 		temp = (unsigned int)((voltage - VOLTAGE_MIN)*TEMP_RANGE - TEMP_MIN);  //°C
	MOV	#100, W1
	SUB	W0, W1, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16928, W3
	CALL	__Sub_FP
	CALL	__Float2Longint
;d_sensors.c,12 :: 		return temp;
;d_sensors.c,13 :: 		}
;d_sensors.c,12 :: 		return temp;
;d_sensors.c,13 :: 		}
L_end_d_SWTemp_getTempValue:
	POP	W10
	RETURN
; end of _d_SWTemp_getTempValue

_d_sensors_sendSWTemp:
	LNK	#2

;d_sensors.c,16 :: 		void d_sensors_sendSWTemp(void){
;d_sensors.c,18 :: 		temp = d_SWTemp_getTempValue();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_d_SWTemp_getTempValue
	MOV	W0, [W14+0]
;d_sensors.c,19 :: 		Can_writeInt(SW_DEBUG_ID, temp);
	MOV	W0, W12
	MOV	#788, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_sensors.c,20 :: 		dd_Indicator_setIntValueP(&ind_sw_board.base, (int)temp);
	MOV	[W14+0], W11
	MOV	#lo_addr(_ind_sw_board), W10
	CALL	_dd_Indicator_setIntValueP
;d_sensors.c,21 :: 		}
L_end_d_sensors_sendSWTemp:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _d_sensors_sendSWTemp
