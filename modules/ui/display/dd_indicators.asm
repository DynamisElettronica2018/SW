
_dd_getIndicatorIndex:

;dd_indicators.c,33 :: 		unsigned char dd_getIndicatorIndex(Indicator_ID id) {
;dd_indicators.c,35 :: 		for (i = 0; i < dd_currentIndicatorsCount; i++) {
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dd_getIndicatorIndex0:
; i start address is: 4 (W2)
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	CP.B	W2, [W0]
	BRA LTU	L__dd_getIndicatorIndex33
	GOTO	L_dd_getIndicatorIndex1
L__dd_getIndicatorIndex33:
;dd_indicators.c,36 :: 		if (dd_currentIndicators[i]->id == id) {
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__dd_getIndicatorIndex34
	GOTO	L_dd_getIndicatorIndex3
L__dd_getIndicatorIndex34:
;dd_indicators.c,37 :: 		return i;
	MOV.B	W2, W0
; i end address is: 4 (W2)
	GOTO	L_end_dd_getIndicatorIndex
;dd_indicators.c,38 :: 		}
L_dd_getIndicatorIndex3:
;dd_indicators.c,35 :: 		for (i = 0; i < dd_currentIndicatorsCount; i++) {
; i start address is: 4 (W2)
	INC.B	W2
;dd_indicators.c,39 :: 		}
	GOTO	L_dd_getIndicatorIndex0
L_dd_getIndicatorIndex1:
;dd_indicators.c,40 :: 		return i; //If id doesn't exist what should we do?
	MOV.B	W2, W0
; i end address is: 4 (W2)
;dd_indicators.c,41 :: 		}
L_end_dd_getIndicatorIndex:
	RETURN
; end of _dd_getIndicatorIndex

_dd_getIndicatorIndexFromCollection:

;dd_indicators.c,43 :: 		unsigned char dd_getIndicatorIndexFromCollection(Indicator_ID id, Indicator** collection, unsigned char collection_count) {
;dd_indicators.c,45 :: 		for (i = 0; i < collection_count; i++) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_dd_getIndicatorIndexFromCollection4:
; i start address is: 2 (W1)
	CP.B	W1, W12
	BRA LTU	L__dd_getIndicatorIndexFromCollection36
	GOTO	L_dd_getIndicatorIndexFromCollection5
L__dd_getIndicatorIndexFromCollection36:
;dd_indicators.c,46 :: 		if (collection[i]->id == id) {
	ZE	W1, W0
	SL	W0, #1, W0
	ADD	W11, W0, W0
	MOV	[W0], W0
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__dd_getIndicatorIndexFromCollection37
	GOTO	L_dd_getIndicatorIndexFromCollection7
L__dd_getIndicatorIndexFromCollection37:
;dd_indicators.c,47 :: 		return i;
	MOV.B	W1, W0
; i end address is: 2 (W1)
	GOTO	L_end_dd_getIndicatorIndexFromCollection
;dd_indicators.c,48 :: 		}
L_dd_getIndicatorIndexFromCollection7:
;dd_indicators.c,45 :: 		for (i = 0; i < collection_count; i++) {
; i start address is: 2 (W1)
	INC.B	W1
;dd_indicators.c,49 :: 		}
	GOTO	L_dd_getIndicatorIndexFromCollection4
L_dd_getIndicatorIndexFromCollection5:
;dd_indicators.c,50 :: 		return i;
	MOV.B	W1, W0
; i end address is: 2 (W1)
;dd_indicators.c,51 :: 		}
L_end_dd_getIndicatorIndexFromCollection:
	RETURN
; end of _dd_getIndicatorIndexFromCollection

_dd_Indicator_requestPrintUpdate:

;dd_indicators.c,56 :: 		void dd_Indicator_requestPrintUpdate(unsigned char indicatorIndex) {
;dd_indicators.c,57 :: 		Indicator* indicator = dd_currentIndicators[indicatorIndex];
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
; indicator start address is: 4 (W2)
	MOV	[W0], W2
;dd_indicators.c,58 :: 		if(indicator->pendingPrintUpdate != FULL_PRINT_UPDATE)
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W0
	AND.B	W0, #3, W0
	CP.B	W0, #2
	BRA NZ	L__dd_Indicator_requestPrintUpdate39
	GOTO	L_dd_Indicator_requestPrintUpdate8
L__dd_Indicator_requestPrintUpdate39:
;dd_indicators.c,59 :: 		indicator->pendingPrintUpdate = TRUE;
	ADD	W2, #8, W1
; indicator end address is: 4 (W2)
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
L_dd_Indicator_requestPrintUpdate8:
;dd_indicators.c,60 :: 		}
L_end_dd_Indicator_requestPrintUpdate:
	RETURN
; end of _dd_Indicator_requestPrintUpdate

_dd_Indicator_requestPrintUpdateP:

;dd_indicators.c,62 :: 		void dd_Indicator_requestPrintUpdateP(Indicator* ind) {
;dd_indicators.c,63 :: 		if(ind->pendingPrintUpdate != FULL_PRINT_UPDATE)
	ADD	W10, #8, W0
	MOV.B	[W0], W0
	AND.B	W0, #3, W0
	CP.B	W0, #2
	BRA NZ	L__dd_Indicator_requestPrintUpdateP41
	GOTO	L_dd_Indicator_requestPrintUpdateP9
L__dd_Indicator_requestPrintUpdateP41:
;dd_indicators.c,64 :: 		ind->pendingPrintUpdate = TRUE;
	ADD	W10, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
L_dd_Indicator_requestPrintUpdateP9:
;dd_indicators.c,65 :: 		}
L_end_dd_Indicator_requestPrintUpdateP:
	RETURN
; end of _dd_Indicator_requestPrintUpdateP

_dd_Indicator_requestFullPrintUpdate:

;dd_indicators.c,67 :: 		void dd_Indicator_requestFullPrintUpdate(unsigned char indicatorIndex) {
;dd_indicators.c,68 :: 		dd_currentIndicators[indicatorIndex]->pendingPrintUpdate = FULL_PRINT_UPDATE;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #2, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;dd_indicators.c,69 :: 		}
L_end_dd_Indicator_requestFullPrintUpdate:
	RETURN
; end of _dd_Indicator_requestFullPrintUpdate

_dd_Indicator_clearPrintUpdateRequest:

;dd_indicators.c,71 :: 		void dd_Indicator_clearPrintUpdateRequest(unsigned char indicatorIndex) {
;dd_indicators.c,72 :: 		dd_currentIndicators[indicatorIndex]->pendingPrintUpdate = FALSE;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W2
	MOV.B	[W2], W1
	MOV.B	#252, W0
	AND.B	W1, W0, [W2]
;dd_indicators.c,73 :: 		}
L_end_dd_Indicator_clearPrintUpdateRequest:
	RETURN
; end of _dd_Indicator_clearPrintUpdateRequest

_dd_Indicator_isRequestingUpdate:

;dd_indicators.c,75 :: 		char dd_Indicator_isRequestingUpdate(unsigned char indicatorIndex) {
;dd_indicators.c,76 :: 		return dd_currentIndicators[indicatorIndex]->pendingPrintUpdate;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W0
	AND.B	W0, #3, W0
;dd_indicators.c,77 :: 		}
L_end_dd_Indicator_isRequestingUpdate:
	RETURN
; end of _dd_Indicator_isRequestingUpdate

_dd_Indicator_isRequestingFullUpdate:

;dd_indicators.c,79 :: 		char dd_Indicator_isRequestingFullUpdate(unsigned char indicatorIndex) {
;dd_indicators.c,80 :: 		return dd_currentIndicators[indicatorIndex]->pendingPrintUpdate == FULL_PRINT_UPDATE;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W0
	AND.B	W0, #3, W0
	CP.B	W0, #2
	CLR.B	W0
	BRA NZ	L__dd_Indicator_isRequestingFullUpdate46
	INC.B	W0
L__dd_Indicator_isRequestingFullUpdate46:
;dd_indicators.c,81 :: 		}
L_end_dd_Indicator_isRequestingFullUpdate:
	RETURN
; end of _dd_Indicator_isRequestingFullUpdate

_dd_Indicator_setStringValue:

;dd_indicators.c,84 :: 		void dd_Indicator_setStringValue(Indicator_ID id, char *value) {
;dd_indicators.c,85 :: 		unsigned char indicatorIndex = dd_getIndicatorIndex(id);
	PUSH	W10
	CALL	_dd_getIndicatorIndex
; indicatorIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_indicators.c,86 :: 		if(dd_currentIndicators[indicatorIndex]->valueType == STRING)
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #0
	BRA Z	L__dd_Indicator_setStringValue48
	GOTO	L_dd_Indicator_setStringValue10
L__dd_Indicator_setStringValue48:
;dd_indicators.c,88 :: 		strcpy(((StringIndicator*) dd_currentIndicators[indicatorIndex])->value, value);
	ZE	W4, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #20, W0
	MOV	[W0], W10
	CALL	_strcpy
;dd_indicators.c,89 :: 		dd_Indicator_requestPrintUpdate(indicatorIndex);
	MOV.B	W4, W10
; indicatorIndex end address is: 8 (W4)
	CALL	_dd_Indicator_requestPrintUpdate
;dd_indicators.c,90 :: 		}
L_dd_Indicator_setStringValue10:
;dd_indicators.c,91 :: 		}
L_end_dd_Indicator_setStringValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setStringValue

_dd_Indicator_setStringValueP:

;dd_indicators.c,93 :: 		void dd_Indicator_setStringValueP(Indicator* ind, char* value) {
;dd_indicators.c,94 :: 		if (ind->valueType == STRING) {
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #0
	BRA Z	L__dd_Indicator_setStringValueP50
	GOTO	L_dd_Indicator_setStringValueP11
L__dd_Indicator_setStringValueP50:
;dd_indicators.c,95 :: 		strcpy(((StringIndicator*) ind)->value, value);
	ADD	W10, #20, W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_strcpy
	POP	W10
;dd_indicators.c,96 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,97 :: 		}
L_dd_Indicator_setStringValueP11:
;dd_indicators.c,98 :: 		}
L_end_dd_Indicator_setStringValueP:
	RETURN
; end of _dd_Indicator_setStringValueP

_dd_Indicator_setIntValue:

;dd_indicators.c,100 :: 		void dd_Indicator_setIntValue(Indicator_ID id, int value) {
;dd_indicators.c,101 :: 		unsigned char indicatorIndex = dd_getIndicatorIndex(id);
	PUSH	W10
	CALL	_dd_getIndicatorIndex
; indicatorIndex start address is: 4 (W2)
	MOV.B	W0, W2
;dd_indicators.c,102 :: 		if (dd_currentIndicators[indicatorIndex]->valueType == INT) {
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #1
	BRA Z	L__dd_Indicator_setIntValue52
	GOTO	L_dd_Indicator_setIntValue12
L__dd_Indicator_setIntValue52:
;dd_indicators.c,103 :: 		((IntegerIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #20, W0
	MOV	W11, [W0]
;dd_indicators.c,104 :: 		dd_Indicator_requestPrintUpdate(indicatorIndex);
	MOV.B	W2, W10
; indicatorIndex end address is: 4 (W2)
	CALL	_dd_Indicator_requestPrintUpdate
;dd_indicators.c,105 :: 		}
L_dd_Indicator_setIntValue12:
;dd_indicators.c,106 :: 		}
L_end_dd_Indicator_setIntValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setIntValue

_dd_Indicator_setIntValueP:

;dd_indicators.c,108 :: 		void dd_Indicator_setIntValueP(Indicator* ind, int value) {
;dd_indicators.c,109 :: 		if (ind->valueType == INT) {
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #1
	BRA Z	L__dd_Indicator_setIntValueP54
	GOTO	L_dd_Indicator_setIntValueP13
L__dd_Indicator_setIntValueP54:
;dd_indicators.c,110 :: 		((IntegerIndicator*) ind)->value = value;
	ADD	W10, #20, W0
	MOV	W11, [W0]
;dd_indicators.c,111 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,112 :: 		}
L_dd_Indicator_setIntValueP13:
;dd_indicators.c,113 :: 		}
L_end_dd_Indicator_setIntValueP:
	RETURN
; end of _dd_Indicator_setIntValueP

_dd_Indicator_setFloatValue:

;dd_indicators.c,115 :: 		void dd_Indicator_setFloatValue(Indicator_ID id, float value) {
;dd_indicators.c,116 :: 		unsigned char indicatorIndex = dd_getIndicatorIndex(id);
	PUSH	W10
	CALL	_dd_getIndicatorIndex
; indicatorIndex start address is: 4 (W2)
	MOV.B	W0, W2
;dd_indicators.c,117 :: 		if (dd_currentIndicators[indicatorIndex]->valueType == FLOAT) {
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #2
	BRA Z	L__dd_Indicator_setFloatValue56
	GOTO	L_dd_Indicator_setFloatValue14
L__dd_Indicator_setFloatValue56:
;dd_indicators.c,118 :: 		((FloatIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #20, W0
	MOV	W11, [W0++]
	MOV	W12, [W0--]
;dd_indicators.c,119 :: 		dd_Indicator_requestPrintUpdate(indicatorIndex);
	MOV.B	W2, W10
; indicatorIndex end address is: 4 (W2)
	CALL	_dd_Indicator_requestPrintUpdate
;dd_indicators.c,120 :: 		}
L_dd_Indicator_setFloatValue14:
;dd_indicators.c,121 :: 		}
L_end_dd_Indicator_setFloatValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setFloatValue

_dd_Indicator_setFloatValueP:

;dd_indicators.c,123 :: 		void dd_Indicator_setFloatValueP(Indicator* ind, float value) {
;dd_indicators.c,124 :: 		if (ind->valueType == FLOAT) {
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #2
	BRA Z	L__dd_Indicator_setFloatValueP58
	GOTO	L_dd_Indicator_setFloatValueP15
L__dd_Indicator_setFloatValueP58:
;dd_indicators.c,125 :: 		((FloatIndicator*) ind)->value = value;
	ADD	W10, #20, W0
	MOV	W11, [W0++]
	MOV	W12, [W0--]
;dd_indicators.c,126 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,127 :: 		}
L_dd_Indicator_setFloatValueP15:
;dd_indicators.c,128 :: 		}
L_end_dd_Indicator_setFloatValueP:
	RETURN
; end of _dd_Indicator_setFloatValueP

_dd_Indicator_setBoolValue:

;dd_indicators.c,130 :: 		void dd_Indicator_setBoolValue(Indicator_ID id, char value) {
;dd_indicators.c,131 :: 		unsigned char indicatorIndex = dd_getIndicatorIndex(id);
	PUSH	W10
	CALL	_dd_getIndicatorIndex
; indicatorIndex start address is: 4 (W2)
	MOV.B	W0, W2
;dd_indicators.c,132 :: 		if (dd_currentIndicators[indicatorIndex]->valueType == BOOL) {
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #3
	BRA Z	L__dd_Indicator_setBoolValue60
	GOTO	L_dd_Indicator_setBoolValue16
L__dd_Indicator_setBoolValue60:
;dd_indicators.c,133 :: 		((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #20, W0
	MOV.B	W11, [W0]
;dd_indicators.c,134 :: 		dd_Indicator_requestPrintUpdate(indicatorIndex);
	MOV.B	W2, W10
; indicatorIndex end address is: 4 (W2)
	CALL	_dd_Indicator_requestPrintUpdate
;dd_indicators.c,135 :: 		}
L_dd_Indicator_setBoolValue16:
;dd_indicators.c,136 :: 		}
L_end_dd_Indicator_setBoolValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setBoolValue

_dd_Indicator_setBoolValueP:

;dd_indicators.c,138 :: 		void dd_Indicator_setBoolValueP(Indicator* ind, char value) {
;dd_indicators.c,139 :: 		if (ind->valueType == BOOL ){
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #3
	BRA Z	L__dd_Indicator_setBoolValueP62
	GOTO	L_dd_Indicator_setBoolValueP17
L__dd_Indicator_setBoolValueP62:
;dd_indicators.c,140 :: 		((BooleanIndicator*) ind)->value = value;
	ADD	W10, #20, W0
	MOV.B	W11, [W0]
;dd_indicators.c,141 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,142 :: 		}
L_dd_Indicator_setBoolValueP17:
;dd_indicators.c,143 :: 		}
L_end_dd_Indicator_setBoolValueP:
	RETURN
; end of _dd_Indicator_setBoolValueP

_dd_Indicator_setIntCoupleValueP:

;dd_indicators.c,145 :: 		void dd_Indicator_setIntCoupleValueP(Indicator* ind, int first_value, int second_value) {
;dd_indicators.c,146 :: 		if (ind->valueType == INT_COUPLE ){
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #4
	BRA Z	L__dd_Indicator_setIntCoupleValueP64
	GOTO	L_dd_Indicator_setIntCoupleValueP18
L__dd_Indicator_setIntCoupleValueP64:
;dd_indicators.c,147 :: 		((IntCoupleIndicator*) ind) -> value.first = first_value;
	ADD	W10, #20, W0
	MOV	W11, [W0]
;dd_indicators.c,148 :: 		((IntCoupleIndicator*) ind) -> value.second = second_value;
	ADD	W10, #20, W0
	INC2	W0
	MOV	W12, [W0]
;dd_indicators.c,149 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,150 :: 		}
L_dd_Indicator_setIntCoupleValueP18:
;dd_indicators.c,151 :: 		}
L_end_dd_Indicator_setIntCoupleValueP:
	RETURN
; end of _dd_Indicator_setIntCoupleValueP

_dd_Indicator_switchBoolValueP:

;dd_indicators.c,153 :: 		void dd_Indicator_switchBoolValueP(Indicator* ind) {
;dd_indicators.c,154 :: 		if(ind->valueType == BOOL){
	ADD	W10, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #3
	BRA Z	L__dd_Indicator_switchBoolValueP66
	GOTO	L_dd_Indicator_switchBoolValueP19
L__dd_Indicator_switchBoolValueP66:
;dd_indicators.c,155 :: 		((BooleanIndicator*) ind)->value = !((BooleanIndicator*) ind)->value;
	ADD	W10, #20, W1
	CP0.B	[W1]
	CLR.B	W0
	BRA NZ	L__dd_Indicator_switchBoolValueP67
	INC.B	W0
L__dd_Indicator_switchBoolValueP67:
	MOV.B	W0, [W1]
;dd_indicators.c,156 :: 		dd_Indicator_requestPrintUpdateP(ind);
	CALL	_dd_Indicator_requestPrintUpdateP
;dd_indicators.c,157 :: 		}
L_dd_Indicator_switchBoolValueP19:
;dd_indicators.c,158 :: 		}
L_end_dd_Indicator_switchBoolValueP:
	RETURN
; end of _dd_Indicator_switchBoolValueP

_dd_Indicator_switchBoolValue:

;dd_indicators.c,160 :: 		void dd_Indicator_switchBoolValue(Indicator_ID id) {
;dd_indicators.c,161 :: 		unsigned char indicatorIndex = dd_getIndicatorIndex(id);
	PUSH	W10
	CALL	_dd_getIndicatorIndex
; indicatorIndex start address is: 4 (W2)
	MOV.B	W0, W2
;dd_indicators.c,162 :: 		if(dd_currentIndicators[indicatorIndex]->valueType == BOOL){
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W1
	MOV.B	#112, W0
	AND.B	W1, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
	CP.B	W1, #3
	BRA Z	L__dd_Indicator_switchBoolValue69
	GOTO	L_dd_Indicator_switchBoolValue20
L__dd_Indicator_switchBoolValue69:
;dd_indicators.c,163 :: 		((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value = !((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value;
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #20, W1
	CP0.B	[W1]
	CLR.B	W0
	BRA NZ	L__dd_Indicator_switchBoolValue70
	INC.B	W0
L__dd_Indicator_switchBoolValue70:
	MOV.B	W0, [W1]
;dd_indicators.c,164 :: 		dd_Indicator_requestPrintUpdate(indicatorIndex);
	MOV.B	W2, W10
; indicatorIndex end address is: 4 (W2)
	CALL	_dd_Indicator_requestPrintUpdate
;dd_indicators.c,165 :: 		}
L_dd_Indicator_switchBoolValue20:
;dd_indicators.c,166 :: 		}
L_end_dd_Indicator_switchBoolValue:
	POP	W10
	RETURN
; end of _dd_Indicator_switchBoolValue

_dd_Indicator_setAsVisible:

;dd_indicators.c,168 :: 		void dd_Indicator_setAsVisible(unsigned char indicatorIndex) {
;dd_indicators.c,169 :: 		dd_currentIndicators[indicatorIndex]->isVisible = TRUE;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	BSET.B	[W0], #2
;dd_indicators.c,170 :: 		}
L_end_dd_Indicator_setAsVisible:
	RETURN
; end of _dd_Indicator_setAsVisible

_dd_Indicator_hide:

;dd_indicators.c,172 :: 		void dd_Indicator_hide(unsigned char indicatorIndex) {
;dd_indicators.c,173 :: 		dd_currentIndicators[indicatorIndex]->isVisible = FALSE;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W0
	BCLR.B	[W0], #2
;dd_indicators.c,174 :: 		}
L_end_dd_Indicator_hide:
	RETURN
; end of _dd_Indicator_hide

_dd_Indicator_parseValueLabel:
	LNK	#2

;dd_indicators.c,176 :: 		void dd_Indicator_parseValueLabel(unsigned char indicatorIndex) {
;dd_indicators.c,177 :: 		Indicator* indicator = dd_currentIndicators[indicatorIndex];
	PUSH	W10
	PUSH	W11
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
; indicator start address is: 6 (W3)
	MOV	[W0], W3
;dd_indicators.c,178 :: 		unsigned char valueType = indicator->valueType;
	MOV	[W0], W0
	ADD	W0, #8, W0
	MOV.B	[W0], W2
	MOV.B	#112, W0
	AND.B	W2, W0, W1
	ZE	W1, W0
	LSR	W0, #4, W1
; valueType start address is: 0 (W0)
	MOV.B	W1, W0
;dd_indicators.c,179 :: 		if (indicator->parseValueLabel) {
	BTSS.B	W2, #3
	GOTO	L_dd_Indicator_parseValueLabel21
;dd_indicators.c,180 :: 		switch (valueType) {
	GOTO	L_dd_Indicator_parseValueLabel22
; valueType end address is: 0 (W0)
;dd_indicators.c,181 :: 		case INT:
L_dd_Indicator_parseValueLabel24:
;dd_indicators.c,182 :: 		sprintf(indicator->label, "%i", ((IntegerIndicator*) indicator)->value);
	ADD	W3, #20, W0
	MOV	[W0], W0
	ADD	W3, #10, W1
	PUSH	W3
	PUSH	W0
	MOV	#lo_addr(?lstr_1_dd_indicators), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP	W3
;dd_indicators.c,183 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,184 :: 		case FLOAT:
L_dd_Indicator_parseValueLabel25:
;dd_indicators.c,185 :: 		sprintf(indicator->label, "%.2f", ((FloatIndicator*) indicator)->value);
	ADD	W3, #20, W0
	ADD	W3, #10, W1
	PUSH	W3
	PUSH	[W0++]
	PUSH	[W0--]
	MOV	#lo_addr(?lstr_2_dd_indicators), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#8, W15
	POP	W3
;dd_indicators.c,186 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,187 :: 		case BOOL:
L_dd_Indicator_parseValueLabel26:
;dd_indicators.c,188 :: 		if (((BooleanIndicator*) indicator)->value) {
	ADD	W3, #20, W0
	CP0.B	[W0]
	BRA NZ	L__dd_Indicator_parseValueLabel74
	GOTO	L_dd_Indicator_parseValueLabel27
L__dd_Indicator_parseValueLabel74:
;dd_indicators.c,189 :: 		strcpy(indicator->label, TRUE_STRING);
	ADD	W3, #10, W0
	PUSH	W3
	MOV	#lo_addr(?lstr3_dd_indicators), W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W3
;dd_indicators.c,190 :: 		} else {
	GOTO	L_dd_Indicator_parseValueLabel28
L_dd_Indicator_parseValueLabel27:
;dd_indicators.c,191 :: 		strcpy(indicator->label, FALSE_STRING);
	ADD	W3, #10, W0
	PUSH	W3
	MOV	#lo_addr(?lstr4_dd_indicators), W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W3
;dd_indicators.c,192 :: 		}
L_dd_Indicator_parseValueLabel28:
;dd_indicators.c,193 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,194 :: 		case STRING:
L_dd_Indicator_parseValueLabel29:
;dd_indicators.c,195 :: 		strcpy(indicator->label, ((StringIndicator*) indicator)->value);
	ADD	W3, #20, W1
	ADD	W3, #10, W0
	PUSH	W3
	MOV	[W1], W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W3
;dd_indicators.c,196 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,197 :: 		case INT_COUPLE:
L_dd_Indicator_parseValueLabel30:
;dd_indicators.c,198 :: 		sprintf(indicator->label, "%3d %3d", ((IntCoupleIndicator*) indicator)->value.first, ((IntCoupleIndicator*) indicator)->value.second);
	ADD	W3, #20, W1
	ADD	W1, #2, W0
	MOV	[W0], W2
	MOV	[W1], W0
	ADD	W3, #10, W1
	PUSH	W3
	PUSH	W2
	PUSH	W0
	MOV	#lo_addr(?lstr_5_dd_indicators), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#8, W15
	POP	W3
;dd_indicators.c,199 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,200 :: 		default:
L_dd_Indicator_parseValueLabel31:
;dd_indicators.c,201 :: 		break;
	GOTO	L_dd_Indicator_parseValueLabel23
;dd_indicators.c,202 :: 		}
L_dd_Indicator_parseValueLabel22:
; valueType start address is: 0 (W0)
	CP.B	W0, #1
	BRA NZ	L__dd_Indicator_parseValueLabel75
	GOTO	L_dd_Indicator_parseValueLabel24
L__dd_Indicator_parseValueLabel75:
	CP.B	W0, #2
	BRA NZ	L__dd_Indicator_parseValueLabel76
	GOTO	L_dd_Indicator_parseValueLabel25
L__dd_Indicator_parseValueLabel76:
	CP.B	W0, #3
	BRA NZ	L__dd_Indicator_parseValueLabel77
	GOTO	L_dd_Indicator_parseValueLabel26
L__dd_Indicator_parseValueLabel77:
	CP.B	W0, #0
	BRA NZ	L__dd_Indicator_parseValueLabel78
	GOTO	L_dd_Indicator_parseValueLabel29
L__dd_Indicator_parseValueLabel78:
	CP.B	W0, #4
	BRA NZ	L__dd_Indicator_parseValueLabel79
	GOTO	L_dd_Indicator_parseValueLabel30
L__dd_Indicator_parseValueLabel79:
; valueType end address is: 0 (W0)
	GOTO	L_dd_Indicator_parseValueLabel31
L_dd_Indicator_parseValueLabel23:
;dd_indicators.c,203 :: 		indicator->labelLength = (unsigned char) strlen(indicator->label);
	ADD	W3, #9, W0
	MOV	W0, [W14+0]
	ADD	W3, #10, W0
; indicator end address is: 6 (W3)
	MOV	W0, W10
	CALL	_strlen
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;dd_indicators.c,204 :: 		}
L_dd_Indicator_parseValueLabel21:
;dd_indicators.c,205 :: 		}
L_end_dd_Indicator_parseValueLabel:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Indicator_parseValueLabel
