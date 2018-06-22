
_dd_boardDebug_reset:

;dd_boardDebug.c,46 :: 		void dd_boardDebug_reset(void) {
;dd_boardDebug.c,47 :: 		dd_boardDebug_SelectedLineIndex = 0;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,48 :: 		dd_boardDebug_FirstLineIndex = 0;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,49 :: 		}
L_end_dd_boardDebug_reset:
	RETURN
; end of _dd_boardDebug_reset

_dd_boardDebug_init:

;dd_boardDebug.c,51 :: 		void dd_boardDebug_init() {
;dd_boardDebug.c,52 :: 		dd_boardDebug_reset();
	CALL	_dd_boardDebug_reset
;dd_boardDebug.c,53 :: 		}
L_end_dd_boardDebug_init:
	RETURN
; end of _dd_boardDebug_init

_dd_boardDebug_setY_OFFSET:

;dd_boardDebug.c,55 :: 		void dd_boardDebug_setY_OFFSET(unsigned char y) {
;dd_boardDebug.c,56 :: 		dd_boardDebug_Y_OFFSET = y;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Y_OFFSET), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,57 :: 		dd_boardDebug_Height = dd_boardDebug_Height_param + dd_boardDebug_Y_OFFSET;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height), W0
	ADD.B	W10, [W1], [W0]
;dd_boardDebug.c,58 :: 		}
L_end_dd_boardDebug_setY_OFFSET:
	RETURN
; end of _dd_boardDebug_setY_OFFSET

_dd_boardDebug_setX_OFFSET:

;dd_boardDebug.c,60 :: 		void dd_boardDebug_setX_OFFSET(unsigned char x) {
;dd_boardDebug.c,61 :: 		dd_boardDebug_X_OFFSET = x;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_X_OFFSET), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,62 :: 		}
L_end_dd_boardDebug_setX_OFFSET:
	RETURN
; end of _dd_boardDebug_setX_OFFSET

_dd_boardDebug_setHeight:

;dd_boardDebug.c,64 :: 		void dd_boardDebug_setHeight(unsigned char height) {
;dd_boardDebug.c,65 :: 		if (height > MAX_BOARD_DEBUG_HEIGHT) {
	CP.B	W10, #8
	BRA GTU	L__dd_boardDebug_setHeight61
	GOTO	L_dd_boardDebug_setHeight0
L__dd_boardDebug_setHeight61:
;dd_boardDebug.c,66 :: 		height = MAX_BOARD_DEBUG_HEIGHT;
	MOV.B	#8, W10
;dd_boardDebug.c,67 :: 		}
L_dd_boardDebug_setHeight0:
;dd_boardDebug.c,68 :: 		dd_boardDebug_Height_param = height;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,69 :: 		dd_boardDebug_Height = dd_boardDebug_Height_param + dd_boardDebug_Y_OFFSET;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Y_OFFSET), W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height), W0
	ADD.B	W10, [W1], [W0]
;dd_boardDebug.c,70 :: 		}
L_end_dd_boardDebug_setHeight:
	RETURN
; end of _dd_boardDebug_setHeight

_dd_boardDebug_setWidth:

;dd_boardDebug.c,72 :: 		void dd_boardDebug_setWidth(unsigned char width) {
;dd_boardDebug.c,73 :: 		if (width > MAX_BOARD_DEBUG_WIDTH) {
	CP.B	W10, #18
	BRA GTU	L__dd_boardDebug_setWidth63
	GOTO	L_dd_boardDebug_setWidth1
L__dd_boardDebug_setWidth63:
;dd_boardDebug.c,74 :: 		width = MAX_BOARD_DEBUG_WIDTH;
	MOV.B	#18, W10
;dd_boardDebug.c,75 :: 		}
L_dd_boardDebug_setWidth1:
;dd_boardDebug.c,76 :: 		dd_boardDebug_Width = width;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Width), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,77 :: 		}
L_end_dd_boardDebug_setWidth:
	RETURN
; end of _dd_boardDebug_setWidth

_dd_boardDebug_scroll:

;dd_boardDebug.c,80 :: 		void dd_boardDebug_scroll(signed char movements) {
;dd_boardDebug.c,82 :: 		dd_boardDebug_FirstLineIndex+=movements;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W1
	SE	W10, W0
	ADD	W1, W0, W2
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	MOV.B	W2, [W0]
;dd_boardDebug.c,83 :: 		if ( dd_boardDebug_FirstLineIndex > dd_currentIndicatorsCount - dd_boardDebug_Height_param ) {
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CP	W2, W0
	BRA GTU	L__dd_boardDebug_scroll65
	GOTO	L_dd_boardDebug_scroll2
L__dd_boardDebug_scroll65:
;dd_boardDebug.c,84 :: 		dd_boardDebug_FirstLineIndex = dd_currentIndicatorsCount - 1 - dd_boardDebug_Height_param;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SUB.B	W2, [W1], [W0]
;dd_boardDebug.c,85 :: 		}
	GOTO	L_dd_boardDebug_scroll3
L_dd_boardDebug_scroll2:
;dd_boardDebug.c,86 :: 		else if (dd_boardDebug_FirstLineIndex < 0) {
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__dd_boardDebug_scroll66
	GOTO	L_dd_boardDebug_scroll4
L__dd_boardDebug_scroll66:
;dd_boardDebug.c,87 :: 		dd_boardDebug_FirstLineIndex = 0;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,88 :: 		}
L_dd_boardDebug_scroll4:
L_dd_boardDebug_scroll3:
;dd_boardDebug.c,89 :: 		for (i = dd_boardDebug_FirstLineIndex; i < dd_boardDebug_FirstLineIndex + dd_boardDebug_Height_param; i++) {
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
; i start address is: 4 (W2)
	MOV.B	[W0], W2
; i end address is: 4 (W2)
L_dd_boardDebug_scroll5:
; i start address is: 4 (W2)
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	ZE	W2, W0
	CP	W0, W1
	BRA LT	L__dd_boardDebug_scroll67
	GOTO	L_dd_boardDebug_scroll6
L__dd_boardDebug_scroll67:
;dd_boardDebug.c,90 :: 		dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,89 :: 		for (i = dd_boardDebug_FirstLineIndex; i < dd_boardDebug_FirstLineIndex + dd_boardDebug_Height_param; i++) {
	INC.B	W2
;dd_boardDebug.c,91 :: 		}
; i end address is: 4 (W2)
	GOTO	L_dd_boardDebug_scroll5
L_dd_boardDebug_scroll6:
;dd_boardDebug.c,92 :: 		}
L_end_dd_boardDebug_scroll:
	RETURN
; end of _dd_boardDebug_scroll

_dd_boardDebug_moveSelection:

;dd_boardDebug.c,94 :: 		void dd_boardDebug_moveSelection(signed char movements) {
;dd_boardDebug.c,95 :: 		dd_currentIndicators[dd_boardDebug_SelectedLineIndex]->pendingPrintUpdate = TRUE;
	PUSH	W10
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,96 :: 		dd_boardDebug_SelectedLineIndex+=movements;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W1
	SE	W10, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	MOV.B	W1, [W0]
;dd_boardDebug.c,97 :: 		if (dd_boardDebug_SelectedLineIndex >= dd_currentIndicatorsCount) {
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W0
	CP	W1, W0
	BRA GE	L__dd_boardDebug_moveSelection69
	GOTO	L_dd_boardDebug_moveSelection8
L__dd_boardDebug_moveSelection69:
;dd_boardDebug.c,98 :: 		dd_boardDebug_SelectedLineIndex = dd_currentIndicatorsCount - 1;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SUB.B	W1, #1, [W0]
;dd_boardDebug.c,99 :: 		}
	GOTO	L_dd_boardDebug_moveSelection9
L_dd_boardDebug_moveSelection8:
;dd_boardDebug.c,100 :: 		else if (dd_boardDebug_SelectedLineIndex < 0) {
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__dd_boardDebug_moveSelection70
	GOTO	L_dd_boardDebug_moveSelection10
L__dd_boardDebug_moveSelection70:
;dd_boardDebug.c,101 :: 		dd_boardDebug_SelectedLineIndex = 0;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,102 :: 		}
L_dd_boardDebug_moveSelection10:
L_dd_boardDebug_moveSelection9:
;dd_boardDebug.c,103 :: 		dd_currentIndicators[dd_boardDebug_SelectedLineIndex]->pendingPrintUpdate = TRUE;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,104 :: 		if (dd_boardDebug_SelectedLineIndex >= dd_boardDebug_FirstLineIndex + dd_boardDebug_Height_param){
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W0
	CP	W0, W1
	BRA GE	L__dd_boardDebug_moveSelection71
	GOTO	L_dd_boardDebug_moveSelection11
L__dd_boardDebug_moveSelection71:
;dd_boardDebug.c,105 :: 		dd_boardDebug_scroll(dd_boardDebug_SelectedLineIndex - dd_boardDebug_FirstLineIndex - dd_boardDebug_Height_param + 1);
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	INC	W0
	MOV.B	W0, W10
	CALL	_dd_boardDebug_scroll
;dd_boardDebug.c,106 :: 		}
	GOTO	L_dd_boardDebug_moveSelection12
L_dd_boardDebug_moveSelection11:
;dd_boardDebug.c,107 :: 		else if (dd_boardDebug_SelectedLineIndex < dd_boardDebug_FirstLineIndex){
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	CP.B	W1, [W0]
	BRA LT	L__dd_boardDebug_moveSelection72
	GOTO	L_dd_boardDebug_moveSelection13
L__dd_boardDebug_moveSelection72:
;dd_boardDebug.c,108 :: 		dd_boardDebug_scroll(dd_boardDebug_SelectedLineIndex - dd_boardDebug_FirstLineIndex);
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W0
	MOV.B	W0, W10
	CALL	_dd_boardDebug_scroll
;dd_boardDebug.c,109 :: 		}
L_dd_boardDebug_moveSelection13:
L_dd_boardDebug_moveSelection12:
;dd_boardDebug.c,110 :: 		}
L_end_dd_boardDebug_moveSelection:
	POP	W10
	RETURN
; end of _dd_boardDebug_moveSelection

_dd_boardDebug_isLineSelected:

;dd_boardDebug.c,112 :: 		char dd_boardDebug_isLineSelected(unsigned char lineIndex) {
;dd_boardDebug.c,113 :: 		return dd_boardDebug_SelectedLineIndex == lineIndex;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_SelectedLineIndex), W0
	SE	[W0], W1
	ZE	W10, W0
	CP	W1, W0
	CLR.B	W0
	BRA NZ	L__dd_boardDebug_isLineSelected74
	INC.B	W0
L__dd_boardDebug_isLineSelected74:
;dd_boardDebug.c,114 :: 		}
L_end_dd_boardDebug_isLineSelected:
	RETURN
; end of _dd_boardDebug_isLineSelected

_dd_boardDebugLine_getVisibleDescriptionWidth:

;dd_boardDebug.c,116 :: 		unsigned char dd_boardDebugLine_getVisibleDescriptionWidth(unsigned char lineIndex) {
;dd_boardDebug.c,118 :: 		labelLength = dd_currentIndicators[lineIndex]->labelLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #9, W0
; labelLength start address is: 4 (W2)
	MOV.B	[W0], W2
;dd_boardDebug.c,119 :: 		if (labelLength > 0) {
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GTU	L__dd_boardDebugLine_getVisibleDescriptionWidth76
	GOTO	L_dd_boardDebugLine_getVisibleDescriptionWidth14
L__dd_boardDebugLine_getVisibleDescriptionWidth76:
;dd_boardDebug.c,120 :: 		return (unsigned char) (dd_boardDebug_Width - labelLength - BOARD_DEBUG_DESCRIPTION_VALUE_SPACING);
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Width), W0
	ZE	[W0], W1
	ZE	W2, W0
; labelLength end address is: 4 (W2)
	SUB	W1, W0, W0
	DEC	W0
	GOTO	L_end_dd_boardDebugLine_getVisibleDescriptionWidth
;dd_boardDebug.c,121 :: 		} else {
L_dd_boardDebugLine_getVisibleDescriptionWidth14:
;dd_boardDebug.c,122 :: 		return dd_boardDebug_Width;
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Width), W0
	MOV.B	[W0], W0
;dd_boardDebug.c,124 :: 		}
L_end_dd_boardDebugLine_getVisibleDescriptionWidth:
	RETURN
; end of _dd_boardDebugLine_getVisibleDescriptionWidth

_dd_boardDebugLine_hasToScroll:
	LNK	#2

;dd_boardDebug.c,126 :: 		unsigned char dd_boardDebugLine_hasToScroll(unsigned char lineIndex) {
;dd_boardDebug.c,127 :: 		return dd_boardDebug_isLineSelected(lineIndex) &&
	CALL	_dd_boardDebug_isLineSelected
;dd_boardDebug.c,128 :: 		dd_currentIndicators[lineIndex]->descriptionLength > dd_boardDebugLine_getVisibleDescriptionWidth(lineIndex);
	CP0.B	W0
	BRA NZ	L__dd_boardDebugLine_hasToScroll78
	GOTO	L_dd_boardDebugLine_hasToScroll17
L__dd_boardDebugLine_hasToScroll78:
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #7, W0
	MOV	W0, [W14+0]
	CALL	_dd_boardDebugLine_getVisibleDescriptionWidth
	MOV	[W14+0], W1
	CP.B	W0, [W1]
	BRA LTU	L__dd_boardDebugLine_hasToScroll79
	GOTO	L_dd_boardDebugLine_hasToScroll17
L__dd_boardDebugLine_hasToScroll79:
	MOV.B	#1, W0
	GOTO	L_dd_boardDebugLine_hasToScroll16
L_dd_boardDebugLine_hasToScroll17:
	CLR	W0
L_dd_boardDebugLine_hasToScroll16:
;dd_boardDebug.c,129 :: 		}
L_end_dd_boardDebugLine_hasToScroll:
	ULNK
	RETURN
; end of _dd_boardDebugLine_hasToScroll

_dd_boardDebug_printLine:
	LNK	#22

;dd_boardDebug.c,131 :: 		void  dd_boardDebug_printLine(unsigned char lineIndex) {
;dd_boardDebug.c,134 :: 		lineNumber = lineIndex - dd_boardDebug_FirstLineIndex + dd_boardDebug_Y_OFFSET;
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W2
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Y_OFFSET), W1
	ADD	W14, #0, W0
	ADD.B	W2, [W1], [W0]
;dd_boardDebug.c,135 :: 		if (dd_boardDebug_isLineSelected(lineIndex)) {
	CALL	_dd_boardDebug_isLineSelected
	CP0.B	W0
	BRA NZ	L__dd_boardDebug_printLine81
	GOTO	L_dd_boardDebug_printLine18
L__dd_boardDebug_printLine81:
;dd_boardDebug.c,136 :: 		color = WHITE;
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_boardDebug.c,137 :: 		} else {
	GOTO	L_dd_boardDebug_printLine19
L_dd_boardDebug_printLine18:
;dd_boardDebug.c,138 :: 		color = BLACK;
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_boardDebug.c,139 :: 		}
L_dd_boardDebug_printLine19:
;dd_boardDebug.c,140 :: 		dd_boardDebug_makeLineText(lineText, lineIndex);
	ADD	W14, #2, W0
	PUSH	W10
	MOV.B	W10, W11
	MOV	W0, W10
	CALL	_dd_boardDebug_makeLineText
;dd_boardDebug.c,141 :: 		eGlcd(
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#8, W13
	MOV.B	#6, W12
	MOV	#lo_addr(dd_boardDebug_DynamisFont_Terminal6x8), W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
	ADD	W14, #2, W0
	MOV.B	[W14+1], W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;dd_boardDebug.c,145 :: 		dd_Indicator_clearPrintUpdateRequest(lineIndex);
	CALL	_dd_Indicator_clearPrintUpdateRequest
;dd_boardDebug.c,146 :: 		}
L_end_dd_boardDebug_printLine:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_boardDebug_printLine

_dd_boardDebug_print:
	LNK	#2

;dd_boardDebug.c,148 :: 		void dd_boardDebug_print() {
;dd_boardDebug.c,151 :: 		(dd_boardDebug_Height_param<=dd_currentIndicatorsCount ? dd_boardDebug_Height_param : dd_currentIndicatorsCount);
	PUSH	W10
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	CP.B	W1, [W0]
	BRA LEU	L__dd_boardDebug_print83
	GOTO	L_dd_boardDebug_print20
L__dd_boardDebug_print83:
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_Height_param), W0
; ?FLOC___dd_boardDebug_print?T77 start address is: 4 (W2)
	MOV.B	[W0], W2
; ?FLOC___dd_boardDebug_print?T77 end address is: 4 (W2)
	GOTO	L_dd_boardDebug_print21
L_dd_boardDebug_print20:
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
; ?FLOC___dd_boardDebug_print?T77 start address is: 4 (W2)
	MOV.B	[W0], W2
; ?FLOC___dd_boardDebug_print?T77 end address is: 4 (W2)
L_dd_boardDebug_print21:
; ?FLOC___dd_boardDebug_print?T77 start address is: 4 (W2)
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	SE	[W0], W1
	ZE	W2, W0
; ?FLOC___dd_boardDebug_print?T77 end address is: 4 (W2)
	ADD	W1, W0, W0
	MOV.B	W0, [W14+1]
;dd_boardDebug.c,152 :: 		dd_boardDebug_DescriptionScrollingTicks++;
	MOV	#1, W1
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_DescriptionScrollingTicks), W0
	ADD	W1, [W0], [W0]
;dd_boardDebug.c,153 :: 		for (i = dd_boardDebug_FirstLineIndex; i < lastLineIndex; i++) {
	MOV	#lo_addr(dd_boardDebug_dd_boardDebug_FirstLineIndex), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
L_dd_boardDebug_print22:
	MOV.B	[W14+0], W1
	ADD	W14, #1, W0
	CP.B	W1, [W0]
	BRA LTU	L__dd_boardDebug_print84
	GOTO	L_dd_boardDebug_print23
L__dd_boardDebug_print84:
;dd_boardDebug.c,154 :: 		if (dd_Indicator_isRequestingUpdate(i) || dd_boardDebugLine_hasToScroll(i) || dd_GraphicController_isFrameUpdateForced()) {
	MOV.B	[W14+0], W10
	CALL	_dd_Indicator_isRequestingUpdate
	CP0.B	W0
	BRA Z	L__dd_boardDebug_print85
	GOTO	L__dd_boardDebug_print55
L__dd_boardDebug_print85:
	MOV.B	[W14+0], W10
	CALL	_dd_boardDebugLine_hasToScroll
	CP0.B	W0
	BRA Z	L__dd_boardDebug_print86
	GOTO	L__dd_boardDebug_print54
L__dd_boardDebug_print86:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_boardDebug_print87
	GOTO	L__dd_boardDebug_print53
L__dd_boardDebug_print87:
	GOTO	L_dd_boardDebug_print27
L__dd_boardDebug_print55:
L__dd_boardDebug_print54:
L__dd_boardDebug_print53:
;dd_boardDebug.c,155 :: 		dd_boardDebug_printLine(i);
	MOV.B	[W14+0], W10
	CALL	_dd_boardDebug_printLine
;dd_boardDebug.c,156 :: 		}
L_dd_boardDebug_print27:
;dd_boardDebug.c,153 :: 		for (i = dd_boardDebug_FirstLineIndex; i < lastLineIndex; i++) {
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;dd_boardDebug.c,157 :: 		}
	GOTO	L_dd_boardDebug_print22
L_dd_boardDebug_print23:
;dd_boardDebug.c,158 :: 		}
L_end_dd_boardDebug_print:
	POP	W10
	ULNK
	RETURN
; end of _dd_boardDebug_print

_dd_boardDebugLine_getScrollingOverflow:

;dd_boardDebug.c,160 :: 		int dd_boardDebugLine_getScrollingOverflow(unsigned char lineIndex) {
;dd_boardDebug.c,161 :: 		return dd_currentIndicators[lineIndex]->descriptionLength + BOARD_DEBUG_DESCRIPTION_SCROLLING_SPACING;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #7, W0
	ZE	[W0], W0
	ADD	W0, #4, W0
;dd_boardDebug.c,162 :: 		}
L_end_dd_boardDebugLine_getScrollingOverflow:
	RETURN
; end of _dd_boardDebugLine_getScrollingOverflow

_dd_boardDebugLine_getScrollOffset:

;dd_boardDebug.c,164 :: 		int dd_boardDebugLine_getScrollOffset(unsigned char lineIndex) {
;dd_boardDebug.c,167 :: 		if (dd_boardDebugLine_hasToScroll(lineIndex)) {
	CALL	_dd_boardDebugLine_hasToScroll
	CP0.B	W0
	BRA NZ	L__dd_boardDebugLine_getScrollOffset90
	GOTO	L_dd_boardDebugLine_getScrollOffset28
L__dd_boardDebugLine_getScrollOffset90:
;dd_boardDebug.c,169 :: 		offset = (int) (FRAME_PERIOD * dd_boardDebuG_DescriptionScrollingTicks * BOARD_DEBUG_DESCRIPTION_SCROLLING_SPEED);
	PUSH	W10
	MOV	dd_boardDebug_dd_boardDebug_DescriptionScrollingTicks, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16480, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	POP	W10
; offset start address is: 4 (W2)
	MOV	W0, W2
;dd_boardDebug.c,170 :: 		if (offset >= dd_boardDebugLine_getScrollingOverflow(lineIndex)) {
	CALL	_dd_boardDebugLine_getScrollingOverflow
	CP	W2, W0
	BRA GE	L__dd_boardDebugLine_getScrollOffset91
	GOTO	L__dd_boardDebugLine_getScrollOffset47
L__dd_boardDebugLine_getScrollOffset91:
; offset end address is: 4 (W2)
;dd_boardDebug.c,171 :: 		offset = 0;
; offset start address is: 2 (W1)
	CLR	W1
;dd_boardDebug.c,172 :: 		dd_boardDebug_DescriptionScrollingTicks = 0;
	CLR	W0
	MOV	W0, dd_boardDebug_dd_boardDebug_DescriptionScrollingTicks
; offset end address is: 2 (W1)
;dd_boardDebug.c,173 :: 		}
	GOTO	L_dd_boardDebugLine_getScrollOffset29
L__dd_boardDebugLine_getScrollOffset47:
;dd_boardDebug.c,170 :: 		if (offset >= dd_boardDebugLine_getScrollingOverflow(lineIndex)) {
	MOV	W2, W1
;dd_boardDebug.c,173 :: 		}
L_dd_boardDebugLine_getScrollOffset29:
;dd_boardDebug.c,174 :: 		return offset;
; offset start address is: 2 (W1)
	MOV	W1, W0
; offset end address is: 2 (W1)
	GOTO	L_end_dd_boardDebugLine_getScrollOffset
;dd_boardDebug.c,175 :: 		} else {
L_dd_boardDebugLine_getScrollOffset28:
;dd_boardDebug.c,176 :: 		return 0;
	CLR	W0
;dd_boardDebug.c,178 :: 		}
L_end_dd_boardDebugLine_getScrollOffset:
	RETURN
; end of _dd_boardDebugLine_getScrollOffset

_dd_boardDebug_makeLineText:
	LNK	#8

;dd_boardDebug.c,180 :: 		void dd_boardDebug_makeLineText(char *lineText, unsigned char lineIndex) {
;dd_boardDebug.c,187 :: 		dd_Indicator_parseValueLabel(lineIndex);  //Too much overkill, find another strategy.
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_Indicator_parseValueLabel
	POP.D	W10
;dd_boardDebug.c,188 :: 		item = dd_currentIndicators[lineIndex];
	ZE	W11, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	MOV	W0, [W14+6]
;dd_boardDebug.c,189 :: 		valueWidth = item->labelLength;
	ADD	W0, #9, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+4]
;dd_boardDebug.c,191 :: 		scrollingOverflow = dd_boardDebugLine_getScrollingOverflow(lineIndex);
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_boardDebugLine_getScrollingOverflow
	POP	W10
	MOV	W0, [W14+2]
;dd_boardDebug.c,192 :: 		scrollingOffset = dd_boardDebugLine_getScrollOffset(lineIndex);
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_boardDebugLine_getScrollOffset
	POP.D	W10
; scrollingOffset start address is: 6 (W3)
	MOV	W0, W3
;dd_boardDebug.c,193 :: 		descriptionLength = item->descriptionLength;
	MOV	[W14+6], W0
	ADD	W0, #7, W0
; descriptionLength start address is: 12 (W6)
	MOV.B	[W0], W6
;dd_boardDebug.c,194 :: 		visibleDescriptionWidth = dd_boardDebugLine_getVisibleDescriptionWidth(lineIndex);
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_boardDebugLine_getVisibleDescriptionWidth
	POP	W10
; visibleDescriptionWidth start address is: 8 (W4)
	MOV.B	W0, W4
;dd_boardDebug.c,195 :: 		for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
; lineCharIndex start address is: 10 (W5)
	CLR	W5
; scrollingOffset end address is: 6 (W3)
; visibleDescriptionWidth end address is: 8 (W4)
; lineCharIndex end address is: 10 (W5)
	MOV	W3, W7
L_dd_boardDebug_makeLineText31:
; lineCharIndex start address is: 10 (W5)
; scrollingOffset start address is: 14 (W7)
; visibleDescriptionWidth start address is: 8 (W4)
; descriptionLength start address is: 12 (W6)
; descriptionLength end address is: 12 (W6)
; scrollingOffset start address is: 14 (W7)
; scrollingOffset end address is: 14 (W7)
	ZE	W4, W0
	CP	W5, W0
	BRA LT	L__dd_boardDebug_makeLineText93
	GOTO	L_dd_boardDebug_makeLineText32
L__dd_boardDebug_makeLineText93:
; descriptionLength end address is: 12 (W6)
; scrollingOffset end address is: 14 (W7)
;dd_boardDebug.c,196 :: 		i = lineCharIndex + scrollingOffset;
; scrollingOffset start address is: 14 (W7)
; descriptionLength start address is: 12 (W6)
	ADD	W5, W7, W1
	MOV	W1, [W14+0]
;dd_boardDebug.c,198 :: 		if (i < descriptionLength) {
	ZE	W6, W0
	CP	W1, W0
	BRA LT	L__dd_boardDebug_makeLineText94
	GOTO	L_dd_boardDebug_makeLineText34
L__dd_boardDebug_makeLineText94:
;dd_boardDebug.c,199 :: 		lineText[lineCharIndex] = (item->description)[i];
	ADD	W10, W5, W2
	MOV	[W14+6], W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W2]
;dd_boardDebug.c,200 :: 		}
	GOTO	L_dd_boardDebug_makeLineText35
L_dd_boardDebug_makeLineText34:
;dd_boardDebug.c,203 :: 		else if (i < scrollingOverflow || !dd_boardDebugLine_hasToScroll(lineIndex)) {
	MOV	[W14+0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA GE	L__dd_boardDebug_makeLineText95
	GOTO	L__dd_boardDebug_makeLineText50
L__dd_boardDebug_makeLineText95:
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_boardDebugLine_hasToScroll
	POP	W10
	CP0.B	W0
	BRA NZ	L__dd_boardDebug_makeLineText96
	GOTO	L__dd_boardDebug_makeLineText49
L__dd_boardDebug_makeLineText96:
	GOTO	L_dd_boardDebug_makeLineText38
L__dd_boardDebug_makeLineText50:
L__dd_boardDebug_makeLineText49:
;dd_boardDebug.c,204 :: 		lineText[lineCharIndex] = ' ';
	ADD	W10, W5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,205 :: 		} else {
	GOTO	L_dd_boardDebug_makeLineText39
L_dd_boardDebug_makeLineText38:
;dd_boardDebug.c,206 :: 		lineText[lineCharIndex] = (item->description)[i - scrollingOverflow];
	ADD	W10, W5, W3
	MOV	[W14+6], W0
	ADD	W0, #4, W2
	MOV	[W14+0], W1
	ADD	W14, #2, W0
	SUB	W1, [W0], W0
	ADD	W0, [W2], W0
	MOV.B	[W0], [W3]
;dd_boardDebug.c,207 :: 		}
L_dd_boardDebug_makeLineText39:
L_dd_boardDebug_makeLineText35:
;dd_boardDebug.c,195 :: 		for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
; lineCharIndex start address is: 0 (W0)
	ADD	W5, #1, W0
; lineCharIndex end address is: 10 (W5)
;dd_boardDebug.c,208 :: 		}
; visibleDescriptionWidth end address is: 8 (W4)
; descriptionLength end address is: 12 (W6)
; scrollingOffset end address is: 14 (W7)
; lineCharIndex end address is: 0 (W0)
	MOV	W0, W5
	GOTO	L_dd_boardDebug_makeLineText31
L_dd_boardDebug_makeLineText32:
;dd_boardDebug.c,209 :: 		if (valueWidth > 0) {
; lineCharIndex start address is: 10 (W5)
	MOV.B	[W14+4], W0
	CP.B	W0, #0
	BRA GTU	L__dd_boardDebug_makeLineText97
	GOTO	L__dd_boardDebug_makeLineText51
L__dd_boardDebug_makeLineText97:
;dd_boardDebug.c,210 :: 		for (i = 0; i < BOARD_DEBUG_DESCRIPTION_VALUE_SPACING; i++) {
	CLR	W0
	MOV	W0, [W14+0]
; lineCharIndex end address is: 10 (W5)
L_dd_boardDebug_makeLineText41:
; lineCharIndex start address is: 10 (W5)
	MOV	[W14+0], W0
	CP	W0, #1
	BRA LT	L__dd_boardDebug_makeLineText98
	GOTO	L_dd_boardDebug_makeLineText42
L__dd_boardDebug_makeLineText98:
;dd_boardDebug.c,211 :: 		lineText[lineCharIndex] = ' ';
	ADD	W10, W5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,212 :: 		lineCharIndex += 1;
; lineCharIndex start address is: 4 (W2)
	ADD	W5, #1, W2
; lineCharIndex end address is: 10 (W5)
;dd_boardDebug.c,210 :: 		for (i = 0; i < BOARD_DEBUG_DESCRIPTION_VALUE_SPACING; i++) {
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_boardDebug.c,213 :: 		}
	MOV	W2, W5
; lineCharIndex end address is: 4 (W2)
	GOTO	L_dd_boardDebug_makeLineText41
L_dd_boardDebug_makeLineText42:
;dd_boardDebug.c,214 :: 		for (i = 0; i < valueWidth; i++) {
; lineCharIndex start address is: 10 (W5)
	CLR	W0
	MOV	W0, [W14+0]
; lineCharIndex end address is: 10 (W5)
	MOV	W5, W3
L_dd_boardDebug_makeLineText44:
; lineCharIndex start address is: 6 (W3)
	ADD	W14, #4, W0
	ZE	[W0], W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GT	L__dd_boardDebug_makeLineText99
	GOTO	L_dd_boardDebug_makeLineText45
L__dd_boardDebug_makeLineText99:
;dd_boardDebug.c,215 :: 		lineText[lineCharIndex] = (item->label)[i];
	ADD	W10, W3, W2
	MOV	[W14+6], W0
	ADD	W0, #10, W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W2]
;dd_boardDebug.c,216 :: 		lineCharIndex += 1;
; lineCharIndex start address is: 10 (W5)
	ADD	W3, #1, W5
; lineCharIndex end address is: 6 (W3)
;dd_boardDebug.c,214 :: 		for (i = 0; i < valueWidth; i++) {
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_boardDebug.c,217 :: 		}
	MOV	W5, W3
; lineCharIndex end address is: 10 (W5)
	GOTO	L_dd_boardDebug_makeLineText44
L_dd_boardDebug_makeLineText45:
;dd_boardDebug.c,218 :: 		}
; lineCharIndex start address is: 6 (W3)
	MOV	W3, W0
	GOTO	L_dd_boardDebug_makeLineText40
; lineCharIndex end address is: 6 (W3)
L__dd_boardDebug_makeLineText51:
;dd_boardDebug.c,209 :: 		if (valueWidth > 0) {
	MOV	W5, W0
;dd_boardDebug.c,218 :: 		}
L_dd_boardDebug_makeLineText40:
;dd_boardDebug.c,219 :: 		lineText[lineCharIndex] = ' ';
; lineCharIndex start address is: 0 (W0)
	ADD	W10, W0, W1
; lineCharIndex end address is: 0 (W0)
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,220 :: 		}
L_end_dd_boardDebug_makeLineText:
	ULNK
	RETURN
; end of _dd_boardDebug_makeLineText
