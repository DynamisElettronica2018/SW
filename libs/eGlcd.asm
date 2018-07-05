
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
	BRA NZ	L__eGlcd_fill171
	GOTO	L_eGlcd_fill0
L__eGlcd_fill171:
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
;eGlcd.c,88 :: 		xGlcd_Write_Char(letter, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,93 :: 		}
L_eGlcd_clearChar2:
;eGlcd.c,94 :: 		}
L_end_eGlcd_clearChar:
	POP	W13
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eGlcd.c,96 :: 		void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,98 :: 		xGlcd_Write_Char(letter, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,101 :: 		}
L_eGlcd_writeChar4:
;eGlcd.c,102 :: 		}
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eGlcd.c,104 :: 		void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
;eGlcd.c,105 :: 		eGlcd_clearText(oldText, x, y);
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
;eGlcd.c,106 :: 		eGlcd_writeText(newText, x, y);
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eGlcd.c,107 :: 		}
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eGlcd.c,109 :: 		void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,111 :: 		xGlcd_Write_Text(text, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,116 :: 		}
L_eGlcd_clearText6:
;eGlcd.c,117 :: 		}
L_end_eGlcd_clearText:
	POP	W13
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eGlcd.c,119 :: 		void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,121 :: 		xGlcd_Write_Text(text, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,124 :: 		}
L_eGlcd_writeText8:
;eGlcd.c,125 :: 		}
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_loadImage:

;eGlcd.c,127 :: 		void eGlcd_loadImage(const char *image)
;eGlcd.c,130 :: 		_frameBuffer_LoadImage(image);
	CALL	__frameBuffer_LoadImage
;eGlcd.c,134 :: 		}
L_end_eGlcd_loadImage:
	RETURN
; end of _eGlcd_loadImage

_eGlcd_setupTimer:

;eGlcd.c,136 :: 		void eGlcd_setupTimer(void) {
;eGlcd.c,140 :: 		}
L_end_eGlcd_setupTimer:
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eGlcd.c,142 :: 		void eGlcd_setTimerCoefficient(float coefficient) {
;eGlcd.c,143 :: 		EGLCD_TIMER_COEFFICIENT = coefficient;
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eGlcd.c,144 :: 		}
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eGlcd.c,146 :: 		unsigned int eGlcd_getTextPixelLength(char *text) {
;eGlcd.c,147 :: 		unsigned int textPixelLength = 0, i;
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eGlcd.c,148 :: 		for (i = 0; i < strlen(text); i += 1) {
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength9:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength182
	GOTO	L_eGlcd_getTextPixelLength10
L__eGlcd_getTextPixelLength182:
;eGlcd.c,149 :: 		textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eGlcd.c,148 :: 		for (i = 0; i < strlen(text); i += 1) {
	INC	W6
;eGlcd.c,150 :: 		}
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength9
L_eGlcd_getTextPixelLength10:
;eGlcd.c,151 :: 		return textPixelLength;
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eGlcd.c,152 :: 		}
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

__Lcd_Toggle_Enable:

;eGlcd.c,166 :: 		void _Lcd_Toggle_Enable() {
;eGlcd.c,168 :: 		BSET _GLCD_EN, _GLCD_EN_BIT
	BSET	LATG, #15
;eGlcd.c,169 :: 		REPEAT #90                    ; 3.5us delay
	REPEAT	#90
;eGlcd.c,170 :: 		NOP
	NOP
;eGlcd.c,172 :: 		BCLR _GLCD_EN, _GLCD_EN_BIT
	BCLR	LATG, #15
;eGlcd.c,173 :: 		REPEAT #90
	REPEAT	#90
;eGlcd.c,174 :: 		NOP
	NOP
;eGlcd.c,176 :: 		}
L_end__Lcd_Toggle_Enable:
	RETURN
; end of __Lcd_Toggle_Enable

__Lcd_Change_Side:

;eGlcd.c,178 :: 		void _Lcd_Change_Side(){
;eGlcd.c,183 :: 		BTG _GLCD_CS1, _GLCD_CS1_BIT
	BTG	LATG, #8
;eGlcd.c,184 :: 		BTG _GLCD_CS2, _GLCD_CS2_BIT
	BTG	LATG, #7
;eGlcd.c,187 :: 		}
L_end__Lcd_Change_Side:
	RETURN
; end of __Lcd_Change_Side

__Lcd_Init:

;eGlcd.c,189 :: 		void _Lcd_Init(){
;eGlcd.c,190 :: 		GLCD_D0_Direction = 0;
	BCLR	TRISB8_bit, BitPos(TRISB8_bit+0)
;eGlcd.c,191 :: 		GLCD_D1_Direction = 0;
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;eGlcd.c,192 :: 		GLCD_D2_Direction = 0;
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;eGlcd.c,193 :: 		GLCD_D3_Direction = 0;
	BCLR	TRISB2_bit, BitPos(TRISB2_bit+0)
;eGlcd.c,194 :: 		GLCD_D4_Direction = 0;
	BCLR	TRISB3_bit, BitPos(TRISB3_bit+0)
;eGlcd.c,195 :: 		GLCD_D5_Direction = 0;
	BCLR	TRISB4_bit, BitPos(TRISB4_bit+0)
;eGlcd.c,196 :: 		GLCD_D6_Direction = 0;
	BCLR	TRISB5_bit, BitPos(TRISB5_bit+0)
;eGlcd.c,197 :: 		GLCD_D7_Direction = 0;
	BCLR	TRISG9_bit, BitPos(TRISG9_bit+0)
;eGlcd.c,199 :: 		GLCD_CS1_Direction = 0;
	BCLR	TRISG8_bit, BitPos(TRISG8_bit+0)
;eGlcd.c,200 :: 		GLCD_CS2_Direction = 0;
	BCLR	TRISG7_bit, BitPos(TRISG7_bit+0)
;eGlcd.c,201 :: 		GLCD_RST_Direction = 0;
	BCLR	TRISG6_bit, BitPos(TRISG6_bit+0)
;eGlcd.c,202 :: 		GLCD_RW_Direction = 0;
	BCLR	TRISC2_bit, BitPos(TRISC2_bit+0)
;eGlcd.c,203 :: 		GLCD_RS_Direction = 0;
	BCLR	TRISC1_bit, BitPos(TRISC1_bit+0)
;eGlcd.c,204 :: 		GLCD_EN_Direction = 0;
	BCLR	TRISG15_bit, BitPos(TRISG15_bit+0)
;eGlcd.c,206 :: 		GLCD_RST = 0;
	BCLR	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,207 :: 		GLCD_RST = 1;
	BSET	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,210 :: 		GLCD_EN = 0;
	BCLR	LATG15_bit, BitPos(LATG15_bit+0)
;eGlcd.c,214 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,215 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,216 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,217 :: 		BCLR _GLCD_CS2, _GLCD_CS2_BIT
	BCLR	LATG, #7
;eGlcd.c,218 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,219 :: 		BCLR _GLCD_D6, _GLCD_D6_BIT
	BCLR	LATB, #5
;eGlcd.c,220 :: 		BSET _GLCD_D5, _GLCD_D5_BIT
	BSET	LATB, #4
;eGlcd.c,221 :: 		BSET _GLCD_D4, _GLCD_D4_BIT
	BSET	LATB, #3
;eGlcd.c,222 :: 		BSET _GLCD_D3, _GLCD_D3_BIT
	BSET	LATB, #2
;eGlcd.c,223 :: 		BSET _GLCD_D2, _GLCD_D2_BIT
	BSET	LATB, #1
;eGlcd.c,224 :: 		BSET _GLCD_D1, _GLCD_D1_BIT
	BSET	LATB, #0
;eGlcd.c,225 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,227 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,231 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,232 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,233 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,234 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,235 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,236 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,237 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,238 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,239 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,240 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,242 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,244 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,245 :: 		BSET _GLCD_CS2, _GLCD_CS2_BIT
	BSET	LATG, #7
;eGlcd.c,247 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,249 :: 		}
L_end__Lcd_Init:
	RETURN
; end of __Lcd_Init

__Lcd_ResetYAddr:

;eGlcd.c,251 :: 		void _Lcd_ResetYAddr(){
;eGlcd.c,255 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,256 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,257 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,258 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,259 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,260 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,261 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,262 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,263 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,264 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,266 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,269 :: 		}
L_end__Lcd_ResetYAddr:
	RETURN
; end of __Lcd_ResetYAddr

__Lcd_SetDataPort:

;eGlcd.c,271 :: 		void _Lcd_SetDataPort(){
;eGlcd.c,274 :: 		LSR W10, #1, W1
	LSR	W10, #1, W1
;eGlcd.c,275 :: 		MOV W1, _GLCD_D1
	MOV	W1, LATB
;eGlcd.c,277 :: 		BTSC W10, #7
	BTSC	W10, #7
;eGlcd.c,278 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,279 :: 		BTSS W10, #7
	BTSS	W10, #7
;eGlcd.c,280 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,282 :: 		BTSC W10, #0
	BTSC	W10, #0
;eGlcd.c,283 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,284 :: 		BTSS W10, #0
	BTSS	W10, #0
;eGlcd.c,285 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,287 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,289 :: 		}
L_end__Lcd_SetDataPort:
	RETURN
; end of __Lcd_SetDataPort

__Lcd_SetPage:

;eGlcd.c,291 :: 		void _Lcd_SetPage(){
;eGlcd.c,294 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,295 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,296 :: 		MOV #0xB8, W1
	MOV	#184, W1
;eGlcd.c,297 :: 		ADD W1, W10, W10
	ADD	W1, W10, W10
;eGlcd.c,298 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,300 :: 		}
L_end__Lcd_SetPage:
	RETURN
; end of __Lcd_SetPage

__Lcd_WriteData:

;eGlcd.c,302 :: 		void _Lcd_WriteData(){
;eGlcd.c,304 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,305 :: 		BSET _GLCD_RS, _GLCD_RS_BIT
	BSET	LATC, #1
;eGlcd.c,306 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,308 :: 		}
L_end__Lcd_WriteData:
	RETURN
; end of __Lcd_WriteData

_Lcd_PrintFrame:

;eGlcd.c,310 :: 		void Lcd_PrintFrame() {
;eGlcd.c,313 :: 		CALL __Lcd_Init
	CALL	__Lcd_Init
;eGlcd.c,315 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,319 :: 		MOV #0, W2                 ; side index
	MOV	#0, W2
;eGlcd.c,320 :: 		MOV _frameBuff, W6      ; buffer cursor address
	MOV	_frameBuff, W6
;eGlcd.c,322 :: 		Side_Loop:
Side_Loop:
;eGlcd.c,323 :: 		MOV #0, W5     ; page index
	MOV	#0, W5
;eGlcd.c,324 :: 		MOV #64, W3    ; store y limit
	MOV	#64, W3
;eGlcd.c,326 :: 		Page_Loop:
Page_Loop:
;eGlcd.c,327 :: 		CALL __Lcd_ResetYAddr
	CALL	__Lcd_ResetYAddr
;eGlcd.c,328 :: 		MOV #0, W4     ; y index
	MOV	#0, W4
;eGlcd.c,329 :: 		MOV W5, W10
	MOV	W5, W10
;eGlcd.c,330 :: 		CALL __Lcd_SetPage
	CALL	__Lcd_SetPage
;eGlcd.c,332 :: 		Y_Loop:
Y_Loop:
;eGlcd.c,333 :: 		MOV.B [W6++], W10
	MOV.B	[W6++], W10
;eGlcd.c,334 :: 		CALL __Lcd_WriteData
	CALL	__Lcd_WriteData
;eGlcd.c,335 :: 		INC W4
	INC	W4
;eGlcd.c,336 :: 		CP W4, W3
	CP	W4, W3
;eGlcd.c,337 :: 		BRA LTU, Y_Loop
	BRA LTU	Y_Loop
;eGlcd.c,339 :: 		INC W5
	INC	W5
;eGlcd.c,340 :: 		CP W5, #8
	CP	W5, #8
;eGlcd.c,341 :: 		BRA LTU, Page_Loop
	BRA LTU	Page_Loop
;eGlcd.c,343 :: 		CALL __Lcd_Change_Side
	CALL	__Lcd_Change_Side
;eGlcd.c,344 :: 		INC W2
	INC	W2
;eGlcd.c,345 :: 		CP W2, #1
	CP	W2, #1
;eGlcd.c,346 :: 		BRA LEU, Side_Loop
	BRA LEU	Side_Loop
;eGlcd.c,350 :: 		_frame_buff_page = 0;
	MOV	#lo_addr(__frame_buff_page), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,351 :: 		_frame_buff_y = 0;
	MOV	#lo_addr(__frame_buff_y), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,352 :: 		_frame_buff_side = 0;
	MOV	#lo_addr(__frame_buff_side), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,353 :: 		}
L_end_Lcd_PrintFrame:
	RETURN
; end of _Lcd_PrintFrame

__frameBuffer_LoadImage:
	LNK	#2

;eGlcd.c,357 :: 		void _frameBuffer_LoadImage(const char *image)
;eGlcd.c,360 :: 		for(i=0; i<16; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L__frameBuffer_LoadImage15:
; i start address is: 6 (W3)
	CP	W3, #16
	BRA LT	L___frameBuffer_LoadImage192
	GOTO	L__frameBuffer_LoadImage16
L___frameBuffer_LoadImage192:
;eGlcd.c,362 :: 		for (j=0; j<64; j++)
; j start address is: 8 (W4)
	CLR	W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
L__frameBuffer_LoadImage18:
; j start address is: 8 (W4)
; i start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L___frameBuffer_LoadImage193
	GOTO	L__frameBuffer_LoadImage19
L___frameBuffer_LoadImage193:
;eGlcd.c,364 :: 		frameBuffer[j+ (i/2)*64 + 512*(i%2)] = image[j + i*64];
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
;eGlcd.c,362 :: 		for (j=0; j<64; j++)
	INC	W4
;eGlcd.c,365 :: 		}
; j end address is: 8 (W4)
	GOTO	L__frameBuffer_LoadImage18
L__frameBuffer_LoadImage19:
;eGlcd.c,360 :: 		for(i=0; i<16; i++)
	INC	W3
;eGlcd.c,366 :: 		}
; i end address is: 6 (W3)
	GOTO	L__frameBuffer_LoadImage15
L__frameBuffer_LoadImage16:
;eGlcd.c,367 :: 		}
L_end__frameBuffer_LoadImage:
	ULNK
	RETURN
; end of __frameBuffer_LoadImage

__frameBuffer_Fill:

;eGlcd.c,369 :: 		void _frameBuffer_Fill(unsigned char byte)
;eGlcd.c,372 :: 		for (i=0; i<1024; i++) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L__frameBuffer_Fill21:
; i start address is: 2 (W1)
	MOV	#1024, W0
	CP	W1, W0
	BRA LT	L___frameBuffer_Fill195
	GOTO	L__frameBuffer_Fill22
L___frameBuffer_Fill195:
;eGlcd.c,373 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,372 :: 		for (i=0; i<1024; i++) {
	INC	W1
;eGlcd.c,374 :: 		}
; i end address is: 2 (W1)
	GOTO	L__frameBuffer_Fill21
L__frameBuffer_Fill22:
;eGlcd.c,375 :: 		}
L_end__frameBuffer_Fill:
	RETURN
; end of __frameBuffer_Fill

__frameBuffer_Write:

;eGlcd.c,378 :: 		void _frameBuffer_Write(unsigned char byte)
;eGlcd.c,380 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,381 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,382 :: 		_frame_buff_y++;
	MOV.B	#1, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ADD.B	W1, [W0], [W0]
;eGlcd.c,383 :: 		}
L_end__frameBuffer_Write:
	RETURN
; end of __frameBuffer_Write

__frameBuffer_Read:

;eGlcd.c,385 :: 		unsigned char _frameBuffer_Read(){
;eGlcd.c,386 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,387 :: 		return frameBuffer[i];
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
;eGlcd.c,388 :: 		}
L_end__frameBuffer_Read:
	RETURN
; end of __frameBuffer_Read

__UART_DebugFrame:

;eGlcd.c,390 :: 		void _UART_DebugFrame(){
;eGlcd.c,391 :: 		int i = 0;
	PUSH	W10
;eGlcd.c,392 :: 		int j=7;
;eGlcd.c,393 :: 		char z = 0;
;eGlcd.c,396 :: 		for (z=0; z<2; z++)
; z start address is: 4 (W2)
	CLR	W2
; z end address is: 4 (W2)
L__UART_DebugFrame24:
; z start address is: 4 (W2)
	CP.B	W2, #2
	BRA LTU	L___UART_DebugFrame199
	GOTO	L__UART_DebugFrame25
L___UART_DebugFrame199:
;eGlcd.c,398 :: 		for (i=0; i<64; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
; z end address is: 4 (W2)
L__UART_DebugFrame27:
; i start address is: 6 (W3)
; z start address is: 4 (W2)
	MOV	#64, W0
	CP	W3, W0
	BRA LT	L___UART_DebugFrame200
	GOTO	L__UART_DebugFrame28
L___UART_DebugFrame200:
;eGlcd.c,400 :: 		for(j=7; j>=0; j--)
; j start address is: 8 (W4)
	MOV	#7, W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
; z end address is: 4 (W2)
L__UART_DebugFrame30:
; j start address is: 8 (W4)
; z start address is: 4 (W2)
; i start address is: 6 (W3)
	CP	W4, #0
	BRA GE	L___UART_DebugFrame201
	GOTO	L__UART_DebugFrame31
L___UART_DebugFrame201:
;eGlcd.c,402 :: 		UART1_Write(frameBuffer[i+j*64+z*512]);
	SL	W4, #6, W0
	ADD	W3, W0, W1
	ZE	W2, W0
	SL	W0, #9, W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	ZE	[W0], W10
	CALL	_UART1_Write
;eGlcd.c,400 :: 		for(j=7; j>=0; j--)
	DEC	W4
;eGlcd.c,403 :: 		}
; j end address is: 8 (W4)
	GOTO	L__UART_DebugFrame30
L__UART_DebugFrame31:
;eGlcd.c,398 :: 		for (i=0; i<64; i++)
	INC	W3
;eGlcd.c,404 :: 		}
; i end address is: 6 (W3)
	GOTO	L__UART_DebugFrame27
L__UART_DebugFrame28:
;eGlcd.c,396 :: 		for (z=0; z<2; z++)
	INC.B	W2
;eGlcd.c,405 :: 		}
; z end address is: 4 (W2)
	GOTO	L__UART_DebugFrame24
L__UART_DebugFrame25:
;eGlcd.c,424 :: 		}
L_end__UART_DebugFrame:
	POP	W10
	RETURN
; end of __UART_DebugFrame

_eGlcd_drawRect:
	LNK	#12

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
	BRA LEU	L__eGlcd_drawRect203
	GOTO	L__eGlcd_drawRect147
L__eGlcd_drawRect203:
	ZE	W11, W1
	ZE	W13, W0
	ADD	W1, W0, W1
	MOV	#63, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect204
	GOTO	L__eGlcd_drawRect146
L__eGlcd_drawRect204:
	GOTO	L_eGlcd_drawRect35
L__eGlcd_drawRect147:
L__eGlcd_drawRect146:
	GOTO	L_end_eGlcd_drawRect
L_eGlcd_drawRect35:
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
	ADD	W2, W1, W2
	ZE	W0, W0
	SL	W0, #3, W1
	ADD	W14, #7, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,458 :: 		startSide1 = x<=63;       ///< Starts on side 1 condition.
	MOV.B	#63, W0
	CP.B	W10, W0
	CLR.B	W2
	BRA GTU	L__eGlcd_drawRect205
	INC.B	W2
L__eGlcd_drawRect205:
; startSide1 start address is: 14 (W7)
	MOV.B	W2, W7
;eGlcd.c,459 :: 		endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#63, W0
; endSide2 start address is: 16 (W8)
	CP	W1, W0
	CLR.B	W8
	BRA LEU	L__eGlcd_drawRect206
	INC.B	W8
L__eGlcd_drawRect206:
;eGlcd.c,460 :: 		startSide = startSide1 ? 0 : 1;
	CP0.B	W2
	BRA NZ	L__eGlcd_drawRect207
	GOTO	L_eGlcd_drawRect36
L__eGlcd_drawRect207:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect37
L_eGlcd_drawRect36:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
L_eGlcd_drawRect37:
; ?FLOC___eGlcd_drawRect?T78 start address is: 0 (W0)
; startSide start address is: 6 (W3)
	MOV.B	W0, W3
; ?FLOC___eGlcd_drawRect?T78 end address is: 0 (W0)
;eGlcd.c,461 :: 		endSide = endSide2 ? 1 : 0;
	CP0.B	W8
	BRA NZ	L__eGlcd_drawRect208
	GOTO	L_eGlcd_drawRect38
L__eGlcd_drawRect208:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect39
L_eGlcd_drawRect38:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
L_eGlcd_drawRect39:
; ?FLOC___eGlcd_drawRect?T79 start address is: 0 (W0)
	MOV.B	W0, [W14+10]
; ?FLOC___eGlcd_drawRect?T79 end address is: 0 (W0)
;eGlcd.c,464 :: 		xOffset = x;            ///< The x offset inside GLCD side to print to.
	MOV.B	W10, [W14+8]
;eGlcd.c,465 :: 		if(x>63) {
	MOV.B	#63, W0
	CP.B	W10, W0
	BRA GTU	L__eGlcd_drawRect209
	GOTO	L_eGlcd_drawRect40
L__eGlcd_drawRect209:
;eGlcd.c,466 :: 		xOffset -= 64;
	MOV.B	[W14+8], W2
	MOV.B	#64, W1
	ADD	W14, #8, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,467 :: 		}
L_eGlcd_drawRect40:
;eGlcd.c,468 :: 		lastX = xOffset+width;
	ADD	W14, #8, W0
	ZE	[W0], W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV.B	W1, [W14+9]
;eGlcd.c,469 :: 		if(lastX > 63)
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA GT	L__eGlcd_drawRect210
	GOTO	L_eGlcd_drawRect41
L__eGlcd_drawRect210:
;eGlcd.c,470 :: 		lastX = 63;
	MOV.B	#63, W0
	MOV.B	W0, [W14+9]
L_eGlcd_drawRect41:
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	W3, [W14+2]
; pageCount end address is: 12 (W6)
; startSide end address is: 6 (W3)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
	MOV.B	W6, W5
	MOV.B	W7, W3
	MOV.B	W8, W2
L_eGlcd_drawRect42:
; endSide2 start address is: 4 (W2)
; startSide1 start address is: 6 (W3)
; pageCount start address is: 10 (W5)
	MOV.B	[W14+2], W1
	ADD	W14, #10, W0
	CP.B	W1, [W0]
	BRA LEU	L__eGlcd_drawRect211
	GOTO	L__eGlcd_drawRect165
L__eGlcd_drawRect211:
	MOV.B	[W14+9], W0
	CP.B	W0, #0
	BRA GT	L__eGlcd_drawRect212
	GOTO	L__eGlcd_drawRect164
L__eGlcd_drawRect212:
L__eGlcd_drawRect144:
;eGlcd.c,476 :: 		_frame_buff_side = k;
	MOV	#lo_addr(__frame_buff_side), W1
	MOV.B	[W14+2], W0
	MOV.B	W0, [W1]
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
	MOV.B	[W14+5], W0
	MOV.B	W0, [W14+0]
; endSide2 end address is: 4 (W2)
; startSide1 end address is: 6 (W3)
; pageCount end address is: 10 (W5)
	MOV.B	W2, W8
	MOV.B	W3, W7
	MOV.B	W5, W4
L_eGlcd_drawRect47:
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
	BRA LTU	L__eGlcd_drawRect213
	GOTO	L__eGlcd_drawRect163
L__eGlcd_drawRect213:
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__eGlcd_drawRect214
	GOTO	L__eGlcd_drawRect162
L__eGlcd_drawRect214:
L__eGlcd_drawRect143:
;eGlcd.c,483 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,484 :: 		_frame_buff_y = xOffset;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+8], W0
	MOV.B	W0, [W1]
;eGlcd.c,489 :: 		if(i==page)   ///< If we are in first page...
	MOV.B	[W14+0], W1
	ADD	W14, #5, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect215
	GOTO	L_eGlcd_drawRect52
L__eGlcd_drawRect215:
;eGlcd.c,491 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect53:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect216
	GOTO	L_eGlcd_drawRect54
L__eGlcd_drawRect216:
;eGlcd.c,493 :: 		byte = ~(0xFF<<pageOffset);
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #3, W1
	COM.B	W0, [W1]
;eGlcd.c,495 :: 		rByte = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,500 :: 		byte&=rByte;
	ADD	W14, #3, W1
	AND.B	W0, [W1], [W1]
;eGlcd.c,502 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect217
	GOTO	L__eGlcd_drawRect149
L__eGlcd_drawRect217:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect218
	INC.B	W0
L__eGlcd_drawRect218:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect148
	GOTO	L__eGlcd_drawRect140
L__eGlcd_drawRect149:
L__eGlcd_drawRect148:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect219
	GOTO	L__eGlcd_drawRect151
L__eGlcd_drawRect219:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect220
	INC.B	W0
L__eGlcd_drawRect220:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect221
	INC.B	W0
L__eGlcd_drawRect221:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect150
	GOTO	L__eGlcd_drawRect140
L__eGlcd_drawRect151:
L__eGlcd_drawRect150:
	GOTO	L_eGlcd_drawRect62
L__eGlcd_drawRect140:
;eGlcd.c,503 :: 		byte2 = 0xFF<<pageOffset;
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+4]
	GOTO	L_eGlcd_drawRect63
L_eGlcd_drawRect62:
;eGlcd.c,505 :: 		byte2 = 1<<pageOffset;
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect63:
;eGlcd.c,506 :: 		byte|= byte2;
	MOV.B	[W14+4], W1
	ADD	W14, #3, W0
	IOR.B	W1, [W0], [W0]
;eGlcd.c,508 :: 		if(j>=62)
	MOV.B	[W14+1], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect222
	GOTO	L_eGlcd_drawRect64
L__eGlcd_drawRect222:
;eGlcd.c,511 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,515 :: 		}
L_eGlcd_drawRect64:
;eGlcd.c,517 :: 		_frame_buff_y = j;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+1], W0
	MOV.B	W0, [W1]
;eGlcd.c,518 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,491 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,523 :: 		}
	GOTO	L_eGlcd_drawRect53
L_eGlcd_drawRect54:
;eGlcd.c,524 :: 		}
	GOTO	L_eGlcd_drawRect65
L_eGlcd_drawRect52:
;eGlcd.c,525 :: 		else if (i == (page+pageCount-1) && pageOverflow)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W0
	SUB	W0, #1, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__eGlcd_drawRect223
	GOTO	L__eGlcd_drawRect157
L__eGlcd_drawRect223:
	ADD	W14, #7, W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_drawRect224
	GOTO	L__eGlcd_drawRect156
L__eGlcd_drawRect224:
L__eGlcd_drawRect139:
;eGlcd.c,527 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect69:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect225
	GOTO	L_eGlcd_drawRect70
L__eGlcd_drawRect225:
;eGlcd.c,529 :: 		byte = (0xFF<<pageOverflow);
	MOV	#255, W1
	ADD	W14, #7, W0
	SE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+3]
;eGlcd.c,531 :: 		rByte = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,536 :: 		byte &= rByte;
	ADD	W14, #3, W2
	ADD	W14, #3, W1
	AND.B	W0, [W2], [W1]
;eGlcd.c,538 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect226
	GOTO	L__eGlcd_drawRect153
L__eGlcd_drawRect226:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect227
	INC.B	W0
L__eGlcd_drawRect227:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect152
	GOTO	L__eGlcd_drawRect136
L__eGlcd_drawRect153:
L__eGlcd_drawRect152:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect228
	GOTO	L__eGlcd_drawRect155
L__eGlcd_drawRect228:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect229
	INC.B	W0
L__eGlcd_drawRect229:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect230
	INC.B	W0
L__eGlcd_drawRect230:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect154
	GOTO	L__eGlcd_drawRect136
L__eGlcd_drawRect155:
L__eGlcd_drawRect154:
	GOTO	L_eGlcd_drawRect78
L__eGlcd_drawRect136:
;eGlcd.c,539 :: 		byte2 = ~(0xFF<<pageOverflow);
	MOV	#255, W1
	ADD	W14, #7, W0
	SE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #4, W1
	COM.B	W0, [W1]
	GOTO	L_eGlcd_drawRect79
L_eGlcd_drawRect78:
;eGlcd.c,541 :: 		byte2 = 1<<(pageOverflow-1);
	ADD	W14, #7, W0
	SE	[W0], W0
	SUB	W0, #1, W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect79:
;eGlcd.c,542 :: 		byte|= byte2;
	MOV.B	[W14+3], W2
	ADD	W14, #4, W1
	ADD	W14, #3, W0
	IOR.B	W2, [W1], [W0]
;eGlcd.c,544 :: 		if(j>=61)
	MOV.B	[W14+1], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect231
	GOTO	L_eGlcd_drawRect80
L__eGlcd_drawRect231:
;eGlcd.c,547 :: 		_frame_buff_page = i;
	MOV	#lo_addr(__frame_buff_page), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;eGlcd.c,551 :: 		}
L_eGlcd_drawRect80:
;eGlcd.c,553 :: 		_frame_buff_y = j;
	MOV	#lo_addr(__frame_buff_y), W1
	MOV.B	[W14+1], W0
	MOV.B	W0, [W1]
;eGlcd.c,554 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,527 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,559 :: 		}
	GOTO	L_eGlcd_drawRect69
L_eGlcd_drawRect70:
;eGlcd.c,560 :: 		}
	GOTO	L_eGlcd_drawRect81
;eGlcd.c,525 :: 		else if (i == (page+pageCount-1) && pageOverflow)
L__eGlcd_drawRect157:
L__eGlcd_drawRect156:
;eGlcd.c,563 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+8], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect82:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect232
	GOTO	L_eGlcd_drawRect83
L__eGlcd_drawRect232:
;eGlcd.c,565 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #8, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect233
	GOTO	L__eGlcd_drawRect159
L__eGlcd_drawRect233:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect234
	INC.B	W0
L__eGlcd_drawRect234:
	ZE	W7, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect158
	GOTO	L__eGlcd_drawRect133
L__eGlcd_drawRect159:
L__eGlcd_drawRect158:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #9, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect235
	GOTO	L__eGlcd_drawRect161
L__eGlcd_drawRect235:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect236
	INC.B	W0
L__eGlcd_drawRect236:
	ZE	W8, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect237
	INC.B	W0
L__eGlcd_drawRect237:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect160
	GOTO	L__eGlcd_drawRect133
L__eGlcd_drawRect161:
L__eGlcd_drawRect160:
	GOTO	L_eGlcd_drawRect91
L__eGlcd_drawRect133:
;eGlcd.c,566 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+3]
	GOTO	L_eGlcd_drawRect92
L_eGlcd_drawRect91:
;eGlcd.c,568 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+3]
L_eGlcd_drawRect92:
;eGlcd.c,570 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,563 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,574 :: 		}
	GOTO	L_eGlcd_drawRect82
L_eGlcd_drawRect83:
;eGlcd.c,575 :: 		}
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect81:
; endSide2 end address is: 16 (W8)
; pageCount start address is: 8 (W4)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect65:
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageCount start address is: 8 (W4)
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,577 :: 		}
	GOTO	L_eGlcd_drawRect47
;eGlcd.c,480 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
L__eGlcd_drawRect163:
L__eGlcd_drawRect162:
;eGlcd.c,578 :: 		lastX=x+width-64;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W2
	MOV.B	#64, W1
	ADD	W14, #9, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,579 :: 		xOffset=0;
	CLR	W0
	MOV.B	W0, [W14+8]
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,580 :: 		}
	MOV.B	W4, W5
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W3
	MOV.B	W8, W2
	GOTO	L_eGlcd_drawRect42
;eGlcd.c,473 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
L__eGlcd_drawRect165:
L__eGlcd_drawRect164:
;eGlcd.c,581 :: 		}
L_end_eGlcd_drawRect:
	POP	W11
	ULNK
	RETURN
; end of _eGlcd_drawRect

_eGlcd_fillPage:

;eGlcd.c,583 :: 		void eGlcd_fillPage(unsigned char page, char color)
;eGlcd.c,585 :: 		int k, i=0;
; i start address is: 2 (W1)
	CLR	W1
;eGlcd.c,586 :: 		char byte = 0;
; byte start address is: 4 (W2)
	CLR	W2
;eGlcd.c,587 :: 		if (color == BLACK)
	CP.B	W11, #1
	BRA Z	L__eGlcd_fillPage239
	GOTO	L__eGlcd_fillPage166
L__eGlcd_fillPage239:
;eGlcd.c,588 :: 		byte = 0xFF;
	MOV.B	#255, W2
; byte end address is: 4 (W2)
	GOTO	L_eGlcd_fillPage93
L__eGlcd_fillPage166:
;eGlcd.c,587 :: 		if (color == BLACK)
;eGlcd.c,588 :: 		byte = 0xFF;
L_eGlcd_fillPage93:
;eGlcd.c,590 :: 		_frame_buff_page = page;
; byte start address is: 4 (W2)
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W10, [W0]
;eGlcd.c,594 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
; k start address is: 6 (W3)
	CLR	W3
; i end address is: 2 (W1)
; byte end address is: 4 (W2)
; k end address is: 6 (W3)
	MOV	W1, W4
L_eGlcd_fillPage94:
; k start address is: 6 (W3)
; byte start address is: 4 (W2)
; i start address is: 8 (W4)
	CP	W3, #1
	BRA LE	L__eGlcd_fillPage240
	GOTO	L_eGlcd_fillPage95
L__eGlcd_fillPage240:
;eGlcd.c,597 :: 		_frame_buff_side = k;
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W3, [W0]
;eGlcd.c,598 :: 		_frame_buff_y = i;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W4, [W0]
; byte end address is: 4 (W2)
; i end address is: 8 (W4)
; k end address is: 6 (W3)
;eGlcd.c,603 :: 		for(; i<64; i++)  {
L_eGlcd_fillPage97:
; i start address is: 8 (W4)
; byte start address is: 4 (W2)
; k start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L__eGlcd_fillPage241
	GOTO	L_eGlcd_fillPage98
L__eGlcd_fillPage241:
;eGlcd.c,605 :: 		_frameBuffer_Write(byte);
	PUSH	W10
	MOV.B	W2, W10
	CALL	__frameBuffer_Write
	POP	W10
;eGlcd.c,603 :: 		for(; i<64; i++)  {
	INC	W4
;eGlcd.c,609 :: 		}
; i end address is: 8 (W4)
	GOTO	L_eGlcd_fillPage97
L_eGlcd_fillPage98:
;eGlcd.c,610 :: 		i = 0;
; i start address is: 8 (W4)
	CLR	W4
;eGlcd.c,594 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
	INC	W3
;eGlcd.c,611 :: 		}
; byte end address is: 4 (W2)
; i end address is: 8 (W4)
; k end address is: 6 (W3)
	GOTO	L_eGlcd_fillPage94
L_eGlcd_fillPage95:
;eGlcd.c,612 :: 		}
L_end_eGlcd_fillPage:
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
	BRA NZ	L__xGlcd_Set_Font243
	GOTO	L_xGlcd_Set_Font100
L__xGlcd_Set_Font243:
	MOV.B	#1, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font100:
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
	BRA LEU	L__xGLCD_Write_Data245
	GOTO	L__xGLCD_Write_Data130
L__xGLCD_Write_Data245:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data246
	GOTO	L__xGLCD_Write_Data129
L__xGLCD_Write_Data246:
	GOTO	L_xGLCD_Write_Data103
L__xGLCD_Write_Data130:
L__xGLCD_Write_Data129:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data103:
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
	BRA NZ	L__xGLCD_Write_Data247
	GOTO	L_xGLCD_Write_Data104
L__xGLCD_Write_Data247:
;eGlcd.c,644 :: 		gData = pData << tmpY;
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,646 :: 		_frame_buff_side = pX/64;
	ZE	W10, W0
	ASR	W0, #6, W1
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W1, [W0]
;eGlcd.c,647 :: 		_frame_buff_y = xx;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
;eGlcd.c,648 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W4, [W0]
;eGlcd.c,649 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,657 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data248
	GOTO	L__xGLCD_Write_Data131
L__xGLCD_Write_Data248:
;eGlcd.c,658 :: 		dataR = dataR & (0xff >> (8 - tmpY));
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
	AND.B	W6, W0, W6
; dataR end address is: 12 (W6)
	GOTO	L_xGLCD_Write_Data105
L__xGLCD_Write_Data131:
;eGlcd.c,657 :: 		if (!xGLCD_Transparency)
;eGlcd.c,658 :: 		dataR = dataR & (0xff >> (8 - tmpY));
L_xGLCD_Write_Data105:
;eGlcd.c,659 :: 		dataR = gData | dataR;
; dataR start address is: 12 (W6)
	ZE	W5, W1
; gData end address is: 10 (W5)
	ZE	W6, W0
; dataR end address is: 12 (W6)
	IOR	W1, W0, W0
;eGlcd.c,662 :: 		_frameBuffer_Write(dataR);
	MOV.B	W0, W10
	CALL	__frameBuffer_Write
;eGlcd.c,668 :: 		tmp++;
	ADD.B	W4, #1, W0
; tmp end address is: 8 (W4)
; tmp start address is: 2 (W1)
	MOV.B	W0, W1
;eGlcd.c,669 :: 		if (tmp > 7) return;
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data249
	GOTO	L_xGLCD_Write_Data106
L__xGLCD_Write_Data249:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 2 (W1)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data106:
;eGlcd.c,671 :: 		_frame_buff_y = xx;
; tmp start address is: 2 (W1)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
; xx end address is: 6 (W3)
;eGlcd.c,672 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W1, [W0]
; tmp end address is: 2 (W1)
;eGlcd.c,673 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
; dataR start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,680 :: 		gData = pData >> (8 - tmpY);
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,681 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data250
	GOTO	L__xGLCD_Write_Data132
L__xGLCD_Write_Data250:
;eGlcd.c,682 :: 		dataR = dataR & (0xff << tmpY);
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 4 (W2)
	AND.B	W4, W0, W2
; dataR end address is: 8 (W4)
; dataR end address is: 4 (W2)
	GOTO	L_xGLCD_Write_Data107
L__xGLCD_Write_Data132:
;eGlcd.c,681 :: 		if (!xGLCD_Transparency)
	MOV.B	W4, W2
;eGlcd.c,682 :: 		dataR = dataR & (0xff << tmpY);
L_xGLCD_Write_Data107:
;eGlcd.c,683 :: 		dataR = gData | dataR;
; dataR start address is: 4 (W2)
	ZE	W3, W1
; gData end address is: 6 (W3)
	ZE	W2, W0
; dataR end address is: 4 (W2)
	IOR	W1, W0, W0
;eGlcd.c,686 :: 		_frameBuffer_Write(dataR);
	MOV.B	W0, W10
	CALL	__frameBuffer_Write
;eGlcd.c,691 :: 		}
	GOTO	L_xGLCD_Write_Data108
L_xGLCD_Write_Data104:
;eGlcd.c,694 :: 		_frame_buff_side = pX/64;
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	ZE	W10, W0
	ASR	W0, #6, W1
	MOV	#lo_addr(__frame_buff_side), W0
	MOV.B	W1, [W0]
;eGlcd.c,695 :: 		_frame_buff_y = xx;
	MOV	#lo_addr(__frame_buff_y), W0
	MOV.B	W3, [W0]
; xx end address is: 6 (W3)
;eGlcd.c,696 :: 		_frame_buff_page = tmp;
	MOV	#lo_addr(__frame_buff_page), W0
	MOV.B	W4, [W0]
; tmp end address is: 8 (W4)
;eGlcd.c,702 :: 		if (xGLCD_Transparency) {
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data251
	GOTO	L_xGLCD_Write_Data109
L__xGLCD_Write_Data251:
;eGlcd.c,704 :: 		dataR = _frameBuffer_Read();
	CALL	__frameBuffer_Read
;eGlcd.c,709 :: 		dataR = pData | dataR;
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eGlcd.c,710 :: 		}
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data110
L_xGLCD_Write_Data109:
;eGlcd.c,712 :: 		dataR = pData;
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
L_xGLCD_Write_Data110:
;eGlcd.c,715 :: 		_frameBuffer_Write(dataR);
; dataR start address is: 0 (W0)
	MOV.B	W0, W10
; dataR end address is: 0 (W0)
	CALL	__frameBuffer_Write
;eGlcd.c,720 :: 		}
L_xGLCD_Write_Data108:
;eGlcd.c,721 :: 		}
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eGlcd.c,723 :: 		unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,728 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
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
; cOffset start address is: 16 (W8)
	ADD	W0, #1, W8
	ADDC	W1, #0, W9
;eGlcd.c,733 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 8 (W4)
	CLR	W4
; CharWidth end address is: 4 (W2)
; cOffset end address is: 16 (W8)
; i end address is: 8 (W4)
	MOV.B	W2, W7
L_xGlcd_Write_Char111:
; i start address is: 8 (W4)
; cOffset start address is: 16 (W8)
; CharWidth start address is: 14 (W7)
	CP.B	W4, W7
	BRA LTU	L__xGlcd_Write_Char253
	GOTO	L_xGlcd_Write_Char112
L__xGlcd_Write_Char253:
;eGlcd.c,734 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 10 (W5)
	CLR	W5
; CharWidth end address is: 14 (W7)
; cOffset end address is: 16 (W8)
; j end address is: 10 (W5)
; i end address is: 8 (W4)
L_xGlcd_Write_Char114:
; j start address is: 10 (W5)
; CharWidth start address is: 14 (W7)
; cOffset start address is: 16 (W8)
; i start address is: 8 (W4)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W5, [W0]
	BRA LTU	L__xGlcd_Write_Char254
	GOTO	L_xGlcd_Write_Char115
L__xGlcd_Write_Char254:
;eGlcd.c,735 :: 		CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
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
;eGlcd.c,736 :: 		switch (color) {
	GOTO	L_xGlcd_Write_Char117
;eGlcd.c,737 :: 		case WHITE:
L_xGlcd_Write_Char119:
;eGlcd.c,738 :: 		CharData = ~(*CurCharData);
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,739 :: 		break;
	GOTO	L_xGlcd_Write_Char118
;eGlcd.c,740 :: 		case BLACK :
L_xGlcd_Write_Char120:
;eGlcd.c,741 :: 		CharData = *CurCharData;
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eGlcd.c,742 :: 		break;
	GOTO	L_xGlcd_Write_Char118
;eGlcd.c,743 :: 		case 2 :
L_xGlcd_Write_Char121:
;eGlcd.c,744 :: 		CharData = ~(*CurCharData);
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,745 :: 		break;
	GOTO	L_xGlcd_Write_Char118
;eGlcd.c,746 :: 		}
L_xGlcd_Write_Char117:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char255
	GOTO	L_xGlcd_Write_Char119
L__xGlcd_Write_Char255:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char256
	GOTO	L_xGlcd_Write_Char120
L__xGlcd_Write_Char256:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char257
	GOTO	L_xGlcd_Write_Char121
L__xGlcd_Write_Char257:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char118:
;eGlcd.c,747 :: 		xGLCD_Write_Data(x + i, y + j * 8, CharData);
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
;eGlcd.c,734 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W5
;eGlcd.c,748 :: 		};
; j end address is: 10 (W5)
	GOTO	L_xGlcd_Write_Char114
L_xGlcd_Write_Char115:
;eGlcd.c,733 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W4
;eGlcd.c,748 :: 		};
; cOffset end address is: 16 (W8)
; i end address is: 8 (W4)
	GOTO	L_xGlcd_Write_Char111
L_xGlcd_Write_Char112:
;eGlcd.c,749 :: 		return CharWidth;
	MOV.B	W7, W0
; CharWidth end address is: 14 (W7)
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
L_xGlcd_Write_Text122:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text260
	GOTO	L_xGlcd_Write_Text123
L__xGlcd_Write_Text260:
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
	GOTO	L_xGlcd_Write_Text122
L_xGlcd_Write_Text123:
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
L_xGlcd_Text_Width125:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width262
	GOTO	L_xGlcd_Text_Width126
L__xGlcd_Text_Width262:
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
	GOTO	L_xGlcd_Text_Width125
L_xGlcd_Text_Width126:
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
