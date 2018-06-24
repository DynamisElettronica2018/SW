
_dd_Dashboard_init:

;dd_dashboard.c,56 :: 		void dd_Dashboard_init() {
;dd_dashboard.c,57 :: 		}
L_end_dd_Dashboard_init:
	RETURN
; end of _dd_Dashboard_init

_dd_Dashboard_getIndicatorIndexAtPosition:

;dd_dashboard.c,59 :: 		unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position) {
;dd_dashboard.c,60 :: 		return (unsigned char) position;
	MOV.B	W10, W0
;dd_dashboard.c,61 :: 		}
L_end_dd_Dashboard_getIndicatorIndexAtPosition:
	RETURN
; end of _dd_Dashboard_getIndicatorIndexAtPosition

_dd_Dashboard_printGearLetter:
	LNK	#2

;dd_dashboard.c,66 :: 		void dd_Dashboard_printGearLetter(void) {
;dd_dashboard.c,67 :: 		unsigned char newLetter = dGear_getCurrentGearLetter();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dGear_getCurrentGearLetter
	MOV.B	W0, [W14+0]
;dd_dashboard.c,68 :: 		if (newLetter!=dd_lastPrintedGearLetter || dd_GraphicController_isFrameUpdateForced()) {
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W1
	CP.B	W0, [W1]
	BRA Z	L__dd_Dashboard_printGearLetter19
	GOTO	L__dd_Dashboard_printGearLetter12
L__dd_Dashboard_printGearLetter19:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printGearLetter20
	GOTO	L__dd_Dashboard_printGearLetter11
L__dd_Dashboard_printGearLetter20:
	GOTO	L_dd_Dashboard_printGearLetter2
L__dd_Dashboard_printGearLetter12:
L__dd_Dashboard_printGearLetter11:
;dd_dashboard.c,69 :: 		eGlcd_setFont(DD_Gears_Font);
	MOV	#48, W13
	MOV.B	#59, W12
	MOV.B	#40, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_Gears40x59), W10
	CALL	_xGlcd_Set_Font
;dd_dashboard.c,70 :: 		eGlcd_overwriteChar(dd_lastPrintedGearLetter, newLetter, GEAR_LETTER_X, GEAR_LETTER_Y);
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W0
	MOV.B	#3, W13
	MOV.B	#44, W12
	MOV.B	[W14+0], W11
	MOV.B	[W0], W10
	CALL	_eGlcd_overwriteChar
;dd_dashboard.c,71 :: 		dd_lastPrintedGearLetter = newLetter;
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;dd_dashboard.c,72 :: 		}
L_dd_Dashboard_printGearLetter2:
;dd_dashboard.c,73 :: 		}
L_end_dd_Dashboard_printGearLetter:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printGearLetter

_dd_Indicator_getLabelYCoord:

;dd_dashboard.c,75 :: 		/*static*/ unsigned char dd_Indicator_getLabelYCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,76 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,77 :: 		((INDICATOR_HEIGHT - (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT)) / 2) +
	ZE	W0, W0
	ADD	W0, #9, W0
;dd_dashboard.c,78 :: 		(INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT) - (DASHBOARD_FONT_HEIGHT / 2) +
	ADD	W0, #11, W0
	SUB	W0, #8, W0
;dd_dashboard.c,79 :: 		INDICATOR_MARGIN);
	INC	W0
;dd_dashboard.c,80 :: 		}
L_end_dd_Indicator_getLabelYCoord:
	RETURN
; end of _dd_Indicator_getLabelYCoord

_dd_Indicator_getLabelXCoord:

;dd_dashboard.c,82 :: 		/*static*/ unsigned char dd_Indicator_getLabelXCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,83 :: 		unsigned char length = dd_currentIndicators[indicatorIndex]->labelLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #9, W3
;dd_dashboard.c,84 :: 		return (unsigned char) ((DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] + INDICATOR_WIDTH / 2) -
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #20, W2
;dd_dashboard.c,85 :: 		(length * INDICATOR_FONT_WIDTH) / 2 );
	ZE	[W3], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_dashboard.c,86 :: 		}
L_end_dd_Indicator_getLabelXCoord:
	RETURN
; end of _dd_Indicator_getLabelXCoord

_dd_Indicator_getNameXCoord:

;dd_dashboard.c,88 :: 		/*static*/ unsigned char dd_Indicator_getNameXCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,89 :: 		unsigned char length = dd_currentIndicators[indicatorIndex]->nameLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #6, W3
;dd_dashboard.c,90 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] +
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,91 :: 		INDICATOR_WIDTH / 2 - ( length * INDICATOR_FONT_WIDTH) / 2);
	ZE	W0, W0
	ADD	W0, #20, W2
	ZE	[W3], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_dashboard.c,92 :: 		}
L_end_dd_Indicator_getNameXCoord:
	RETURN
; end of _dd_Indicator_getNameXCoord

_dd_Indicator_getNameYCoord:

;dd_dashboard.c,94 :: 		/*static*/ unsigned char dd_Indicator_getNameYCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,95 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,96 :: 		INDICATOR_RADIUS);
	ZE	W0, W0
	ADD	W0, #3, W0
;dd_dashboard.c,97 :: 		}
L_end_dd_Indicator_getNameYCoord:
	RETURN
; end of _dd_Indicator_getNameYCoord

_dd_Indicator_drawContainers:

;dd_dashboard.c,102 :: 		/*static*/ void dd_Indicator_drawContainers(unsigned char indicatorIndex) {
;dd_dashboard.c,104 :: 		x = DASHBOARD_POSITION_COORDINATES[indicatorIndex][X];
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W2
;dd_dashboard.c,105 :: 		y = DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y];
	INC	W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,107 :: 		eGlcd(eGlcd_drawRect(
	ZE	W0, W0
	ADD	W0, #1, W1
	ZE	W2, W0
	INC	W0
	MOV.B	#29, W13
	MOV.B	#41, W12
	MOV.B	W1, W11
	MOV.B	W0, W10
	CALL	_eGlcd_drawRect
;dd_dashboard.c,113 :: 		}
L_end_dd_Indicator_drawContainers:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Indicator_drawContainers

dd_dashboard_dd_Dashboard_printIndicator:
	LNK	#6

;dd_dashboard.c,119 :: 		static void dd_Dashboard_printIndicator(unsigned char indicatorIndex) {
;dd_dashboard.c,120 :: 		Indicator* indicator = dd_currentIndicators[indicatorIndex];
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;dd_dashboard.c,125 :: 		dd_Indicator_drawContainers(indicatorIndex);
	PUSH	W10
	CALL	_dd_Indicator_drawContainers
	POP	W10
;dd_dashboard.c,126 :: 		x = dd_Indicator_getNameXCoord(indicatorIndex);
	CALL	_dd_Indicator_getNameXCoord
	MOV.B	W0, [W14+2]
;dd_dashboard.c,127 :: 		y = dd_Indicator_getNameYCoord(indicatorIndex);
	CALL	_dd_Indicator_getNameYCoord
	MOV.B	W0, [W14+3]
;dd_dashboard.c,128 :: 		eGlcd_setFont(DD_xTerminal_Font);
	PUSH	W10
	MOV	#32, W13
	MOV.B	#8, W12
	MOV.B	#6, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_xTerminal6x8), W10
	CALL	_xGlcd_Set_Font
;dd_dashboard.c,130 :: 		eGlcd_overwriteText(indicator->name, indicator->name, x, y);
	MOV	[W14+0], W0
	INC2	W0
	MOV.B	[W14+3], W13
	MOV.B	[W14+2], W12
	MOV	[W0], W11
	MOV	[W0], W10
	CALL	_eGlcd_overwriteText
;dd_dashboard.c,133 :: 		oldLabelLength = indicator->labelLength;
	MOV	[W14+0], W0
	ADD	W0, #9, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+4]
;dd_dashboard.c,134 :: 		eGlcd_setFont(DD_Dashboard_Font);
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_dashboard.c,136 :: 		x = dd_Indicator_getLabelXCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelXCoord
	MOV.B	W0, [W14+2]
;dd_dashboard.c,137 :: 		y = dd_Indicator_getLabelYCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelYCoord
	MOV.B	W0, [W14+3]
;dd_dashboard.c,139 :: 		eGlcd_clearText(indicator->label, x, y);
	MOV	[W14+0], W1
	ADD	W1, #10, W1
	PUSH	W10
	MOV.B	W0, W12
	MOV.B	[W14+2], W11
	MOV	W1, W10
	CALL	_eGlcd_clearText
	POP	W10
;dd_dashboard.c,141 :: 		dd_Indicator_parseValueLabel(indicatorIndex);
	PUSH	W10
	CALL	_dd_Indicator_parseValueLabel
	POP	W10
;dd_dashboard.c,142 :: 		if (oldLabelLength != indicator->labelLength) {
	MOV	[W14+0], W0
	ADD	W0, #9, W1
	MOV.B	[W14+4], W0
	CP.B	W0, [W1]
	BRA NZ	L_dd_dashboard_dd_Dashboard_printIndicator27
	GOTO	L_dd_dashboard_dd_Dashboard_printIndicator3
L_dd_dashboard_dd_Dashboard_printIndicator27:
;dd_dashboard.c,144 :: 		x = dd_Indicator_getLabelXCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelXCoord
	MOV.B	W0, [W14+2]
;dd_dashboard.c,145 :: 		}
L_dd_dashboard_dd_Dashboard_printIndicator3:
;dd_dashboard.c,146 :: 		eGlcd_writeText(indicator->label, x, y);
	MOV	[W14+0], W0
	ADD	W0, #10, W0
	PUSH	W10
	MOV.B	[W14+3], W12
	MOV.B	[W14+2], W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
	POP	W10
;dd_dashboard.c,148 :: 		dd_Indicator_clearPrintUpdateRequest(indicatorIndex);
	CALL	_dd_Indicator_clearPrintUpdateRequest
;dd_dashboard.c,149 :: 		}
L_end_dd_Dashboard_printIndicator:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of dd_dashboard_dd_Dashboard_printIndicator

_dd_Dashboard_printIndicators:
	LNK	#2

;dd_dashboard.c,158 :: 		void dd_Dashboard_printIndicators(void) {
;dd_dashboard.c,161 :: 		for (index = 0; index < DASHBOARD_INDICATORS_COUNT; index++) {
	PUSH	W10
	CLR	W0
	MOV.B	W0, [W14+0]
L_dd_Dashboard_printIndicators4:
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA LTU	L__dd_Dashboard_printIndicators29
	GOTO	L_dd_Dashboard_printIndicators5
L__dd_Dashboard_printIndicators29:
;dd_dashboard.c,162 :: 		if (dd_Indicator_isRequestingUpdate(index) ||
	MOV.B	[W14+0], W10
	CALL	_dd_Indicator_isRequestingUpdate
;dd_dashboard.c,163 :: 		dd_GraphicController_isFrameUpdateForced()) {
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators30
	GOTO	L__dd_Dashboard_printIndicators15
L__dd_Dashboard_printIndicators30:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators31
	GOTO	L__dd_Dashboard_printIndicators14
L__dd_Dashboard_printIndicators31:
	GOTO	L_dd_Dashboard_printIndicators9
L__dd_Dashboard_printIndicators15:
L__dd_Dashboard_printIndicators14:
;dd_dashboard.c,165 :: 		dd_Dashboard_printIndicator(index);
	MOV.B	[W14+0], W10
	CALL	dd_dashboard_dd_Dashboard_printIndicator
;dd_dashboard.c,168 :: 		}
L_dd_Dashboard_printIndicators9:
;dd_dashboard.c,161 :: 		for (index = 0; index < DASHBOARD_INDICATORS_COUNT; index++) {
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;dd_dashboard.c,169 :: 		}
	GOTO	L_dd_Dashboard_printIndicators4
L_dd_Dashboard_printIndicators5:
;dd_dashboard.c,174 :: 		}
L_end_dd_Dashboard_printIndicators:
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printIndicators

_dd_Dashboard_print:

;dd_dashboard.c,178 :: 		void dd_Dashboard_print(void) {
;dd_dashboard.c,181 :: 		dd_Dashboard_printGearLetter();
	CALL	_dd_Dashboard_printGearLetter
;dd_dashboard.c,187 :: 		dd_Dashboard_printIndicators();
	CALL	_dd_Dashboard_printIndicators
;dd_dashboard.c,188 :: 		}
L_end_dd_Dashboard_print:
	RETURN
; end of _dd_Dashboard_print
