
_eGlcd_init:

;eGlcd.c,42 :: 		void eGlcd_init() {
;eGlcd.c,48 :: 		Glcd_Init();
	CALL	_Glcd_Init
;eGlcd.c,52 :: 		}
L_eGlcd_init0:
;eGlcd.c,53 :: 		}
L_end_eGlcd_init:
	RETURN
; end of _eGlcd_init

_eGlcd_invertColors:

;eGlcd.c,55 :: 		void eGlcd_invertColors(void) {
;eGlcd.c,63 :: 		}
L_end_eGlcd_invertColors:
	RETURN
; end of _eGlcd_invertColors

_eGlcd_clear:

;eGlcd.c,65 :: 		void eGlcd_clear(void) {
;eGlcd.c,66 :: 		eGlcd_fill(WHITE);
	PUSH	W10
	CLR	W10
	CALL	_eGlcd_fill
;eGlcd.c,67 :: 		}
L_end_eGlcd_clear:
	POP	W10
	RETURN
; end of _eGlcd_clear

_eGlcd_fill:

;eGlcd.c,69 :: 		void eGlcd_fill(unsigned char color) {
;eGlcd.c,70 :: 		char hex = 0;
;eGlcd.c,71 :: 		if (color) hex = 0xFF;
	CP0.B	W10
	BRA NZ	L__eGlcd_fill162
	GOTO	L_eGlcd_fill1
L__eGlcd_fill162:
L_eGlcd_fill1:
;eGlcd.c,75 :: 		Glcd_Fill(color);
	CALL	_Glcd_Fill
;eGlcd.c,77 :: 		}
L_end_eGlcd_fill:
	RETURN
; end of _eGlcd_fill

_eGlcd_overwriteChar:

;eGlcd.c,80 :: 		void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y) {
;eGlcd.c,81 :: 		eGlcd_clearChar(oldChar, x, y);
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
;eGlcd.c,82 :: 		eGlcd_writeChar(newChar, x, y);
	MOV.B	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeChar
;eGlcd.c,83 :: 		}
L_end_eGlcd_overwriteChar:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteChar

_eGlcd_clearChar:

;eGlcd.c,85 :: 		void eGlcd_clearChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,87 :: 		xGlcd_Write_Char(letter, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,92 :: 		}
L_eGlcd_clearChar3:
;eGlcd.c,93 :: 		}
L_end_eGlcd_clearChar:
	POP	W13
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eGlcd.c,95 :: 		void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,97 :: 		xGlcd_Write_Char(letter, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,100 :: 		}
L_eGlcd_writeChar5:
;eGlcd.c,101 :: 		}
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eGlcd.c,103 :: 		void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
;eGlcd.c,104 :: 		eGlcd_clearText(oldText, x, y);
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
;eGlcd.c,105 :: 		eGlcd_writeText(newText, x, y);
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eGlcd.c,106 :: 		}
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eGlcd.c,108 :: 		void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,110 :: 		xGlcd_Write_Text(text, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,115 :: 		}
L_eGlcd_clearText7:
;eGlcd.c,116 :: 		}
L_end_eGlcd_clearText:
	POP	W13
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eGlcd.c,118 :: 		void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,120 :: 		xGlcd_Write_Text(text, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,123 :: 		}
L_eGlcd_writeText9:
;eGlcd.c,124 :: 		}
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_loadImage:

;eGlcd.c,126 :: 		void eGlcd_loadImage(const char *image)
;eGlcd.c,131 :: 		Glcd_Image(image);
	PUSH	W11
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, W11
	CALL	_Glcd_Image
;eGlcd.c,133 :: 		}
L_end_eGlcd_loadImage:
	POP	W11
	RETURN
; end of _eGlcd_loadImage

_eGlcd_setupTimer:

;eGlcd.c,135 :: 		void eGlcd_setupTimer(void) {
;eGlcd.c,139 :: 		}
L_end_eGlcd_setupTimer:
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eGlcd.c,141 :: 		void eGlcd_setTimerCoefficient(float coefficient) {
;eGlcd.c,142 :: 		EGLCD_TIMER_COEFFICIENT = coefficient;
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eGlcd.c,143 :: 		}
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eGlcd.c,145 :: 		unsigned int eGlcd_getTextPixelLength(char *text) {
;eGlcd.c,146 :: 		unsigned int textPixelLength = 0, i;
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eGlcd.c,147 :: 		for (i = 0; i < strlen(text); i += 1) {
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength10:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength173
	GOTO	L_eGlcd_getTextPixelLength11
L__eGlcd_getTextPixelLength173:
;eGlcd.c,148 :: 		textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eGlcd.c,147 :: 		for (i = 0; i < strlen(text); i += 1) {
	INC	W6
;eGlcd.c,149 :: 		}
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength10
L_eGlcd_getTextPixelLength11:
;eGlcd.c,150 :: 		return textPixelLength;
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eGlcd.c,151 :: 		}
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

__Lcd_Toggle_Enable:

;eGlcd.c,165 :: 		void _Lcd_Toggle_Enable() {
;eGlcd.c,167 :: 		BSET _GLCD_EN, _GLCD_EN_BIT
	BSET	LATG, #15
;eGlcd.c,168 :: 		REPEAT #90                    ; 3.5us delay
	REPEAT	#90
;eGlcd.c,169 :: 		NOP
	NOP
;eGlcd.c,171 :: 		BCLR _GLCD_EN, _GLCD_EN_BIT
	BCLR	LATG, #15
;eGlcd.c,172 :: 		REPEAT #90
	REPEAT	#90
;eGlcd.c,173 :: 		NOP
	NOP
;eGlcd.c,175 :: 		}
L_end__Lcd_Toggle_Enable:
	RETURN
; end of __Lcd_Toggle_Enable

__Lcd_Change_Side:

;eGlcd.c,177 :: 		void _Lcd_Change_Side(){
;eGlcd.c,182 :: 		BTG _GLCD_CS1, _GLCD_CS1_BIT
	BTG	LATG, #8
;eGlcd.c,183 :: 		BTG _GLCD_CS2, _GLCD_CS2_BIT
	BTG	LATG, #7
;eGlcd.c,186 :: 		}
L_end__Lcd_Change_Side:
	RETURN
; end of __Lcd_Change_Side

__Lcd_Init:

;eGlcd.c,188 :: 		void _Lcd_Init(){
;eGlcd.c,189 :: 		GLCD_D0_Direction = 0;
	BCLR	TRISB8_bit, BitPos(TRISB8_bit+0)
;eGlcd.c,190 :: 		GLCD_D1_Direction = 0;
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;eGlcd.c,191 :: 		GLCD_D2_Direction = 0;
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;eGlcd.c,192 :: 		GLCD_D3_Direction = 0;
	BCLR	TRISB2_bit, BitPos(TRISB2_bit+0)
;eGlcd.c,193 :: 		GLCD_D4_Direction = 0;
	BCLR	TRISB3_bit, BitPos(TRISB3_bit+0)
;eGlcd.c,194 :: 		GLCD_D5_Direction = 0;
	BCLR	TRISB4_bit, BitPos(TRISB4_bit+0)
;eGlcd.c,195 :: 		GLCD_D6_Direction = 0;
	BCLR	TRISB5_bit, BitPos(TRISB5_bit+0)
;eGlcd.c,196 :: 		GLCD_D7_Direction = 0;
	BCLR	TRISG9_bit, BitPos(TRISG9_bit+0)
;eGlcd.c,198 :: 		GLCD_CS1_Direction = 0;
	BCLR	TRISG8_bit, BitPos(TRISG8_bit+0)
;eGlcd.c,199 :: 		GLCD_CS2_Direction = 0;
	BCLR	TRISG7_bit, BitPos(TRISG7_bit+0)
;eGlcd.c,200 :: 		GLCD_RST_Direction = 0;
	BCLR	TRISG6_bit, BitPos(TRISG6_bit+0)
;eGlcd.c,201 :: 		GLCD_RW_Direction = 0;
	BCLR	TRISC2_bit, BitPos(TRISC2_bit+0)
;eGlcd.c,202 :: 		GLCD_RS_Direction = 0;
	BCLR	TRISC1_bit, BitPos(TRISC1_bit+0)
;eGlcd.c,203 :: 		GLCD_EN_Direction = 0;
	BCLR	TRISG15_bit, BitPos(TRISG15_bit+0)
;eGlcd.c,205 :: 		GLCD_RST = 0;
	BCLR	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,206 :: 		GLCD_RST = 1;
	BSET	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,209 :: 		GLCD_EN = 0;
	BCLR	LATG15_bit, BitPos(LATG15_bit+0)
;eGlcd.c,213 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,214 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,215 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,216 :: 		BCLR _GLCD_CS2, _GLCD_CS2_BIT
	BCLR	LATG, #7
;eGlcd.c,217 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,218 :: 		BCLR _GLCD_D6, _GLCD_D6_BIT
	BCLR	LATB, #5
;eGlcd.c,219 :: 		BSET _GLCD_D5, _GLCD_D5_BIT
	BSET	LATB, #4
;eGlcd.c,220 :: 		BSET _GLCD_D4, _GLCD_D4_BIT
	BSET	LATB, #3
;eGlcd.c,221 :: 		BSET _GLCD_D3, _GLCD_D3_BIT
	BSET	LATB, #2
;eGlcd.c,222 :: 		BSET _GLCD_D2, _GLCD_D2_BIT
	BSET	LATB, #1
;eGlcd.c,223 :: 		BSET _GLCD_D1, _GLCD_D1_BIT
	BSET	LATB, #0
;eGlcd.c,224 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,226 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,230 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,231 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,232 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,233 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,234 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,235 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,236 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,237 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,238 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,239 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,241 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,243 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,244 :: 		BSET _GLCD_CS2, _GLCD_CS2_BIT
	BSET	LATG, #7
;eGlcd.c,246 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,248 :: 		}
L_end__Lcd_Init:
	RETURN
; end of __Lcd_Init

__Lcd_ResetYAddr:

;eGlcd.c,250 :: 		void _Lcd_ResetYAddr(){
;eGlcd.c,254 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,255 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,256 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,257 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,258 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,259 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,260 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,261 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,262 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,263 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,265 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,268 :: 		}
L_end__Lcd_ResetYAddr:
	RETURN
; end of __Lcd_ResetYAddr

__Lcd_SetDataPort:

;eGlcd.c,270 :: 		void _Lcd_SetDataPort(){
;eGlcd.c,273 :: 		LSR W10, #1, W1
	LSR	W10, #1, W1
;eGlcd.c,274 :: 		MOV W1, _GLCD_D1
	MOV	W1, LATB
;eGlcd.c,276 :: 		BTSC W10, #7
	BTSC	W10, #7
;eGlcd.c,277 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,278 :: 		BTSS W10, #7
	BTSS	W10, #7
;eGlcd.c,279 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,281 :: 		BTSC W10, #0
	BTSC	W10, #0
;eGlcd.c,282 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,283 :: 		BTSS W10, #0
	BTSS	W10, #0
;eGlcd.c,284 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,286 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,288 :: 		}
L_end__Lcd_SetDataPort:
	RETURN
; end of __Lcd_SetDataPort

__Lcd_SetPage:

;eGlcd.c,290 :: 		void _Lcd_SetPage(){
;eGlcd.c,293 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,294 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,295 :: 		MOV #0xB8, W1
	MOV	#184, W1
;eGlcd.c,296 :: 		ADD W1, W10, W10
	ADD	W1, W10, W10
;eGlcd.c,297 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,299 :: 		}
L_end__Lcd_SetPage:
	RETURN
; end of __Lcd_SetPage

__Lcd_WriteData:

;eGlcd.c,301 :: 		void _Lcd_WriteData(){
;eGlcd.c,303 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,304 :: 		BSET _GLCD_RS, _GLCD_RS_BIT
	BSET	LATC, #1
;eGlcd.c,305 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,307 :: 		}
L_end__Lcd_WriteData:
	RETURN
; end of __Lcd_WriteData

_Lcd_PrintFrame:

;eGlcd.c,309 :: 		void Lcd_PrintFrame() {
;eGlcd.c,312 :: 		CALL __Lcd_Init
	CALL	__Lcd_Init
;eGlcd.c,314 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,318 :: 		MOV #0, W2                 ; side index
	MOV	#0, W2
;eGlcd.c,319 :: 		MOV _frameBuff, W6      ; buffer cursor address
	MOV	_frameBuff, W6
;eGlcd.c,321 :: 		Side_Loop:
Side_Loop:
;eGlcd.c,322 :: 		MOV #0, W5     ; page index
	MOV	#0, W5
;eGlcd.c,323 :: 		MOV #64, W3    ; store y limit
	MOV	#64, W3
;eGlcd.c,325 :: 		Page_Loop:
Page_Loop:
;eGlcd.c,326 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,327 :: 		MOV #0, W4     ; y index
	MOV	#0, W4
;eGlcd.c,328 :: 		MOV W5, W10
	MOV	W5, W10
;eGlcd.c,329 :: 		CALL __Lcd_SetPage
	CALL	__Lcd_SetPage
;eGlcd.c,331 :: 		Y_Loop:
Y_Loop:
;eGlcd.c,332 :: 		MOV.B [W6++], W10
	MOV.B	[W6++], W10
;eGlcd.c,333 :: 		CALL __Lcd_WriteData
	CALL	__Lcd_WriteData
;eGlcd.c,334 :: 		INC W4
	INC	W4
;eGlcd.c,335 :: 		CP W4, W3
	CP	W4, W3
;eGlcd.c,336 :: 		BRA LTU, Y_Loop
	BRA LTU	Y_Loop
;eGlcd.c,338 :: 		INC W5
	INC	W5
;eGlcd.c,339 :: 		CP W5, #8
	CP	W5, #8
;eGlcd.c,340 :: 		BRA LTU, Page_Loop
	BRA LTU	Page_Loop
;eGlcd.c,342 :: 		CALL __Lcd_Change_Side
	CALL	__Lcd_Change_Side
;eGlcd.c,343 :: 		INC W2
	INC	W2
;eGlcd.c,344 :: 		CP W2, #1
	CP	W2, #1
;eGlcd.c,345 :: 		BRA LEU, Side_Loop
	BRA LEU	Side_Loop
;eGlcd.c,349 :: 		_frame_buff_page = 0;
	MOV	#lo_addr(__frame_buff_page), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,350 :: 		_frame_buff_y = 0;
	MOV	#lo_addr(__frame_buff_y), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,351 :: 		_frame_buff_side = 0;
	MOV	#lo_addr(__frame_buff_side), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,352 :: 		}
L_end_Lcd_PrintFrame:
	RETURN
; end of _Lcd_PrintFrame

__frameBuffer_LoadImage:
	LNK	#2

;eGlcd.c,356 :: 		void _frameBuffer_LoadImage(const char *image)
;eGlcd.c,359 :: 		for(i=0; i<16; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L__frameBuffer_LoadImage16:
; i start address is: 6 (W3)
	CP	W3, #16
	BRA LT	L___frameBuffer_LoadImage183
	GOTO	L__frameBuffer_LoadImage17
L___frameBuffer_LoadImage183:
;eGlcd.c,361 :: 		for (j=0; j<64; j++)
; j start address is: 8 (W4)
	CLR	W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
L__frameBuffer_LoadImage19:
; j start address is: 8 (W4)
; i start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L___frameBuffer_LoadImage184
	GOTO	L__frameBuffer_LoadImage20
L___frameBuffer_LoadImage184:
;eGlcd.c,363 :: 		frameBuffer[j+ (i/2)*64 + 512*(i%2)] = image[j + i*64];
	ASR	W3, #1, W0
	SL	W0, #6, W0
	ADD	W4, W0, W0
	MOV	W0, [W14+0]
	MOV	#2, W2
	REPEAT	#17
	DIV.S	W3, W2
	MOV	W1, W0
	SL	W0, #9, W1
	MOV	[W14+0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W2
	SL	W3, #6, W0
	ADD	W4, W0, W0
	ADD	W10, W0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	MOV.B	W0, [W2]
;eGlcd.c,361 :: 		for (j=0; j<64; j++)
	INC	W4
;eGlcd.c,364 :: 		}
; j end address is: 8 (W4)
	GOTO	L__frameBuffer_LoadImage19
L__frameBuffer_LoadImage20:
;eGlcd.c,359 :: 		for(i=0; i<16; i++)
	INC	W3
;eGlcd.c,365 :: 		}
; i end address is: 6 (W3)
	GOTO	L__frameBuffer_LoadImage16
L__frameBuffer_LoadImage17:
;eGlcd.c,366 :: 		}
L_end__frameBuffer_LoadImage:
	ULNK
	RETURN
; end of __frameBuffer_LoadImage

__frameBuffer_Fill:

;eGlcd.c,368 :: 		void _frameBuffer_Fill(unsigned char byte)
;eGlcd.c,371 :: 		for (i=0; i<1024; i++) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L__frameBuffer_Fill22:
; i start address is: 2 (W1)
	MOV	#1024, W0
	CP	W1, W0
	BRA LT	L___frameBuffer_Fill186
	GOTO	L__frameBuffer_Fill23
L___frameBuffer_Fill186:
;eGlcd.c,372 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,371 :: 		for (i=0; i<1024; i++) {
	INC	W1
;eGlcd.c,373 :: 		}
; i end address is: 2 (W1)
	GOTO	L__frameBuffer_Fill22
L__frameBuffer_Fill23:
;eGlcd.c,374 :: 		}
L_end__frameBuffer_Fill:
	RETURN
; end of __frameBuffer_Fill

__frameBuffer_Write:

;eGlcd.c,377 :: 		void _frameBuffer_Write(unsigned char byte)
;eGlcd.c,379 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
	MOV	#lo_addr(__frame_buff_side), W0
	ZE	[W0], W0
	SL	W0, #9, W1
	MOV	#lo_addr(__frame_buff_page), W0
	ZE	[W0], W0
	SL	W0, #6, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
;eGlcd.c,380 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,381 :: 		_frame_buff_y++;
	MOV.B	#1, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ADD.B	W1, [W0], [W0]
;eGlcd.c,382 :: 		}
L_end__frameBuffer_Write:
	RETURN
; end of __frameBuffer_Write

__frameBuffer_Read:

;eGlcd.c,384 :: 		unsigned char _frameBuffer_Read(){
;eGlcd.c,385 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
	MOV	#lo_addr(__frame_buff_side), W0
	ZE	[W0], W0
	SL	W0, #9, W1
	MOV	#lo_addr(__frame_buff_page), W0
	ZE	[W0], W0
	SL	W0, #6, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
;eGlcd.c,386 :: 		return frameBuffer[i];
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
;eGlcd.c,387 :: 		}
L_end__frameBuffer_Read:
	RETURN
; end of __frameBuffer_Read

__UART_DebugFrame:

;eGlcd.c,389 :: 		void _UART_DebugFrame(){
;eGlcd.c,424 :: 		}
L_end__UART_DebugFrame:
	RETURN
; end of __UART_DebugFrame

_eGlcd_drawRect:
	LNK	#10

;eGlcd.c,437 :: 		void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height)
;eGlcd.c,439 :: 		char pageCount = 0;
	PUSH	W11
;eGlcd.c,441 :: 		unsigned char xOffset = 0;
;eGlcd.c,442 :: 		signed char lastX = 0;
;eGlcd.c,446 :: 		char startSide1 = 0, endSide2 = 0;
;eGlcd.c,447 :: 		char startSide = 0, endSide = 0;
;eGlcd.c,451 :: 		if(x+width>127 || y+height>63) return;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#127, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect191
	GOTO	L__eGlcd_drawRect139
L__eGlcd_drawRect191:
	ZE	W11, W1
	ZE	W13, W0
	ADD	W1, W0, W1
	MOV	#63, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect192
	GOTO	L__eGlcd_drawRect138
L__eGlcd_drawRect192:
	GOTO	L_eGlcd_drawRect27
L__eGlcd_drawRect139:
L__eGlcd_drawRect138:
	GOTO	L_end_eGlcd_drawRect
L_eGlcd_drawRect27:
;eGlcd.c,454 :: 		page = y / 8;           ///< Page index. Integer division, will be a value between 0 and 7.
	ZE	W11, W0
	ASR	W0, #3, W0
	MOV.B	W0, [W14+5]
;eGlcd.c,455 :: 		pageOffset = y % 8;     ///< Row index inside page, increasing downwards.
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	MOV.B	W0, [W14+6]
;eGlcd.c,456 :: 		pageCount = ceil((pageOffset+height)/8.0);  ///< The rect spans at least this number of pages. According to the offset it might fall into another page.
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
;eGlcd.c,457 :: 		pageOverflow = 8 + pageOffset + height - pageCount*8 ;   ///< How many rows it falls onto next page.
	ADD	W14, #6, W1
	ZE	[W1], W1
	ADD	W1, #8, W2
	ZE	W13, W1
	ADD	W2, W1, W1
	ZE	W0, W0
	SL	W0, #3, W0
; pageOverflow start address is: 10 (W5)
	SUB.B	W1, W0, W5
;eGlcd.c,458 :: 		startSide1 = x<=63;       ///< Starts on side 1 condition.
	MOV.B	#63, W0
	CP.B	W10, W0
	CLR.B	W2
	BRA GTU	L__eGlcd_drawRect193
	INC.B	W2
L__eGlcd_drawRect193:
; startSide1 start address is: 6 (W3)
	MOV.B	W2, W3
;eGlcd.c,459 :: 		endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#63, W0
; endSide2 start address is: 16 (W8)
	CP	W1, W0
	CLR.B	W8
	BRA LEU	L__eGlcd_drawRect194
	INC.B	W8
L__eGlcd_drawRect194:
;eGlcd.c,460 :: 		startSide = startSide1 ? 0 : 1;
	CP0.B	W2
	BRA NZ	L__eGlcd_drawRect195
	GOTO	L_eGlcd_drawRect28
L__eGlcd_drawRect195:
; ?FLOC___eGlcd_drawRect?T64 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T64 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect29
L_eGlcd_drawRect28:
; ?FLOC___eGlcd_drawRect?T64 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T64 end address is: 0 (W0)
L_eGlcd_drawRect29:
; ?FLOC___eGlcd_drawRect?T64 start address is: 0 (W0)
; startSide start address is: 8 (W4)
	MOV.B	W0, W4
; ?FLOC___eGlcd_drawRect?T64 end address is: 0 (W0)
;eGlcd.c,461 :: 		endSide = endSide2 ? 1 : 0;
	CP0.B	W8
	BRA NZ	L__eGlcd_drawRect196
	GOTO	L_eGlcd_drawRect30
L__eGlcd_drawRect196:
; ?FLOC___eGlcd_drawRect?T65 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T65 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect31
L_eGlcd_drawRect30:
; ?FLOC___eGlcd_drawRect?T65 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T65 end address is: 0 (W0)
L_eGlcd_drawRect31:
; ?FLOC___eGlcd_drawRect?T65 start address is: 0 (W0)
	MOV.B	W0, [W14+9]
; ?FLOC___eGlcd_drawRect?T65 end address is: 0 (W0)
;eGlcd.c,464 :: 		xOffset = x;            ///< The x offset inside GLCD side to print to.
	MOV.B	W10, [W14+7]
;eGlcd.c,465 :: 		if(x>63) {
	MOV.B	#63, W0
	CP.B	W10, W0
	BRA GTU	L__eGlcd_drawRect197
	GOTO	L_eGlcd_drawRect32
L__eGlcd_drawRect197:
;eGlcd.c,466 :: 		xOffset -= 64;
	MOV.B	[W14+7], W2
	MOV.B	#64, W1
	ADD	W14, #7, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,467 :: 		}
L_eGlcd_drawRect32:
;eGlcd.c,468 :: 		lastX = xOffset+width;
	ADD	W14, #7, W0
	ZE	[W0], W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV.B	W1, [W14+8]
;eGlcd.c,469 :: 		if(lastX > 63)
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA GT	L__eGlcd_drawRect198
	GOTO	L_eGlcd_drawRect33
L__eGlcd_drawRect198:
;eGlcd.c,470 :: 		lastX = 63;
	MOV.B	#63, W0
	MOV.B	W0, [W14+8]
L_eGlcd_drawRect33:
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	W4, [W14+2]
; startSide end address is: 8 (W4)
; pageCount end address is: 12 (W6)
; startSide1 end address is: 6 (W3)
; endSide2 end address is: 16 (W8)
; pageOverflow end address is: 10 (W5)
	MOV.B	W5, W9
	MOV.B	W3, W2
L_eGlcd_drawRect34:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 4 (W2)
; pageOverflow start address is: 18 (W9)
; pageCount start address is: 12 (W6)
	MOV.B	[W14+2], W1
	ADD	W14, #9, W0
	CP.B	W1, [W0]
	BRA LEU	L__eGlcd_drawRect199
	GOTO	L__eGlcd_drawRect157
L__eGlcd_drawRect199:
	MOV.B	[W14+8], W0
	CP.B	W0, #0
	BRA GT	L__eGlcd_drawRect200
	GOTO	L__eGlcd_drawRect156
L__eGlcd_drawRect200:
L__eGlcd_drawRect136:
;eGlcd.c,478 :: 		Glcd_Set_Side(k*64);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #6, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
	POP	W10
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
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
L_eGlcd_drawRect39:
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
	BRA LTU	L__eGlcd_drawRect201
	GOTO	L__eGlcd_drawRect155
L__eGlcd_drawRect201:
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__eGlcd_drawRect202
	GOTO	L__eGlcd_drawRect154
L__eGlcd_drawRect202:
L__eGlcd_drawRect135:
;eGlcd.c,486 :: 		Glcd_Set_Page(i);
	PUSH	W7
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
;eGlcd.c,487 :: 		Glcd_Set_X(xOffset);
	MOV.B	[W14+7], W10
	CALL	_Glcd_Set_X
	POP	W10
	POP	W7
;eGlcd.c,489 :: 		if(i==page)   ///< If we are in first page...
	MOV.B	[W14+0], W1
	ADD	W14, #5, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect203
	GOTO	L_eGlcd_drawRect44
L__eGlcd_drawRect203:
;eGlcd.c,491 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect45:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect204
	GOTO	L_eGlcd_drawRect46
L__eGlcd_drawRect204:
;eGlcd.c,493 :: 		byte = ~(0xFF<<pageOffset);
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #3, W1
	COM.B	W0, [W1]
;eGlcd.c,497 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,498 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,500 :: 		byte&=rByte;
	ADD	W14, #3, W1
	AND.B	W0, [W1], [W1]
;eGlcd.c,502 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect205
	GOTO	L__eGlcd_drawRect141
L__eGlcd_drawRect205:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect206
	INC.B	W0
L__eGlcd_drawRect206:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect140
	GOTO	L__eGlcd_drawRect132
L__eGlcd_drawRect141:
L__eGlcd_drawRect140:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect207
	GOTO	L__eGlcd_drawRect143
L__eGlcd_drawRect207:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect208
	INC.B	W0
L__eGlcd_drawRect208:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect209
	INC.B	W0
L__eGlcd_drawRect209:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect142
	GOTO	L__eGlcd_drawRect132
L__eGlcd_drawRect143:
L__eGlcd_drawRect142:
	GOTO	L_eGlcd_drawRect54
L__eGlcd_drawRect132:
;eGlcd.c,503 :: 		byte2 = 0xFF<<pageOffset;
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+4]
	GOTO	L_eGlcd_drawRect55
L_eGlcd_drawRect54:
;eGlcd.c,505 :: 		byte2 = 1<<pageOffset;
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect55:
;eGlcd.c,506 :: 		byte|= byte2;
	MOV.B	[W14+4], W1
	ADD	W14, #3, W0
	IOR.B	W1, [W0], [W0]
;eGlcd.c,508 :: 		if(j>=62)
	MOV.B	[W14+1], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect210
	GOTO	L_eGlcd_drawRect56
L__eGlcd_drawRect210:
;eGlcd.c,513 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
;eGlcd.c,515 :: 		}
L_eGlcd_drawRect56:
;eGlcd.c,520 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,521 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,491 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,523 :: 		}
	GOTO	L_eGlcd_drawRect45
L_eGlcd_drawRect46:
;eGlcd.c,524 :: 		}
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	MOV.B	W6, W8
	GOTO	L_eGlcd_drawRect57
L_eGlcd_drawRect44:
;eGlcd.c,525 :: 		else if (i == (page+pageCount-1) && pageOverflow)
; endSide2 start address is: 14 (W7)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W0
	SUB	W0, #1, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__eGlcd_drawRect211
	GOTO	L__eGlcd_drawRect149
L__eGlcd_drawRect211:
	CP0.B	W5
	BRA NZ	L__eGlcd_drawRect212
	GOTO	L__eGlcd_drawRect148
L__eGlcd_drawRect212:
L__eGlcd_drawRect131:
;eGlcd.c,527 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect61:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect213
	GOTO	L_eGlcd_drawRect62
L__eGlcd_drawRect213:
;eGlcd.c,529 :: 		byte = (0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+3]
;eGlcd.c,533 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,534 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,536 :: 		byte &= rByte;
	ADD	W14, #3, W2
	ADD	W14, #3, W1
	AND.B	W0, [W2], [W1]
;eGlcd.c,538 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect214
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect214:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect215
	INC.B	W0
L__eGlcd_drawRect215:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect144
	GOTO	L__eGlcd_drawRect128
L__eGlcd_drawRect145:
L__eGlcd_drawRect144:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect216
	GOTO	L__eGlcd_drawRect147
L__eGlcd_drawRect216:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect217
	INC.B	W0
L__eGlcd_drawRect217:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect218
	INC.B	W0
L__eGlcd_drawRect218:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect146
	GOTO	L__eGlcd_drawRect128
L__eGlcd_drawRect147:
L__eGlcd_drawRect146:
	GOTO	L_eGlcd_drawRect70
L__eGlcd_drawRect128:
;eGlcd.c,539 :: 		byte2 = ~(0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	ADD	W14, #4, W1
	COM.B	W0, [W1]
	GOTO	L_eGlcd_drawRect71
L_eGlcd_drawRect70:
;eGlcd.c,541 :: 		byte2 = 1<<(pageOverflow-1);
	SE	W5, W0
	SUB	W0, #1, W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect71:
;eGlcd.c,542 :: 		byte|= byte2;
	MOV.B	[W14+3], W2
	ADD	W14, #4, W1
	ADD	W14, #3, W0
	IOR.B	W2, [W1], [W0]
;eGlcd.c,544 :: 		if(j>=61)
	MOV.B	[W14+1], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect219
	GOTO	L_eGlcd_drawRect72
L__eGlcd_drawRect219:
;eGlcd.c,549 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
;eGlcd.c,551 :: 		}
L_eGlcd_drawRect72:
;eGlcd.c,556 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,557 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,527 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,559 :: 		}
	GOTO	L_eGlcd_drawRect61
L_eGlcd_drawRect62:
;eGlcd.c,560 :: 		}
	MOV.B	W6, W8
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	GOTO	L_eGlcd_drawRect73
;eGlcd.c,525 :: 		else if (i == (page+pageCount-1) && pageOverflow)
L__eGlcd_drawRect149:
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect148:
;eGlcd.c,563 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W2
L_eGlcd_drawRect74:
; endSide2 start address is: 4 (W2)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect220
	GOTO	L_eGlcd_drawRect75
L__eGlcd_drawRect220:
;eGlcd.c,565 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect221
	GOTO	L__eGlcd_drawRect151
L__eGlcd_drawRect221:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect222
	INC.B	W0
L__eGlcd_drawRect222:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect150
	GOTO	L__eGlcd_drawRect125
L__eGlcd_drawRect151:
L__eGlcd_drawRect150:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect223
	GOTO	L__eGlcd_drawRect153
L__eGlcd_drawRect223:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect224
	INC.B	W0
L__eGlcd_drawRect224:
	ZE	W2, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect225
	INC.B	W0
L__eGlcd_drawRect225:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect152
	GOTO	L__eGlcd_drawRect125
L__eGlcd_drawRect153:
L__eGlcd_drawRect152:
	GOTO	L_eGlcd_drawRect83
L__eGlcd_drawRect125:
;eGlcd.c,566 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+3]
	GOTO	L_eGlcd_drawRect84
L_eGlcd_drawRect83:
;eGlcd.c,568 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+3]
L_eGlcd_drawRect84:
;eGlcd.c,572 :: 		Glcd_Write_Data(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,563 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,574 :: 		}
	GOTO	L_eGlcd_drawRect74
L_eGlcd_drawRect75:
;eGlcd.c,575 :: 		}
	MOV.B	W2, W8
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W3, W7
L_eGlcd_drawRect73:
; endSide2 end address is: 4 (W2)
; pageCount start address is: 8 (W4)
; pageOverflow start address is: 10 (W5)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect57:
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,577 :: 		}
	MOV.B	W7, W3
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
	MOV.B	W8, W7
	GOTO	L_eGlcd_drawRect39
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
L__eGlcd_drawRect155:
; startSide1 start address is: 6 (W3)
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect154:
;eGlcd.c,578 :: 		lastX=x+width-64;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W2
	MOV.B	#64, W1
	ADD	W14, #8, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,579 :: 		xOffset=0;
	CLR	W0
	MOV.B	W0, [W14+7]
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,580 :: 		}
	MOV.B	W4, W6
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W5, W9
	MOV.B	W3, W2
	MOV.B	W7, W8
	GOTO	L_eGlcd_drawRect34
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
L__eGlcd_drawRect157:
L__eGlcd_drawRect156:
;eGlcd.c,581 :: 		}
L_end_eGlcd_drawRect:
	POP	W11
	ULNK
	RETURN
; end of _eGlcd_drawRect

_eGlcd_fillPage:
	LNK	#2

;eGlcd.c,583 :: 		void eGlcd_fillPage(unsigned char page, char color)
;eGlcd.c,585 :: 		int k, i=0;
; i start address is: 8 (W4)
	CLR	W4
;eGlcd.c,586 :: 		char byte = 0;
	MOV	#0, W0
	MOV.B	W0, [W14+0]
;eGlcd.c,587 :: 		if (color == BLACK)
	CP.B	W11, #1
	BRA Z	L__eGlcd_fillPage227
	GOTO	L_eGlcd_fillPage85
L__eGlcd_fillPage227:
;eGlcd.c,588 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
L_eGlcd_fillPage85:
;eGlcd.c,592 :: 		Glcd_Set_Page(page);
	CALL	_Glcd_Set_Page
;eGlcd.c,594 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
; k start address is: 4 (W2)
	CLR	W2
; i end address is: 8 (W4)
; k end address is: 4 (W2)
	MOV	W4, W3
L_eGlcd_fillPage86:
; k start address is: 4 (W2)
; i start address is: 6 (W3)
	CP	W2, #1
	BRA LE	L__eGlcd_fillPage228
	GOTO	L_eGlcd_fillPage87
L__eGlcd_fillPage228:
;eGlcd.c,600 :: 		Glcd_Set_Side(k*64);
	SL	W2, #6, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
;eGlcd.c,601 :: 		Glcd_Set_X(i);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
; i end address is: 6 (W3)
; k end address is: 4 (W2)
	POP	W10
	MOV	W3, W1
;eGlcd.c,603 :: 		for(; i<64; i++)  {
L_eGlcd_fillPage89:
; i start address is: 2 (W1)
; k start address is: 4 (W2)
	MOV	#64, W0
	CP	W1, W0
	BRA LT	L__eGlcd_fillPage229
	GOTO	L_eGlcd_fillPage90
L__eGlcd_fillPage229:
;eGlcd.c,607 :: 		Glcd_Write_Data(byte);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,603 :: 		for(; i<64; i++)  {
; i start address is: 6 (W3)
	ADD	W1, #1, W3
; i end address is: 2 (W1)
;eGlcd.c,609 :: 		}
; i end address is: 6 (W3)
	MOV	W3, W1
	GOTO	L_eGlcd_fillPage89
L_eGlcd_fillPage90:
;eGlcd.c,610 :: 		i = 0;
; i start address is: 8 (W4)
	CLR	W4
;eGlcd.c,594 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
	INC	W2
;eGlcd.c,611 :: 		}
	MOV	W4, W3
; i end address is: 8 (W4)
; k end address is: 4 (W2)
	GOTO	L_eGlcd_fillPage86
L_eGlcd_fillPage87:
;eGlcd.c,612 :: 		}
L_end_eGlcd_fillPage:
	ULNK
	RETURN
; end of _eGlcd_fillPage

_xGlcd_Set_Font:

;eGlcd.c,623 :: 		unsigned short font_height, unsigned int font_offset) {
;eGlcd.c,624 :: 		xGlcdSelFont = ptrFontTbl;
	MOV	W10, eGlcd_xGlcdSelFont
;eGlcd.c,625 :: 		xGlcdSelFontWidth = font_width;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	MOV.B	W11, [W0]
;eGlcd.c,626 :: 		xGlcdSelFontHeight = font_height;
	MOV	#lo_addr(eGlcd_xGlcdSelFontHeight), W0
	MOV.B	W12, [W0]
;eGlcd.c,627 :: 		xGlcdSelFontOffset = font_offset;
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	MOV.B	W13, [W0]
;eGlcd.c,628 :: 		xGLCD_Transparency = FALSE;  //Transparency of Text is set to False !!!
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,630 :: 		xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
	ZE	W12, W0
	ASR	W0, #3, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	MOV.B	W1, [W0]
;eGlcd.c,631 :: 		if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
	ZE	W12, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP0	W0
	BRA NZ	L__xGlcd_Set_Font231
	GOTO	L_xGlcd_Set_Font92
L__xGlcd_Set_Font231:
	MOV.B	#1, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font92:
;eGlcd.c,632 :: 		}
L_end_xGlcd_Set_Font:
	RETURN
; end of _xGlcd_Set_Font

_xGLCD_Write_Data:

;eGlcd.c,635 :: 		void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
;eGlcd.c,638 :: 		if ((pX > 127) || (pY > 63)) return;
	PUSH	W10
	MOV.B	#127, W0
	CP.B	W10, W0
	BRA LEU	L__xGLCD_Write_Data233
	GOTO	L__xGLCD_Write_Data122
L__xGLCD_Write_Data233:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data234
	GOTO	L__xGLCD_Write_Data121
L__xGLCD_Write_Data234:
	GOTO	L_xGLCD_Write_Data95
L__xGLCD_Write_Data122:
L__xGLCD_Write_Data121:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data95:
;eGlcd.c,639 :: 		xx = pX % 64;
	ZE	W10, W0
	MOV	#64, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; xx start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,640 :: 		tmp = pY / 8;
	ZE	W11, W0
	ASR	W0, #3, W0
; tmp start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,641 :: 		tmpY = pY % 8;
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; tmpY start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,642 :: 		if (tmpY) {
	CP0.B	W0
	BRA NZ	L__xGLCD_Write_Data235
	GOTO	L_xGLCD_Write_Data96
L__xGLCD_Write_Data235:
;eGlcd.c,644 :: 		gData = pData << tmpY;
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,651 :: 		Glcd_Set_Side(pX);
	CALL	_Glcd_Set_Side
;eGlcd.c,652 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,653 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
	CALL	_Glcd_Set_Page
;eGlcd.c,654 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,655 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,657 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data236
	GOTO	L__xGLCD_Write_Data123
L__xGLCD_Write_Data236:
;eGlcd.c,658 :: 		dataR = dataR & (0xff >> (8 - tmpY));
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
; dataR start address is: 0 (W0)
	AND.B	W6, W0, W0
; dataR end address is: 12 (W6)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data97
L__xGLCD_Write_Data123:
;eGlcd.c,657 :: 		if (!xGLCD_Transparency)
	MOV.B	W6, W0
;eGlcd.c,658 :: 		dataR = dataR & (0xff >> (8 - tmpY));
L_xGLCD_Write_Data97:
;eGlcd.c,659 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 12 (W6)
	IOR.B	W5, W0, W6
; gData end address is: 10 (W5)
; dataR end address is: 0 (W0)
;eGlcd.c,664 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,665 :: 		Glcd_Write_Data(dataR);
	MOV.B	W6, W10
; dataR end address is: 12 (W6)
	CALL	_Glcd_Write_Data
;eGlcd.c,668 :: 		tmp++;
	ADD.B	W4, #1, W0
	MOV.B	W0, W4
;eGlcd.c,669 :: 		if (tmp > 7) return;
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data237
	GOTO	L_xGLCD_Write_Data98
L__xGLCD_Write_Data237:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 8 (W4)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data98:
;eGlcd.c,675 :: 		Glcd_Set_X(xx);
; tmp start address is: 8 (W4)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,676 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eGlcd.c,677 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,678 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
; dataR start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,680 :: 		gData = pData >> (8 - tmpY);
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,681 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data238
	GOTO	L__xGLCD_Write_Data124
L__xGLCD_Write_Data238:
;eGlcd.c,682 :: 		dataR = dataR & (0xff << tmpY);
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 0 (W0)
	AND.B	W5, W0, W0
; dataR end address is: 10 (W5)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data99
L__xGLCD_Write_Data124:
;eGlcd.c,681 :: 		if (!xGLCD_Transparency)
	MOV.B	W5, W0
;eGlcd.c,682 :: 		dataR = dataR & (0xff << tmpY);
L_xGLCD_Write_Data99:
;eGlcd.c,683 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 4 (W2)
	IOR.B	W4, W0, W2
; gData end address is: 8 (W4)
; dataR end address is: 0 (W0)
;eGlcd.c,688 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
;eGlcd.c,689 :: 		Glcd_Write_Data(dataR);
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,691 :: 		}
	GOTO	L_xGLCD_Write_Data100
L_xGLCD_Write_Data96:
;eGlcd.c,698 :: 		Glcd_Set_Side(pX);
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	CALL	_Glcd_Set_Side
;eGlcd.c,699 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,700 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eGlcd.c,702 :: 		if (xGLCD_Transparency) {
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data239
	GOTO	L_xGLCD_Write_Data101
L__xGLCD_Write_Data239:
;eGlcd.c,706 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,707 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,709 :: 		dataR = pData | dataR;
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eGlcd.c,710 :: 		}
	MOV.B	W0, W2
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data102
L_xGLCD_Write_Data101:
;eGlcd.c,712 :: 		dataR = pData;
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
	MOV.B	W0, W2
L_xGLCD_Write_Data102:
;eGlcd.c,717 :: 		Glcd_Set_X(xx);
; dataR start address is: 4 (W2)
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
;eGlcd.c,718 :: 		Glcd_Write_Data(dataR);
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,720 :: 		}
L_xGLCD_Write_Data100:
;eGlcd.c,721 :: 		}
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eGlcd.c,723 :: 		unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,728 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jumo the first byte associated to the char's width
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,729 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,730 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W3
;eGlcd.c,731 :: 		CharWidth = *CurCharData;  // retrieves first byte in the char, which stores its width
	MOV	#___Lib_System_DefaultPage, W2
	MOV	W2, 52
	MOV.B	[W3], W2
; CharWidth start address is: 4 (W2)
;eGlcd.c,732 :: 		cOffset++;
; cOffset start address is: 10 (W5)
	ADD	W0, #1, W5
	ADDC	W1, #0, W6
;eGlcd.c,733 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 14 (W7)
	CLR	W7
; CharWidth end address is: 4 (W2)
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	MOV.B	W2, W4
L_xGlcd_Write_Char103:
; i start address is: 14 (W7)
; cOffset start address is: 10 (W5)
; CharWidth start address is: 8 (W4)
	CP.B	W7, W4
	BRA LTU	L__xGlcd_Write_Char241
	GOTO	L_xGlcd_Write_Char104
L__xGlcd_Write_Char241:
;eGlcd.c,734 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 16 (W8)
	CLR	W8
; CharWidth end address is: 8 (W4)
; cOffset end address is: 10 (W5)
; j end address is: 16 (W8)
; i end address is: 14 (W7)
L_xGlcd_Write_Char106:
; j start address is: 16 (W8)
; CharWidth start address is: 8 (W4)
; cOffset start address is: 10 (W5)
; i start address is: 14 (W7)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W8, [W0]
	BRA LTU	L__xGlcd_Write_Char242
	GOTO	L_xGlcd_Write_Char107
L__xGlcd_Write_Char242:
;eGlcd.c,735 :: 		CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
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
;eGlcd.c,736 :: 		switch (color) {
	GOTO	L_xGlcd_Write_Char109
;eGlcd.c,737 :: 		case WHITE:
L_xGlcd_Write_Char111:
;eGlcd.c,738 :: 		CharData = ~(*CurCharData);
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,739 :: 		break;
	GOTO	L_xGlcd_Write_Char110
;eGlcd.c,740 :: 		case BLACK :
L_xGlcd_Write_Char112:
;eGlcd.c,741 :: 		CharData = *CurCharData;
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eGlcd.c,742 :: 		break;
	GOTO	L_xGlcd_Write_Char110
;eGlcd.c,743 :: 		case 2 :
L_xGlcd_Write_Char113:
;eGlcd.c,744 :: 		CharData = ~(*CurCharData);
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,745 :: 		break;
	GOTO	L_xGlcd_Write_Char110
;eGlcd.c,746 :: 		}
L_xGlcd_Write_Char109:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char243
	GOTO	L_xGlcd_Write_Char111
L__xGlcd_Write_Char243:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char244
	GOTO	L_xGlcd_Write_Char112
L__xGlcd_Write_Char244:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char245
	GOTO	L_xGlcd_Write_Char113
L__xGlcd_Write_Char245:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char110:
;eGlcd.c,747 :: 		xGLCD_Write_Data(x + i, y + j * 8, CharData);
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
;eGlcd.c,734 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W8
;eGlcd.c,748 :: 		};
; j end address is: 16 (W8)
	GOTO	L_xGlcd_Write_Char106
L_xGlcd_Write_Char107:
;eGlcd.c,733 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W7
;eGlcd.c,748 :: 		};
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	GOTO	L_xGlcd_Write_Char103
L_xGlcd_Write_Char104:
;eGlcd.c,749 :: 		return CharWidth;
	MOV.B	W4, W0
; CharWidth end address is: 8 (W4)
;eGlcd.c,750 :: 		}
L_end_xGlcd_Write_Char:
	ULNK
	RETURN
; end of _xGlcd_Write_Char

_xGlcd_Char_Width:

;eGlcd.c,752 :: 		unsigned short xGlcd_Char_Width(unsigned short ch) {
;eGlcd.c,755 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,756 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,757 :: 		CurCharDt = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,758 :: 		return *CurCharDt;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
;eGlcd.c,759 :: 		}
L_end_xGlcd_Char_Width:
	RETURN
; end of _xGlcd_Char_Width

_xGlcd_Write_Text:

;eGlcd.c,761 :: 		void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,764 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,765 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,766 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,767 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Write_Text114:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text248
	GOTO	L_xGlcd_Write_Text115
L__xGlcd_Write_Text248:
;eGlcd.c,768 :: 		posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1; //add 1 blank column
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
;eGlcd.c,769 :: 		curChar++;
	INC	W4
;eGlcd.c,767 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,770 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Write_Text114
L_xGlcd_Write_Text115:
;eGlcd.c,771 :: 		}
L_end_xGlcd_Write_Text:
	RETURN
; end of _xGlcd_Write_Text

_xGlcd_Text_Width:

;eGlcd.c,773 :: 		unsigned short xGlcd_Text_Width(char *text) {
;eGlcd.c,775 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,776 :: 		w = 0;
; w start address is: 16 (W8)
	CLR	W8
;eGlcd.c,777 :: 		for (i = 0; i < l; i++)
; i start address is: 14 (W7)
	CLR	W7
; w end address is: 16 (W8)
; l end address is: 12 (W6)
; i end address is: 14 (W7)
L_xGlcd_Text_Width117:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width250
	GOTO	L_xGlcd_Text_Width118
L__xGlcd_Text_Width250:
;eGlcd.c,778 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
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
;eGlcd.c,777 :: 		for (i = 0; i < l; i++)
	INC.B	W7
;eGlcd.c,778 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
; l end address is: 12 (W6)
; w end address is: 0 (W0)
; i end address is: 14 (W7)
	MOV.B	W0, W8
	GOTO	L_xGlcd_Text_Width117
L_xGlcd_Text_Width118:
;eGlcd.c,779 :: 		return w;
; w start address is: 16 (W8)
	MOV.B	W8, W0
; w end address is: 16 (W8)
;eGlcd.c,780 :: 		}
L_end_xGlcd_Text_Width:
	RETURN
; end of _xGlcd_Text_Width

_xGLCD_Set_Transparency:

;eGlcd.c,782 :: 		void xGLCD_Set_Transparency(char active) {
;eGlcd.c,783 :: 		xGLCD_Transparency = active;
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	MOV.B	W10, [W0]
;eGlcd.c,784 :: 		}
L_end_xGLCD_Set_Transparency:
	RETURN
; end of _xGLCD_Set_Transparency

eGlcd____?ag:

L_end_eGlcd___?ag:
	RETURN
; end of eGlcd____?ag
