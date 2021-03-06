
_dd_Menu_reset:

;dd_menu.c,43 :: 		void dd_Menu_reset(void) {
;dd_menu.c,44 :: 		dd_Menu_SelectedLineIndex = 0;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,45 :: 		dd_Menu_FirstLineIndex = 0;
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,46 :: 		}
L_end_dd_Menu_reset:
	RETURN
; end of _dd_Menu_reset

_dd_Menu_init:

;dd_menu.c,48 :: 		void dd_Menu_init() {
;dd_menu.c,49 :: 		dd_Menu_reset();
	CALL	_dd_Menu_reset
;dd_menu.c,50 :: 		}
L_end_dd_Menu_init:
	RETURN
; end of _dd_Menu_init

_dd_Menu_setY_OFFSET:

;dd_menu.c,52 :: 		void dd_Menu_setY_OFFSET(unsigned char y) {
;dd_menu.c,53 :: 		dd_Menu_Y_OFFSET = y;
	MOV	#lo_addr(dd_menu_dd_Menu_Y_OFFSET), W0
	MOV.B	W10, [W0]
;dd_menu.c,54 :: 		dd_Menu_Height = dd_Menu_Height_param + dd_Menu_Y_OFFSET;
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height), W0
	ADD.B	W10, [W1], [W0]
;dd_menu.c,55 :: 		}
L_end_dd_Menu_setY_OFFSET:
	RETURN
; end of _dd_Menu_setY_OFFSET

_dd_Menu_setX_OFFSET:

;dd_menu.c,57 :: 		void dd_Menu_setX_OFFSET(unsigned char x) {
;dd_menu.c,58 :: 		dd_Menu_X_OFFSET = x;
	MOV	#lo_addr(dd_menu_dd_Menu_X_OFFSET), W0
	MOV.B	W10, [W0]
;dd_menu.c,59 :: 		}
L_end_dd_Menu_setX_OFFSET:
	RETURN
; end of _dd_Menu_setX_OFFSET

_dd_Menu_setHeight:

;dd_menu.c,61 :: 		void dd_Menu_setHeight(unsigned char height) {
;dd_menu.c,62 :: 		if (height > MAX_MENU_HEIGHT) {
	CP.B	W10, #8
	BRA GTU	L__dd_Menu_setHeight61
	GOTO	L_dd_Menu_setHeight0
L__dd_Menu_setHeight61:
;dd_menu.c,63 :: 		height = MAX_MENU_HEIGHT;
	MOV.B	#8, W10
;dd_menu.c,64 :: 		}
L_dd_Menu_setHeight0:
;dd_menu.c,65 :: 		dd_Menu_Height_param = height;
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	MOV.B	W10, [W0]
;dd_menu.c,66 :: 		dd_Menu_Height = dd_Menu_Height_param + dd_Menu_Y_OFFSET;
	MOV	#lo_addr(dd_menu_dd_Menu_Y_OFFSET), W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height), W0
	ADD.B	W10, [W1], [W0]
;dd_menu.c,67 :: 		}
L_end_dd_Menu_setHeight:
	RETURN
; end of _dd_Menu_setHeight

_dd_Menu_setWidth:

;dd_menu.c,69 :: 		void dd_Menu_setWidth(unsigned char width) {
;dd_menu.c,70 :: 		if (width > MAX_MENU_WIDTH) {
	CP.B	W10, #18
	BRA GTU	L__dd_Menu_setWidth63
	GOTO	L_dd_Menu_setWidth1
L__dd_Menu_setWidth63:
;dd_menu.c,71 :: 		width = MAX_MENU_WIDTH;
	MOV.B	#18, W10
;dd_menu.c,72 :: 		}
L_dd_Menu_setWidth1:
;dd_menu.c,73 :: 		dd_Menu_Width = width;
	MOV	#lo_addr(dd_menu_dd_Menu_Width), W0
	MOV.B	W10, [W0]
;dd_menu.c,74 :: 		}
L_end_dd_Menu_setWidth:
	RETURN
; end of _dd_Menu_setWidth

_dd_Menu_scroll:

;dd_menu.c,76 :: 		void dd_Menu_scroll(signed char movements) {
;dd_menu.c,78 :: 		dd_Menu_FirstLineIndex+=movements;
	PUSH	W10
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W1
	SE	W10, W0
	ADD	W1, W0, W2
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	MOV.B	W2, [W0]
;dd_menu.c,79 :: 		if ( dd_Menu_FirstLineIndex > dd_currentIndicatorsCount - dd_Menu_Height_param ) {
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CP	W2, W0
	BRA GTU	L__dd_Menu_scroll65
	GOTO	L_dd_Menu_scroll2
L__dd_Menu_scroll65:
;dd_menu.c,80 :: 		dd_Menu_FirstLineIndex = dd_currentIndicatorsCount - 1 - dd_Menu_Height_param;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W1
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SUB.B	W2, [W1], [W0]
;dd_menu.c,81 :: 		}
	GOTO	L_dd_Menu_scroll3
L_dd_Menu_scroll2:
;dd_menu.c,82 :: 		else if (dd_Menu_FirstLineIndex < 0) {
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__dd_Menu_scroll66
	GOTO	L_dd_Menu_scroll4
L__dd_Menu_scroll66:
;dd_menu.c,83 :: 		Debug_UART_Write("FirstLineIndex = 0\r\n");
	MOV	#lo_addr(?lstr1_dd_menu), W10
	CALL	_Debug_UART_Write
;dd_menu.c,84 :: 		dd_Menu_FirstLineIndex = 0;
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,85 :: 		}
L_dd_Menu_scroll4:
L_dd_Menu_scroll3:
;dd_menu.c,86 :: 		for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height_param; i++) {
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
; i start address is: 4 (W2)
	MOV.B	[W0], W2
; i end address is: 4 (W2)
L_dd_Menu_scroll5:
; i start address is: 4 (W2)
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	ZE	W2, W0
	CP	W0, W1
	BRA LT	L__dd_Menu_scroll67
	GOTO	L_dd_Menu_scroll6
L__dd_Menu_scroll67:
;dd_menu.c,87 :: 		dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
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
;dd_menu.c,86 :: 		for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height_param; i++) {
	INC.B	W2
;dd_menu.c,88 :: 		}
; i end address is: 4 (W2)
	GOTO	L_dd_Menu_scroll5
L_dd_Menu_scroll6:
;dd_menu.c,89 :: 		}
L_end_dd_Menu_scroll:
	POP	W10
	RETURN
; end of _dd_Menu_scroll

_dd_Menu_moveSelection:

;dd_menu.c,114 :: 		void dd_Menu_moveSelection(signed char movements) {
;dd_menu.c,117 :: 		dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
	PUSH	W10
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
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
;dd_menu.c,118 :: 		dd_Menu_SelectedLineIndex+=movements;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SE	[W0], W1
	SE	W10, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	MOV.B	W1, [W0]
;dd_menu.c,119 :: 		if (dd_Menu_SelectedLineIndex >= dd_currentIndicatorsCount) {
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	ZE	[W0], W0
	CP	W1, W0
	BRA GE	L__dd_Menu_moveSelection69
	GOTO	L_dd_Menu_moveSelection8
L__dd_Menu_moveSelection69:
;dd_menu.c,120 :: 		dd_Menu_SelectedLineIndex = dd_currentIndicatorsCount - 1;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SUB.B	W1, #1, [W0]
;dd_menu.c,121 :: 		}
	GOTO	L_dd_Menu_moveSelection9
L_dd_Menu_moveSelection8:
;dd_menu.c,122 :: 		else if (dd_Menu_SelectedLineIndex < 0) {
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__dd_Menu_moveSelection70
	GOTO	L_dd_Menu_moveSelection10
L__dd_Menu_moveSelection70:
;dd_menu.c,123 :: 		Debug_UART_Write("SelectedLineIndex = 0\r\n");
	MOV	#lo_addr(?lstr2_dd_menu), W10
	CALL	_Debug_UART_Write
;dd_menu.c,124 :: 		dd_Menu_SelectedLineIndex = 0;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,125 :: 		}
L_dd_Menu_moveSelection10:
L_dd_Menu_moveSelection9:
;dd_menu.c,126 :: 		dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
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
;dd_menu.c,129 :: 		if (dd_Menu_SelectedLineIndex >= dd_Menu_FirstLineIndex + dd_Menu_Height_param)
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SE	[W0], W0
	CP	W0, W1
	BRA GE	L__dd_Menu_moveSelection71
	GOTO	L_dd_Menu_moveSelection11
L__dd_Menu_moveSelection71:
;dd_menu.c,131 :: 		dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex - dd_Menu_Height_param + 1);
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W1
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	INC	W0
	MOV.B	W0, W10
	CALL	_dd_Menu_scroll
;dd_menu.c,132 :: 		}
	GOTO	L_dd_Menu_moveSelection12
L_dd_Menu_moveSelection11:
;dd_menu.c,133 :: 		else if (dd_Menu_SelectedLineIndex < dd_Menu_FirstLineIndex)
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	CP.B	W1, [W0]
	BRA LT	L__dd_Menu_moveSelection72
	GOTO	L_dd_Menu_moveSelection13
L__dd_Menu_moveSelection72:
;dd_menu.c,136 :: 		dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex);
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SE	[W0], W1
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W0
	MOV.B	W0, W10
	CALL	_dd_Menu_scroll
;dd_menu.c,138 :: 		}
L_dd_Menu_moveSelection13:
L_dd_Menu_moveSelection12:
;dd_menu.c,139 :: 		}
L_end_dd_Menu_moveSelection:
	POP	W10
	RETURN
; end of _dd_Menu_moveSelection

_dd_Menu_selectedLine:

;dd_menu.c,166 :: 		unsigned char dd_Menu_selectedLine(void) {
;dd_menu.c,167 :: 		return dd_Menu_SelectedLineIndex;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	MOV.B	[W0], W0
;dd_menu.c,168 :: 		}
L_end_dd_Menu_selectedLine:
	RETURN
; end of _dd_Menu_selectedLine

_dd_printMenuLine:
	LNK	#22

;dd_menu.c,175 :: 		void dd_printMenuLine(unsigned char lineIndex) {
;dd_menu.c,181 :: 		lineNumber = lineIndex - dd_Menu_FirstLineIndex + dd_Menu_Y_OFFSET;
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W1
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W0
	SUB	W1, W0, W2
	MOV	#lo_addr(dd_menu_dd_Menu_Y_OFFSET), W1
	ADD	W14, #0, W0
	ADD.B	W2, [W1], [W0]
;dd_menu.c,182 :: 		if (dd_Menu_isLineSelected(lineIndex)) {
	CALL	_dd_Menu_isLineSelected
	CP0.B	W0
	BRA NZ	L__dd_printMenuLine75
	GOTO	L_dd_printMenuLine14
L__dd_printMenuLine75:
;dd_menu.c,183 :: 		color = WHITE;
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_menu.c,184 :: 		} else {
	GOTO	L_dd_printMenuLine15
L_dd_printMenuLine14:
;dd_menu.c,185 :: 		color = BLACK;
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_menu.c,186 :: 		}
L_dd_printMenuLine15:
;dd_menu.c,187 :: 		dd_Menu_makeLineText(lineText, lineIndex);
	ADD	W14, #2, W0
	PUSH	W10
	MOV.B	W10, W11
	MOV	W0, W10
	CALL	_dd_Menu_makeLineText
;dd_menu.c,191 :: 		eGlcd(
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#8, W13
	MOV.B	#6, W12
	MOV	#lo_addr(dd_menu_DynamisFont_Terminal6x8), W10
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
;dd_menu.c,196 :: 		dd_Indicator_clearPrintUpdateRequest(lineIndex);
	CALL	_dd_Indicator_clearPrintUpdateRequest
;dd_menu.c,197 :: 		}
L_end_dd_printMenuLine:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_printMenuLine

_dd_printMenu:
	LNK	#2

;dd_menu.c,202 :: 		void dd_printMenu() {
;dd_menu.c,205 :: 		(dd_Menu_Height_param<=dd_currentIndicatorsCount ? dd_Menu_Height_param : dd_currentIndicatorsCount);
	PUSH	W10
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	CP.B	W1, [W0]
	BRA LEU	L__dd_printMenu77
	GOTO	L_dd_printMenu16
L__dd_printMenu77:
	MOV	#lo_addr(dd_menu_dd_Menu_Height_param), W0
; ?FLOC___dd_printMenu?T58 start address is: 4 (W2)
	MOV.B	[W0], W2
; ?FLOC___dd_printMenu?T58 end address is: 4 (W2)
	GOTO	L_dd_printMenu17
L_dd_printMenu16:
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
; ?FLOC___dd_printMenu?T58 start address is: 4 (W2)
	MOV.B	[W0], W2
; ?FLOC___dd_printMenu?T58 end address is: 4 (W2)
L_dd_printMenu17:
; ?FLOC___dd_printMenu?T58 start address is: 4 (W2)
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	SE	[W0], W1
	ZE	W2, W0
; ?FLOC___dd_printMenu?T58 end address is: 4 (W2)
	ADD	W1, W0, W0
	MOV.B	W0, [W14+1]
;dd_menu.c,207 :: 		dd_Menu_DescriptionScrollingTicks++;
	MOV	#1, W1
	MOV	#lo_addr(dd_menu_dd_Menu_DescriptionScrollingTicks), W0
	ADD	W1, [W0], [W0]
;dd_menu.c,208 :: 		for (i = dd_Menu_FirstLineIndex; i < lastLineIndex; i++) {
	MOV	#lo_addr(dd_menu_dd_Menu_FirstLineIndex), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
L_dd_printMenu18:
	MOV.B	[W14+0], W1
	ADD	W14, #1, W0
	CP.B	W1, [W0]
	BRA LTU	L__dd_printMenu78
	GOTO	L_dd_printMenu19
L__dd_printMenu78:
;dd_menu.c,209 :: 		if (dd_Indicator_isRequestingUpdate(i) || dd_MenuLine_hasToScroll(i) || dd_GraphicController_isFrameUpdateForced()) {
	MOV.B	[W14+0], W10
	CALL	_dd_Indicator_isRequestingUpdate
	CP0.B	W0
	BRA Z	L__dd_printMenu79
	GOTO	L__dd_printMenu55
L__dd_printMenu79:
	MOV.B	[W14+0], W10
	CALL	_dd_MenuLine_hasToScroll
	CP0.B	W0
	BRA Z	L__dd_printMenu80
	GOTO	L__dd_printMenu54
L__dd_printMenu80:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_printMenu81
	GOTO	L__dd_printMenu53
L__dd_printMenu81:
	GOTO	L_dd_printMenu23
L__dd_printMenu55:
L__dd_printMenu54:
L__dd_printMenu53:
;dd_menu.c,210 :: 		dd_printMenuLine(i);
	MOV.B	[W14+0], W10
	CALL	_dd_printMenuLine
;dd_menu.c,211 :: 		}
L_dd_printMenu23:
;dd_menu.c,208 :: 		for (i = dd_Menu_FirstLineIndex; i < lastLineIndex; i++) {
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;dd_menu.c,212 :: 		}
	GOTO	L_dd_printMenu18
L_dd_printMenu19:
;dd_menu.c,214 :: 		}
L_end_dd_printMenu:
	POP	W10
	ULNK
	RETURN
; end of _dd_printMenu

_dd_MenuLine_getVisibleDescriptionWidth:

;dd_menu.c,219 :: 		unsigned char dd_MenuLine_getVisibleDescriptionWidth(unsigned char lineIndex) {
;dd_menu.c,221 :: 		labelLength = dd_currentIndicators[lineIndex]->labelLength;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #9, W0
; labelLength start address is: 4 (W2)
	MOV.B	[W0], W2
;dd_menu.c,222 :: 		if (labelLength > 0) {
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GTU	L__dd_MenuLine_getVisibleDescriptionWidth83
	GOTO	L_dd_MenuLine_getVisibleDescriptionWidth24
L__dd_MenuLine_getVisibleDescriptionWidth83:
;dd_menu.c,223 :: 		return (unsigned char) (dd_Menu_Width - labelLength - MENU_DESCRIPTION_VALUE_SPACING);
	MOV	#lo_addr(dd_menu_dd_Menu_Width), W0
	ZE	[W0], W1
	ZE	W2, W0
; labelLength end address is: 4 (W2)
	SUB	W1, W0, W0
	DEC	W0
	GOTO	L_end_dd_MenuLine_getVisibleDescriptionWidth
;dd_menu.c,224 :: 		} else {
L_dd_MenuLine_getVisibleDescriptionWidth24:
;dd_menu.c,225 :: 		return dd_Menu_Width;
	MOV	#lo_addr(dd_menu_dd_Menu_Width), W0
	MOV.B	[W0], W0
;dd_menu.c,227 :: 		}
L_end_dd_MenuLine_getVisibleDescriptionWidth:
	RETURN
; end of _dd_MenuLine_getVisibleDescriptionWidth

_dd_MenuLine_hasToScroll:
	LNK	#2

;dd_menu.c,231 :: 		unsigned char dd_MenuLine_hasToScroll(unsigned char lineIndex) {
;dd_menu.c,232 :: 		return dd_Menu_isLineSelected(lineIndex) &&
	CALL	_dd_Menu_isLineSelected
;dd_menu.c,233 :: 		dd_currentIndicators[lineIndex]->descriptionLength > dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
	CP0.B	W0
	BRA NZ	L__dd_MenuLine_hasToScroll85
	GOTO	L_dd_MenuLine_hasToScroll27
L__dd_MenuLine_hasToScroll85:
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #7, W0
	MOV	W0, [W14+0]
	CALL	_dd_MenuLine_getVisibleDescriptionWidth
	MOV	[W14+0], W1
	CP.B	W0, [W1]
	BRA LTU	L__dd_MenuLine_hasToScroll86
	GOTO	L_dd_MenuLine_hasToScroll27
L__dd_MenuLine_hasToScroll86:
	MOV.B	#1, W0
	GOTO	L_dd_MenuLine_hasToScroll26
L_dd_MenuLine_hasToScroll27:
	CLR	W0
L_dd_MenuLine_hasToScroll26:
;dd_menu.c,234 :: 		}
L_end_dd_MenuLine_hasToScroll:
	ULNK
	RETURN
; end of _dd_MenuLine_hasToScroll

_dd_MenuLine_getScrollingOverflow:

;dd_menu.c,237 :: 		int dd_MenuLine_getScrollingOverflow(unsigned char lineIndex) {
;dd_menu.c,238 :: 		return dd_currentIndicators[lineIndex]->descriptionLength + DESCRIPTION_SCROLLING_SPACING;
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	ADD	W0, #7, W0
	ZE	[W0], W0
	ADD	W0, #4, W0
;dd_menu.c,239 :: 		}
L_end_dd_MenuLine_getScrollingOverflow:
	RETURN
; end of _dd_MenuLine_getScrollingOverflow

_dd_MenuLine_getScrollOffset:

;dd_menu.c,243 :: 		int dd_MenuLine_getScrollOffset(unsigned char lineIndex) {
;dd_menu.c,246 :: 		if (dd_MenuLine_hasToScroll(lineIndex)) {
	CALL	_dd_MenuLine_hasToScroll
	CP0.B	W0
	BRA NZ	L__dd_MenuLine_getScrollOffset89
	GOTO	L_dd_MenuLine_getScrollOffset28
L__dd_MenuLine_getScrollOffset89:
;dd_menu.c,248 :: 		offset = (int) (FRAME_PERIOD * dd_Menu_DescriptionScrollingTicks * DESCRIPTION_SCROLLING_SPEED);
	PUSH	W10
	MOV	dd_menu_dd_Menu_DescriptionScrollingTicks, W0
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
;dd_menu.c,249 :: 		if (offset >= dd_MenuLine_getScrollingOverflow(lineIndex)) {
	CALL	_dd_MenuLine_getScrollingOverflow
	CP	W2, W0
	BRA GE	L__dd_MenuLine_getScrollOffset90
	GOTO	L__dd_MenuLine_getScrollOffset47
L__dd_MenuLine_getScrollOffset90:
; offset end address is: 4 (W2)
;dd_menu.c,250 :: 		offset = 0;
; offset start address is: 2 (W1)
	CLR	W1
;dd_menu.c,251 :: 		dd_Menu_DescriptionScrollingTicks = 0;
	CLR	W0
	MOV	W0, dd_menu_dd_Menu_DescriptionScrollingTicks
; offset end address is: 2 (W1)
;dd_menu.c,252 :: 		}
	GOTO	L_dd_MenuLine_getScrollOffset29
L__dd_MenuLine_getScrollOffset47:
;dd_menu.c,249 :: 		if (offset >= dd_MenuLine_getScrollingOverflow(lineIndex)) {
	MOV	W2, W1
;dd_menu.c,252 :: 		}
L_dd_MenuLine_getScrollOffset29:
;dd_menu.c,253 :: 		return offset;
; offset start address is: 2 (W1)
	MOV	W1, W0
; offset end address is: 2 (W1)
	GOTO	L_end_dd_MenuLine_getScrollOffset
;dd_menu.c,254 :: 		} else {
L_dd_MenuLine_getScrollOffset28:
;dd_menu.c,255 :: 		return 0;
	CLR	W0
;dd_menu.c,257 :: 		}
L_end_dd_MenuLine_getScrollOffset:
	RETURN
; end of _dd_MenuLine_getScrollOffset

_dd_Menu_makeLineText:
	LNK	#8

;dd_menu.c,259 :: 		void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex) {
;dd_menu.c,266 :: 		dd_Indicator_parseValueLabel(lineIndex);  //Too much overkill, find another strategy.
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_Indicator_parseValueLabel
	POP.D	W10
;dd_menu.c,267 :: 		item = dd_currentIndicators[lineIndex];
	ZE	W11, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_currentIndicators), W0
	ADD	W1, [W0], W0
	MOV	[W0], W0
	MOV	W0, [W14+6]
;dd_menu.c,268 :: 		valueWidth = item->labelLength;
	ADD	W0, #9, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+4]
;dd_menu.c,270 :: 		scrollingOverflow = dd_MenuLine_getScrollingOverflow(lineIndex);
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getScrollingOverflow
	POP	W10
	MOV	W0, [W14+2]
;dd_menu.c,271 :: 		scrollingOffset = dd_MenuLine_getScrollOffset(lineIndex);
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getScrollOffset
	POP.D	W10
; scrollingOffset start address is: 6 (W3)
	MOV	W0, W3
;dd_menu.c,272 :: 		descriptionLength = item->descriptionLength;
	MOV	[W14+6], W0
	ADD	W0, #7, W0
; descriptionLength start address is: 12 (W6)
	MOV.B	[W0], W6
;dd_menu.c,273 :: 		visibleDescriptionWidth = dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getVisibleDescriptionWidth
	POP	W10
; visibleDescriptionWidth start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,283 :: 		for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
; lineCharIndex start address is: 10 (W5)
	CLR	W5
; scrollingOffset end address is: 6 (W3)
; visibleDescriptionWidth end address is: 8 (W4)
; lineCharIndex end address is: 10 (W5)
	MOV	W3, W7
L_dd_Menu_makeLineText31:
; lineCharIndex start address is: 10 (W5)
; scrollingOffset start address is: 14 (W7)
; visibleDescriptionWidth start address is: 8 (W4)
; descriptionLength start address is: 12 (W6)
; descriptionLength end address is: 12 (W6)
; scrollingOffset start address is: 14 (W7)
; scrollingOffset end address is: 14 (W7)
	ZE	W4, W0
	CP	W5, W0
	BRA LT	L__dd_Menu_makeLineText92
	GOTO	L_dd_Menu_makeLineText32
L__dd_Menu_makeLineText92:
; descriptionLength end address is: 12 (W6)
; scrollingOffset end address is: 14 (W7)
;dd_menu.c,284 :: 		i = lineCharIndex + scrollingOffset;
; scrollingOffset start address is: 14 (W7)
; descriptionLength start address is: 12 (W6)
	ADD	W5, W7, W1
	MOV	W1, [W14+0]
;dd_menu.c,286 :: 		if (i < descriptionLength) {
	ZE	W6, W0
	CP	W1, W0
	BRA LT	L__dd_Menu_makeLineText93
	GOTO	L_dd_Menu_makeLineText34
L__dd_Menu_makeLineText93:
;dd_menu.c,287 :: 		lineText[lineCharIndex] = (item->description)[i];
	ADD	W10, W5, W2
	MOV	[W14+6], W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W2]
;dd_menu.c,288 :: 		}
	GOTO	L_dd_Menu_makeLineText35
L_dd_Menu_makeLineText34:
;dd_menu.c,291 :: 		else if (i < scrollingOverflow || !dd_MenuLine_hasToScroll(lineIndex)) {
	MOV	[W14+0], W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA GE	L__dd_Menu_makeLineText94
	GOTO	L__dd_Menu_makeLineText50
L__dd_Menu_makeLineText94:
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_hasToScroll
	POP	W10
	CP0.B	W0
	BRA NZ	L__dd_Menu_makeLineText95
	GOTO	L__dd_Menu_makeLineText49
L__dd_Menu_makeLineText95:
	GOTO	L_dd_Menu_makeLineText38
L__dd_Menu_makeLineText50:
L__dd_Menu_makeLineText49:
;dd_menu.c,292 :: 		lineText[lineCharIndex] = ' ';
	ADD	W10, W5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,293 :: 		} else {
	GOTO	L_dd_Menu_makeLineText39
L_dd_Menu_makeLineText38:
;dd_menu.c,294 :: 		lineText[lineCharIndex] = (item->description)[i - scrollingOverflow];
	ADD	W10, W5, W3
	MOV	[W14+6], W0
	ADD	W0, #4, W2
	MOV	[W14+0], W1
	ADD	W14, #2, W0
	SUB	W1, [W0], W0
	ADD	W0, [W2], W0
	MOV.B	[W0], [W3]
;dd_menu.c,295 :: 		}
L_dd_Menu_makeLineText39:
L_dd_Menu_makeLineText35:
;dd_menu.c,283 :: 		for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
; lineCharIndex start address is: 0 (W0)
	ADD	W5, #1, W0
; lineCharIndex end address is: 10 (W5)
;dd_menu.c,296 :: 		}
; visibleDescriptionWidth end address is: 8 (W4)
; descriptionLength end address is: 12 (W6)
; scrollingOffset end address is: 14 (W7)
; lineCharIndex end address is: 0 (W0)
	MOV	W0, W5
	GOTO	L_dd_Menu_makeLineText31
L_dd_Menu_makeLineText32:
;dd_menu.c,313 :: 		if (valueWidth > 0) {
; lineCharIndex start address is: 10 (W5)
	MOV.B	[W14+4], W0
	CP.B	W0, #0
	BRA GTU	L__dd_Menu_makeLineText96
	GOTO	L__dd_Menu_makeLineText51
L__dd_Menu_makeLineText96:
;dd_menu.c,314 :: 		for (i = 0; i < MENU_DESCRIPTION_VALUE_SPACING; i++) {
	CLR	W0
	MOV	W0, [W14+0]
; lineCharIndex end address is: 10 (W5)
L_dd_Menu_makeLineText41:
; lineCharIndex start address is: 10 (W5)
	MOV	[W14+0], W0
	CP	W0, #1
	BRA LT	L__dd_Menu_makeLineText97
	GOTO	L_dd_Menu_makeLineText42
L__dd_Menu_makeLineText97:
;dd_menu.c,315 :: 		lineText[lineCharIndex] = ' ';
	ADD	W10, W5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,316 :: 		lineCharIndex += 1;
; lineCharIndex start address is: 4 (W2)
	ADD	W5, #1, W2
; lineCharIndex end address is: 10 (W5)
;dd_menu.c,314 :: 		for (i = 0; i < MENU_DESCRIPTION_VALUE_SPACING; i++) {
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_menu.c,317 :: 		}
	MOV	W2, W5
; lineCharIndex end address is: 4 (W2)
	GOTO	L_dd_Menu_makeLineText41
L_dd_Menu_makeLineText42:
;dd_menu.c,318 :: 		for (i = 0; i < valueWidth; i++) {
; lineCharIndex start address is: 10 (W5)
	CLR	W0
	MOV	W0, [W14+0]
; lineCharIndex end address is: 10 (W5)
	MOV	W5, W3
L_dd_Menu_makeLineText44:
; lineCharIndex start address is: 6 (W3)
	ADD	W14, #4, W0
	ZE	[W0], W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GT	L__dd_Menu_makeLineText98
	GOTO	L_dd_Menu_makeLineText45
L__dd_Menu_makeLineText98:
;dd_menu.c,319 :: 		lineText[lineCharIndex] = (item->label)[i];
	ADD	W10, W3, W2
	MOV	[W14+6], W0
	ADD	W0, #10, W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W2]
;dd_menu.c,320 :: 		lineCharIndex += 1;
; lineCharIndex start address is: 10 (W5)
	ADD	W3, #1, W5
; lineCharIndex end address is: 6 (W3)
;dd_menu.c,318 :: 		for (i = 0; i < valueWidth; i++) {
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_menu.c,321 :: 		}
	MOV	W5, W3
; lineCharIndex end address is: 10 (W5)
	GOTO	L_dd_Menu_makeLineText44
L_dd_Menu_makeLineText45:
;dd_menu.c,322 :: 		}
; lineCharIndex start address is: 6 (W3)
	MOV	W3, W0
	GOTO	L_dd_Menu_makeLineText40
; lineCharIndex end address is: 6 (W3)
L__dd_Menu_makeLineText51:
;dd_menu.c,313 :: 		if (valueWidth > 0) {
	MOV	W5, W0
;dd_menu.c,322 :: 		}
L_dd_Menu_makeLineText40:
;dd_menu.c,327 :: 		lineText[lineCharIndex] = ' ';
; lineCharIndex start address is: 0 (W0)
	ADD	W10, W0, W1
; lineCharIndex end address is: 0 (W0)
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,333 :: 		}
L_end_dd_Menu_makeLineText:
	ULNK
	RETURN
; end of _dd_Menu_makeLineText

_dd_Menu_isLineSelected:

;dd_menu.c,335 :: 		char dd_Menu_isLineSelected(unsigned char lineIndex) {
;dd_menu.c,336 :: 		return dd_Menu_SelectedLineIndex == lineIndex;
	MOV	#lo_addr(dd_menu_dd_Menu_SelectedLineIndex), W0
	SE	[W0], W1
	ZE	W10, W0
	CP	W1, W0
	CLR.B	W0
	BRA NZ	L__dd_Menu_isLineSelected100
	INC.B	W0
L__dd_Menu_isLineSelected100:
;dd_menu.c,337 :: 		}
L_end_dd_Menu_isLineSelected:
	RETURN
; end of _dd_Menu_isLineSelected
