
_eGlcd_init:

;eGlcd.c,36 :: 		void eGlcd_init() {
;eGlcd.c,37 :: 		BLACK = PIXEL_ON;                             // pixel_on means the pixel has been drawn (correctly in black) above default white background
	MOV	#lo_addr(_BLACK), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eGlcd.c,38 :: 		WHITE = PIXEL_OFF;
	MOV	#lo_addr(_WHITE), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,39 :: 		Glcd_Init();
	CALL	_Glcd_Init
;eGlcd.c,42 :: 		}
L_eGlcd_init0:
;eGlcd.c,43 :: 		}
L_end_eGlcd_init:
	RETURN
; end of _eGlcd_init

_eGlcd_invertColors:

;eGlcd.c,45 :: 		void eGlcd_invertColors(void) {
;eGlcd.c,46 :: 		if (BLACK == PIXEL_OFF) {
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__eGlcd_invertColors149
	GOTO	L_eGlcd_invertColors1
L__eGlcd_invertColors149:
;eGlcd.c,47 :: 		BLACK = PIXEL_ON;
	MOV	#lo_addr(_BLACK), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eGlcd.c,48 :: 		WHITE = PIXEL_OFF;
	MOV	#lo_addr(_WHITE), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,49 :: 		} else {
	GOTO	L_eGlcd_invertColors2
L_eGlcd_invertColors1:
;eGlcd.c,50 :: 		BLACK = PIXEL_OFF;
	MOV	#lo_addr(_BLACK), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,51 :: 		WHITE = PIXEL_ON;
	MOV	#lo_addr(_WHITE), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eGlcd.c,52 :: 		}
L_eGlcd_invertColors2:
;eGlcd.c,53 :: 		}
L_end_eGlcd_invertColors:
	RETURN
; end of _eGlcd_invertColors

_eGlcd_clear:

;eGlcd.c,55 :: 		void eGlcd_clear(void) {
;eGlcd.c,56 :: 		eGlcd_fill(WHITE);
	PUSH	W10
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W10
	CALL	_eGlcd_fill
;eGlcd.c,57 :: 		}
L_end_eGlcd_clear:
	POP	W10
	RETURN
; end of _eGlcd_clear

_eGlcd_fill:

;eGlcd.c,59 :: 		void eGlcd_fill(unsigned char color) {
;eGlcd.c,60 :: 		if (color) {
	PUSH	W10
	CP0.B	W10
	BRA NZ	L__eGlcd_fill152
	GOTO	L_eGlcd_fill3
L__eGlcd_fill152:
;eGlcd.c,61 :: 		eGlcd(Glcd_Fill(0xFF));
	MOV.B	#255, W10
	CALL	_Glcd_Fill
;eGlcd.c,62 :: 		} else {
	GOTO	L_eGlcd_fill4
L_eGlcd_fill3:
;eGlcd.c,63 :: 		eGlcd(Glcd_Fill(0x00));
	CLR	W10
	CALL	_Glcd_Fill
;eGlcd.c,64 :: 		}
L_eGlcd_fill4:
;eGlcd.c,65 :: 		}
L_end_eGlcd_fill:
	POP	W10
	RETURN
; end of _eGlcd_fill

_eGlcd_overwriteChar:

;eGlcd.c,68 :: 		void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y) {
;eGlcd.c,69 :: 		eGlcd_clearChar(oldChar, x, y);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W12
	PUSH	W11
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_clearChar
	POP	W11
	POP	W12
;eGlcd.c,70 :: 		eGlcd_writeChar(newChar, x, y);
	MOV.B	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeChar
;eGlcd.c,71 :: 		}
L_end_eGlcd_overwriteChar:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteChar

_eGlcd_clearChar:

;eGlcd.c,73 :: 		void eGlcd_clearChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,74 :: 		if (BLACK) {
	PUSH	W10
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_clearChar155
	GOTO	L_eGlcd_clearChar5
L__eGlcd_clearChar155:
;eGlcd.c,75 :: 		xGlcd_Write_Char(letter, x, y, WHITE);
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,76 :: 		} else {
	GOTO	L_eGlcd_clearChar6
L_eGlcd_clearChar5:
;eGlcd.c,77 :: 		xGLCD_Set_Transparency(TRUE);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_xGLCD_Set_Transparency
	POP	W10
;eGlcd.c,78 :: 		xGlcd_Write_Char(letter, x, y, WHITE);
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,79 :: 		xGLCD_Set_Transparency(FALSE);
	CLR	W10
	CALL	_xGLCD_Set_Transparency
;eGlcd.c,80 :: 		}
L_eGlcd_clearChar6:
;eGlcd.c,81 :: 		}
L_end_eGlcd_clearChar:
	POP	W13
	POP	W10
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eGlcd.c,83 :: 		void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,84 :: 		if (BLACK) {
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_writeChar157
	GOTO	L_eGlcd_writeChar7
L__eGlcd_writeChar157:
;eGlcd.c,85 :: 		xGlcd_Write_Char(letter, x, y, BLACK);
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,86 :: 		} else {
	GOTO	L_eGlcd_writeChar8
L_eGlcd_writeChar7:
;eGlcd.c,87 :: 		xGlcd_Write_Char(letter, x, y, INVERT);
	MOV.B	#2, W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,88 :: 		}
L_eGlcd_writeChar8:
;eGlcd.c,89 :: 		}
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eGlcd.c,91 :: 		void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
;eGlcd.c,92 :: 		eGlcd_clearText(oldText, x, y);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W12
	PUSH	W11
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_clearText
	POP	W11
	POP	W12
;eGlcd.c,93 :: 		eGlcd_writeText(newText, x, y);
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eGlcd.c,94 :: 		}
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eGlcd.c,96 :: 		void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,97 :: 		if (BLACK) {
	PUSH	W10
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_clearText160
	GOTO	L_eGlcd_clearText9
L__eGlcd_clearText160:
;eGlcd.c,98 :: 		xGlcd_Write_Text(text, x, y, WHITE);
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,99 :: 		} else {
	GOTO	L_eGlcd_clearText10
L_eGlcd_clearText9:
;eGlcd.c,100 :: 		xGLCD_Set_Transparency(TRUE);
	PUSH	W10
	MOV.B	#1, W10
	CALL	_xGLCD_Set_Transparency
	POP	W10
;eGlcd.c,101 :: 		xGlcd_Write_Text(text, x, y, WHITE);
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,102 :: 		xGLCD_Set_Transparency(FALSE);
	CLR	W10
	CALL	_xGLCD_Set_Transparency
;eGlcd.c,103 :: 		}
L_eGlcd_clearText10:
;eGlcd.c,104 :: 		}
L_end_eGlcd_clearText:
	POP	W13
	POP	W10
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eGlcd.c,106 :: 		void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,107 :: 		if (BLACK) {
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_writeText162
	GOTO	L_eGlcd_writeText11
L__eGlcd_writeText162:
;eGlcd.c,108 :: 		xGlcd_Write_Text(text, x, y, BLACK);
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,109 :: 		} else {
	GOTO	L_eGlcd_writeText12
L_eGlcd_writeText11:
;eGlcd.c,110 :: 		xGlcd_Write_Text(text, x, y, INVERT);
	MOV.B	#2, W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,111 :: 		}
L_eGlcd_writeText12:
;eGlcd.c,112 :: 		}
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_setupTimer:

;eGlcd.c,114 :: 		void eGlcd_setupTimer(void) {
;eGlcd.c,118 :: 		}
L_end_eGlcd_setupTimer:
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eGlcd.c,120 :: 		void eGlcd_setTimerCoefficient(float coefficient) {
;eGlcd.c,121 :: 		EGLCD_TIMER_COEFFICIENT = coefficient;
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eGlcd.c,122 :: 		}
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eGlcd.c,124 :: 		unsigned int eGlcd_getTextPixelLength(char *text) {
;eGlcd.c,125 :: 		unsigned int textPixelLength = 0, i;
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eGlcd.c,126 :: 		for (i = 0; i < strlen(text); i += 1) {
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength13:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength166
	GOTO	L_eGlcd_getTextPixelLength14
L__eGlcd_getTextPixelLength166:
;eGlcd.c,127 :: 		textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eGlcd.c,126 :: 		for (i = 0; i < strlen(text); i += 1) {
	INC	W6
;eGlcd.c,128 :: 		}
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength13
L_eGlcd_getTextPixelLength14:
;eGlcd.c,129 :: 		return textPixelLength;
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eGlcd.c,130 :: 		}
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

_eGlcd_drawRect:
	LNK	#10

;eGlcd.c,142 :: 		void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height)
;eGlcd.c,144 :: 		char pageCount = 0;
	PUSH	W11
;eGlcd.c,146 :: 		unsigned char xOffset = 0;
;eGlcd.c,147 :: 		signed char lastX = 0;
;eGlcd.c,151 :: 		char startSide1 = 0, endSide2 = 0;
;eGlcd.c,152 :: 		char startSide = 0, endSide = 0;
;eGlcd.c,156 :: 		if(x+width>127 || y+height>63) return;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#127, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect168
	GOTO	L__eGlcd_drawRect126
L__eGlcd_drawRect168:
	ZE	W11, W1
	ZE	W13, W0
	ADD	W1, W0, W1
	MOV	#63, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect169
	GOTO	L__eGlcd_drawRect125
L__eGlcd_drawRect169:
	GOTO	L_eGlcd_drawRect18
L__eGlcd_drawRect126:
L__eGlcd_drawRect125:
	GOTO	L_end_eGlcd_drawRect
L_eGlcd_drawRect18:
;eGlcd.c,159 :: 		page = y / 8;           ///< Page index. Integer division, will be a value between 0 and 7.
	ZE	W11, W0
	ASR	W0, #3, W0
	MOV.B	W0, [W14+5]
;eGlcd.c,160 :: 		pageOffset = y % 8;     ///< Row index inside page, increasing downwards.
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	MOV.B	W0, [W14+6]
;eGlcd.c,161 :: 		pageCount = ceil((pageOffset+height)/8.0);  ///< The rect spans at least this number of pages. According to the offset it might fall into another page.
	ZE	W0, W1
	ZE	W13, W0
	ADD	W1, W0, W0
	PUSH.D	W12
	PUSH	W10
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16640, W3
	CALL	__Div_FP
	MOV.D	W0, W10
	CALL	_ceil
	CALL	__Float2Longint
	POP	W10
	POP.D	W12
; pageCount start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,162 :: 		pageOverflow = 8 + pageOffset + height - pageCount*8 ;   ///< How many rows it falls onto next page.
	ADD	W14, #6, W1
	ZE	[W1], W1
	ADD	W1, #8, W2
	ZE	W13, W1
	ADD	W2, W1, W1
	ZE	W0, W0
	SL	W0, #3, W0
; pageOverflow start address is: 10 (W5)
	SUB.B	W1, W0, W5
;eGlcd.c,163 :: 		startSide1 = x<=63;       ///< Starts on side 1 condition.
	MOV.B	#63, W0
	CP.B	W10, W0
	CLR.B	W2
	BRA GTU	L__eGlcd_drawRect170
	INC.B	W2
L__eGlcd_drawRect170:
; startSide1 start address is: 6 (W3)
	MOV.B	W2, W3
;eGlcd.c,164 :: 		endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#63, W0
; endSide2 start address is: 16 (W8)
	CP	W1, W0
	CLR.B	W8
	BRA LEU	L__eGlcd_drawRect171
	INC.B	W8
L__eGlcd_drawRect171:
;eGlcd.c,165 :: 		startSide = startSide1 ? 0 : 1;
	CP0.B	W2
	BRA NZ	L__eGlcd_drawRect172
	GOTO	L_eGlcd_drawRect19
L__eGlcd_drawRect172:
; ?FLOC___eGlcd_drawRect?T25 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T25 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect20
L_eGlcd_drawRect19:
; ?FLOC___eGlcd_drawRect?T25 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T25 end address is: 0 (W0)
L_eGlcd_drawRect20:
; ?FLOC___eGlcd_drawRect?T25 start address is: 0 (W0)
; startSide start address is: 8 (W4)
	MOV.B	W0, W4
; ?FLOC___eGlcd_drawRect?T25 end address is: 0 (W0)
;eGlcd.c,166 :: 		endSide = endSide2 ? 1 : 0;
	CP0.B	W8
	BRA NZ	L__eGlcd_drawRect173
	GOTO	L_eGlcd_drawRect21
L__eGlcd_drawRect173:
; ?FLOC___eGlcd_drawRect?T26 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T26 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect22
L_eGlcd_drawRect21:
; ?FLOC___eGlcd_drawRect?T26 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T26 end address is: 0 (W0)
L_eGlcd_drawRect22:
; ?FLOC___eGlcd_drawRect?T26 start address is: 0 (W0)
	MOV.B	W0, [W14+9]
; ?FLOC___eGlcd_drawRect?T26 end address is: 0 (W0)
;eGlcd.c,169 :: 		xOffset = x;            ///< The x offset inside GLCD side to print to.
	MOV.B	W10, [W14+7]
;eGlcd.c,170 :: 		if(x>63) {
	MOV.B	#63, W0
	CP.B	W10, W0
	BRA GTU	L__eGlcd_drawRect174
	GOTO	L_eGlcd_drawRect23
L__eGlcd_drawRect174:
;eGlcd.c,171 :: 		xOffset -= 64;
	MOV.B	[W14+7], W2
	MOV.B	#64, W1
	ADD	W14, #7, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,172 :: 		}
L_eGlcd_drawRect23:
;eGlcd.c,173 :: 		lastX = xOffset+width;
	ADD	W14, #7, W0
	ZE	[W0], W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV.B	W1, [W14+8]
;eGlcd.c,174 :: 		if(lastX > 63)
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA GT	L__eGlcd_drawRect175
	GOTO	L_eGlcd_drawRect24
L__eGlcd_drawRect175:
;eGlcd.c,175 :: 		lastX = 63;
	MOV.B	#63, W0
	MOV.B	W0, [W14+8]
L_eGlcd_drawRect24:
;eGlcd.c,178 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	W4, [W14+2]
; startSide end address is: 8 (W4)
; pageCount end address is: 12 (W6)
; startSide1 end address is: 6 (W3)
; endSide2 end address is: 16 (W8)
; pageOverflow end address is: 10 (W5)
	MOV.B	W5, W9
	MOV.B	W3, W2
L_eGlcd_drawRect25:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 4 (W2)
; pageOverflow start address is: 18 (W9)
; pageCount start address is: 12 (W6)
	MOV.B	[W14+2], W1
	ADD	W14, #9, W0
	CP.B	W1, [W0]
	BRA LEU	L__eGlcd_drawRect176
	GOTO	L__eGlcd_drawRect146
L__eGlcd_drawRect176:
	MOV.B	[W14+8], W0
	CP.B	W0, #0
	BRA GT	L__eGlcd_drawRect177
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect177:
L__eGlcd_drawRect123:
;eGlcd.c,180 :: 		eGlcd(Glcd_Set_Side(k*64););
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #6, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
	POP	W10
;eGlcd.c,181 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
	MOV.B	[W14+5], W0
	MOV.B	W0, [W14+0]
; startSide1 end address is: 4 (W2)
; pageOverflow end address is: 18 (W9)
; pageCount end address is: 12 (W6)
; endSide2 end address is: 16 (W8)
	MOV.B	W8, W7
	MOV.B	W2, W3
	MOV.B	W9, W5
	MOV.B	W6, W4
L_eGlcd_drawRect30:
; pageCount start address is: 8 (W4)
; pageOverflow start address is: 10 (W5)
; startSide1 start address is: 6 (W3)
; endSide2 start address is: 14 (W7)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA LTU	L__eGlcd_drawRect178
	GOTO	L__eGlcd_drawRect144
L__eGlcd_drawRect178:
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__eGlcd_drawRect179
	GOTO	L__eGlcd_drawRect143
L__eGlcd_drawRect179:
L__eGlcd_drawRect122:
;eGlcd.c,183 :: 		Glcd_Set_Page(i);
	PUSH	W7
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
;eGlcd.c,184 :: 		Glcd_Set_X(xOffset);
	MOV.B	[W14+7], W10
	CALL	_Glcd_Set_X
	POP	W10
	POP	W7
;eGlcd.c,185 :: 		if(i==page && pageOffset)   ///< If we are in first page and there is a row offset...
	MOV.B	[W14+0], W1
	ADD	W14, #5, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect180
	GOTO	L__eGlcd_drawRect132
L__eGlcd_drawRect180:
	ADD	W14, #6, W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_drawRect181
	GOTO	L__eGlcd_drawRect131
L__eGlcd_drawRect181:
L__eGlcd_drawRect121:
;eGlcd.c,187 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect38:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect182
	GOTO	L_eGlcd_drawRect39
L__eGlcd_drawRect182:
;eGlcd.c,189 :: 		byte = ~(0xFF<<pageOffset);
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #3, W1
	COM.B	W0, [W1]
;eGlcd.c,190 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,191 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,192 :: 		byte&=rByte;
	ADD	W14, #3, W1
	AND.B	W0, [W1], [W1]
;eGlcd.c,194 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect183
	GOTO	L__eGlcd_drawRect128
L__eGlcd_drawRect183:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect184
	INC.B	W0
L__eGlcd_drawRect184:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect127
	GOTO	L__eGlcd_drawRect118
L__eGlcd_drawRect128:
L__eGlcd_drawRect127:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect185
	GOTO	L__eGlcd_drawRect130
L__eGlcd_drawRect185:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect186
	INC.B	W0
L__eGlcd_drawRect186:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect187
	INC.B	W0
L__eGlcd_drawRect187:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect129
	GOTO	L__eGlcd_drawRect118
L__eGlcd_drawRect130:
L__eGlcd_drawRect129:
	GOTO	L_eGlcd_drawRect47
L__eGlcd_drawRect118:
;eGlcd.c,195 :: 		byte2 = 0xFF<<pageOffset;
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+4]
	GOTO	L_eGlcd_drawRect48
L_eGlcd_drawRect47:
;eGlcd.c,197 :: 		byte2 = 1<<pageOffset;
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect48:
;eGlcd.c,198 :: 		byte|= byte2;
	MOV.B	[W14+4], W1
	ADD	W14, #3, W0
	IOR.B	W1, [W0], [W0]
;eGlcd.c,200 :: 		if(j>=62)
	MOV.B	[W14+1], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect188
	GOTO	L_eGlcd_drawRect49
L__eGlcd_drawRect188:
;eGlcd.c,201 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
L_eGlcd_drawRect49:
;eGlcd.c,202 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,203 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,187 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,204 :: 		}
	GOTO	L_eGlcd_drawRect38
L_eGlcd_drawRect39:
;eGlcd.c,205 :: 		}
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	MOV.B	W6, W8
	GOTO	L_eGlcd_drawRect50
;eGlcd.c,185 :: 		if(i==page && pageOffset)   ///< If we are in first page and there is a row offset...
L__eGlcd_drawRect132:
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect131:
;eGlcd.c,206 :: 		else if (i == (page+pageCount-1) && pageOverflow)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W0
	SUB	W0, #1, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__eGlcd_drawRect189
	GOTO	L__eGlcd_drawRect138
L__eGlcd_drawRect189:
	CP0.B	W5
	BRA NZ	L__eGlcd_drawRect190
	GOTO	L__eGlcd_drawRect137
L__eGlcd_drawRect190:
L__eGlcd_drawRect117:
;eGlcd.c,208 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect54:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect191
	GOTO	L_eGlcd_drawRect55
L__eGlcd_drawRect191:
;eGlcd.c,210 :: 		byte = (0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+3]
;eGlcd.c,211 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,212 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,213 :: 		byte &= rByte;
	ADD	W14, #3, W2
	ADD	W14, #3, W1
	AND.B	W0, [W2], [W1]
;eGlcd.c,215 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect192
	GOTO	L__eGlcd_drawRect134
L__eGlcd_drawRect192:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect193
	INC.B	W0
L__eGlcd_drawRect193:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect133
	GOTO	L__eGlcd_drawRect114
L__eGlcd_drawRect134:
L__eGlcd_drawRect133:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect194
	GOTO	L__eGlcd_drawRect136
L__eGlcd_drawRect194:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect195
	INC.B	W0
L__eGlcd_drawRect195:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect196
	INC.B	W0
L__eGlcd_drawRect196:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect135
	GOTO	L__eGlcd_drawRect114
L__eGlcd_drawRect136:
L__eGlcd_drawRect135:
	GOTO	L_eGlcd_drawRect63
L__eGlcd_drawRect114:
;eGlcd.c,216 :: 		byte2 = ~(0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	ADD	W14, #4, W1
	COM.B	W0, [W1]
	GOTO	L_eGlcd_drawRect64
L_eGlcd_drawRect63:
;eGlcd.c,218 :: 		byte2 = 1<<(pageOverflow-1);
	SE	W5, W0
	SUB	W0, #1, W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect64:
;eGlcd.c,219 :: 		byte|= byte2;
	MOV.B	[W14+3], W2
	ADD	W14, #4, W1
	ADD	W14, #3, W0
	IOR.B	W2, [W1], [W0]
;eGlcd.c,221 :: 		if(j>=61)
	MOV.B	[W14+1], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect197
	GOTO	L_eGlcd_drawRect65
L__eGlcd_drawRect197:
;eGlcd.c,222 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
L_eGlcd_drawRect65:
;eGlcd.c,223 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,224 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,208 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,225 :: 		}
	GOTO	L_eGlcd_drawRect54
L_eGlcd_drawRect55:
;eGlcd.c,226 :: 		}
	MOV.B	W6, W8
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	GOTO	L_eGlcd_drawRect66
;eGlcd.c,206 :: 		else if (i == (page+pageCount-1) && pageOverflow)
L__eGlcd_drawRect138:
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect137:
;eGlcd.c,229 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W2
L_eGlcd_drawRect67:
; endSide2 start address is: 4 (W2)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect198
	GOTO	L_eGlcd_drawRect68
L__eGlcd_drawRect198:
;eGlcd.c,231 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect199
	GOTO	L__eGlcd_drawRect140
L__eGlcd_drawRect199:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect200
	INC.B	W0
L__eGlcd_drawRect200:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect139
	GOTO	L__eGlcd_drawRect111
L__eGlcd_drawRect140:
L__eGlcd_drawRect139:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect201
	GOTO	L__eGlcd_drawRect142
L__eGlcd_drawRect201:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect202
	INC.B	W0
L__eGlcd_drawRect202:
	ZE	W2, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect203
	INC.B	W0
L__eGlcd_drawRect203:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect141
	GOTO	L__eGlcd_drawRect111
L__eGlcd_drawRect142:
L__eGlcd_drawRect141:
	GOTO	L_eGlcd_drawRect76
L__eGlcd_drawRect111:
;eGlcd.c,232 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+3]
	GOTO	L_eGlcd_drawRect77
L_eGlcd_drawRect76:
;eGlcd.c,234 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+3]
L_eGlcd_drawRect77:
;eGlcd.c,235 :: 		Glcd_Write_Data(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,229 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,236 :: 		}
	GOTO	L_eGlcd_drawRect67
L_eGlcd_drawRect68:
;eGlcd.c,237 :: 		}
	MOV.B	W2, W8
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W3, W7
L_eGlcd_drawRect66:
; endSide2 end address is: 4 (W2)
; pageCount start address is: 8 (W4)
; pageOverflow start address is: 10 (W5)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect50:
;eGlcd.c,181 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,239 :: 		}
	MOV.B	W7, W3
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
	MOV.B	W8, W7
	GOTO	L_eGlcd_drawRect30
;eGlcd.c,181 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
L__eGlcd_drawRect144:
; startSide1 start address is: 6 (W3)
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect143:
;eGlcd.c,240 :: 		lastX=x+width-64;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W2
	MOV.B	#64, W1
	ADD	W14, #8, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,241 :: 		xOffset=0;
	CLR	W0
	MOV.B	W0, [W14+7]
;eGlcd.c,178 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,242 :: 		}
	MOV.B	W4, W6
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W5, W9
	MOV.B	W3, W2
	MOV.B	W7, W8
	GOTO	L_eGlcd_drawRect25
;eGlcd.c,178 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
L__eGlcd_drawRect146:
L__eGlcd_drawRect145:
;eGlcd.c,243 :: 		}
L_end_eGlcd_drawRect:
	POP	W11
	ULNK
	RETURN
; end of _eGlcd_drawRect

_xGlcd_Set_Font:

;eGlcd.c,254 :: 		unsigned short font_height, unsigned int font_offset) {
;eGlcd.c,255 :: 		xGlcdSelFont = ptrFontTbl;
	MOV	W10, eGlcd_xGlcdSelFont
;eGlcd.c,256 :: 		xGlcdSelFontWidth = font_width;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	MOV.B	W11, [W0]
;eGlcd.c,257 :: 		xGlcdSelFontHeight = font_height;
	MOV	#lo_addr(eGlcd_xGlcdSelFontHeight), W0
	MOV.B	W12, [W0]
;eGlcd.c,258 :: 		xGlcdSelFontOffset = font_offset;
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	MOV.B	W13, [W0]
;eGlcd.c,259 :: 		xGLCD_Transparency = FALSE;  //Transparency of Text is set to False !!!
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,260 :: 		xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
	ZE	W12, W0
	ASR	W0, #3, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	MOV.B	W1, [W0]
;eGlcd.c,261 :: 		if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
	ZE	W12, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP0	W0
	BRA NZ	L__xGlcd_Set_Font205
	GOTO	L_xGlcd_Set_Font78
L__xGlcd_Set_Font205:
	MOV.B	#1, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font78:
;eGlcd.c,262 :: 		}
L_end_xGlcd_Set_Font:
	RETURN
; end of _xGlcd_Set_Font

_xGLCD_Write_Data:

;eGlcd.c,265 :: 		void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
;eGlcd.c,268 :: 		if ((pX > 127) || (pY > 63)) return;
	PUSH	W10
	MOV.B	#127, W0
	CP.B	W10, W0
	BRA LEU	L__xGLCD_Write_Data207
	GOTO	L__xGLCD_Write_Data108
L__xGLCD_Write_Data207:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data208
	GOTO	L__xGLCD_Write_Data107
L__xGLCD_Write_Data208:
	GOTO	L_xGLCD_Write_Data81
L__xGLCD_Write_Data108:
L__xGLCD_Write_Data107:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data81:
;eGlcd.c,269 :: 		xx = pX % 64;
	ZE	W10, W0
	MOV	#64, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; xx start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,270 :: 		tmp = pY / 8;
	ZE	W11, W0
	ASR	W0, #3, W0
; tmp start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,272 :: 		tmpY = pY % 8;
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; tmpY start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,273 :: 		if (tmpY) {
	CP0.B	W0
	BRA NZ	L__xGLCD_Write_Data209
	GOTO	L_xGLCD_Write_Data82
L__xGLCD_Write_Data209:
;eGlcd.c,275 :: 		gData = pData << tmpY;
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,276 :: 		eGlcd(Glcd_Set_Side(pX);
	CALL	_Glcd_Set_Side
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
	CALL	_Glcd_Set_Page
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,281 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data210
	GOTO	L__xGLCD_Write_Data109
L__xGLCD_Write_Data210:
;eGlcd.c,282 :: 		dataR = dataR & (0xff >> (8 - tmpY));
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
; dataR start address is: 0 (W0)
	AND.B	W6, W0, W0
; dataR end address is: 12 (W6)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data83
L__xGLCD_Write_Data109:
;eGlcd.c,281 :: 		if (!xGLCD_Transparency)
	MOV.B	W6, W0
;eGlcd.c,282 :: 		dataR = dataR & (0xff >> (8 - tmpY));
L_xGLCD_Write_Data83:
;eGlcd.c,283 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 12 (W6)
	IOR.B	W5, W0, W6
; gData end address is: 10 (W5)
; dataR end address is: 0 (W0)
;eGlcd.c,284 :: 		eGlcd(Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W6, W10
; dataR end address is: 12 (W6)
	CALL	_Glcd_Write_Data
;eGlcd.c,287 :: 		tmp++;
	ADD.B	W4, #1, W0
	MOV.B	W0, W4
;eGlcd.c,288 :: 		if (tmp > 7) return;
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data211
	GOTO	L_xGLCD_Write_Data84
L__xGLCD_Write_Data211:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 8 (W4)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data84:
;eGlcd.c,289 :: 		eGlcd(Glcd_Set_X(xx);
; tmp start address is: 8 (W4)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 8 (W4)
	MOV.B	W0, W4
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,294 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data212
	GOTO	L__xGLCD_Write_Data110
L__xGLCD_Write_Data212:
;eGlcd.c,295 :: 		dataR = dataR & (0xff << tmpY);
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 0 (W0)
	AND.B	W5, W0, W0
; dataR end address is: 10 (W5)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data85
L__xGLCD_Write_Data110:
;eGlcd.c,294 :: 		if (!xGLCD_Transparency)
	MOV.B	W5, W0
;eGlcd.c,295 :: 		dataR = dataR & (0xff << tmpY);
L_xGLCD_Write_Data85:
;eGlcd.c,296 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 4 (W2)
	IOR.B	W4, W0, W2
; gData end address is: 8 (W4)
; dataR end address is: 0 (W0)
;eGlcd.c,297 :: 		eGlcd(Glcd_Set_X(xx);
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,299 :: 		}
	GOTO	L_xGLCD_Write_Data86
L_xGLCD_Write_Data82:
;eGlcd.c,301 :: 		eGlcd(Glcd_Set_Side(pX);
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	CALL	_Glcd_Set_Side
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eGlcd.c,304 :: 		if (xGLCD_Transparency) {
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data213
	GOTO	L_xGLCD_Write_Data87
L__xGLCD_Write_Data213:
;eGlcd.c,305 :: 		eGlcd(dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eGlcd.c,308 :: 		}
	MOV.B	W0, W2
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data88
L_xGLCD_Write_Data87:
;eGlcd.c,310 :: 		dataR = pData;
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
	MOV.B	W0, W2
L_xGLCD_Write_Data88:
;eGlcd.c,311 :: 		eGlcd(Glcd_Set_X(xx);
; dataR start address is: 4 (W2)
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,313 :: 		}
L_xGLCD_Write_Data86:
;eGlcd.c,314 :: 		}
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eGlcd.c,316 :: 		unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,321 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,322 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,323 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W3
;eGlcd.c,324 :: 		CharWidth = *CurCharData;
	MOV	#___Lib_System_DefaultPage, W2
	MOV	W2, 52
	MOV.B	[W3], W2
; CharWidth start address is: 4 (W2)
;eGlcd.c,325 :: 		cOffset++;
; cOffset start address is: 10 (W5)
	ADD	W0, #1, W5
	ADDC	W1, #0, W6
;eGlcd.c,326 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 14 (W7)
	CLR	W7
; CharWidth end address is: 4 (W2)
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	MOV.B	W2, W4
L_xGlcd_Write_Char89:
; i start address is: 14 (W7)
; cOffset start address is: 10 (W5)
; CharWidth start address is: 8 (W4)
	CP.B	W7, W4
	BRA LTU	L__xGlcd_Write_Char215
	GOTO	L_xGlcd_Write_Char90
L__xGlcd_Write_Char215:
;eGlcd.c,327 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 16 (W8)
	CLR	W8
; CharWidth end address is: 8 (W4)
; cOffset end address is: 10 (W5)
; j end address is: 16 (W8)
; i end address is: 14 (W7)
L_xGlcd_Write_Char92:
; j start address is: 16 (W8)
; CharWidth start address is: 8 (W4)
; cOffset start address is: 10 (W5)
; i start address is: 14 (W7)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W8, [W0]
	BRA LTU	L__xGlcd_Write_Char216
	GOTO	L_xGlcd_Write_Char93
L__xGlcd_Write_Char216:
;eGlcd.c,328 :: 		CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
	ZE	W7, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W0
	ADD	W2, [W0], W1
	ZE	W8, W0
	ADD	W1, W0, W0
; CurCharData start address is: 2 (W1)
	ADD	W0, W5, W1
;eGlcd.c,329 :: 		switch (color) {
	GOTO	L_xGlcd_Write_Char95
; CurCharData end address is: 2 (W1)
;eGlcd.c,330 :: 		case 0 :
L_xGlcd_Write_Char97:
;eGlcd.c,331 :: 		CharData = 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;eGlcd.c,332 :: 		break;
	GOTO	L_xGlcd_Write_Char96
;eGlcd.c,333 :: 		case 1 :
L_xGlcd_Write_Char98:
;eGlcd.c,334 :: 		CharData = *CurCharData;
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eGlcd.c,335 :: 		break;
	GOTO	L_xGlcd_Write_Char96
;eGlcd.c,336 :: 		case 2 :
L_xGlcd_Write_Char99:
;eGlcd.c,337 :: 		CharData = ~(*CurCharData);
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,338 :: 		break;
	GOTO	L_xGlcd_Write_Char96
;eGlcd.c,339 :: 		}
L_xGlcd_Write_Char95:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char217
	GOTO	L_xGlcd_Write_Char97
L__xGlcd_Write_Char217:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char218
	GOTO	L_xGlcd_Write_Char98
L__xGlcd_Write_Char218:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char219
	GOTO	L_xGlcd_Write_Char99
L__xGlcd_Write_Char219:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char96:
;eGlcd.c,340 :: 		xGLCD_Write_Data(x + i, y + j * 8, CharData);
	ZE	W8, W0
	SL	W0, #3, W1
	ZE	W12, W0
	ADD	W0, W1, W2
	ZE	W11, W1
	ZE	W7, W0
	ADD	W1, W0, W0
	PUSH.D	W4
	PUSH.D	W6
	PUSH	W8
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W14+0], W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_xGLCD_Write_Data
	POP.D	W10
	POP	W12
	POP	W8
	POP.D	W6
	POP.D	W4
;eGlcd.c,327 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W8
;eGlcd.c,341 :: 		};
; j end address is: 16 (W8)
	GOTO	L_xGlcd_Write_Char92
L_xGlcd_Write_Char93:
;eGlcd.c,326 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W7
;eGlcd.c,341 :: 		};
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	GOTO	L_xGlcd_Write_Char89
L_xGlcd_Write_Char90:
;eGlcd.c,342 :: 		return CharWidth;
	MOV.B	W4, W0
; CharWidth end address is: 8 (W4)
;eGlcd.c,343 :: 		}
L_end_xGlcd_Write_Char:
	ULNK
	RETURN
; end of _xGlcd_Write_Char

_xGlcd_Char_Width:

;eGlcd.c,345 :: 		unsigned short xGlcd_Char_Width(unsigned short ch) {
;eGlcd.c,348 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,349 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,350 :: 		CurCharDt = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,351 :: 		return *CurCharDt;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
;eGlcd.c,352 :: 		}
L_end_xGlcd_Char_Width:
	RETURN
; end of _xGlcd_Char_Width

_xGlcd_Write_Text:

;eGlcd.c,354 :: 		void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,357 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,358 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,359 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,360 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Write_Text100:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text222
	GOTO	L_xGlcd_Write_Text101
L__xGlcd_Write_Text222:
;eGlcd.c,361 :: 		posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1; //add 1 blank column
	PUSH	W2
	PUSH.D	W4
	PUSH	W3
	PUSH.D	W10
	MOV.B	W5, W11
	MOV.B	[W4], W10
	CALL	_xGlcd_Write_Char
	POP.D	W10
	POP	W3
	POP.D	W4
	POP	W2
	ZE	W5, W1
; posX end address is: 10 (W5)
	ZE	W0, W0
	ADD	W1, W0, W0
; posX start address is: 0 (W0)
	INC.B	W0
;eGlcd.c,362 :: 		curChar++;
	INC	W4
;eGlcd.c,360 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,363 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Write_Text100
L_xGlcd_Write_Text101:
;eGlcd.c,364 :: 		}
L_end_xGlcd_Write_Text:
	RETURN
; end of _xGlcd_Write_Text

_xGlcd_Text_Width:

;eGlcd.c,366 :: 		unsigned short xGlcd_Text_Width(char *text) {
;eGlcd.c,368 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,369 :: 		w = 0;
; w start address is: 16 (W8)
	CLR	W8
;eGlcd.c,370 :: 		for (i = 0; i < l; i++)
; i start address is: 14 (W7)
	CLR	W7
; w end address is: 16 (W8)
; l end address is: 12 (W6)
; i end address is: 14 (W7)
L_xGlcd_Text_Width103:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width224
	GOTO	L_xGlcd_Text_Width104
L__xGlcd_Text_Width224:
;eGlcd.c,371 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
	ZE	W7, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W8, W1
; w end address is: 16 (W8)
	ZE	W0, W0
	ADD	W1, W0, W0
; w start address is: 0 (W0)
	INC.B	W0
;eGlcd.c,370 :: 		for (i = 0; i < l; i++)
	INC.B	W7
;eGlcd.c,371 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
; l end address is: 12 (W6)
; w end address is: 0 (W0)
; i end address is: 14 (W7)
	MOV.B	W0, W8
	GOTO	L_xGlcd_Text_Width103
L_xGlcd_Text_Width104:
;eGlcd.c,372 :: 		return w;
; w start address is: 16 (W8)
	MOV.B	W8, W0
; w end address is: 16 (W8)
;eGlcd.c,373 :: 		}
L_end_xGlcd_Text_Width:
	RETURN
; end of _xGlcd_Text_Width

_xGLCD_Set_Transparency:

;eGlcd.c,375 :: 		void xGLCD_Set_Transparency(char active) {
;eGlcd.c,376 :: 		xGLCD_Transparency = active;
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	MOV.B	W10, [W0]
;eGlcd.c,377 :: 		}
L_end_xGLCD_Set_Transparency:
	RETURN
; end of _xGLCD_Set_Transparency
