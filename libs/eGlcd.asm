
_eGlcd_init:

;eGlcd.c,43 :: 		void eGlcd_init() {
;eGlcd.c,47 :: 		_Lcd_Init();
	CALL	__Lcd_Init
;eGlcd.c,54 :: 		}
L_end_eGlcd_init:
	RETURN
; end of _eGlcd_init

_eGlcd_invertColors:

;eGlcd.c,56 :: 		void eGlcd_invertColors(void) {
;eGlcd.c,64 :: 		}
L_end_eGlcd_invertColors:
	RETURN
; end of _eGlcd_invertColors

_eGlcd_clear:

;eGlcd.c,66 :: 		void eGlcd_clear(void) {
;eGlcd.c,67 :: 		eGlcd_fill(WHITE);
	PUSH	W10
	CLR	W10
	CALL	_eGlcd_fill
;eGlcd.c,68 :: 		}
L_end_eGlcd_clear:
	POP	W10
	RETURN
; end of _eGlcd_clear

_eGlcd_fill:

;eGlcd.c,70 :: 		void eGlcd_fill(unsigned char color) {
;eGlcd.c,71 :: 		char hex = 0;
;eGlcd.c,72 :: 		if (color) hex = 0xFF;
	CP0.B	W10
	BRA NZ	L__eGlcd_fill183
	GOTO	L_eGlcd_fill0
L__eGlcd_fill183:
L_eGlcd_fill0:
;eGlcd.c,74 :: 		_frameBuffer_Fill(color);
	CALL	__frameBuffer_Fill
;eGlcd.c,78 :: 		}
L_end_eGlcd_fill:
	RETURN
; end of _eGlcd_fill

_eGlcd_overwriteChar:

;eGlcd.c,81 :: 		void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y) {
;eGlcd.c,82 :: 		eGlcd_clearChar(oldChar, x, y);
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
;eGlcd.c,83 :: 		eGlcd_writeChar(newChar, x, y);
	MOV.B	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeChar
;eGlcd.c,84 :: 		}
L_end_eGlcd_overwriteChar:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteChar

_eGlcd_clearChar:

;eGlcd.c,86 :: 		void eGlcd_clearChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,88 :: 		xGlcd_Clear_Char(letter, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Clear_Char
;eGlcd.c,89 :: 		}
L_end_eGlcd_clearChar:
	POP	W13
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eGlcd.c,91 :: 		void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,93 :: 		xGlcd_Write_Char(letter, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,96 :: 		}
L_eGlcd_writeChar3:
;eGlcd.c,97 :: 		}
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eGlcd.c,99 :: 		void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
;eGlcd.c,100 :: 		eGlcd_clearText(oldText, x, y);
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
;eGlcd.c,101 :: 		eGlcd_writeText(newText, x, y);
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eGlcd.c,102 :: 		}
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eGlcd.c,104 :: 		void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,106 :: 		xGlcd_Clear_Text(text, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Clear_Text
;eGlcd.c,112 :: 		}
L_end_eGlcd_clearText:
	POP	W13
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eGlcd.c,114 :: 		void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,116 :: 		xGlcd_Write_Text(text, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,119 :: 		}
L_eGlcd_writeText6:
;eGlcd.c,120 :: 		}
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_loadImage:

;eGlcd.c,122 :: 		void eGlcd_loadImage(const char *image)
;eGlcd.c,125 :: 		_frameBuffer_LoadImage(image);
	CALL	__frameBuffer_LoadImage
;eGlcd.c,129 :: 		}
L_end_eGlcd_loadImage:
	RETURN
; end of _eGlcd_loadImage

_eGlcd_setupTimer:

;eGlcd.c,131 :: 		void eGlcd_setupTimer(void) {
;eGlcd.c,135 :: 		}
L_end_eGlcd_setupTimer:
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eGlcd.c,137 :: 		void eGlcd_setTimerCoefficient(float coefficient) {
;eGlcd.c,138 :: 		EGLCD_TIMER_COEFFICIENT = coefficient;
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eGlcd.c,139 :: 		}
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eGlcd.c,141 :: 		unsigned int eGlcd_getTextPixelLength(char *text) {
;eGlcd.c,142 :: 		unsigned int textPixelLength = 0, i;
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eGlcd.c,143 :: 		for (i = 0; i < strlen(text); i += 1) {
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength7:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength194
	GOTO	L_eGlcd_getTextPixelLength8
L__eGlcd_getTextPixelLength194:
;eGlcd.c,144 :: 		textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eGlcd.c,143 :: 		for (i = 0; i < strlen(text); i += 1) {
	INC	W6
;eGlcd.c,145 :: 		}
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength7
L_eGlcd_getTextPixelLength8:
;eGlcd.c,146 :: 		return textPixelLength;
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eGlcd.c,147 :: 		}
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

__Lcd_Toggle_Enable:

;eGlcd.c,161 :: 		void _Lcd_Toggle_Enable() {
;eGlcd.c,163 :: 		BSET _GLCD_EN, _GLCD_EN_BIT
	BSET	LATG, #15
;eGlcd.c,164 :: 		REPEAT #90                    ; 3.5us delay
	REPEAT	#90
;eGlcd.c,165 :: 		NOP
	NOP
;eGlcd.c,167 :: 		BCLR _GLCD_EN, _GLCD_EN_BIT
	BCLR	LATG, #15
;eGlcd.c,168 :: 		REPEAT #90
	REPEAT	#90
;eGlcd.c,169 :: 		NOP
	NOP
;eGlcd.c,171 :: 		}
L_end__Lcd_Toggle_Enable:
	RETURN
; end of __Lcd_Toggle_Enable

__Lcd_Change_Side:

;eGlcd.c,173 :: 		void _Lcd_Change_Side(){
;eGlcd.c,178 :: 		BTG _GLCD_CS1, _GLCD_CS1_BIT
	BTG	LATG, #8
;eGlcd.c,179 :: 		BTG _GLCD_CS2, _GLCD_CS2_BIT
	BTG	LATG, #7
;eGlcd.c,182 :: 		}
L_end__Lcd_Change_Side:
	RETURN
; end of __Lcd_Change_Side

__Lcd_Init:

;eGlcd.c,184 :: 		void _Lcd_Init(){
;eGlcd.c,185 :: 		GLCD_D0_Direction = 0;
	BCLR	TRISB8_bit, BitPos(TRISB8_bit+0)
;eGlcd.c,186 :: 		GLCD_D1_Direction = 0;
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;eGlcd.c,187 :: 		GLCD_D2_Direction = 0;
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;eGlcd.c,188 :: 		GLCD_D3_Direction = 0;
	BCLR	TRISB2_bit, BitPos(TRISB2_bit+0)
;eGlcd.c,189 :: 		GLCD_D4_Direction = 0;
	BCLR	TRISB3_bit, BitPos(TRISB3_bit+0)
;eGlcd.c,190 :: 		GLCD_D5_Direction = 0;
	BCLR	TRISB4_bit, BitPos(TRISB4_bit+0)
;eGlcd.c,191 :: 		GLCD_D6_Direction = 0;
	BCLR	TRISB5_bit, BitPos(TRISB5_bit+0)
;eGlcd.c,192 :: 		GLCD_D7_Direction = 0;
	BCLR	TRISG9_bit, BitPos(TRISG9_bit+0)
;eGlcd.c,194 :: 		GLCD_CS1_Direction = 0;
	BCLR	TRISG8_bit, BitPos(TRISG8_bit+0)
;eGlcd.c,195 :: 		GLCD_CS2_Direction = 0;
	BCLR	TRISG7_bit, BitPos(TRISG7_bit+0)
;eGlcd.c,196 :: 		GLCD_RST_Direction = 0;
	BCLR	TRISG6_bit, BitPos(TRISG6_bit+0)
;eGlcd.c,197 :: 		GLCD_RW_Direction = 0;
	BCLR	TRISC2_bit, BitPos(TRISC2_bit+0)
;eGlcd.c,198 :: 		GLCD_RS_Direction = 0;
	BCLR	TRISC1_bit, BitPos(TRISC1_bit+0)
;eGlcd.c,199 :: 		GLCD_EN_Direction = 0;
	BCLR	TRISG15_bit, BitPos(TRISG15_bit+0)
;eGlcd.c,201 :: 		GLCD_RST = 0;
	BCLR	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,202 :: 		GLCD_RST = 1;
	BSET	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,205 :: 		GLCD_EN = 0;
	BCLR	LATG15_bit, BitPos(LATG15_bit+0)
;eGlcd.c,209 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,210 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,211 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,212 :: 		BCLR _GLCD_CS2, _GLCD_CS2_BIT
	BCLR	LATG, #7
;eGlcd.c,213 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,214 :: 		BCLR _GLCD_D6, _GLCD_D6_BIT
	BCLR	LATB, #5
;eGlcd.c,215 :: 		BSET _GLCD_D5, _GLCD_D5_BIT
	BSET	LATB, #4
;eGlcd.c,216 :: 		BSET _GLCD_D4, _GLCD_D4_BIT
	BSET	LATB, #3
;eGlcd.c,217 :: 		BSET _GLCD_D3, _GLCD_D3_BIT
	BSET	LATB, #2
;eGlcd.c,218 :: 		BSET _GLCD_D2, _GLCD_D2_BIT
	BSET	LATB, #1
;eGlcd.c,219 :: 		BSET _GLCD_D1, _GLCD_D1_BIT
	BSET	LATB, #0
;eGlcd.c,220 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,222 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,226 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,227 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,228 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,229 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,230 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,231 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,232 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,233 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,234 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,235 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,237 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,239 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,240 :: 		BSET _GLCD_CS2, _GLCD_CS2_BIT
	BSET	LATG, #7
;eGlcd.c,242 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,244 :: 		}
L_end__Lcd_Init:
	RETURN
; end of __Lcd_Init

__Lcd_ResetYAddr:

;eGlcd.c,246 :: 		void _Lcd_ResetYAddr(){
;eGlcd.c,250 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,251 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,252 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,253 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,254 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,255 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,256 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,257 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,258 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,259 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,261 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,264 :: 		}
L_end__Lcd_ResetYAddr:
	RETURN
; end of __Lcd_ResetYAddr

__Lcd_SetDataPort:

;eGlcd.c,266 :: 		void _Lcd_SetDataPort(){
;eGlcd.c,269 :: 		LSR W10, #1, W1
	LSR	W10, #1, W1
;eGlcd.c,270 :: 		MOV W1, _GLCD_D1
	MOV	W1, LATB
;eGlcd.c,272 :: 		BTSC W10, #7
	BTSC	W10, #7
;eGlcd.c,273 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,274 :: 		BTSS W10, #7
	BTSS	W10, #7
;eGlcd.c,275 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,277 :: 		BTSC W10, #0
	BTSC	W10, #0
;eGlcd.c,278 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,279 :: 		BTSS W10, #0
	BTSS	W10, #0
;eGlcd.c,280 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,282 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,284 :: 		}
L_end__Lcd_SetDataPort:
	RETURN
; end of __Lcd_SetDataPort

__Lcd_SetPage:

;eGlcd.c,286 :: 		void _Lcd_SetPage(){
;eGlcd.c,289 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,290 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,291 :: 		MOV #0xB8, W1
	MOV	#184, W1
;eGlcd.c,292 :: 		ADD W1, W10, W10
	ADD	W1, W10, W10
;eGlcd.c,293 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,295 :: 		}
L_end__Lcd_SetPage:
	RETURN
; end of __Lcd_SetPage

__Lcd_WriteData:

;eGlcd.c,297 :: 		void _Lcd_WriteData(){
;eGlcd.c,299 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,300 :: 		BSET _GLCD_RS, _GLCD_RS_BIT
	BSET	LATC, #1
;eGlcd.c,301 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,303 :: 		}
L_end__Lcd_WriteData:
	RETURN
; end of __Lcd_WriteData

_Lcd_PrintFrame:

;eGlcd.c,305 :: 		void Lcd_PrintFrame() {
;eGlcd.c,308 :: 		CALL __Lcd_Init
	CALL	__Lcd_Init
;eGlcd.c,310 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,314 :: 		MOV #0, W2                 ; side index
	MOV	#0, W2
;eGlcd.c,315 :: 		MOV _frameBuff, W6      ; buffer cursor address
	MOV	_frameBuff, W6
;eGlcd.c,317 :: 		Side_Loop:
Side_Loop:
;eGlcd.c,318 :: 		MOV #0, W5     ; page index
	MOV	#0, W5
;eGlcd.c,319 :: 		MOV #64, W3    ; store y limit
	MOV	#64, W3
;eGlcd.c,321 :: 		Page_Loop:
Page_Loop:
;eGlcd.c,322 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,323 :: 		MOV #0, W4     ; y index
	MOV	#0, W4
;eGlcd.c,324 :: 		MOV W5, W10
	MOV	W5, W10
;eGlcd.c,325 :: 		CALL __Lcd_SetPage
	CALL	__Lcd_SetPage
;eGlcd.c,327 :: 		Y_Loop:
Y_Loop:
;eGlcd.c,328 :: 		MOV.B [W6++], W10
	MOV.B	[W6++], W10
;eGlcd.c,329 :: 		CALL __Lcd_WriteData
	CALL	__Lcd_WriteData
;eGlcd.c,330 :: 		INC W4
	INC	W4
;eGlcd.c,331 :: 		CP W4, W3
	CP	W4, W3
;eGlcd.c,332 :: 		BRA LTU, Y_Loop
	BRA LTU	Y_Loop
;eGlcd.c,334 :: 		INC W5
	INC	W5
;eGlcd.c,335 :: 		CP W5, #8
	CP	W5, #8
;eGlcd.c,336 :: 		BRA LTU, Page_Loop
	BRA LTU	Page_Loop
;eGlcd.c,338 :: 		CALL __Lcd_Change_Side
	CALL	__Lcd_Change_Side
;eGlcd.c,339 :: 		INC W2
	INC	W2
;eGlcd.c,340 :: 		CP W2, #1
	CP	W2, #1
;eGlcd.c,341 :: 		BRA LEU, Side_Loop
	BRA LEU	Side_Loop
;eGlcd.c,345 :: 		_frame_buff_page = 0;
	MOV	#lo_addr(__frame_buff_page), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,346 :: 		_frame_buff_y = 0;
	MOV	#lo_addr(__frame_buff_y), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,347 :: 		_frame_buff_side = 0;
	MOV	#lo_addr(__frame_buff_side), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,348 :: 		}
L_end_Lcd_PrintFrame:
	RETURN
; end of _Lcd_PrintFrame

__frameBuffer_LoadImage:
	LNK	#2

;eGlcd.c,352 :: 		void _frameBuffer_LoadImage(const char *image)
;eGlcd.c,355 :: 		for(i=0; i<16; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L__frameBuffer_LoadImage13:
; i start address is: 6 (W3)
	CP	W3, #16
	BRA LT	L___frameBuffer_LoadImage204
	GOTO	L__frameBuffer_LoadImage14
L___frameBuffer_LoadImage204:
;eGlcd.c,357 :: 		for (j=0; j<64; j++)
; j start address is: 8 (W4)
	CLR	W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
L__frameBuffer_LoadImage16:
; j start address is: 8 (W4)
; i start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L___frameBuffer_LoadImage205
	GOTO	L__frameBuffer_LoadImage17
L___frameBuffer_LoadImage205:
;eGlcd.c,359 :: 		frameBuffer[j+ (i/2)*64 + 512*(i%2)] = image[j + i*64];
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
;eGlcd.c,357 :: 		for (j=0; j<64; j++)
	INC	W4
;eGlcd.c,360 :: 		}
; j end address is: 8 (W4)
	GOTO	L__frameBuffer_LoadImage16
L__frameBuffer_LoadImage17:
;eGlcd.c,355 :: 		for(i=0; i<16; i++)
	INC	W3
;eGlcd.c,361 :: 		}
; i end address is: 6 (W3)
	GOTO	L__frameBuffer_LoadImage13
L__frameBuffer_LoadImage14:
;eGlcd.c,362 :: 		}
L_end__frameBuffer_LoadImage:
	ULNK
	RETURN
; end of __frameBuffer_LoadImage

__frameBuffer_Fill:

;eGlcd.c,364 :: 		void _frameBuffer_Fill(unsigned char byte)
;eGlcd.c,367 :: 		for (i=0; i<1024; i++) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L__frameBuffer_Fill19:
; i start address is: 2 (W1)
	MOV	#1024, W0
	CP	W1, W0
	BRA LT	L___frameBuffer_Fill207
	GOTO	L__frameBuffer_Fill20
L___frameBuffer_Fill207:
;eGlcd.c,368 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,367 :: 		for (i=0; i<1024; i++) {
	INC	W1
;eGlcd.c,369 :: 		}
; i end address is: 2 (W1)
	GOTO	L__frameBuffer_Fill19
L__frameBuffer_Fill20:
;eGlcd.c,370 :: 		}
L_end__frameBuffer_Fill:
	RETURN
; end of __frameBuffer_Fill

__frameBuffer_Write:

;eGlcd.c,373 :: 		void _frameBuffer_Write(unsigned char byte)
;eGlcd.c,375 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,376 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,377 :: 		_frame_buff_y++;
	MOV.B	#1, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ADD.B	W1, [W0], [W0]
;eGlcd.c,378 :: 		}
L_end__frameBuffer_Write:
	RETURN
; end of __frameBuffer_Write

__frameBuffer_Read:

;eGlcd.c,380 :: 		unsigned char _frameBuffer_Read(){
;eGlcd.c,381 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,382 :: 		return frameBuffer[i];
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
;eGlcd.c,383 :: 		}
L_end__frameBuffer_Read:
	RETURN
; end of __frameBuffer_Read

__UART_DebugFrame:

;eGlcd.c,385 :: 		void _UART_DebugFrame(){
;eGlcd.c,386 :: 		int i = 0;
	PUSH	W10
;eGlcd.c,387 :: 		int j=7;
;eGlcd.c,388 :: 		char z = 0;
;eGlcd.c,391 :: 		for (z=0; z<2; z++)
; z start address is: 4 (W2)
	CLR	W2
; z end address is: 4 (W2)
L__UART_DebugFrame22:
; z start address is: 4 (W2)
	CP.B	W2, #2
	BRA LTU	L___UART_DebugFrame211
	GOTO	L__UART_DebugFrame23
L___UART_DebugFrame211:
;eGlcd.c,393 :: 		for (i=0; i<64; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
; z end address is: 4 (W2)
L__UART_DebugFrame25:
; i start address is: 6 (W3)
; z start address is: 4 (W2)
	MOV	#64, W0
	CP	W3, W0
	BRA LT	L___UART_DebugFrame212
	GOTO	L__UART_DebugFrame26
L___UART_DebugFrame212:
;eGlcd.c,395 :: 		for(j=7; j>=0; j--)
; j start address is: 8 (W4)
	MOV	#7, W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
; z end address is: 4 (W2)
L__UART_DebugFrame28:
; j start address is: 8 (W4)
; z start address is: 4 (W2)
; i start address is: 6 (W3)
	CP	W4, #0
	BRA GE	L___UART_DebugFrame213
	GOTO	L__UART_DebugFrame29
L___UART_DebugFrame213:
;eGlcd.c,397 :: 		UART1_Write(frameBuffer[i+j*64+z*512]);
	SL	W4, #6, W0
	ADD	W3, W0, W1
	ZE	W2, W0
	SL	W0, #9, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART1_Write
;eGlcd.c,395 :: 		for(j=7; j>=0; j--)
	DEC	W4
;eGlcd.c,398 :: 		}
; j end address is: 8 (W4)
	GOTO	L__UART_DebugFrame28
L__UART_DebugFrame29:
;eGlcd.c,393 :: 		for (i=0; i<64; i++)
	INC	W3
;eGlcd.c,399 :: 		}
; i end address is: 6 (W3)
	GOTO	L__UART_DebugFrame25
L__UART_DebugFrame26:
;eGlcd.c,391 :: 		for (z=0; z<2; z++)
	INC.B	W2
;eGlcd.c,400 :: 		}
; z end address is: 4 (W2)
	GOTO	L__UART_DebugFrame22
L__UART_DebugFrame23:
;eGlcd.c,419 :: 		}
L_end__UART_DebugFrame:
	POP	W10
	RETURN
; end of __UART_DebugFrame

_eGlcd_drawRect:
	LNK	#12

;eGlcd.c,432 :: 		void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height)
;eGlcd.c,434 :: 		char pageCount = 0;
	PUSH	W11
;eGlcd.c,436 :: 		unsigned char xOffset = 0;
;eGlcd.c,437 :: 		signed char lastX = 0;
;eGlcd.c,441 :: 		char startSide1 = 0, endSide2 = 0;
;eGlcd.c,442 :: 		char startSide = 0, endSide = 0;
;eGlcd.c,446 :: 		if(x+width>127 || y+height>63) return;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#127, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect215
	GOTO	L__eGlcd_drawRect159
L__eGlcd_drawRect215:
	ZE	W11, W1
	ZE	W13, W0
	ADD	W1, W0, W1
	MOV	#63, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect216
	GOTO	L__eGlcd_drawRect158
L__eGlcd_drawRect216:
	GOTO	L_eGlcd_drawRect33
L__eGlcd_drawRect159:
L__eGlcd_drawRect158:
	GOTO	L_end_eGlcd_drawRect
L_eGlcd_drawRect33:
;eGlcd.c,449 :: 		page = y / 8;           ///< Page index. Integer division, will be a value between 0 and 7.
	ZE	W11, W0
	ASR	W0, #3, W0
	MOV.B	W0, [W14+5]
;eGlcd.c,450 :: 		pageOffset = y % 8;     ///< Row index inside page, increasing downwards.
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	MOV.B	W0, [W14+6]
;eGlcd.c,451 :: 		pageCount = ceil((pageOffset+height)/8.0);  ///< The rect spans at least this number of pages. According to the offset it might fall into another page.
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
;eGlcd.c,452 :: 		pageOverflow = 8 + pageOffset + height - pageCount*8 ;   ///< How many rows it falls onto next page.
	ADD	W14, #6, W1
	ZE	[W1], W1
	ADD	W1, #8, W2
	ZE	W13, W1
	ADD	W2, W1, W2
	ZE	W0, W0
	SL	W0, #3, W1
	ADD	W14, #7, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,453 :: 		startSide1 = x<=63;       ///< Starts on side 1 condition.
	MOV.B	#63, W0
	CP.B	W10, W0
	CLR.B	W2
	BRA GTU	L__eGlcd_drawRect217
	INC.B	W2
L__eGlcd_drawRect217:
; startSide1 start address is: 14 (W7)
	MOV.B	W2, W7
;eGlcd.c,454 :: 		endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#63, W0
; endSide2 start address is: 16 (W8)
	CP	W1, W0
	CLR.B	W8
	BRA LEU	L__eGlcd_drawRect218
	INC.B	W8
L__eGlcd_drawRect218:
;eGlcd.c,455 :: 		startSide = startSide1 ? 0 : 1;
	CP0.B	W2
	BRA NZ	L__eGlcd_drawRect219
	GOTO	L_eGlcd_drawRect34
L__eGlcd_drawRect219:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect35
L_eGlcd_drawRect34:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
L_eGlcd_drawRect35:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
; startSide start address is: 6 (W3)
	MOV.B	W0, W3
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
;eGlcd.c,456 :: 		endSide = endSide2 ? 1 : 0;
	CP0.B	W8
	BRA NZ	L__eGlcd_drawRect220
	GOTO	L_eGlcd_drawRect36
L__eGlcd_drawRect220:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect37
L_eGlcd_drawRect36:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
L_eGlcd_drawRect37:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	MOV.B	W0, [W14+10]
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
;eGlcd.c,459 :: 		xOffset = x;            ///< The x offset inside GLCD side to print to.
	MOV.B	W10, [W14+8]
;eGlcd.c,460 :: 		if(x>63) {
	MOV.B	#63, W0
	CP.B	W10, W0
	BRA GTU	L__eGlcd_drawRect221
	GOTO	L_eGlcd_drawRect38
L__eGlcd_drawRect221:
;eGlcd.c,461 :: 		xOffset -= 64;
	MOV.B	[W14+8], W2
	MOV.B	#64, W1
	ADD	W14, #8, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,462 :: 		}
L_eGlcd_drawRect38:
;eGlcd.c,463 :: 		lastX = xOffset+width;
	ADD	W14, #8, W0
	ZE	[W0], W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV.B	W1, [W14+9]
;eGlcd.c,464 :: 		if(lastX > 63)
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA GT	L__eGlcd_drawRect222
	GOTO	L_eGlcd_drawRect39
L__eGlcd_drawRect222:
;eGlcd.c,465 :: 		lastX = 63;
	MOV.B	#63, W0
	MOV.B	W0, [W14+9]
L_eGlcd_drawRect39:
;eGlcd.c,468 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	W3, [W14+2]
; pageCount end address is: 12 (W6)
; startSide end address is: 6 (W3)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
	MOV.B	W6, W5
	MOV.B	W7, W3
	MOV.B	W8, W2
L_eGlcd_drawRect40:
; endSide2 start address is: 4 (W2)
; startSide1 start address is: 6 (W3)
; pageCount start address is: 10 (W5)
	MOV.B	[W14+2], W1
	ADD	W14, #10, W0
	CP.B	W1, [W0]
	BRA LEU	L__eGlcd_drawRect223
	GOTO	L__eGlcd_drawRect177
L__eGlcd_drawRect223:
	MOV.B	[W14+9], W0
	CP.B	W0, #0
	BRA GT	L__eGlcd_drawRect224
	GOTO	L__eGlcd_drawRect176
L__eGlcd_drawRect224:
L__eGlcd_drawRect156:
;eGlcd.c,471 :: 		_frame_buff_side = k;
	MOV	#lo_addr(__frame_buff_side), W1
	MOV.B	[W14+2], W0
	MOV.B	W0, [W1]
;eGlcd.c,475 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
	MOV.B	[W14+5], W0
	MOV.B	W0, [W14+0]
; endSide2 end address is: 4 (W2)
; startSide1 end address is: 6 (W3)
; pageCount end address is: 10 (W5)
	MOV.B	W2, W8
	MOV.B	W3, W7
	MOV.B	W5, W4
L_eGlcd_drawRect45:
; pageCount start address is: 8 (W4)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA LTU	L__eGlcd_drawRect225
	GOTO	L__eGlcd_drawRect175
L__eGlcd_drawRect225:
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__eGlcd_drawRect226
	GOTO	L__eGlcd_drawRect174
L__eGlcd_drawRect226:
L__eGlcd_drawRect155:
;eGlcd.c,478 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,479 :: 		_frame_buff_y = xOffset;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+8], W0
	MOV.B	W0, [W1]
;eGlcd.c,484 :: 		if(i==page)   ///< If we are in first page...
	MOV.B	[W14+0], W1
	ADD	W14, #5, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect227
	GOTO	L_eGlcd_drawRect50
L__eGlcd_drawRect227:
;eGlcd.c,486 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect51:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect228
	GOTO	L_eGlcd_drawRect52
L__eGlcd_drawRect228:
;eGlcd.c,488 :: 		byte = ~(0xFF<<pageOffset);
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #3, W1
	COM.B	W0, [W1]
;eGlcd.c,490 :: 		rByte = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,495 :: 		byte&=rByte;
	ADD	W14, #3, W1
	AND.B	W0, [W1], [W1]
;eGlcd.c,497 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect229
	GOTO	L__eGlcd_drawRect161
L__eGlcd_drawRect229:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect230
	INC.B	W0
L__eGlcd_drawRect230:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect160
	GOTO	L__eGlcd_drawRect152
L__eGlcd_drawRect161:
L__eGlcd_drawRect160:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect231
	GOTO	L__eGlcd_drawRect163
L__eGlcd_drawRect231:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect232
	INC.B	W0
L__eGlcd_drawRect232:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect233
	INC.B	W0
L__eGlcd_drawRect233:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect162
	GOTO	L__eGlcd_drawRect152
L__eGlcd_drawRect163:
L__eGlcd_drawRect162:
	GOTO	L_eGlcd_drawRect60
L__eGlcd_drawRect152:
;eGlcd.c,498 :: 		byte2 = 0xFF<<pageOffset;
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+4]
	GOTO	L_eGlcd_drawRect61
L_eGlcd_drawRect60:
;eGlcd.c,500 :: 		byte2 = 1<<pageOffset;
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect61:
;eGlcd.c,501 :: 		byte|= byte2;
	MOV.B	[W14+4], W1
	ADD	W14, #3, W0
	IOR.B	W1, [W0], [W0]
;eGlcd.c,503 :: 		if(j>=62)
	MOV.B	[W14+1], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect234
	GOTO	L_eGlcd_drawRect62
L__eGlcd_drawRect234:
;eGlcd.c,506 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,510 :: 		}
L_eGlcd_drawRect62:
;eGlcd.c,512 :: 		_frame_buff_y = j;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+1], W0
	MOV.B	W0, [W1]
;eGlcd.c,513 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,486 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,518 :: 		}
	GOTO	L_eGlcd_drawRect51
L_eGlcd_drawRect52:
;eGlcd.c,519 :: 		}
	GOTO	L_eGlcd_drawRect63
L_eGlcd_drawRect50:
;eGlcd.c,520 :: 		else if (i == (page+pageCount-1) && pageOverflow)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W0
	SUB	W0, #1, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__eGlcd_drawRect235
	GOTO	L__eGlcd_drawRect169
L__eGlcd_drawRect235:
	ADD	W14, #7, W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_drawRect236
	GOTO	L__eGlcd_drawRect168
L__eGlcd_drawRect236:
L__eGlcd_drawRect151:
;eGlcd.c,522 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect67:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect237
	GOTO	L_eGlcd_drawRect68
L__eGlcd_drawRect237:
;eGlcd.c,524 :: 		byte = (0xFF<<pageOverflow);
	MOV	#255, W1
	ADD	W14, #7, W0
	SE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+3]
;eGlcd.c,526 :: 		rByte = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,531 :: 		byte &= rByte;
	ADD	W14, #3, W2
	ADD	W14, #3, W1
	AND.B	W0, [W2], [W1]
;eGlcd.c,533 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect238
	GOTO	L__eGlcd_drawRect165
L__eGlcd_drawRect238:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect239
	INC.B	W0
L__eGlcd_drawRect239:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect164
	GOTO	L__eGlcd_drawRect148
L__eGlcd_drawRect165:
L__eGlcd_drawRect164:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect240
	GOTO	L__eGlcd_drawRect167
L__eGlcd_drawRect240:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect241
	INC.B	W0
L__eGlcd_drawRect241:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect242
	INC.B	W0
L__eGlcd_drawRect242:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect166
	GOTO	L__eGlcd_drawRect148
L__eGlcd_drawRect167:
L__eGlcd_drawRect166:
	GOTO	L_eGlcd_drawRect76
L__eGlcd_drawRect148:
;eGlcd.c,534 :: 		byte2 = ~(0xFF<<pageOverflow);
	MOV	#255, W1
	ADD	W14, #7, W0
	SE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #4, W1
	COM.B	W0, [W1]
	GOTO	L_eGlcd_drawRect77
L_eGlcd_drawRect76:
;eGlcd.c,536 :: 		byte2 = 1<<(pageOverflow-1);
	ADD	W14, #7, W0
	SE	[W0], W0
	SUB	W0, #1, W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect77:
;eGlcd.c,537 :: 		byte|= byte2;
	MOV.B	[W14+3], W2
	ADD	W14, #4, W1
	ADD	W14, #3, W0
	IOR.B	W2, [W1], [W0]
;eGlcd.c,539 :: 		if(j>=61)
	MOV.B	[W14+1], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect243
	GOTO	L_eGlcd_drawRect78
L__eGlcd_drawRect243:
;eGlcd.c,542 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,546 :: 		}
L_eGlcd_drawRect78:
;eGlcd.c,548 :: 		_frame_buff_y = j;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+1], W0
	MOV.B	W0, [W1]
;eGlcd.c,549 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,522 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,554 :: 		}
	GOTO	L_eGlcd_drawRect67
L_eGlcd_drawRect68:
;eGlcd.c,555 :: 		}
	GOTO	L_eGlcd_drawRect79
;eGlcd.c,520 :: 		else if (i == (page+pageCount-1) && pageOverflow)
L__eGlcd_drawRect169:
L__eGlcd_drawRect168:
;eGlcd.c,558 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect80:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect244
	GOTO	L_eGlcd_drawRect81
L__eGlcd_drawRect244:
;eGlcd.c,560 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect245
	GOTO	L__eGlcd_drawRect171
L__eGlcd_drawRect245:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect246
	INC.B	W0
L__eGlcd_drawRect246:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect170
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect171:
L__eGlcd_drawRect170:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect247
	GOTO	L__eGlcd_drawRect173
L__eGlcd_drawRect247:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect248
	INC.B	W0
L__eGlcd_drawRect248:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect249
	INC.B	W0
L__eGlcd_drawRect249:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect172
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect173:
L__eGlcd_drawRect172:
	GOTO	L_eGlcd_drawRect89
L__eGlcd_drawRect145:
;eGlcd.c,561 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+3]
	GOTO	L_eGlcd_drawRect90
L_eGlcd_drawRect89:
;eGlcd.c,563 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+3]
L_eGlcd_drawRect90:
;eGlcd.c,565 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,558 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,569 :: 		}
	GOTO	L_eGlcd_drawRect80
L_eGlcd_drawRect81:
;eGlcd.c,570 :: 		}
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect79:
; endSide2 end address is: 16 (W8)
; pageCount start address is: 8 (W4)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect63:
;eGlcd.c,475 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,572 :: 		}
	GOTO	L_eGlcd_drawRect45
;eGlcd.c,475 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
L__eGlcd_drawRect175:
L__eGlcd_drawRect174:
;eGlcd.c,573 :: 		lastX=x+width-64;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W2
	MOV.B	#64, W1
	ADD	W14, #9, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,574 :: 		xOffset=0;
	CLR	W0
	MOV.B	W0, [W14+8]
;eGlcd.c,468 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,575 :: 		}
	MOV.B	W4, W5
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W3
	MOV.B	W8, W2
	GOTO	L_eGlcd_drawRect40
;eGlcd.c,468 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
L__eGlcd_drawRect177:
L__eGlcd_drawRect176:
;eGlcd.c,576 :: 		}
L_end_eGlcd_drawRect:
	POP	W11
	ULNK
	RETURN
; end of _eGlcd_drawRect

_eGlcd_fillPage:

;eGlcd.c,578 :: 		void eGlcd_fillPage(unsigned char page, char color)
;eGlcd.c,580 :: 		int k, i=0;
; i start address is: 2 (W1)
	CLR	W1
;eGlcd.c,581 :: 		char byte = 0;
; byte start address is: 4 (W2)
	CLR	W2
;eGlcd.c,582 :: 		if (color == BLACK)
	CP.B	W11, #1
	BRA Z	L__eGlcd_fillPage251
	GOTO	L__eGlcd_fillPage178
L__eGlcd_fillPage251:
;eGlcd.c,583 :: 		byte = 0xFF;
	MOV.B	#255, W2
; byte end address is: 4 (W2)
	GOTO	L_eGlcd_fillPage91
L__eGlcd_fillPage178:
;eGlcd.c,582 :: 		if (color == BLACK)
;eGlcd.c,583 :: 		byte = 0xFF;
L_eGlcd_fillPage91:
;eGlcd.c,585 :: 		_frame_buff_page = page;
; byte start address is: 4 (W2)
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W10, [W0]
;eGlcd.c,589 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
; k start address is: 6 (W3)
	CLR	W3
; i end address is: 2 (W1)
; byte end address is: 4 (W2)
; k end address is: 6 (W3)
	MOV	W1, W4
L_eGlcd_fillPage92:
; k start address is: 6 (W3)
; byte start address is: 4 (W2)
; i start address is: 8 (W4)
	CP	W3, #1
	BRA LE	L__eGlcd_fillPage252
	GOTO	L_eGlcd_fillPage93
L__eGlcd_fillPage252:
;eGlcd.c,592 :: 		_frame_buff_side = k;
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W3, [W0]
;eGlcd.c,593 :: 		_frame_buff_y = i;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W4, [W0]
; byte end address is: 4 (W2)
; i end address is: 8 (W4)
; k end address is: 6 (W3)
;eGlcd.c,598 :: 		for(; i<64; i++)  {
L_eGlcd_fillPage95:
; i start address is: 8 (W4)
; byte start address is: 4 (W2)
; k start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L__eGlcd_fillPage253
	GOTO	L_eGlcd_fillPage96
L__eGlcd_fillPage253:
;eGlcd.c,600 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	W2, W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,598 :: 		for(; i<64; i++)  {
	INC	W4
;eGlcd.c,604 :: 		}
; i end address is: 8 (W4)
	GOTO	L_eGlcd_fillPage95
L_eGlcd_fillPage96:
;eGlcd.c,605 :: 		i = 0;
; i start address is: 8 (W4)
	CLR	W4
;eGlcd.c,589 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
	INC	W3
;eGlcd.c,606 :: 		}
; byte end address is: 4 (W2)
; i end address is: 8 (W4)
; k end address is: 6 (W3)
	GOTO	L_eGlcd_fillPage92
L_eGlcd_fillPage93:
;eGlcd.c,607 :: 		}
L_end_eGlcd_fillPage:
	RETURN
; end of _eGlcd_fillPage

_xGlcd_Set_Font:

;eGlcd.c,618 :: 		unsigned short font_height, unsigned int font_offset) {
;eGlcd.c,619 :: 		xGlcdSelFont = ptrFontTbl;
	MOV	W10, eGlcd_xGlcdSelFont
;eGlcd.c,620 :: 		xGlcdSelFontWidth = font_width;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	MOV.B	W11, [W0]
;eGlcd.c,621 :: 		xGlcdSelFontHeight = font_height;
	MOV	#lo_addr(eGlcd_xGlcdSelFontHeight), W0
	MOV.B	W12, [W0]
;eGlcd.c,622 :: 		xGlcdSelFontOffset = font_offset;
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	MOV.B	W13, [W0]
;eGlcd.c,623 :: 		xGLCD_Transparency = FALSE;  //Transparency of Text is set to False !!!
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,625 :: 		xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
	ZE	W12, W0
	ASR	W0, #3, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	MOV.B	W1, [W0]
;eGlcd.c,626 :: 		if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
	ZE	W12, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP0	W0
	BRA NZ	L__xGlcd_Set_Font255
	GOTO	L_xGlcd_Set_Font98
L__xGlcd_Set_Font255:
	MOV.B	#1, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font98:
;eGlcd.c,627 :: 		}
L_end_xGlcd_Set_Font:
	RETURN
; end of _xGlcd_Set_Font

_xGLCD_Write_Data:

;eGlcd.c,630 :: 		void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
;eGlcd.c,633 :: 		if ((pX > 127) || (pY > 63)) return;
	PUSH	W10
	MOV.B	#127, W0
	CP.B	W10, W0
	BRA LEU	L__xGLCD_Write_Data257
	GOTO	L__xGLCD_Write_Data142
L__xGLCD_Write_Data257:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data258
	GOTO	L__xGLCD_Write_Data141
L__xGLCD_Write_Data258:
	GOTO	L_xGLCD_Write_Data101
L__xGLCD_Write_Data142:
L__xGLCD_Write_Data141:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data101:
;eGlcd.c,634 :: 		xx = pX % 64;
	ZE	W10, W0
	MOV	#64, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; xx start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,635 :: 		tmp = pY / 8;
	ZE	W11, W0
	ASR	W0, #3, W0
; tmp start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,636 :: 		tmpY = pY % 8;
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; tmpY start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,637 :: 		if (tmpY) {
	CP0.B	W0
	BRA NZ	L__xGLCD_Write_Data259
	GOTO	L_xGLCD_Write_Data102
L__xGLCD_Write_Data259:
;eGlcd.c,639 :: 		gData = pData << tmpY;
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,641 :: 		_frame_buff_side = pX/64;
	ZE	W10, W0
	ASR	W0, #6, W1
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W1, [W0]
;eGlcd.c,642 :: 		_frame_buff_y = xx;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
;eGlcd.c,643 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W4, [W0]
;eGlcd.c,644 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,652 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data260
	GOTO	L__xGLCD_Write_Data143
L__xGLCD_Write_Data260:
;eGlcd.c,653 :: 		dataR = dataR & (0xff >> (8 - tmpY));
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
	AND.B	W6, W0, W6
; dataR end address is: 12 (W6)
	GOTO	L_xGLCD_Write_Data103
L__xGLCD_Write_Data143:
;eGlcd.c,652 :: 		if (!xGLCD_Transparency)
;eGlcd.c,653 :: 		dataR = dataR & (0xff >> (8 - tmpY));
L_xGLCD_Write_Data103:
;eGlcd.c,654 :: 		dataR = gData | dataR;
; dataR start address is: 12 (W6)
	ZE	W5, W1
; gData end address is: 10 (W5)
	ZE	W6, W0
; dataR end address is: 12 (W6)
	IOR	W1, W0, W0
;eGlcd.c,657 :: 		_frameBuffer_Write(dataR);
	MOV.B	W0, W10
	CALL	__frameBuffer_Write
;eGlcd.c,663 :: 		tmp++;
	ADD.B	W4, #1, W0
; tmp end address is: 8 (W4)
; tmp start address is: 2 (W1)
	MOV.B	W0, W1
;eGlcd.c,664 :: 		if (tmp > 7) return;
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data261
	GOTO	L_xGLCD_Write_Data104
L__xGLCD_Write_Data261:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 2 (W1)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data104:
;eGlcd.c,666 :: 		_frame_buff_y = xx;
; tmp start address is: 2 (W1)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
; xx end address is: 6 (W3)
;eGlcd.c,667 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W1, [W0]
; tmp end address is: 2 (W1)
;eGlcd.c,668 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
; dataR start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,675 :: 		gData = pData >> (8 - tmpY);
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,676 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data262
	GOTO	L__xGLCD_Write_Data144
L__xGLCD_Write_Data262:
;eGlcd.c,677 :: 		dataR = dataR & (0xff << tmpY);
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 4 (W2)
	AND.B	W4, W0, W2
; dataR end address is: 8 (W4)
; dataR end address is: 4 (W2)
	GOTO	L_xGLCD_Write_Data105
L__xGLCD_Write_Data144:
;eGlcd.c,676 :: 		if (!xGLCD_Transparency)
	MOV.B	W4, W2
;eGlcd.c,677 :: 		dataR = dataR & (0xff << tmpY);
L_xGLCD_Write_Data105:
;eGlcd.c,678 :: 		dataR = gData | dataR;
; dataR start address is: 4 (W2)
	ZE	W3, W1
; gData end address is: 6 (W3)
	ZE	W2, W0
; dataR end address is: 4 (W2)
	IOR	W1, W0, W0
;eGlcd.c,681 :: 		_frameBuffer_Write(dataR);
	MOV.B	W0, W10
	CALL	__frameBuffer_Write
;eGlcd.c,686 :: 		}
	GOTO	L_xGLCD_Write_Data106
L_xGLCD_Write_Data102:
;eGlcd.c,689 :: 		_frame_buff_side = pX/64;
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	ZE	W10, W0
	ASR	W0, #6, W1
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W1, [W0]
;eGlcd.c,690 :: 		_frame_buff_y = xx;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
; xx end address is: 6 (W3)
;eGlcd.c,691 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W4, [W0]
; tmp end address is: 8 (W4)
;eGlcd.c,697 :: 		if (xGLCD_Transparency) {
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data263
	GOTO	L_xGLCD_Write_Data107
L__xGLCD_Write_Data263:
;eGlcd.c,699 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,704 :: 		dataR = pData | dataR;
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eGlcd.c,705 :: 		}
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data108
L_xGLCD_Write_Data107:
;eGlcd.c,707 :: 		dataR = pData;
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
L_xGLCD_Write_Data108:
;eGlcd.c,710 :: 		_frameBuffer_Write(dataR);
; dataR start address is: 0 (W0)
	MOV.B	W0, W10
; dataR end address is: 0 (W0)
	CALL	__frameBuffer_Write
;eGlcd.c,715 :: 		}
L_xGLCD_Write_Data106:
;eGlcd.c,716 :: 		}
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eGlcd.c,718 :: 		unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,723 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,724 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,725 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W3
;eGlcd.c,726 :: 		CharWidth = *CurCharData;  // retrieves first byte in the char, which stores its width
	MOV	#___Lib_System_DefaultPage, W2
	MOV	W2, 52
	MOV.B	[W3], W2
; CharWidth start address is: 4 (W2)
;eGlcd.c,727 :: 		cOffset++;
; cOffset start address is: 16 (W8)
	ADD	W0, #1, W8
	ADDC	W1, #0, W9
;eGlcd.c,728 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 8 (W4)
	CLR	W4
; CharWidth end address is: 4 (W2)
; cOffset end address is: 16 (W8)
; i end address is: 8 (W4)
	MOV.B	W2, W7
L_xGlcd_Write_Char109:
; i start address is: 8 (W4)
; cOffset start address is: 16 (W8)
; CharWidth start address is: 14 (W7)
	CP.B	W4, W7
	BRA LTU	L__xGlcd_Write_Char265
	GOTO	L_xGlcd_Write_Char110
L__xGlcd_Write_Char265:
;eGlcd.c,729 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 10 (W5)
	CLR	W5
; CharWidth end address is: 14 (W7)
; cOffset end address is: 16 (W8)
; j end address is: 10 (W5)
; i end address is: 8 (W4)
L_xGlcd_Write_Char112:
; j start address is: 10 (W5)
; CharWidth start address is: 14 (W7)
; cOffset start address is: 16 (W8)
; i start address is: 8 (W4)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W5, [W0]
	BRA LTU	L__xGlcd_Write_Char266
	GOTO	L_xGlcd_Write_Char113
L__xGlcd_Write_Char266:
;eGlcd.c,730 :: 		CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
	ZE	W4, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W0
	ADD	W2, [W0], W1
	ZE	W5, W0
	ADD	W1, W0, W0
; CurCharData start address is: 2 (W1)
	ADD	W0, W8, W1
;eGlcd.c,731 :: 		switch (color) {
	GOTO	L_xGlcd_Write_Char115
;eGlcd.c,732 :: 		case WHITE:
L_xGlcd_Write_Char117:
;eGlcd.c,733 :: 		CharData = ~(*CurCharData);
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,734 :: 		break;
	GOTO	L_xGlcd_Write_Char116
;eGlcd.c,735 :: 		case BLACK :
L_xGlcd_Write_Char118:
;eGlcd.c,736 :: 		CharData = *CurCharData;
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eGlcd.c,737 :: 		break;
	GOTO	L_xGlcd_Write_Char116
;eGlcd.c,738 :: 		case 2 :
L_xGlcd_Write_Char119:
;eGlcd.c,739 :: 		CharData = ~(*CurCharData);
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,740 :: 		break;
	GOTO	L_xGlcd_Write_Char116
;eGlcd.c,741 :: 		}
L_xGlcd_Write_Char115:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char267
	GOTO	L_xGlcd_Write_Char117
L__xGlcd_Write_Char267:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char268
	GOTO	L_xGlcd_Write_Char118
L__xGlcd_Write_Char268:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char269
	GOTO	L_xGlcd_Write_Char119
L__xGlcd_Write_Char269:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char116:
;eGlcd.c,742 :: 		xGLCD_Write_Data(x + i, y + j * 8, CharData);
	ZE	W5, W0
	SL	W0, #3, W1
	ZE	W12, W0
	ADD	W0, W1, W2
	ZE	W11, W1
	ZE	W4, W0
	ADD	W1, W0, W0
	PUSH.D	W4
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W14+0], W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_xGLCD_Write_Data
	POP.D	W10
	POP	W12
	POP.D	W4
;eGlcd.c,729 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W5
;eGlcd.c,743 :: 		};
; j end address is: 10 (W5)
	GOTO	L_xGlcd_Write_Char112
L_xGlcd_Write_Char113:
;eGlcd.c,728 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W4
;eGlcd.c,743 :: 		};
; cOffset end address is: 16 (W8)
; i end address is: 8 (W4)
	GOTO	L_xGlcd_Write_Char109
L_xGlcd_Write_Char110:
;eGlcd.c,744 :: 		return CharWidth;
	MOV.B	W7, W0
; CharWidth end address is: 14 (W7)
;eGlcd.c,745 :: 		}
L_end_xGlcd_Write_Char:
	ULNK
	RETURN
; end of _xGlcd_Write_Char

_xGlcd_Clear_Char:
	LNK	#2

;eGlcd.c,747 :: 		unsigned short xGlcd_Clear_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,753 :: 		switch (color)
	GOTO	L_xGlcd_Clear_Char120
;eGlcd.c,755 :: 		case WHITE:
L_xGlcd_Clear_Char122:
;eGlcd.c,756 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;eGlcd.c,757 :: 		break;
	GOTO	L_xGlcd_Clear_Char121
;eGlcd.c,758 :: 		case BLACK:
L_xGlcd_Clear_Char123:
;eGlcd.c,759 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
;eGlcd.c,760 :: 		break;
	GOTO	L_xGlcd_Clear_Char121
;eGlcd.c,761 :: 		default:
L_xGlcd_Clear_Char124:
;eGlcd.c,762 :: 		break;
	GOTO	L_xGlcd_Clear_Char121
;eGlcd.c,763 :: 		}
L_xGlcd_Clear_Char120:
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Clear_Char271
	GOTO	L_xGlcd_Clear_Char122
L__xGlcd_Clear_Char271:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Clear_Char272
	GOTO	L_xGlcd_Clear_Char123
L__xGlcd_Clear_Char272:
	GOTO	L_xGlcd_Clear_Char124
L_xGlcd_Clear_Char121:
;eGlcd.c,765 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,766 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,767 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,768 :: 		CharWidth = *CurCharData;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
; CharWidth start address is: 14 (W7)
	MOV.B	W0, W7
;eGlcd.c,769 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
; CharWidth end address is: 14 (W7)
	MOV.B	W0, W8
L_xGlcd_Clear_Char125:
; i start address is: 16 (W8)
; CharWidth start address is: 14 (W7)
	CP.B	W8, W7
	BRA LTU	L__xGlcd_Clear_Char273
	GOTO	L_xGlcd_Clear_Char126
L__xGlcd_Clear_Char273:
;eGlcd.c,770 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 18 (W9)
	CLR	W9
; CharWidth end address is: 14 (W7)
; j end address is: 18 (W9)
; i end address is: 16 (W8)
L_xGlcd_Clear_Char128:
; j start address is: 18 (W9)
; CharWidth start address is: 14 (W7)
; i start address is: 16 (W8)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W9, [W0]
	BRA LTU	L__xGlcd_Clear_Char274
	GOTO	L_xGlcd_Clear_Char129
L__xGlcd_Clear_Char274:
;eGlcd.c,771 :: 		xGLCD_Write_Data(x + i, y + j * 8, byte);
	ZE	W9, W0
	SL	W0, #3, W1
	ZE	W12, W0
	ADD	W0, W1, W2
	ZE	W11, W1
	ZE	W8, W0
	ADD	W1, W0, W0
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W14+0], W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_xGLCD_Write_Data
	POP.D	W10
	POP	W12
;eGlcd.c,770 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W9
;eGlcd.c,772 :: 		};
; j end address is: 18 (W9)
	GOTO	L_xGlcd_Clear_Char128
L_xGlcd_Clear_Char129:
;eGlcd.c,769 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W8
;eGlcd.c,772 :: 		};
; i end address is: 16 (W8)
	GOTO	L_xGlcd_Clear_Char125
L_xGlcd_Clear_Char126:
;eGlcd.c,773 :: 		return CharWidth;
	MOV.B	W7, W0
; CharWidth end address is: 14 (W7)
;eGlcd.c,774 :: 		}
L_end_xGlcd_Clear_Char:
	ULNK
	RETURN
; end of _xGlcd_Clear_Char

_xGlcd_Char_Width:

;eGlcd.c,776 :: 		unsigned short xGlcd_Char_Width(unsigned short ch) {
;eGlcd.c,779 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,780 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,781 :: 		CurCharDt = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,782 :: 		return *CurCharDt;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
;eGlcd.c,783 :: 		}
L_end_xGlcd_Char_Width:
	RETURN
; end of _xGlcd_Char_Width

_xGlcd_Write_Text:

;eGlcd.c,785 :: 		void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,788 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,789 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,790 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,791 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Write_Text131:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text277
	GOTO	L_xGlcd_Write_Text132
L__xGlcd_Write_Text277:
;eGlcd.c,792 :: 		posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1; //add 1 blank column
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
;eGlcd.c,793 :: 		curChar++;
	INC	W4
;eGlcd.c,791 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,794 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Write_Text131
L_xGlcd_Write_Text132:
;eGlcd.c,795 :: 		}
L_end_xGlcd_Write_Text:
	RETURN
; end of _xGlcd_Write_Text

_xGlcd_Clear_Text:

;eGlcd.c,797 :: 		void xGlcd_Clear_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,800 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,801 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,802 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,803 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Clear_Text134:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Clear_Text279
	GOTO	L_xGlcd_Clear_Text135
L__xGlcd_Clear_Text279:
;eGlcd.c,804 :: 		posX = posX + xGlcd_Clear_Char(*curChar, posX, y, color) + 1; //add 1 blank column
	PUSH	W2
	PUSH.D	W4
	PUSH	W3
	PUSH.D	W10
	MOV.B	W5, W11
	MOV.B	[W4], W10
	CALL	_xGlcd_Clear_Char
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
;eGlcd.c,805 :: 		curChar++;
	INC	W4
;eGlcd.c,803 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,806 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Clear_Text134
L_xGlcd_Clear_Text135:
;eGlcd.c,807 :: 		}
L_end_xGlcd_Clear_Text:
	RETURN
; end of _xGlcd_Clear_Text

_xGlcd_Text_Width:

;eGlcd.c,809 :: 		unsigned short xGlcd_Text_Width(char *text) {
;eGlcd.c,811 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,812 :: 		w = 0;
; w start address is: 16 (W8)
	CLR	W8
;eGlcd.c,813 :: 		for (i = 0; i < l; i++)
; i start address is: 14 (W7)
	CLR	W7
; w end address is: 16 (W8)
; l end address is: 12 (W6)
; i end address is: 14 (W7)
L_xGlcd_Text_Width137:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width281
	GOTO	L_xGlcd_Text_Width138
L__xGlcd_Text_Width281:
;eGlcd.c,814 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
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
;eGlcd.c,813 :: 		for (i = 0; i < l; i++)
	INC.B	W7
;eGlcd.c,814 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
; l end address is: 12 (W6)
; w end address is: 0 (W0)
; i end address is: 14 (W7)
	MOV.B	W0, W8
	GOTO	L_xGlcd_Text_Width137
L_xGlcd_Text_Width138:
;eGlcd.c,815 :: 		return w;
; w start address is: 16 (W8)
	MOV.B	W8, W0
; w end address is: 16 (W8)
;eGlcd.c,816 :: 		}
L_end_xGlcd_Text_Width:
	RETURN
; end of _xGlcd_Text_Width

_xGLCD_Set_Transparency:

;eGlcd.c,818 :: 		void xGLCD_Set_Transparency(char active) {
;eGlcd.c,819 :: 		xGLCD_Transparency = active;
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	MOV.B	W10, [W0]
;eGlcd.c,820 :: 		}
L_end_xGLCD_Set_Transparency:
	RETURN
; end of _xGLCD_Set_Transparency

eGlcd____?ag:

L_end_eGlcd___?ag:
	RETURN
; end of eGlcd____?ag
