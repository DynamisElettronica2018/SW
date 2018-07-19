
_dd_Dashboard_init:

;dd_dashboard.c,57 :: 		void dd_Dashboard_init() {
;dd_dashboard.c,58 :: 		}
L_end_dd_Dashboard_init:
	RETURN
; end of _dd_Dashboard_init

_dd_Dashboard_getIndicatorIndexAtPosition:

;dd_dashboard.c,60 :: 		unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position) {
;dd_dashboard.c,61 :: 		return (unsigned char) position;
	MOV.B	W10, W0
;dd_dashboard.c,62 :: 		}
L_end_dd_Dashboard_getIndicatorIndexAtPosition:
	RETURN
; end of _dd_Dashboard_getIndicatorIndexAtPosition

_dd_Dashboard_printGearLetter:
	LNK	#2

;dd_dashboard.c,67 :: 		void dd_Dashboard_printGearLetter(void) {
;dd_dashboard.c,68 :: 		unsigned char newLetter = dGear_getCurrentGearLetter();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dGear_getCurrentGearLetter
	MOV.B	W0, [W14+0]
;dd_dashboard.c,69 :: 		if (newLetter!=dd_lastPrintedGearLetter || dd_GraphicController_isFrameUpdateForced()) {
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W1
	CP.B	W0, [W1]
	BRA Z	L__dd_Dashboard_printGearLetter21
	GOTO	L__dd_Dashboard_printGearLetter14
L__dd_Dashboard_printGearLetter21:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printGearLetter22
	GOTO	L__dd_Dashboard_printGearLetter13
L__dd_Dashboard_printGearLetter22:
	GOTO	L_dd_Dashboard_printGearLetter2
L__dd_Dashboard_printGearLetter14:
L__dd_Dashboard_printGearLetter13:
;dd_dashboard.c,70 :: 		eGlcd_setFont(DD_Gears_Font);
	MOV	#48, W13
	MOV.B	#59, W12
	MOV.B	#40, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_Gears40x59), W10
	CALL	_xGlcd_Set_Font
;dd_dashboard.c,71 :: 		eGlcd_overwriteChar(dd_lastPrintedGearLetter, newLetter, GEAR_LETTER_X, GEAR_LETTER_Y);
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W0
	MOV.B	#3, W13
	MOV.B	#44, W12
	MOV.B	[W14+0], W11
	MOV.B	[W0], W10
	CALL	_eGlcd_overwriteChar
;dd_dashboard.c,72 :: 		dd_lastPrintedGearLetter = newLetter;
	MOV	#lo_addr(dd_dashboard_dd_lastPrintedGearLetter), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;dd_dashboard.c,73 :: 		}
L_dd_Dashboard_printGearLetter2:
;dd_dashboard.c,74 :: 		}
L_end_dd_Dashboard_printGearLetter:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printGearLetter

_dd_Indicator_getLabelYCoord:

;dd_dashboard.c,76 :: 		/*static*/ unsigned char dd_Indicator_getLabelYCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,77 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,78 :: 		((INDICATOR_HEIGHT - (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT)) / 2) +
	ZE	W0, W0
	ADD	W0, #9, W0
;dd_dashboard.c,79 :: 		(INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT) - (DASHBOARD_FONT_HEIGHT / 2) +
	ADD	W0, #11, W0
	SUB	W0, #8, W0
;dd_dashboard.c,80 :: 		INDICATOR_MARGIN);
	INC	W0
;dd_dashboard.c,81 :: 		}
L_end_dd_Indicator_getLabelYCoord:
	RETURN
; end of _dd_Indicator_getLabelYCoord

_dd_Indicator_getLabelXCoord:

;dd_dashboard.c,83 :: 		/*static*/ unsigned char dd_Indicator_getLabelXCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,84 :: 		unsigned char length = dd_currentIndicators[indicatorIndex]->labelLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #9, W3
;dd_dashboard.c,85 :: 		return (unsigned char) ((DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] + INDICATOR_WIDTH / 2) -
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #20, W2
;dd_dashboard.c,86 :: 		(length * INDICATOR_FONT_WIDTH) / 2 );
	ZE	[W3], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_dashboard.c,87 :: 		}
L_end_dd_Indicator_getLabelXCoord:
	RETURN
; end of _dd_Indicator_getLabelXCoord

_dd_Indicator_getNameXCoord:

;dd_dashboard.c,89 :: 		/*static*/ unsigned char dd_Indicator_getNameXCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,90 :: 		unsigned char length = dd_currentIndicators[indicatorIndex]->nameLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #6, W3
;dd_dashboard.c,91 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] +
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,92 :: 		INDICATOR_WIDTH / 2 - ( length * INDICATOR_FONT_WIDTH) / 2);
	ZE	W0, W0
	ADD	W0, #20, W2
	ZE	[W3], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_dashboard.c,93 :: 		}
L_end_dd_Indicator_getNameXCoord:
	RETURN
; end of _dd_Indicator_getNameXCoord

_dd_Indicator_getNameYCoord:

;dd_dashboard.c,95 :: 		/*static*/ unsigned char dd_Indicator_getNameYCoord(unsigned char indicatorIndex) {
;dd_dashboard.c,96 :: 		return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_dashboard_DASHBOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,97 :: 		INDICATOR_RADIUS);
	ZE	W0, W0
	ADD	W0, #3, W0
;dd_dashboard.c,98 :: 		}
L_end_dd_Indicator_getNameYCoord:
	RETURN
; end of _dd_Indicator_getNameYCoord

_dd_Indicator_drawContainers:

;dd_dashboard.c,103 :: 		/*static*/ void dd_Indicator_drawContainers(unsigned char indicatorIndex) {
;dd_dashboard.c,105 :: 		x = DASHBOARD_POSITION_COORDINATES[indicatorIndex][X];
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
;dd_dashboard.c,106 :: 		y = DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y];
	INC	W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_dashboard.c,108 :: 		eGlcd(eGlcd_drawRect(
	ZE	W0, W0
	ADD	W0, #1, W1
	ZE	W2, W0
	INC	W0
	MOV.B	#29, W13
	MOV.B	#41, W12
	MOV.B	W1, W11
	MOV.B	W0, W10
	CALL	_eGlcd_drawRect
;dd_dashboard.c,114 :: 		}
L_end_dd_Indicator_drawContainers:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Indicator_drawContainers

dd_dashboard_dd_Dashboard_printIndicator:
	LNK	#4

;dd_dashboard.c,120 :: 		static void dd_Dashboard_printIndicator(unsigned char indicatorIndex) {
;dd_dashboard.c,121 :: 		Indicator* indicator = dd_currentIndicators[indicatorIndex];
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;dd_dashboard.c,124 :: 		if (dd_GraphicController_isFrameUpdateForced()) {
	PUSH	W10
	CALL	_dd_GraphicController_isFrameUpdateForced
	POP	W10
	CP0.B	W0
	BRA NZ	L_dd_dashboard_dd_Dashboard_printIndicator29
	GOTO	L_dd_dashboard_dd_Dashboard_printIndicator3
L_dd_dashboard_dd_Dashboard_printIndicator29:
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
;dd_dashboard.c,129 :: 		eGlcd_writeText(indicator->name, x, y);
	MOV	[W14+0], W0
	INC2	W0
	MOV.B	[W14+3], W12
	MOV.B	[W14+2], W11
	MOV	[W0], W10
	CALL	_eGlcd_writeText
;dd_dashboard.c,130 :: 		eGlcd_setFont(DD_Dashboard_Font);
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_dashboard.c,131 :: 		}
L_dd_dashboard_dd_Dashboard_printIndicator3:
;dd_dashboard.c,134 :: 		x = dd_Indicator_getLabelXCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelXCoord
	MOV.B	W0, [W14+2]
;dd_dashboard.c,135 :: 		y = dd_Indicator_getLabelYCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelYCoord
	MOV.B	W0, [W14+3]
;dd_dashboard.c,137 :: 		eGlcd_clearText(indicator->label, x, y);
	MOV	[W14+0], W1
	ADD	W1, #10, W1
	PUSH	W10
	MOV.B	W0, W12
	MOV.B	[W14+2], W11
	MOV	W1, W10
	CALL	_eGlcd_clearText
	POP	W10
;dd_dashboard.c,139 :: 		if(dd_Indicator_isRequestingUpdate(indicatorIndex))
	PUSH	W10
	CALL	_dd_Indicator_isRequestingUpdate
	POP	W10
	CP0.B	W0
	BRA NZ	L_dd_dashboard_dd_Dashboard_printIndicator30
	GOTO	L_dd_dashboard_dd_Dashboard_printIndicator4
L_dd_dashboard_dd_Dashboard_printIndicator30:
;dd_dashboard.c,141 :: 		dd_Indicator_parseValueLabel(indicatorIndex);
	PUSH	W10
	CALL	_dd_Indicator_parseValueLabel
	POP	W10
;dd_dashboard.c,142 :: 		x = dd_Indicator_getLabelXCoord(indicatorIndex);
	CALL	_dd_Indicator_getLabelXCoord
	MOV.B	W0, [W14+2]
;dd_dashboard.c,143 :: 		dd_Indicator_clearPrintUpdateRequest(indicatorIndex);
	CALL	_dd_Indicator_clearPrintUpdateRequest
;dd_dashboard.c,144 :: 		}
L_dd_dashboard_dd_Dashboard_printIndicator4:
;dd_dashboard.c,145 :: 		eGlcd_writeText(indicator->label, x, y);
	MOV	[W14+0], W0
	ADD	W0, #10, W0
	MOV.B	[W14+3], W12
	MOV.B	[W14+2], W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
;dd_dashboard.c,146 :: 		}
L_end_dd_Dashboard_printIndicator:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of dd_dashboard_dd_Dashboard_printIndicator

_dd_Dashboard_printIndicators:
	LNK	#2

;dd_dashboard.c,155 :: 		void dd_Dashboard_printIndicators(void) {
;dd_dashboard.c,157 :: 		eGlcd_setFont(DD_Dashboard_Font);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_dashboard_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;dd_dashboard.c,158 :: 		for (index = 0; index < DASHBOARD_INDICATORS_COUNT; index++) {
	CLR	W0
	MOV.B	W0, [W14+0]
L_dd_Dashboard_printIndicators5:
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA LTU	L__dd_Dashboard_printIndicators32
	GOTO	L_dd_Dashboard_printIndicators6
L__dd_Dashboard_printIndicators32:
;dd_dashboard.c,159 :: 		if (dd_Indicator_isRequestingUpdate(index) ||
	MOV.B	[W14+0], W10
	CALL	_dd_Indicator_isRequestingUpdate
;dd_dashboard.c,160 :: 		dd_GraphicController_isFrameUpdateForced()) {
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators33
	GOTO	L__dd_Dashboard_printIndicators17
L__dd_Dashboard_printIndicators33:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators34
	GOTO	L__dd_Dashboard_printIndicators16
L__dd_Dashboard_printIndicators34:
	GOTO	L_dd_Dashboard_printIndicators10
L__dd_Dashboard_printIndicators17:
L__dd_Dashboard_printIndicators16:
;dd_dashboard.c,161 :: 		dd_Dashboard_printIndicator(index);
	MOV.B	[W14+0], W10
	CALL	dd_dashboard_dd_Dashboard_printIndicator
;dd_dashboard.c,162 :: 		}
L_dd_Dashboard_printIndicators10:
;dd_dashboard.c,158 :: 		for (index = 0; index < DASHBOARD_INDICATORS_COUNT; index++) {
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;dd_dashboard.c,163 :: 		}
	GOTO	L_dd_Dashboard_printIndicators5
L_dd_Dashboard_printIndicators6:
;dd_dashboard.c,164 :: 		}
L_end_dd_Dashboard_printIndicators:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printIndicators

_dd_Dashboard_print:

;dd_dashboard.c,168 :: 		void dd_Dashboard_print(void) {
;dd_dashboard.c,169 :: 		if(dd_GraphicController_isFrameUpdateForced())
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_Dashboard_print36
	GOTO	L_dd_Dashboard_print11
L__dd_Dashboard_print36:
;dd_dashboard.c,170 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
L_dd_Dashboard_print11:
;dd_dashboard.c,171 :: 		dd_Dashboard_printGearLetter();
	CALL	_dd_Dashboard_printGearLetter
;dd_dashboard.c,172 :: 		dd_Dashboard_printIndicators();
	CALL	_dd_Dashboard_printIndicators
;dd_dashboard.c,173 :: 		}
L_end_dd_Dashboard_print:
	RETURN
; end of _dd_Dashboard_print
