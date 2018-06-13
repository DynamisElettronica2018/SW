
_dd_boardDebug_setPrintValue:

;dd_boardDebug.c,51 :: 		void dd_boardDebug_setPrintValue(unsigned char index){
;dd_boardDebug.c,52 :: 		dd_PrintValue = index;
	MOV	#lo_addr(_dd_PrintValue), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,53 :: 		}
L_end_dd_boardDebug_setPrintValue:
	RETURN
; end of _dd_boardDebug_setPrintValue

_dd_boardDebug_setStartPrintIndex:

;dd_boardDebug.c,55 :: 		void dd_boardDebug_setStartPrintIndex(unsigned char index){
;dd_boardDebug.c,56 :: 		dd_StartPrintIndex = index;
	MOV	#lo_addr(_dd_StartPrintIndex), W0
	MOV.B	W10, [W0]
;dd_boardDebug.c,57 :: 		}
L_end_dd_boardDebug_setStartPrintIndex:
	RETURN
; end of _dd_boardDebug_setStartPrintIndex

_dd_boardDebug_getPrintPosition:

;dd_boardDebug.c,59 :: 		unsigned char dd_boardDebug_getPrintPosition(unsigned char index){
;dd_boardDebug.c,60 :: 		if(dd_upMoves!=MAX_MOVES || dd_downMoves!=0){
	MOV	_dd_upMoves, W0
	CP	W0, #3
	BRA Z	L__dd_boardDebug_getPrintPosition48
	GOTO	L__dd_boardDebug_getPrintPosition29
L__dd_boardDebug_getPrintPosition48:
	MOV	_dd_downMoves, W0
	CP	W0, #0
	BRA Z	L__dd_boardDebug_getPrintPosition49
	GOTO	L__dd_boardDebug_getPrintPosition28
L__dd_boardDebug_getPrintPosition49:
	GOTO	L_dd_boardDebug_getPrintPosition2
L__dd_boardDebug_getPrintPosition29:
L__dd_boardDebug_getPrintPosition28:
;dd_boardDebug.c,61 :: 		return index - /*2*/4*(dd_downMoves);
	MOV	_dd_downMoves, W0
	SL	W0, #2, W1
	ZE	W10, W0
	SUB	W0, W1, W0
	GOTO	L_end_dd_boardDebug_getPrintPosition
;dd_boardDebug.c,62 :: 		}
L_dd_boardDebug_getPrintPosition2:
;dd_boardDebug.c,63 :: 		else return index;
	MOV.B	W10, W0
;dd_boardDebug.c,64 :: 		}
L_end_dd_boardDebug_getPrintPosition:
	RETURN
; end of _dd_boardDebug_getPrintPosition

_dd_boardDebug_drawRect:

;dd_boardDebug.c,66 :: 		void dd_boardDebug_drawRect(unsigned char index) {
;dd_boardDebug.c,68 :: 		index = dd_boardDebug_getPrintPosition(index);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dd_boardDebug_getPrintPosition
	MOV.B	W0, W10
;dd_boardDebug.c,69 :: 		x = BOARD_POSITION_COORDINATES[index][0];
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W2
;dd_boardDebug.c,70 :: 		y = BOARD_POSITION_COORDINATES[index][1];
	INC	W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_boardDebug.c,72 :: 		eGlcd(eGlcd_drawRect(
	ZE	W0, W0
	ADD	W0, #1, W1
	ZE	W2, W0
	INC	W0
	MOV.B	#28, W13
	MOV.B	#61, W12
	MOV.B	W1, W11
	MOV.B	W0, W10
	CALL	_eGlcd_drawRect
;dd_boardDebug.c,78 :: 		}
L_end_dd_boardDebug_drawRect:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_boardDebug_drawRect

_dd_boardDebug_writeValue:
	LNK	#4

;dd_boardDebug.c,80 :: 		void dd_boardDebug_writeValue(unsigned char index){
;dd_boardDebug.c,81 :: 		Indicator* indicator = dd_currentIndicators[index+BOARDS_OFFSET];
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
;dd_boardDebug.c,83 :: 		unsigned char title_letters = 0;
;dd_boardDebug.c,84 :: 		eGlcd_setFont(DD_xTerminal_Font);
	PUSH	W10
	MOV	#32, W13
	MOV.B	#8, W12
	MOV.B	#6, W11
	MOV	#lo_addr(dd_boardDebug_DynamisFont_xTerminal6x8), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_boardDebug.c,85 :: 		print_position = dd_boardDebug_getPrintPosition(index);
	CALL	_dd_boardDebug_getPrintPosition
	MOV.B	W0, [W14+2]
;dd_boardDebug.c,86 :: 		if(index + BOARDS_OFFSET < CAR_BOARDS ){
	ZE	W10, W0
	CP	W0, #7
	BRA LT	L__dd_boardDebug_writeValue52
	GOTO	L_dd_boardDebug_writeValue4
L__dd_boardDebug_writeValue52:
;dd_boardDebug.c,87 :: 		title_letters = eGlcd_getTextPixelLength(indicator->name)/2;
	MOV	[W14+0], W0
	INC2	W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_eGlcd_getTextPixelLength
	LSR	W0, #1, W4
;dd_boardDebug.c,88 :: 		eGlcd_writeText(indicator->name, BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X - title_letters, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN + TITLE_Y);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	INC	W0
	ADD	W0, #2, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W0
	ADD	W0, #30, W1
	ZE	W4, W0
	SUB	W1, W0, W1
	MOV	[W14+0], W0
	INC2	W0
	MOV.B	W2, W12
	MOV.B	W1, W11
	MOV	[W0], W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,89 :: 		eGlcd_writeText("T", BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W2
	ADD	W2, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #3, W0
	ADD	W0, #9, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
	ZE	W0, W0
	ADD	W0, #15, W0
	SUB	W0, #3, W0
	MOV.B	W1, W12
	MOV.B	W0, W11
	MOV	#lo_addr(?lstr1_dd_boardDebug), W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,90 :: 		eGlcd_writeText("I", BOARD_POSITION_COORDINATES[print_position][0] + 3*TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #3, W0
	ADD	W0, #9, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#45, W0
	ADD	W1, W0, W0
	SUB	W0, #3, W0
	MOV.B	W2, W12
	MOV.B	W0, W11
	MOV	#lo_addr(?lstr2_dd_boardDebug), W10
	CALL	_eGlcd_writeText
	POP	W10
;dd_boardDebug.c,91 :: 		dd_Indicator_parseValueLabel(index+ BOARDS_OFFSET );
	ZE	W10, W0
	MOV.B	W0, W10
	CALL	_dd_Indicator_parseValueLabel
;dd_boardDebug.c,92 :: 		eGlcd_writeText(indicator->label, BOARD_POSITION_COORDINATES[print_position][0] + 4*RECT_MARGIN , BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*2 + (FONT_HEIGHT+1)*2);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	INC2	W0
	ADD	W0, #18, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W0
	ADD	W0, #4, W1
	MOV	[W14+0], W0
	ADD	W0, #10, W0
	MOV.B	W2, W12
	MOV.B	W1, W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,93 :: 		} else if(index < CAR_BOARDS + CAR_SENSORS && index + BOARDS_OFFSET >= CAR_BOARDS  ){
	GOTO	L_dd_boardDebug_writeValue5
L_dd_boardDebug_writeValue4:
	CP.B	W10, #13
	BRA LTU	L__dd_boardDebug_writeValue53
	GOTO	L__dd_boardDebug_writeValue32
L__dd_boardDebug_writeValue53:
	ZE	W10, W0
	CP	W0, #7
	BRA GE	L__dd_boardDebug_writeValue54
	GOTO	L__dd_boardDebug_writeValue31
L__dd_boardDebug_writeValue54:
L__dd_boardDebug_writeValue30:
;dd_boardDebug.c,94 :: 		title_letters = eGlcd_getTextPixelLength(indicator->name)/2;
	MOV	[W14+0], W0
	INC2	W0
	PUSH	W10
	MOV	[W0], W10
	CALL	_eGlcd_getTextPixelLength
	LSR	W0, #1, W4
;dd_boardDebug.c,95 :: 		eGlcd_writeText(indicator->name, BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X - title_letters, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN + TITLE_Y);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	INC	W0
	ADD	W0, #2, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W0
	ADD	W0, #30, W1
	ZE	W4, W0
	SUB	W1, W0, W1
	MOV	[W14+0], W0
	INC2	W0
	MOV.B	W2, W12
	MOV.B	W1, W11
	MOV	[W0], W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,96 :: 		eGlcd_writeText("T", BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W2
	ADD	W2, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #3, W0
	ADD	W0, #9, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
	ZE	W0, W0
	ADD	W0, #15, W0
	SUB	W0, #3, W0
	MOV.B	W1, W12
	MOV.B	W0, W11
	MOV	#lo_addr(?lstr3_dd_boardDebug), W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,97 :: 		eGlcd_writeText("I", BOARD_POSITION_COORDINATES[print_position][0] + 3*TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #3, W0
	ADD	W0, #9, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W1
	MOV	#45, W0
	ADD	W1, W0, W0
	SUB	W0, #3, W0
	MOV.B	W2, W12
	MOV.B	W0, W11
	MOV	#lo_addr(?lstr4_dd_boardDebug), W10
	CALL	_eGlcd_writeText
	POP	W10
;dd_boardDebug.c,98 :: 		dd_Indicator_parseValueLabel(index+ BOARDS_OFFSET );
	ZE	W10, W0
	MOV.B	W0, W10
	CALL	_dd_Indicator_parseValueLabel
;dd_boardDebug.c,99 :: 		eGlcd_writeText(indicator->label, BOARD_POSITION_COORDINATES[print_position][0] + 4*RECT_MARGIN , BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*2 + (FONT_HEIGHT+1)*2);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(dd_boardDebug_BOARD_POSITION_COORDINATES), W0
	ADD	W0, W1, W3
	ADD	W3, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	INC2	W0
	ADD	W0, #18, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W3], W0
	ZE	W0, W0
	ADD	W0, #4, W1
	MOV	[W14+0], W0
	ADD	W0, #10, W0
	MOV.B	W2, W12
	MOV.B	W1, W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
;dd_boardDebug.c,93 :: 		} else if(index < CAR_BOARDS + CAR_SENSORS && index + BOARDS_OFFSET >= CAR_BOARDS  ){
L__dd_boardDebug_writeValue32:
L__dd_boardDebug_writeValue31:
;dd_boardDebug.c,100 :: 		}
L_dd_boardDebug_writeValue5:
;dd_boardDebug.c,101 :: 		}
L_end_dd_boardDebug_writeValue:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_boardDebug_writeValue

_dd_boardDebug_printRect:

;dd_boardDebug.c,105 :: 		void dd_boardDebug_printRect(unsigned char index){
;dd_boardDebug.c,106 :: 		dd_boardDebug_drawRect(index);
	PUSH	W10
	CALL	_dd_boardDebug_drawRect
	POP	W10
;dd_boardDebug.c,107 :: 		dd_boardDebug_writeValue(index);
	CALL	_dd_boardDebug_writeValue
;dd_boardDebug.c,108 :: 		}
L_end_dd_boardDebug_printRect:
	RETURN
; end of _dd_boardDebug_printRect

_dd_boardDebug_print:

;dd_boardDebug.c,110 :: 		void dd_boardDebug_print() {
;dd_boardDebug.c,112 :: 		if(dd_downMovement || dd_upMovement){
	PUSH	W10
	MOV	#lo_addr(_dd_downMovement), W0
	CP0.B	[W0]
	BRA Z	L__dd_boardDebug_print57
	GOTO	L__dd_boardDebug_print36
L__dd_boardDebug_print57:
	MOV	#lo_addr(_dd_upMovement), W0
	CP0.B	[W0]
	BRA Z	L__dd_boardDebug_print58
	GOTO	L__dd_boardDebug_print35
L__dd_boardDebug_print58:
	GOTO	L_dd_boardDebug_print11
L__dd_boardDebug_print36:
L__dd_boardDebug_print35:
;dd_boardDebug.c,113 :: 		dd_boardDebug_setStartPrintIndex(dd_printValue);
	MOV	#lo_addr(_dd_PrintValue), W0
	MOV.B	[W0], W10
	CALL	_dd_boardDebug_setStartPrintIndex
;dd_boardDebug.c,114 :: 		}
L_dd_boardDebug_print11:
;dd_boardDebug.c,115 :: 		printIndex = dd_StartPrintIndex;
	MOV	#lo_addr(_dd_StartPrintIndex), W0
; printIndex start address is: 2 (W1)
	MOV.B	[W0], W1
;dd_boardDebug.c,116 :: 		for (index = 0; index < BOARD_RECT_COUNT; index++) {
; index start address is: 0 (W0)
	CLR	W0
; printIndex end address is: 2 (W1)
; index end address is: 0 (W0)
L_dd_boardDebug_print12:
; index start address is: 0 (W0)
; printIndex start address is: 2 (W1)
	CP.B	W0, #4
	BRA LTU	L__dd_boardDebug_print59
	GOTO	L_dd_boardDebug_print13
L__dd_boardDebug_print59:
;dd_boardDebug.c,118 :: 		dd_boardDebug_printRect(printIndex);
	PUSH.D	W0
	MOV.B	W1, W10
	CALL	_dd_boardDebug_printRect
	POP.D	W0
;dd_boardDebug.c,119 :: 		printIndex++;
	INC.B	W1
;dd_boardDebug.c,116 :: 		for (index = 0; index < BOARD_RECT_COUNT; index++) {
	INC.B	W0
;dd_boardDebug.c,120 :: 		}
; index end address is: 0 (W0)
	GOTO	L_dd_boardDebug_print12
L_dd_boardDebug_print13:
;dd_boardDebug.c,121 :: 		dd_boardDebug_setPrintValue(printIndex-1);
	ZE	W1, W0
; printIndex end address is: 2 (W1)
	DEC	W0
	MOV.B	W0, W10
	CALL	_dd_boardDebug_setPrintValue
;dd_boardDebug.c,122 :: 		if(dd_downMovement || dd_upMovement){
	MOV	#lo_addr(_dd_downMovement), W0
	CP0.B	[W0]
	BRA Z	L__dd_boardDebug_print60
	GOTO	L__dd_boardDebug_print38
L__dd_boardDebug_print60:
	MOV	#lo_addr(_dd_upMovement), W0
	CP0.B	[W0]
	BRA Z	L__dd_boardDebug_print61
	GOTO	L__dd_boardDebug_print37
L__dd_boardDebug_print61:
	GOTO	L_dd_boardDebug_print17
L__dd_boardDebug_print38:
L__dd_boardDebug_print37:
;dd_boardDebug.c,123 :: 		dd_downMovement = FALSE;
	MOV	#lo_addr(_dd_downMovement), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,124 :: 		dd_upMovement = FALSE;
	MOV	#lo_addr(_dd_upMovement), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,125 :: 		}
L_dd_boardDebug_print17:
;dd_boardDebug.c,126 :: 		}
L_end_dd_boardDebug_print:
	POP	W10
	RETURN
; end of _dd_boardDebug_print

_dd_boardDebug_init:

;dd_boardDebug.c,128 :: 		void dd_boardDebug_init(void){
;dd_boardDebug.c,129 :: 		}
L_end_dd_boardDebug_init:
	RETURN
; end of _dd_boardDebug_init

_dd_boardDebug_Move:

;dd_boardDebug.c,132 :: 		void dd_boardDebug_Move(signed char movement){
;dd_boardDebug.c,134 :: 		if( dd_downMoves < MAX_MOVES && movement > 0 ) {
	PUSH	W10
	MOV	_dd_downMoves, W0
	CP	W0, #3
	BRA LT	L__dd_boardDebug_Move64
	GOTO	L__dd_boardDebug_Move42
L__dd_boardDebug_Move64:
	CP.B	W10, #0
	BRA GT	L__dd_boardDebug_Move65
	GOTO	L__dd_boardDebug_Move41
L__dd_boardDebug_Move65:
L__dd_boardDebug_Move40:
;dd_boardDebug.c,135 :: 		dd_downMovement = TRUE;
	MOV	#lo_addr(_dd_downMovement), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,136 :: 		value = dd_PrintValue+1;
	MOV	#lo_addr(_dd_PrintValue), W0
	ZE	[W0], W0
	INC	W0
;dd_boardDebug.c,137 :: 		dd_boardDebug_setPrintValue(value);
	MOV.B	W0, W10
	CALL	_dd_boardDebug_setPrintValue
;dd_boardDebug.c,138 :: 		dd_downMoves ++;
	MOV	#1, W1
	MOV	#lo_addr(_dd_downMoves), W0
	ADD	W1, [W0], [W0]
;dd_boardDebug.c,139 :: 		dd_upMoves --;
	MOV	#1, W1
	MOV	#lo_addr(_dd_upMoves), W0
	SUBR	W1, [W0], [W0]
;dd_boardDebug.c,140 :: 		}
	GOTO	L_dd_boardDebug_Move21
;dd_boardDebug.c,134 :: 		if( dd_downMoves < MAX_MOVES && movement > 0 ) {
L__dd_boardDebug_Move42:
L__dd_boardDebug_Move41:
;dd_boardDebug.c,141 :: 		else if( dd_upMoves < MAX_MOVES && movement < 0 ) {
	MOV	_dd_upMoves, W0
	CP	W0, #3
	BRA LT	L__dd_boardDebug_Move66
	GOTO	L__dd_boardDebug_Move44
L__dd_boardDebug_Move66:
	CP.B	W10, #0
	BRA LT	L__dd_boardDebug_Move67
	GOTO	L__dd_boardDebug_Move43
L__dd_boardDebug_Move67:
L__dd_boardDebug_Move39:
;dd_boardDebug.c,142 :: 		dd_upMovement = TRUE;
	MOV	#lo_addr(_dd_upMovement), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,143 :: 		value = dd_PrintValue-7;
	MOV	#lo_addr(_dd_PrintValue), W0
	ZE	[W0], W0
	SUB	W0, #7, W0
;dd_boardDebug.c,144 :: 		dd_boardDebug_setPrintValue(value);
	MOV.B	W0, W10
	CALL	_dd_boardDebug_setPrintValue
;dd_boardDebug.c,145 :: 		dd_downMoves --;
	MOV	#1, W1
	MOV	#lo_addr(_dd_downMoves), W0
	SUBR	W1, [W0], [W0]
;dd_boardDebug.c,146 :: 		dd_upMoves ++;
	MOV	#1, W1
	MOV	#lo_addr(_dd_upMoves), W0
	ADD	W1, [W0], [W0]
;dd_boardDebug.c,141 :: 		else if( dd_upMoves < MAX_MOVES && movement < 0 ) {
L__dd_boardDebug_Move44:
L__dd_boardDebug_Move43:
;dd_boardDebug.c,147 :: 		}
L_dd_boardDebug_Move21:
;dd_boardDebug.c,148 :: 		}
L_end_dd_boardDebug_Move:
	POP	W10
	RETURN
; end of _dd_boardDebug_Move

_dd_boardDebug_downMovement:

;dd_boardDebug.c,151 :: 		void dd_boardDebug_downMovement(){
;dd_boardDebug.c,153 :: 		if(dd_downMoves < MAX_MOVES){
	PUSH	W10
	MOV	_dd_downMoves, W0
	CP	W0, #3
	BRA LT	L__dd_boardDebug_downMovement69
	GOTO	L_dd_boardDebug_downMovement25
L__dd_boardDebug_downMovement69:
;dd_boardDebug.c,154 :: 		dd_downMovement = TRUE;
	MOV	#lo_addr(_dd_downMovement), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,155 :: 		value = dd_PrintValue-1;
	MOV	#lo_addr(_dd_PrintValue), W0
	ZE	[W0], W0
	DEC	W0
;dd_boardDebug.c,156 :: 		dd_boardDebug_setPrintValue(value);
	MOV.B	W0, W10
	CALL	_dd_boardDebug_setPrintValue
;dd_boardDebug.c,157 :: 		dd_downMoves ++;
	MOV	#1, W1
	MOV	#lo_addr(_dd_downMoves), W0
	ADD	W1, [W0], [W0]
;dd_boardDebug.c,158 :: 		dd_upMoves --;
	MOV	#1, W1
	MOV	#lo_addr(_dd_upMoves), W0
	SUBR	W1, [W0], [W0]
;dd_boardDebug.c,159 :: 		}
L_dd_boardDebug_downMovement25:
;dd_boardDebug.c,160 :: 		}
L_end_dd_boardDebug_downMovement:
	POP	W10
	RETURN
; end of _dd_boardDebug_downMovement

_dd_boardDebug_upMovement:

;dd_boardDebug.c,162 :: 		void dd_boardDebug_upMovement(){
;dd_boardDebug.c,164 :: 		if(dd_upMoves < MAX_MOVES){
	PUSH	W10
	MOV	_dd_upMoves, W0
	CP	W0, #3
	BRA LT	L__dd_boardDebug_upMovement71
	GOTO	L_dd_boardDebug_upMovement26
L__dd_boardDebug_upMovement71:
;dd_boardDebug.c,165 :: 		dd_upMovement = TRUE;
	MOV	#lo_addr(_dd_upMovement), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_boardDebug.c,166 :: 		value = dd_PrintValue-5;
	MOV	#lo_addr(_dd_PrintValue), W0
	ZE	[W0], W0
	SUB	W0, #5, W0
;dd_boardDebug.c,167 :: 		dd_boardDebug_setPrintValue(value);
	MOV.B	W0, W10
	CALL	_dd_boardDebug_setPrintValue
;dd_boardDebug.c,168 :: 		dd_downMoves --;
	MOV	#1, W1
	MOV	#lo_addr(_dd_downMoves), W0
	SUBR	W1, [W0], [W0]
;dd_boardDebug.c,169 :: 		dd_upMoves ++;
	MOV	#1, W1
	MOV	#lo_addr(_dd_upMoves), W0
	ADD	W1, [W0], [W0]
;dd_boardDebug.c,170 :: 		}
L_dd_boardDebug_upMovement26:
;dd_boardDebug.c,171 :: 		}
L_end_dd_boardDebug_upMovement:
	POP	W10
	RETURN
; end of _dd_boardDebug_upMovement
