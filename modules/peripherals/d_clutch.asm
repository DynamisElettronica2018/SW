
_dClutch_send:

;d_clutch.c,13 :: 		void dClutch_send(void) {
;d_clutch.c,14 :: 		Can_writeByte(SW_CLUTCH_TARGET_GCU_ID, dClutch_value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	[W0], W12
	MOV	#513, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_clutch.c,15 :: 		}
L_end_dClutch_send:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_send

_dClutch_set:

;d_clutch.c,17 :: 		void dClutch_set(unsigned char value) {
;d_clutch.c,18 :: 		if (value > 100) {
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GTU	L__dClutch_set3
	GOTO	L_dClutch_set0
L__dClutch_set3:
;d_clutch.c,19 :: 		value = 100;
	MOV.B	#100, W10
;d_clutch.c,20 :: 		}
L_dClutch_set0:
;d_clutch.c,21 :: 		dClutch_value = value;
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	W10, [W0]
;d_clutch.c,22 :: 		}
L_end_dClutch_set:
	RETURN
; end of _dClutch_set

_dClutch_injectActualValue:

;d_clutch.c,24 :: 		void dClutch_injectActualValue(unsigned char value) {
;d_clutch.c,25 :: 		dClutch_actualValue = value;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	W10, [W0]
;d_clutch.c,26 :: 		dd_Indicator_setIntValue(CLUTCH_POSITION, dClutch_actualValue);
	ZE	W10, W11
	MOV.B	#4, W10
	CALL	_dd_Indicator_setIntValue
;d_clutch.c,28 :: 		}
L_end_dClutch_injectActualValue:
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_injectActualValue

_dClutch_get:

;d_clutch.c,30 :: 		unsigned char dClutch_get(void) {
;d_clutch.c,31 :: 		return dClutch_actualValue;
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	[W0], W0
;d_clutch.c,32 :: 		}
L_end_dClutch_get:
	RETURN
; end of _dClutch_get
