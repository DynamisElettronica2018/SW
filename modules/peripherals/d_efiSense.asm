
_dEfiSense_heartbeat:

;d_efiSense.c,11 :: 		void dEfiSense_heartbeat(void) {
;d_efiSense.c,12 :: 		dEfiSense_detectReset = TRUE;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEfiSense_detectReset), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_efiSense.c,13 :: 		dEfiSense_dead = FALSE;
	MOV	#lo_addr(_dEfiSense_dead), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_efiSense.c,14 :: 		dEfiSense_ticks = EFI_SENSE_DEADTIME;
	MOV	#1000, W0
	MOV	W0, _dEfiSense_ticks
;d_efiSense.c,15 :: 		dd_Indicator_setBoolValueP(&ind_efi_status.base, !dEfiSense_isDead());
	CALL	_dEfiSense_isDead
	CP0.B	W0
	CLR.B	W0
	BRA NZ	L__dEfiSense_heartbeat4
	INC.B	W0
L__dEfiSense_heartbeat4:
	MOV.B	W0, W11
	MOV	#lo_addr(_ind_efi_status), W10
	CALL	_dd_Indicator_setBoolValueP
;d_efiSense.c,16 :: 		dSignalLed_set(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_set
;d_efiSense.c,17 :: 		}
L_end_dEfiSense_heartbeat:
	POP	W11
	POP	W10
	RETURN
; end of _dEfiSense_heartbeat

_dEfiSense_tick:

;d_efiSense.c,19 :: 		void dEfiSense_tick(void) {
;d_efiSense.c,20 :: 		if (dEfiSense_ticks > 0) {
	MOV	_dEfiSense_ticks, W0
	CP	W0, #0
	BRA GTU	L__dEfiSense_tick6
	GOTO	L_dEfiSense_tick0
L__dEfiSense_tick6:
;d_efiSense.c,21 :: 		dEfiSense_ticks -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_dEfiSense_ticks), W0
	SUBR	W1, [W0], [W0]
;d_efiSense.c,22 :: 		if (dEfiSense_ticks == 0) {
	MOV	_dEfiSense_ticks, W0
	CP	W0, #0
	BRA Z	L__dEfiSense_tick7
	GOTO	L_dEfiSense_tick1
L__dEfiSense_tick7:
;d_efiSense.c,23 :: 		dEfiSense_die();
	CALL	_dEfiSense_die
;d_efiSense.c,24 :: 		if (dEfiSense_detectReset) {
	MOV	#lo_addr(_dEfiSense_detectReset), W0
	CP0.B	[W0]
	BRA NZ	L__dEfiSense_tick8
	GOTO	L_dEfiSense_tick2
L__dEfiSense_tick8:
;d_efiSense.c,25 :: 		dHardReset_reset();
	CALL	_dHardReset_reset
;d_efiSense.c,26 :: 		}
L_dEfiSense_tick2:
;d_efiSense.c,27 :: 		}
L_dEfiSense_tick1:
;d_efiSense.c,28 :: 		}
L_dEfiSense_tick0:
;d_efiSense.c,29 :: 		}
L_end_dEfiSense_tick:
	RETURN
; end of _dEfiSense_tick

_dEfiSense_die:

;d_efiSense.c,31 :: 		void dEfiSense_die(void) {
;d_efiSense.c,32 :: 		dEfiSense_dead = TRUE;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEfiSense_dead), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_efiSense.c,33 :: 		dd_Indicator_setBoolValue(EFI_STATUS, !dEfiSense_isDead());
	CALL	_dEfiSense_isDead
	CP0.B	W0
	CLR.B	W0
	BRA NZ	L__dEfiSense_die10
	INC.B	W0
L__dEfiSense_die10:
	MOV.B	W0, W11
	MOV.B	#10, W10
	CALL	_dd_Indicator_setBoolValue
;d_efiSense.c,34 :: 		dSignalLed_unset(DSIGNAL_LED_GREEN);
	MOV.B	#3, W10
	CALL	_dSignalLed_unset
;d_efiSense.c,35 :: 		}
L_end_dEfiSense_die:
	POP	W11
	POP	W10
	RETURN
; end of _dEfiSense_die

_dEfiSense_isDead:

;d_efiSense.c,37 :: 		char dEfiSense_isDead(void) {
;d_efiSense.c,38 :: 		return dEfiSense_dead;
	MOV	#lo_addr(_dEfiSense_dead), W0
	MOV.B	[W0], W0
;d_efiSense.c,39 :: 		}
L_end_dEfiSense_isDead:
	RETURN
; end of _dEfiSense_isDead

_dEfiSense_calculateTPS:

;d_efiSense.c,41 :: 		int dEfiSense_calculateTPS (unsigned int value){
;d_efiSense.c,42 :: 		return ((int)(value*100)/EFI_SENSE_TPS_RANGE);
	MOV	#100, W0
	MUL.UU	W10, W0, W4
	MOV	#255, W2
	REPEAT	#17
	DIV.S	W4, W2
;d_efiSense.c,43 :: 		}
L_end_dEfiSense_calculateTPS:
	RETURN
; end of _dEfiSense_calculateTPS

_dEfiSense_calculateOilInTemperature:
	LNK	#4

;d_efiSense.c,45 :: 		float dEfiSense_calculateOilInTemperature (unsigned int value){
;d_efiSense.c,46 :: 		return ((int) (( EFI_SENSE_OIL_MIN_TEMP - (value * EFI_SENSE_OIL_TEMP_RANGE ) ) * 100)) / 100.0;
	MOV	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52513, W2
	MOV	#16056, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#23593, W0
	MOV	#17220, W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Sub_FP
	POP.D	W2
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efiSense.c,47 :: 		}
L_end_dEfiSense_calculateOilInTemperature:
	ULNK
	RETURN
; end of _dEfiSense_calculateOilInTemperature

_dEfiSense_calculateOilOutTemperature:

;d_efiSense.c,49 :: 		float dEfiSense_calculateOilOutTemperature (unsigned int value){
;d_efiSense.c,50 :: 		return dEfiSense_calculateWaterTemperature (value);
	CALL	_dEfiSense_calculateWaterTemperature
;d_efiSense.c,51 :: 		}
L_end_dEfiSense_calculateOilOutTemperature:
	RETURN
; end of _dEfiSense_calculateOilOutTemperature

_dEfiSense_calculateWaterTemperature:
	LNK	#4

;d_efiSense.c,53 :: 		float dEfiSense_calculateWaterTemperature (unsigned int value) {
;d_efiSense.c,54 :: 		return ((int) (( EFI_SENSE_WATER_MIN_TEMP - (value * EFI_SENSE_WATER_TEMP_RANGE ) ) * 100)) / 100.0;
	MOV	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#8431, W2
	MOV	#16054, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#62259, W0
	MOV	#17214, W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Sub_FP
	POP.D	W2
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efiSense.c,55 :: 		}
L_end_dEfiSense_calculateWaterTemperature:
	ULNK
	RETURN
; end of _dEfiSense_calculateWaterTemperature

_dEfiSense_calculateTemperature:

;d_efiSense.c,57 :: 		float dEfiSense_calculateTemperature(unsigned int value) { //Value is Temperature, 256 values ranging from -10° to 160°
;d_efiSense.c,58 :: 		return ((int) ((((value * EFI_SENSE_TEMP_RANGE) / 256.0) - EFI_SENSE_MIN_TEMP) * 100)) / 100.0;
	MOV	#160, W0
	MUL.UU	W10, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17280, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Sub_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efiSense.c,59 :: 		}
L_end_dEfiSense_calculateTemperature:
	RETURN
; end of _dEfiSense_calculateTemperature

_dEfiSense_calculatePressure:

;d_efiSense.c,61 :: 		float dEfiSense_calculatePressure(unsigned int value) { //Value is Pressure in millibars
;d_efiSense.c,62 :: 		return (value / 10) / 100.0;
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efiSense.c,63 :: 		}
L_end_dEfiSense_calculatePressure:
	RETURN
; end of _dEfiSense_calculatePressure

_dEfiSense_calculateVoltage:

;d_efiSense.c,65 :: 		float dEfiSense_calculateVoltage(unsigned int value) { //Value is Battery Voltage, 1024 values ranging from 0 to 18V
;d_efiSense.c,66 :: 		return ((int) (((value * EFI_SENSE_MAX_VOLTAGE) / 1024.0) * 100)) / 100.0;
	MOV	#18, W0
	MUL.UU	W10, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17536, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efiSense.c,67 :: 		}
L_end_dEfiSense_calculateVoltage:
	RETURN
; end of _dEfiSense_calculateVoltage

_dEfiSense_calculateSlip:

;d_efiSense.c,69 :: 		int dEfiSense_calculateSlip(unsigned int value){
;d_efiSense.c,70 :: 		return ((int) ((value * EFI_SENSE_SLIP) * 100)) / 100.0;
	MOV	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
;d_efiSense.c,71 :: 		}
L_end_dEfiSense_calculateSlip:
	RETURN
; end of _dEfiSense_calculateSlip
