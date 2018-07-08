
_eGlcd_init:

;eGlcd.c,43 :: 		void eGlcd_init() {
;eGlcd.c,49 :: 		Glcd_Init();
	CALL	_Glcd_Init
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
	BRA NZ	L__eGlcd_fill180
	GOTO	L_eGlcd_fill0
L__eGlcd_fill180:
L_eGlcd_fill0:
;eGlcd.c,76 :: 		Glcd_Fill(color);
	CALL	_Glcd_Fill
;eGlcd.c,78 :: 		}
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
;eGlcd.c,87 :: 		xGlcd_Clear_Char(letter, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Clear_Char
;eGlcd.c,88 :: 		}
L_end_eGlcd_clearChar:
	POP	W13
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eGlcd.c,90 :: 		void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
;eGlcd.c,92 :: 		xGlcd_Write_Char(letter, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Char
;eGlcd.c,95 :: 		}
L_eGlcd_writeChar3:
;eGlcd.c,96 :: 		}
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eGlcd.c,98 :: 		void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
;eGlcd.c,99 :: 		eGlcd_clearText(oldText, x, y);
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
;eGlcd.c,100 :: 		eGlcd_writeText(newText, x, y);
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eGlcd.c,101 :: 		}
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eGlcd.c,103 :: 		void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,105 :: 		xGlcd_Clear_Text(text, x, y, WHITE);
	PUSH	W13
	CLR	W13
	CALL	_xGlcd_Clear_Text
;eGlcd.c,111 :: 		}
L_end_eGlcd_clearText:
	POP	W13
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eGlcd.c,113 :: 		void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
;eGlcd.c,115 :: 		xGlcd_Write_Text(text, x, y, BLACK);
	PUSH	W13
	MOV.B	#1, W13
	CALL	_xGlcd_Write_Text
;eGlcd.c,118 :: 		}
L_eGlcd_writeText6:
;eGlcd.c,119 :: 		}
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_loadImage:

;eGlcd.c,121 :: 		void eGlcd_loadImage(const char *image)
;eGlcd.c,126 :: 		Glcd_Image(image);
	PUSH	W11
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, W11
	CALL	_Glcd_Image
;eGlcd.c,128 :: 		}
L_end_eGlcd_loadImage:
	POP	W11
	RETURN
; end of _eGlcd_loadImage

_eGlcd_setupTimer:

;eGlcd.c,130 :: 		void eGlcd_setupTimer(void) {
;eGlcd.c,134 :: 		}
L_end_eGlcd_setupTimer:
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eGlcd.c,136 :: 		void eGlcd_setTimerCoefficient(float coefficient) {
;eGlcd.c,137 :: 		EGLCD_TIMER_COEFFICIENT = coefficient;
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eGlcd.c,138 :: 		}
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eGlcd.c,140 :: 		unsigned int eGlcd_getTextPixelLength(char *text) {
;eGlcd.c,141 :: 		unsigned int textPixelLength = 0, i;
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eGlcd.c,142 :: 		for (i = 0; i < strlen(text); i += 1) {
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength7:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength191
	GOTO	L_eGlcd_getTextPixelLength8
L__eGlcd_getTextPixelLength191:
;eGlcd.c,143 :: 		textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eGlcd.c,142 :: 		for (i = 0; i < strlen(text); i += 1) {
	INC	W6
;eGlcd.c,144 :: 		}
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength7
L_eGlcd_getTextPixelLength8:
;eGlcd.c,145 :: 		return textPixelLength;
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eGlcd.c,146 :: 		}
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

__Lcd_Toggle_Enable:

;eGlcd.c,160 :: 		void _Lcd_Toggle_Enable() {
;eGlcd.c,162 :: 		BSET _GLCD_EN, _GLCD_EN_BIT
	BSET	LATG, #15
;eGlcd.c,163 :: 		REPEAT #90                    ; 3.5us delay
	REPEAT	#90
;eGlcd.c,164 :: 		NOP
	NOP
;eGlcd.c,166 :: 		BCLR _GLCD_EN, _GLCD_EN_BIT
	BCLR	LATG, #15
;eGlcd.c,167 :: 		REPEAT #90
	REPEAT	#90
;eGlcd.c,168 :: 		NOP
	NOP
;eGlcd.c,170 :: 		}
L_end__Lcd_Toggle_Enable:
	RETURN
; end of __Lcd_Toggle_Enable

__Lcd_Change_Side:

;eGlcd.c,172 :: 		void _Lcd_Change_Side(){
;eGlcd.c,177 :: 		BTG _GLCD_CS1, _GLCD_CS1_BIT
	BTG	LATG, #8
;eGlcd.c,178 :: 		BTG _GLCD_CS2, _GLCD_CS2_BIT
	BTG	LATG, #7
;eGlcd.c,181 :: 		}
L_end__Lcd_Change_Side:
	RETURN
; end of __Lcd_Change_Side

__Lcd_Init:

;eGlcd.c,183 :: 		void _Lcd_Init(){
;eGlcd.c,184 :: 		GLCD_D0_Direction = 0;
	BCLR	TRISB8_bit, BitPos(TRISB8_bit+0)
;eGlcd.c,185 :: 		GLCD_D1_Direction = 0;
	BCLR	TRISB0_bit, BitPos(TRISB0_bit+0)
;eGlcd.c,186 :: 		GLCD_D2_Direction = 0;
	BCLR	TRISB1_bit, BitPos(TRISB1_bit+0)
;eGlcd.c,187 :: 		GLCD_D3_Direction = 0;
	BCLR	TRISB2_bit, BitPos(TRISB2_bit+0)
;eGlcd.c,188 :: 		GLCD_D4_Direction = 0;
	BCLR	TRISB3_bit, BitPos(TRISB3_bit+0)
;eGlcd.c,189 :: 		GLCD_D5_Direction = 0;
	BCLR	TRISB4_bit, BitPos(TRISB4_bit+0)
;eGlcd.c,190 :: 		GLCD_D6_Direction = 0;
	BCLR	TRISB5_bit, BitPos(TRISB5_bit+0)
;eGlcd.c,191 :: 		GLCD_D7_Direction = 0;
	BCLR	TRISG9_bit, BitPos(TRISG9_bit+0)
;eGlcd.c,193 :: 		GLCD_CS1_Direction = 0;
	BCLR	TRISG8_bit, BitPos(TRISG8_bit+0)
;eGlcd.c,194 :: 		GLCD_CS2_Direction = 0;
	BCLR	TRISG7_bit, BitPos(TRISG7_bit+0)
;eGlcd.c,195 :: 		GLCD_RST_Direction = 0;
	BCLR	TRISG6_bit, BitPos(TRISG6_bit+0)
;eGlcd.c,196 :: 		GLCD_RW_Direction = 0;
	BCLR	TRISC2_bit, BitPos(TRISC2_bit+0)
;eGlcd.c,197 :: 		GLCD_RS_Direction = 0;
	BCLR	TRISC1_bit, BitPos(TRISC1_bit+0)
;eGlcd.c,198 :: 		GLCD_EN_Direction = 0;
	BCLR	TRISG15_bit, BitPos(TRISG15_bit+0)
;eGlcd.c,200 :: 		GLCD_RST = 0;
	BCLR	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,201 :: 		GLCD_RST = 1;
	BSET	LATG6_bit, BitPos(LATG6_bit+0)
;eGlcd.c,204 :: 		GLCD_EN = 0;
	BCLR	LATG15_bit, BitPos(LATG15_bit+0)
;eGlcd.c,208 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,209 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,210 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,211 :: 		BCLR _GLCD_CS2, _GLCD_CS2_BIT
	BCLR	LATG, #7
;eGlcd.c,212 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,213 :: 		BCLR _GLCD_D6, _GLCD_D6_BIT
	BCLR	LATB, #5
;eGlcd.c,214 :: 		BSET _GLCD_D5, _GLCD_D5_BIT
	BSET	LATB, #4
;eGlcd.c,215 :: 		BSET _GLCD_D4, _GLCD_D4_BIT
	BSET	LATB, #3
;eGlcd.c,216 :: 		BSET _GLCD_D3, _GLCD_D3_BIT
	BSET	LATB, #2
;eGlcd.c,217 :: 		BSET _GLCD_D2, _GLCD_D2_BIT
	BSET	LATB, #1
;eGlcd.c,218 :: 		BSET _GLCD_D1, _GLCD_D1_BIT
	BSET	LATB, #0
;eGlcd.c,219 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,221 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,225 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,226 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,227 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,228 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,229 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,230 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,231 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,232 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,233 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,234 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,236 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,238 :: 		BCLR _GLCD_CS1, _GLCD_CS1_BIT
	BCLR	LATG, #8
;eGlcd.c,239 :: 		BSET _GLCD_CS2, _GLCD_CS2_BIT
	BSET	LATG, #7
;eGlcd.c,241 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,243 :: 		}
L_end__Lcd_Init:
	RETURN
; end of __Lcd_Init

__Lcd_ResetYAddr:

;eGlcd.c,245 :: 		void _Lcd_ResetYAddr(){
;eGlcd.c,249 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,250 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,251 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,252 :: 		BSET _GLCD_D6, _GLCD_D6_BIT
	BSET	LATB, #5
;eGlcd.c,253 :: 		BCLR _GLCD_D5, _GLCD_D5_BIT
	BCLR	LATB, #4
;eGlcd.c,254 :: 		BCLR _GLCD_D4, _GLCD_D4_BIT
	BCLR	LATB, #3
;eGlcd.c,255 :: 		BCLR _GLCD_D3, _GLCD_D3_BIT
	BCLR	LATB, #2
;eGlcd.c,256 :: 		BCLR _GLCD_D2, _GLCD_D2_BIT
	BCLR	LATB, #1
;eGlcd.c,257 :: 		BCLR _GLCD_D1, _GLCD_D1_BIT
	BCLR	LATB, #0
;eGlcd.c,258 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,260 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,263 :: 		}
L_end__Lcd_ResetYAddr:
	RETURN
; end of __Lcd_ResetYAddr

__Lcd_SetDataPort:

;eGlcd.c,265 :: 		void _Lcd_SetDataPort(){
;eGlcd.c,268 :: 		LSR W10, #1, W1
	LSR	W10, #1, W1
;eGlcd.c,269 :: 		MOV W1, _GLCD_D1
	MOV	W1, LATB
;eGlcd.c,271 :: 		BTSC W10, #7
	BTSC	W10, #7
;eGlcd.c,272 :: 		BSET _GLCD_D7, _GLCD_D7_BIT
	BSET	LATG, #9
;eGlcd.c,273 :: 		BTSS W10, #7
	BTSS	W10, #7
;eGlcd.c,274 :: 		BCLR _GLCD_D7, _GLCD_D7_BIT
	BCLR	LATG, #9
;eGlcd.c,276 :: 		BTSC W10, #0
	BTSC	W10, #0
;eGlcd.c,277 :: 		BSET _GLCD_D0, _GLCD_D0_BIT
	BSET	LATB, #8
;eGlcd.c,278 :: 		BTSS W10, #0
	BTSS	W10, #0
;eGlcd.c,279 :: 		BCLR _GLCD_D0, _GLCD_D0_BIT
	BCLR	LATB, #8
;eGlcd.c,281 :: 		CALL __Lcd_Toggle_Enable
	CALL	__Lcd_Toggle_Enable
;eGlcd.c,283 :: 		}
L_end__Lcd_SetDataPort:
	RETURN
; end of __Lcd_SetDataPort

__Lcd_SetPage:

;eGlcd.c,285 :: 		void _Lcd_SetPage(){
;eGlcd.c,288 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,289 :: 		BCLR _GLCD_RS, _GLCD_RS_BIT
	BCLR	LATC, #1
;eGlcd.c,290 :: 		MOV #0xB8, W1
	MOV	#184, W1
;eGlcd.c,291 :: 		ADD W1, W10, W10
	ADD	W1, W10, W10
;eGlcd.c,292 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,294 :: 		}
L_end__Lcd_SetPage:
	RETURN
; end of __Lcd_SetPage

__Lcd_WriteData:

;eGlcd.c,296 :: 		void _Lcd_WriteData(){
;eGlcd.c,298 :: 		BCLR _GLCD_RW, _GLCD_RW_BIT
	BCLR	LATC, #2
;eGlcd.c,299 :: 		BSET _GLCD_RS, _GLCD_RS_BIT
	BSET	LATC, #1
;eGlcd.c,300 :: 		CALL __Lcd_SetDataPort
	CALL	__Lcd_SetDataPort
;eGlcd.c,302 :: 		}
L_end__Lcd_WriteData:
	RETURN
; end of __Lcd_WriteData

_Lcd_PrintFrame:

;eGlcd.c,304 :: 		void Lcd_PrintFrame() {
;eGlcd.c,350 :: 		}
L_end_Lcd_PrintFrame:
	RETURN
; end of _Lcd_PrintFrame

__frameBuffer_LoadImage:
	LNK	#2

;eGlcd.c,354 :: 		void _frameBuffer_LoadImage(const char *image)
;eGlcd.c,357 :: 		for(i=0; i<16; i++)
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L__frameBuffer_LoadImage10:
; i start address is: 6 (W3)
	CP	W3, #16
	BRA LT	L___frameBuffer_LoadImage201
	GOTO	L__frameBuffer_LoadImage11
L___frameBuffer_LoadImage201:
;eGlcd.c,359 :: 		for (j=0; j<64; j++)
; j start address is: 8 (W4)
	CLR	W4
; j end address is: 8 (W4)
; i end address is: 6 (W3)
L__frameBuffer_LoadImage13:
; j start address is: 8 (W4)
; i start address is: 6 (W3)
	MOV	#64, W0
	CP	W4, W0
	BRA LT	L___frameBuffer_LoadImage202
	GOTO	L__frameBuffer_LoadImage14
L___frameBuffer_LoadImage202:
;eGlcd.c,361 :: 		frameBuffer[j+ (i/2)*64 + 512*(i%2)] = image[j + i*64];
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
;eGlcd.c,359 :: 		for (j=0; j<64; j++)
	INC	W4
;eGlcd.c,362 :: 		}
; j end address is: 8 (W4)
	GOTO	L__frameBuffer_LoadImage13
L__frameBuffer_LoadImage14:
;eGlcd.c,357 :: 		for(i=0; i<16; i++)
	INC	W3
;eGlcd.c,363 :: 		}
; i end address is: 6 (W3)
	GOTO	L__frameBuffer_LoadImage10
L__frameBuffer_LoadImage11:
;eGlcd.c,364 :: 		}
L_end__frameBuffer_LoadImage:
	ULNK
	RETURN
; end of __frameBuffer_LoadImage

__frameBuffer_Fill:

;eGlcd.c,366 :: 		void _frameBuffer_Fill(unsigned char byte)
;eGlcd.c,369 :: 		for (i=0; i<1024; i++) {
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L__frameBuffer_Fill16:
; i start address is: 2 (W1)
	MOV	#1024, W0
	CP	W1, W0
	BRA LT	L___frameBuffer_Fill204
	GOTO	L__frameBuffer_Fill17
L___frameBuffer_Fill204:
;eGlcd.c,370 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,369 :: 		for (i=0; i<1024; i++) {
	INC	W1
;eGlcd.c,371 :: 		}
; i end address is: 2 (W1)
	GOTO	L__frameBuffer_Fill16
L__frameBuffer_Fill17:
;eGlcd.c,372 :: 		}
L_end__frameBuffer_Fill:
	RETURN
; end of __frameBuffer_Fill

__frameBuffer_Write:

;eGlcd.c,375 :: 		void _frameBuffer_Write(unsigned char byte)
;eGlcd.c,377 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,378 :: 		frameBuffer[i] = byte;
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	W10, [W0]
;eGlcd.c,379 :: 		_frame_buff_y++;
	MOV.B	#1, W1
	MOV	#lo_addr(__frame_buff_y), W0
	ADD.B	W1, [W0], [W0]
;eGlcd.c,380 :: 		}
L_end__frameBuffer_Write:
	RETURN
; end of __frameBuffer_Write

__frameBuffer_Read:

;eGlcd.c,382 :: 		unsigned char _frameBuffer_Read(){
;eGlcd.c,383 :: 		int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
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
;eGlcd.c,384 :: 		return frameBuffer[i];
	MOV	#lo_addr(_frameBuffer), W0
	ADD	W0, W1, W0
	MOV.B	[W0], W0
;eGlcd.c,385 :: 		}
L_end__frameBuffer_Read:
	RETURN
; end of __frameBuffer_Read

__UART_DebugFrame:

;eGlcd.c,387 :: 		void _UART_DebugFrame(){
;eGlcd.c,388 :: 		int i = 0;
	PUSH	W10
;eGlcd.c,389 :: 		int j=7;
;eGlcd.c,390 :: 		char z = 0;
;eGlcd.c,404 :: 		for (z=0; z<2; z++)
; z start address is: 4 (W2)
	CLR	W2
; z end address is: 4 (W2)
L__UART_DebugFrame19:
; z start address is: 4 (W2)
	CP.B	W2, #2
	BRA LTU	L___UART_DebugFrame208
	GOTO	L__UART_DebugFrame20
L___UART_DebugFrame208:
;eGlcd.c,406 :: 		Glcd_Set_Side(z*64);
	ZE	W2, W0
	SL	W0, #6, W0
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
;eGlcd.c,407 :: 		for (i=0; i<64; i++)
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
; z end address is: 4 (W2)
L__UART_DebugFrame22:
; i start address is: 2 (W1)
; z start address is: 4 (W2)
	MOV	#64, W0
	CP	W1, W0
	BRA LT	L___UART_DebugFrame209
	GOTO	L__UART_DebugFrame23
L___UART_DebugFrame209:
;eGlcd.c,409 :: 		for(j=7; j>=0; j--)
; j start address is: 0 (W0)
	MOV	#7, W0
; j end address is: 0 (W0)
; i end address is: 2 (W1)
; z end address is: 4 (W2)
	MOV	W1, W3
	MOV	W0, W4
L__UART_DebugFrame25:
; j start address is: 8 (W4)
; z start address is: 4 (W2)
; i start address is: 6 (W3)
	CP	W4, #0
	BRA GE	L___UART_DebugFrame210
	GOTO	L__UART_DebugFrame26
L___UART_DebugFrame210:
;eGlcd.c,411 :: 		Glcd_Set_Page(j);
	MOV.B	W4, W10
	CALL	_Glcd_Set_Page
;eGlcd.c,412 :: 		Glcd_Set_X(i);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,413 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,414 :: 		byte =Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,415 :: 		UART1_Write(byte);
	ZE	W0, W10
	CALL	_UART1_Write
;eGlcd.c,409 :: 		for(j=7; j>=0; j--)
	DEC	W4
;eGlcd.c,416 :: 		}
; j end address is: 8 (W4)
	GOTO	L__UART_DebugFrame25
L__UART_DebugFrame26:
;eGlcd.c,407 :: 		for (i=0; i<64; i++)
; i start address is: 2 (W1)
	ADD	W3, #1, W1
; i end address is: 6 (W3)
;eGlcd.c,417 :: 		}
; i end address is: 2 (W1)
	GOTO	L__UART_DebugFrame22
L__UART_DebugFrame23:
;eGlcd.c,404 :: 		for (z=0; z<2; z++)
	INC.B	W2
;eGlcd.c,418 :: 		}
; z end address is: 4 (W2)
	GOTO	L__UART_DebugFrame19
L__UART_DebugFrame20:
;eGlcd.c,421 :: 		}
L_end__UART_DebugFrame:
	POP	W10
	RETURN
; end of __UART_DebugFrame

_eGlcd_drawRect:
	LNK	#10

;eGlcd.c,434 :: 		void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height)
;eGlcd.c,436 :: 		char pageCount = 0;
	PUSH	W11
;eGlcd.c,438 :: 		unsigned char xOffset = 0;
;eGlcd.c,439 :: 		signed char lastX = 0;
;eGlcd.c,443 :: 		char startSide1 = 0, endSide2 = 0;
;eGlcd.c,444 :: 		char startSide = 0, endSide = 0;
;eGlcd.c,448 :: 		if(x+width>127 || y+height>63) return;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#127, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect212
	GOTO	L__eGlcd_drawRect156
L__eGlcd_drawRect212:
	ZE	W11, W1
	ZE	W13, W0
	ADD	W1, W0, W1
	MOV	#63, W0
	CP	W1, W0
	BRA LEU	L__eGlcd_drawRect213
	GOTO	L__eGlcd_drawRect155
L__eGlcd_drawRect213:
	GOTO	L_eGlcd_drawRect30
L__eGlcd_drawRect156:
L__eGlcd_drawRect155:
	GOTO	L_end_eGlcd_drawRect
L_eGlcd_drawRect30:
;eGlcd.c,451 :: 		page = y / 8;           ///< Page index. Integer division, will be a value between 0 and 7.
	ZE	W11, W0
	ASR	W0, #3, W0
	MOV.B	W0, [W14+5]
;eGlcd.c,452 :: 		pageOffset = y % 8;     ///< Row index inside page, increasing downwards.
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	MOV.B	W0, [W14+6]
;eGlcd.c,453 :: 		pageCount = ceil((pageOffset+height)/8.0);  ///< The rect spans at least this number of pages. According to the offset it might fall into another page.
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
;eGlcd.c,454 :: 		pageOverflow = 8 + pageOffset + height - pageCount*8 ;   ///< How many rows it falls onto next page.
	ADD	W14, #6, W1
	ZE	[W1], W1
	ADD	W1, #8, W2
	ZE	W13, W1
	ADD	W2, W1, W1
	ZE	W0, W0
	SL	W0, #3, W0
; pageOverflow start address is: 10 (W5)
	SUB.B	W1, W0, W5
;eGlcd.c,455 :: 		startSide1 = x<=63;       ///< Starts on side 1 condition.
	MOV.B	#63, W0
	CP.B	W10, W0
	CLR.B	W2
	BRA GTU	L__eGlcd_drawRect214
	INC.B	W2
L__eGlcd_drawRect214:
; startSide1 start address is: 6 (W3)
	MOV.B	W2, W3
;eGlcd.c,456 :: 		endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV	#63, W0
; endSide2 start address is: 16 (W8)
	CP	W1, W0
	CLR.B	W8
	BRA LEU	L__eGlcd_drawRect215
	INC.B	W8
L__eGlcd_drawRect215:
;eGlcd.c,457 :: 		startSide = startSide1 ? 0 : 1;
	CP0.B	W2
	BRA NZ	L__eGlcd_drawRect216
	GOTO	L_eGlcd_drawRect31
L__eGlcd_drawRect216:
; ?FLOC___eGlcd_drawRect?T71 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T71 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect32
L_eGlcd_drawRect31:
; ?FLOC___eGlcd_drawRect?T71 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T71 end address is: 0 (W0)
L_eGlcd_drawRect32:
; ?FLOC___eGlcd_drawRect?T71 start address is: 0 (W0)
; startSide start address is: 8 (W4)
	MOV.B	W0, W4
; ?FLOC___eGlcd_drawRect?T71 end address is: 0 (W0)
;eGlcd.c,458 :: 		endSide = endSide2 ? 1 : 0;
	CP0.B	W8
	BRA NZ	L__eGlcd_drawRect217
	GOTO	L_eGlcd_drawRect33
L__eGlcd_drawRect217:
; ?FLOC___eGlcd_drawRect?T72 start address is: 0 (W0)
	MOV.B	#1, W0
; ?FLOC___eGlcd_drawRect?T72 end address is: 0 (W0)
	GOTO	L_eGlcd_drawRect34
L_eGlcd_drawRect33:
; ?FLOC___eGlcd_drawRect?T72 start address is: 0 (W0)
	CLR	W0
; ?FLOC___eGlcd_drawRect?T72 end address is: 0 (W0)
L_eGlcd_drawRect34:
; ?FLOC___eGlcd_drawRect?T72 start address is: 0 (W0)
	MOV.B	W0, [W14+9]
; ?FLOC___eGlcd_drawRect?T72 end address is: 0 (W0)
;eGlcd.c,461 :: 		xOffset = x;            ///< The x offset inside GLCD side to print to.
	MOV.B	W10, [W14+7]
;eGlcd.c,462 :: 		if(x>63) {
	MOV.B	#63, W0
	CP.B	W10, W0
	BRA GTU	L__eGlcd_drawRect218
	GOTO	L_eGlcd_drawRect35
L__eGlcd_drawRect218:
;eGlcd.c,463 :: 		xOffset -= 64;
	MOV.B	[W14+7], W2
	MOV.B	#64, W1
	ADD	W14, #7, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,464 :: 		}
L_eGlcd_drawRect35:
;eGlcd.c,465 :: 		lastX = xOffset+width;
	ADD	W14, #7, W0
	ZE	[W0], W1
	ZE	W12, W0
	ADD	W1, W0, W1
	MOV.B	W1, [W14+8]
;eGlcd.c,466 :: 		if(lastX > 63)
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA GT	L__eGlcd_drawRect219
	GOTO	L_eGlcd_drawRect36
L__eGlcd_drawRect219:
;eGlcd.c,467 :: 		lastX = 63;
	MOV.B	#63, W0
	MOV.B	W0, [W14+8]
L_eGlcd_drawRect36:
;eGlcd.c,470 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	W4, [W14+2]
; startSide end address is: 8 (W4)
; pageCount end address is: 12 (W6)
; startSide1 end address is: 6 (W3)
; endSide2 end address is: 16 (W8)
; pageOverflow end address is: 10 (W5)
	MOV.B	W5, W9
	MOV.B	W3, W2
L_eGlcd_drawRect37:
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 4 (W2)
; pageOverflow start address is: 18 (W9)
; pageCount start address is: 12 (W6)
	MOV.B	[W14+2], W1
	ADD	W14, #9, W0
	CP.B	W1, [W0]
	BRA LEU	L__eGlcd_drawRect220
	GOTO	L__eGlcd_drawRect174
L__eGlcd_drawRect220:
	MOV.B	[W14+8], W0
	CP.B	W0, #0
	BRA GT	L__eGlcd_drawRect221
	GOTO	L__eGlcd_drawRect173
L__eGlcd_drawRect221:
L__eGlcd_drawRect153:
;eGlcd.c,475 :: 		Glcd_Set_Side(k*64);
	ADD	W14, #2, W0
	ZE	[W0], W0
	SL	W0, #6, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
	POP	W10
;eGlcd.c,477 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
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
L_eGlcd_drawRect42:
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
	BRA LTU	L__eGlcd_drawRect222
	GOTO	L__eGlcd_drawRect172
L__eGlcd_drawRect222:
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__eGlcd_drawRect223
	GOTO	L__eGlcd_drawRect171
L__eGlcd_drawRect223:
L__eGlcd_drawRect152:
;eGlcd.c,483 :: 		Glcd_Set_Page(i);
	PUSH	W7
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
;eGlcd.c,484 :: 		Glcd_Set_X(xOffset);
	MOV.B	[W14+7], W10
	CALL	_Glcd_Set_X
	POP	W10
	POP	W7
;eGlcd.c,486 :: 		if(i==page)   ///< If we are in first page...
	MOV.B	[W14+0], W1
	ADD	W14, #5, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect224
	GOTO	L_eGlcd_drawRect47
L__eGlcd_drawRect224:
;eGlcd.c,488 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect48:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect225
	GOTO	L_eGlcd_drawRect49
L__eGlcd_drawRect225:
;eGlcd.c,490 :: 		byte = ~(0xFF<<pageOffset);
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	ADD	W14, #3, W1
	COM.B	W0, [W1]
;eGlcd.c,494 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,495 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,497 :: 		byte&=rByte;
	ADD	W14, #3, W1
	AND.B	W0, [W1], [W1]
;eGlcd.c,499 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect226
	GOTO	L__eGlcd_drawRect158
L__eGlcd_drawRect226:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect227
	INC.B	W0
L__eGlcd_drawRect227:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect157
	GOTO	L__eGlcd_drawRect149
L__eGlcd_drawRect158:
L__eGlcd_drawRect157:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect228
	GOTO	L__eGlcd_drawRect160
L__eGlcd_drawRect228:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect229
	INC.B	W0
L__eGlcd_drawRect229:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect230
	INC.B	W0
L__eGlcd_drawRect230:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect159
	GOTO	L__eGlcd_drawRect149
L__eGlcd_drawRect160:
L__eGlcd_drawRect159:
	GOTO	L_eGlcd_drawRect57
L__eGlcd_drawRect149:
;eGlcd.c,500 :: 		byte2 = 0xFF<<pageOffset;
	MOV	#255, W1
	ADD	W14, #6, W0
	ZE	[W0], W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+4]
	GOTO	L_eGlcd_drawRect58
L_eGlcd_drawRect57:
;eGlcd.c,502 :: 		byte2 = 1<<pageOffset;
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect58:
;eGlcd.c,503 :: 		byte|= byte2;
	MOV.B	[W14+4], W1
	ADD	W14, #3, W0
	IOR.B	W1, [W0], [W0]
;eGlcd.c,505 :: 		if(j>=62)
	MOV.B	[W14+1], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect231
	GOTO	L_eGlcd_drawRect59
L__eGlcd_drawRect231:
;eGlcd.c,510 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
;eGlcd.c,512 :: 		}
L_eGlcd_drawRect59:
;eGlcd.c,517 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,518 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,488 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,520 :: 		}
	GOTO	L_eGlcd_drawRect48
L_eGlcd_drawRect49:
;eGlcd.c,521 :: 		}
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	MOV.B	W6, W8
	GOTO	L_eGlcd_drawRect60
L_eGlcd_drawRect47:
;eGlcd.c,522 :: 		else if (i == (page+pageCount-1) && pageOverflow)
; endSide2 start address is: 14 (W7)
	ADD	W14, #5, W0
	ZE	[W0], W1
	ZE	W4, W0
	ADD	W1, W0, W0
	SUB	W0, #1, W1
	ADD	W14, #0, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__eGlcd_drawRect232
	GOTO	L__eGlcd_drawRect166
L__eGlcd_drawRect232:
	CP0.B	W5
	BRA NZ	L__eGlcd_drawRect233
	GOTO	L__eGlcd_drawRect165
L__eGlcd_drawRect233:
L__eGlcd_drawRect148:
;eGlcd.c,524 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W6
L_eGlcd_drawRect64:
; endSide2 start address is: 12 (W6)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect234
	GOTO	L_eGlcd_drawRect65
L__eGlcd_drawRect234:
;eGlcd.c,526 :: 		byte = (0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	MOV.B	W0, [W14+3]
;eGlcd.c,530 :: 		Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,531 :: 		rByte = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,533 :: 		byte &= rByte;
	ADD	W14, #3, W2
	ADD	W14, #3, W1
	AND.B	W0, [W2], [W1]
;eGlcd.c,535 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect235
	GOTO	L__eGlcd_drawRect162
L__eGlcd_drawRect235:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect236
	INC.B	W0
L__eGlcd_drawRect236:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect161
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect162:
L__eGlcd_drawRect161:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect237
	GOTO	L__eGlcd_drawRect164
L__eGlcd_drawRect237:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect238
	INC.B	W0
L__eGlcd_drawRect238:
	ZE	W6, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect239
	INC.B	W0
L__eGlcd_drawRect239:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect163
	GOTO	L__eGlcd_drawRect145
L__eGlcd_drawRect164:
L__eGlcd_drawRect163:
	GOTO	L_eGlcd_drawRect73
L__eGlcd_drawRect145:
;eGlcd.c,536 :: 		byte2 = ~(0xFF<<pageOverflow);
	MOV	#255, W1
	SE	W5, W0
	SL	W1, W0, W0
	ADD	W14, #4, W1
	COM.B	W0, [W1]
	GOTO	L_eGlcd_drawRect74
L_eGlcd_drawRect73:
;eGlcd.c,538 :: 		byte2 = 1<<(pageOverflow-1);
	SE	W5, W0
	SUB	W0, #1, W1
	MOV	#1, W0
	SL	W0, W1, W0
	MOV.B	W0, [W14+4]
L_eGlcd_drawRect74:
;eGlcd.c,539 :: 		byte|= byte2;
	MOV.B	[W14+3], W2
	ADD	W14, #4, W1
	ADD	W14, #3, W0
	IOR.B	W2, [W1], [W0]
;eGlcd.c,541 :: 		if(j>=61)
	MOV.B	[W14+1], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA GEU	L__eGlcd_drawRect240
	GOTO	L_eGlcd_drawRect75
L__eGlcd_drawRect240:
;eGlcd.c,546 :: 		Glcd_Set_Page(i);
	PUSH	W10
	MOV.B	[W14+0], W10
	CALL	_Glcd_Set_Page
	POP	W10
;eGlcd.c,548 :: 		}
L_eGlcd_drawRect75:
;eGlcd.c,553 :: 		Glcd_Set_X(j);
	PUSH	W10
	MOV.B	[W14+1], W10
	CALL	_Glcd_Set_X
;eGlcd.c,554 :: 		Glcd_Write_Data(byte);
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,524 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,556 :: 		}
	GOTO	L_eGlcd_drawRect64
L_eGlcd_drawRect65:
;eGlcd.c,557 :: 		}
	MOV.B	W6, W8
; endSide2 end address is: 12 (W6)
	MOV.B	W3, W7
	GOTO	L_eGlcd_drawRect76
;eGlcd.c,522 :: 		else if (i == (page+pageCount-1) && pageOverflow)
L__eGlcd_drawRect166:
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect165:
;eGlcd.c,560 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+7], W0
	MOV.B	W0, [W14+1]
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W7, W2
L_eGlcd_drawRect77:
; endSide2 start address is: 4 (W2)
; startSide1 start address is: 6 (W3)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA LE	L__eGlcd_drawRect241
	GOTO	L_eGlcd_drawRect78
L__eGlcd_drawRect241:
;eGlcd.c,562 :: 		if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
	MOV.B	[W14+1], W1
	ADD	W14, #7, W0
	CP.B	W1, [W0]
	BRA Z	L__eGlcd_drawRect242
	GOTO	L__eGlcd_drawRect168
L__eGlcd_drawRect242:
	MOV.B	[W14+2], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect243
	INC.B	W0
L__eGlcd_drawRect243:
	ZE	W3, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	BTSC	W0, #0
	GOTO	L__eGlcd_drawRect167
	GOTO	L__eGlcd_drawRect142
L__eGlcd_drawRect168:
L__eGlcd_drawRect167:
	ADD	W14, #1, W0
	ZE	[W0], W1
	ADD	W14, #8, W0
	SE	[W0], W0
	CP	W1, W0
	BRA Z	L__eGlcd_drawRect244
	GOTO	L__eGlcd_drawRect170
L__eGlcd_drawRect244:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect245
	INC.B	W0
L__eGlcd_drawRect245:
	ZE	W2, W1
	ZE	W0, W0
	XOR	W1, W0, W0
	CP0	W0
	CLR.B	W0
	BRA NZ	L__eGlcd_drawRect246
	INC.B	W0
L__eGlcd_drawRect246:
	BTSS	W0, #0
	GOTO	L__eGlcd_drawRect169
	GOTO	L__eGlcd_drawRect142
L__eGlcd_drawRect170:
L__eGlcd_drawRect169:
	GOTO	L_eGlcd_drawRect86
L__eGlcd_drawRect142:
;eGlcd.c,563 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+3]
	GOTO	L_eGlcd_drawRect87
L_eGlcd_drawRect86:
;eGlcd.c,565 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+3]
L_eGlcd_drawRect87:
;eGlcd.c,569 :: 		Glcd_Write_Data(byte);
	PUSH	W10
	MOV.B	[W14+3], W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,560 :: 		for (j=xOffset; j <= lastX; j++)
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,571 :: 		}
	GOTO	L_eGlcd_drawRect77
L_eGlcd_drawRect78:
;eGlcd.c,572 :: 		}
	MOV.B	W2, W8
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W3, W7
L_eGlcd_drawRect76:
; endSide2 end address is: 4 (W2)
; pageCount start address is: 8 (W4)
; pageOverflow start address is: 10 (W5)
; startSide1 start address is: 14 (W7)
; endSide2 start address is: 16 (W8)
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
L_eGlcd_drawRect60:
;eGlcd.c,477 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
; endSide2 start address is: 16 (W8)
; startSide1 start address is: 14 (W7)
; pageOverflow start address is: 10 (W5)
; pageCount start address is: 8 (W4)
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,574 :: 		}
	MOV.B	W7, W3
; endSide2 end address is: 16 (W8)
; startSide1 end address is: 14 (W7)
	MOV.B	W8, W7
	GOTO	L_eGlcd_drawRect42
;eGlcd.c,477 :: 		for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
L__eGlcd_drawRect172:
; startSide1 start address is: 6 (W3)
; endSide2 start address is: 14 (W7)
L__eGlcd_drawRect171:
;eGlcd.c,575 :: 		lastX=x+width-64;
	ZE	W10, W1
	ZE	W12, W0
	ADD	W1, W0, W2
	MOV.B	#64, W1
	ADD	W14, #8, W0
	SUB.B	W2, W1, [W0]
;eGlcd.c,576 :: 		xOffset=0;
	CLR	W0
	MOV.B	W0, [W14+7]
;eGlcd.c,470 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;eGlcd.c,577 :: 		}
	MOV.B	W4, W6
; endSide2 end address is: 14 (W7)
; startSide1 end address is: 6 (W3)
; pageOverflow end address is: 10 (W5)
; pageCount end address is: 8 (W4)
	MOV.B	W5, W9
	MOV.B	W3, W2
	MOV.B	W7, W8
	GOTO	L_eGlcd_drawRect37
;eGlcd.c,470 :: 		for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
L__eGlcd_drawRect174:
L__eGlcd_drawRect173:
;eGlcd.c,578 :: 		}
L_end_eGlcd_drawRect:
	POP	W11
	ULNK
	RETURN
; end of _eGlcd_drawRect

_eGlcd_fillPage:

;eGlcd.c,580 :: 		void eGlcd_fillPage(unsigned char page, char color)
;eGlcd.c,582 :: 		int k, i=0;
; i start address is: 4 (W2)
	CLR	W2
;eGlcd.c,583 :: 		char byte = 0;
; byte start address is: 6 (W3)
	CLR	W3
;eGlcd.c,584 :: 		if (color == BLACK)
	CP.B	W11, #1
	BRA Z	L__eGlcd_fillPage248
	GOTO	L__eGlcd_fillPage175
L__eGlcd_fillPage248:
; byte end address is: 6 (W3)
;eGlcd.c,585 :: 		byte = 0xFF;
; byte start address is: 0 (W0)
	MOV.B	#255, W0
; byte end address is: 0 (W0)
	MOV.B	W0, W3
	GOTO	L_eGlcd_fillPage88
L__eGlcd_fillPage175:
;eGlcd.c,584 :: 		if (color == BLACK)
;eGlcd.c,585 :: 		byte = 0xFF;
L_eGlcd_fillPage88:
;eGlcd.c,589 :: 		Glcd_Set_Side(0);
; byte start address is: 6 (W3)
	PUSH	W10
	CLR	W10
	CALL	_Glcd_Set_Side
	POP	W10
;eGlcd.c,590 :: 		Glcd_Set_Page(page);
	CALL	_Glcd_Set_Page
;eGlcd.c,592 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
; k start address is: 0 (W0)
	CLR	W0
; i end address is: 4 (W2)
; k end address is: 0 (W0)
; byte end address is: 6 (W3)
	MOV	W2, W4
	MOV	W0, W2
L_eGlcd_fillPage89:
; k start address is: 4 (W2)
; byte start address is: 6 (W3)
; i start address is: 8 (W4)
	CP	W2, #1
	BRA LE	L__eGlcd_fillPage249
	GOTO	L_eGlcd_fillPage90
L__eGlcd_fillPage249:
;eGlcd.c,598 :: 		Glcd_Set_Side(k*64);
	SL	W2, #6, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Glcd_Set_Side
;eGlcd.c,599 :: 		Glcd_Set_X(i);
	MOV.B	W4, W10
	CALL	_Glcd_Set_X
; byte end address is: 6 (W3)
; i end address is: 8 (W4)
; k end address is: 4 (W2)
	POP	W10
	MOV.B	W3, W1
	MOV	W4, W3
;eGlcd.c,601 :: 		for(; i<64; i++)  {
L_eGlcd_fillPage92:
; i start address is: 6 (W3)
; byte start address is: 2 (W1)
; k start address is: 4 (W2)
	MOV	#64, W0
	CP	W3, W0
	BRA LT	L__eGlcd_fillPage250
	GOTO	L_eGlcd_fillPage93
L__eGlcd_fillPage250:
;eGlcd.c,605 :: 		Glcd_Write_Data(byte);
	PUSH	W10
	MOV.B	W1, W10
	CALL	_Glcd_Write_Data
	POP	W10
;eGlcd.c,601 :: 		for(; i<64; i++)  {
	INC	W3
;eGlcd.c,607 :: 		}
; i end address is: 6 (W3)
	GOTO	L_eGlcd_fillPage92
L_eGlcd_fillPage93:
;eGlcd.c,608 :: 		i = 0;
; i start address is: 8 (W4)
	CLR	W4
;eGlcd.c,592 :: 		for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
	INC	W2
;eGlcd.c,609 :: 		}
; byte end address is: 2 (W1)
; i end address is: 8 (W4)
; k end address is: 4 (W2)
	MOV.B	W1, W3
	GOTO	L_eGlcd_fillPage89
L_eGlcd_fillPage90:
;eGlcd.c,610 :: 		}
L_end_eGlcd_fillPage:
	RETURN
; end of _eGlcd_fillPage

_xGlcd_Set_Font:

;eGlcd.c,621 :: 		unsigned short font_height, unsigned int font_offset) {
;eGlcd.c,622 :: 		xGlcdSelFont = ptrFontTbl;
	MOV	W10, eGlcd_xGlcdSelFont
;eGlcd.c,623 :: 		xGlcdSelFontWidth = font_width;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	MOV.B	W11, [W0]
;eGlcd.c,624 :: 		xGlcdSelFontHeight = font_height;
	MOV	#lo_addr(eGlcd_xGlcdSelFontHeight), W0
	MOV.B	W12, [W0]
;eGlcd.c,625 :: 		xGlcdSelFontOffset = font_offset;
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	MOV.B	W13, [W0]
;eGlcd.c,626 :: 		xGLCD_Transparency = FALSE;  //Transparency of Text is set to False !!!
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W1
	CLR	W0
	MOV.B	W0, [W1]
;eGlcd.c,628 :: 		xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
	ZE	W12, W0
	ASR	W0, #3, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	MOV.B	W1, [W0]
;eGlcd.c,629 :: 		if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
	ZE	W12, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP0	W0
	BRA NZ	L__xGlcd_Set_Font252
	GOTO	L_xGlcd_Set_Font95
L__xGlcd_Set_Font252:
	MOV.B	#1, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font95:
;eGlcd.c,630 :: 		}
L_end_xGlcd_Set_Font:
	RETURN
; end of _xGlcd_Set_Font

_xGLCD_Write_Data:

;eGlcd.c,633 :: 		void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
;eGlcd.c,636 :: 		if ((pX > 127) || (pY > 63)) return;
	PUSH	W10
	MOV.B	#127, W0
	CP.B	W10, W0
	BRA LEU	L__xGLCD_Write_Data254
	GOTO	L__xGLCD_Write_Data139
L__xGLCD_Write_Data254:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data255
	GOTO	L__xGLCD_Write_Data138
L__xGLCD_Write_Data255:
	GOTO	L_xGLCD_Write_Data98
L__xGLCD_Write_Data139:
L__xGLCD_Write_Data138:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data98:
;eGlcd.c,637 :: 		xx = pX % 64;
	ZE	W10, W0
	MOV	#64, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; xx start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,638 :: 		tmp = pY / 8;
	ZE	W11, W0
	ASR	W0, #3, W0
; tmp start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,639 :: 		tmpY = pY % 8;
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; tmpY start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,640 :: 		if (tmpY) {
	CP0.B	W0
	BRA NZ	L__xGLCD_Write_Data256
	GOTO	L_xGLCD_Write_Data99
L__xGLCD_Write_Data256:
;eGlcd.c,642 :: 		gData = pData << tmpY;
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,649 :: 		Glcd_Set_Side(pX);
	CALL	_Glcd_Set_Side
;eGlcd.c,650 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,651 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
	CALL	_Glcd_Set_Page
;eGlcd.c,652 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,653 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,655 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data257
	GOTO	L__xGLCD_Write_Data140
L__xGLCD_Write_Data257:
;eGlcd.c,656 :: 		dataR = dataR & (0xff >> (8 - tmpY));
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
; dataR start address is: 0 (W0)
	AND.B	W6, W0, W0
; dataR end address is: 12 (W6)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data100
L__xGLCD_Write_Data140:
;eGlcd.c,655 :: 		if (!xGLCD_Transparency)
	MOV.B	W6, W0
;eGlcd.c,656 :: 		dataR = dataR & (0xff >> (8 - tmpY));
L_xGLCD_Write_Data100:
;eGlcd.c,657 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 12 (W6)
	IOR.B	W5, W0, W6
; gData end address is: 10 (W5)
; dataR end address is: 0 (W0)
;eGlcd.c,662 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,663 :: 		Glcd_Write_Data(dataR);
	MOV.B	W6, W10
; dataR end address is: 12 (W6)
	CALL	_Glcd_Write_Data
;eGlcd.c,666 :: 		tmp++;
	ADD.B	W4, #1, W0
	MOV.B	W0, W4
;eGlcd.c,667 :: 		if (tmp > 7) return;
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data258
	GOTO	L_xGLCD_Write_Data101
L__xGLCD_Write_Data258:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 8 (W4)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data101:
;eGlcd.c,673 :: 		Glcd_Set_X(xx);
; tmp start address is: 8 (W4)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,674 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eGlcd.c,675 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,676 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
; dataR start address is: 10 (W5)
	MOV.B	W0, W5
;eGlcd.c,678 :: 		gData = pData >> (8 - tmpY);
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 8 (W4)
	MOV.B	W0, W4
;eGlcd.c,679 :: 		if (!xGLCD_Transparency)
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data259
	GOTO	L__xGLCD_Write_Data141
L__xGLCD_Write_Data259:
;eGlcd.c,680 :: 		dataR = dataR & (0xff << tmpY);
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 0 (W0)
	AND.B	W5, W0, W0
; dataR end address is: 10 (W5)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data102
L__xGLCD_Write_Data141:
;eGlcd.c,679 :: 		if (!xGLCD_Transparency)
	MOV.B	W5, W0
;eGlcd.c,680 :: 		dataR = dataR & (0xff << tmpY);
L_xGLCD_Write_Data102:
;eGlcd.c,681 :: 		dataR = gData | dataR;
; dataR start address is: 0 (W0)
; dataR start address is: 4 (W2)
	IOR.B	W4, W0, W2
; gData end address is: 8 (W4)
; dataR end address is: 0 (W0)
;eGlcd.c,686 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
;eGlcd.c,687 :: 		Glcd_Write_Data(dataR);
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,689 :: 		}
	GOTO	L_xGLCD_Write_Data103
L_xGLCD_Write_Data99:
;eGlcd.c,696 :: 		Glcd_Set_Side(pX);
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	CALL	_Glcd_Set_Side
;eGlcd.c,697 :: 		Glcd_Set_X(xx);
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
;eGlcd.c,698 :: 		Glcd_Set_Page(tmp);
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eGlcd.c,700 :: 		if (xGLCD_Transparency) {
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data260
	GOTO	L_xGLCD_Write_Data104
L__xGLCD_Write_Data260:
;eGlcd.c,704 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,705 :: 		dataR = Glcd_Read_Data();
	CALL	_Glcd_Read_Data
;eGlcd.c,707 :: 		dataR = pData | dataR;
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eGlcd.c,708 :: 		}
	MOV.B	W0, W2
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data105
L_xGLCD_Write_Data104:
;eGlcd.c,710 :: 		dataR = pData;
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
	MOV.B	W0, W2
L_xGLCD_Write_Data105:
;eGlcd.c,715 :: 		Glcd_Set_X(xx);
; dataR start address is: 4 (W2)
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
;eGlcd.c,716 :: 		Glcd_Write_Data(dataR);
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eGlcd.c,718 :: 		}
L_xGLCD_Write_Data103:
;eGlcd.c,719 :: 		}
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eGlcd.c,721 :: 		unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,726 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,727 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,728 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W3
;eGlcd.c,729 :: 		CharWidth = *CurCharData;  // retrieves first byte in the char, which stores its width
	MOV	#___Lib_System_DefaultPage, W2
	MOV	W2, 52
	MOV.B	[W3], W2
; CharWidth start address is: 4 (W2)
;eGlcd.c,730 :: 		cOffset++;
; cOffset start address is: 10 (W5)
	ADD	W0, #1, W5
	ADDC	W1, #0, W6
;eGlcd.c,731 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 14 (W7)
	CLR	W7
; CharWidth end address is: 4 (W2)
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	MOV.B	W2, W4
L_xGlcd_Write_Char106:
; i start address is: 14 (W7)
; cOffset start address is: 10 (W5)
; CharWidth start address is: 8 (W4)
	CP.B	W7, W4
	BRA LTU	L__xGlcd_Write_Char262
	GOTO	L_xGlcd_Write_Char107
L__xGlcd_Write_Char262:
;eGlcd.c,732 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 16 (W8)
	CLR	W8
; CharWidth end address is: 8 (W4)
; cOffset end address is: 10 (W5)
; j end address is: 16 (W8)
; i end address is: 14 (W7)
L_xGlcd_Write_Char109:
; j start address is: 16 (W8)
; CharWidth start address is: 8 (W4)
; cOffset start address is: 10 (W5)
; i start address is: 14 (W7)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W8, [W0]
	BRA LTU	L__xGlcd_Write_Char263
	GOTO	L_xGlcd_Write_Char110
L__xGlcd_Write_Char263:
;eGlcd.c,733 :: 		CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
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
;eGlcd.c,734 :: 		switch (color) {
	GOTO	L_xGlcd_Write_Char112
;eGlcd.c,735 :: 		case WHITE:
L_xGlcd_Write_Char114:
;eGlcd.c,736 :: 		CharData = ~(*CurCharData);
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,737 :: 		break;
	GOTO	L_xGlcd_Write_Char113
;eGlcd.c,738 :: 		case BLACK :
L_xGlcd_Write_Char115:
;eGlcd.c,739 :: 		CharData = *CurCharData;
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eGlcd.c,740 :: 		break;
	GOTO	L_xGlcd_Write_Char113
;eGlcd.c,741 :: 		case 2 :
L_xGlcd_Write_Char116:
;eGlcd.c,742 :: 		CharData = ~(*CurCharData);
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eGlcd.c,743 :: 		break;
	GOTO	L_xGlcd_Write_Char113
;eGlcd.c,744 :: 		}
L_xGlcd_Write_Char112:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char264
	GOTO	L_xGlcd_Write_Char114
L__xGlcd_Write_Char264:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char265
	GOTO	L_xGlcd_Write_Char115
L__xGlcd_Write_Char265:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char266
	GOTO	L_xGlcd_Write_Char116
L__xGlcd_Write_Char266:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char113:
;eGlcd.c,745 :: 		xGLCD_Write_Data(x + i, y + j * 8, CharData);
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
;eGlcd.c,732 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W8
;eGlcd.c,746 :: 		};
; j end address is: 16 (W8)
	GOTO	L_xGlcd_Write_Char109
L_xGlcd_Write_Char110:
;eGlcd.c,731 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W7
;eGlcd.c,746 :: 		};
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	GOTO	L_xGlcd_Write_Char106
L_xGlcd_Write_Char107:
;eGlcd.c,747 :: 		return CharWidth;
	MOV.B	W4, W0
; CharWidth end address is: 8 (W4)
;eGlcd.c,748 :: 		}
L_end_xGlcd_Write_Char:
	ULNK
	RETURN
; end of _xGlcd_Write_Char

_xGlcd_Clear_Char:
	LNK	#2

;eGlcd.c,750 :: 		unsigned short xGlcd_Clear_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,756 :: 		switch (color)
	GOTO	L_xGlcd_Clear_Char117
;eGlcd.c,758 :: 		case WHITE:
L_xGlcd_Clear_Char119:
;eGlcd.c,759 :: 		byte = 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;eGlcd.c,760 :: 		break;
	GOTO	L_xGlcd_Clear_Char118
;eGlcd.c,761 :: 		case BLACK:
L_xGlcd_Clear_Char120:
;eGlcd.c,762 :: 		byte = 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
;eGlcd.c,763 :: 		break;
	GOTO	L_xGlcd_Clear_Char118
;eGlcd.c,764 :: 		default:
L_xGlcd_Clear_Char121:
;eGlcd.c,765 :: 		break;
	GOTO	L_xGlcd_Clear_Char118
;eGlcd.c,766 :: 		}
L_xGlcd_Clear_Char117:
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Clear_Char268
	GOTO	L_xGlcd_Clear_Char119
L__xGlcd_Clear_Char268:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Clear_Char269
	GOTO	L_xGlcd_Clear_Char120
L__xGlcd_Clear_Char269:
	GOTO	L_xGlcd_Clear_Char121
L_xGlcd_Clear_Char118:
;eGlcd.c,768 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,769 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,770 :: 		CurCharData = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,771 :: 		CharWidth = *CurCharData;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
; CharWidth start address is: 6 (W3)
	MOV.B	W0, W3
;eGlcd.c,772 :: 		for (i = 0; i < CharWidth; i++)
; i start address is: 0 (W0)
	CLR	W0
; i end address is: 0 (W0)
; CharWidth end address is: 6 (W3)
	MOV.B	W0, W4
L_xGlcd_Clear_Char122:
; i start address is: 8 (W4)
; CharWidth start address is: 6 (W3)
	CP.B	W4, W3
	BRA LTU	L__xGlcd_Clear_Char270
	GOTO	L_xGlcd_Clear_Char123
L__xGlcd_Clear_Char270:
;eGlcd.c,773 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
; j start address is: 10 (W5)
	CLR	W5
; CharWidth end address is: 6 (W3)
; j end address is: 10 (W5)
; i end address is: 8 (W4)
L_xGlcd_Clear_Char125:
; j start address is: 10 (W5)
; CharWidth start address is: 6 (W3)
; i start address is: 8 (W4)
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	CP.B	W5, [W0]
	BRA LTU	L__xGlcd_Clear_Char271
	GOTO	L_xGlcd_Clear_Char126
L__xGlcd_Clear_Char271:
;eGlcd.c,774 :: 		xGLCD_Write_Data(x + i, y + j * 8, byte);
	ZE	W5, W0
	SL	W0, #3, W1
	ZE	W12, W0
	ADD	W0, W1, W2
	ZE	W11, W1
	ZE	W4, W0
	ADD	W1, W0, W0
	PUSH	W4
	PUSH	W3
	PUSH	W5
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W14+0], W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_xGLCD_Write_Data
	POP.D	W10
	POP	W12
	POP	W5
	POP	W3
	POP	W4
;eGlcd.c,773 :: 		for (j = 0; j < xGlcdSelFontNbRows; j++) {
	INC.B	W5
;eGlcd.c,775 :: 		};
; j end address is: 10 (W5)
	GOTO	L_xGlcd_Clear_Char125
L_xGlcd_Clear_Char126:
;eGlcd.c,772 :: 		for (i = 0; i < CharWidth; i++)
	INC.B	W4
;eGlcd.c,775 :: 		};
; i end address is: 8 (W4)
	GOTO	L_xGlcd_Clear_Char122
L_xGlcd_Clear_Char123:
;eGlcd.c,776 :: 		return CharWidth;
	MOV.B	W3, W0
; CharWidth end address is: 6 (W3)
;eGlcd.c,777 :: 		}
L_end_xGlcd_Clear_Char:
	ULNK
	RETURN
; end of _xGlcd_Clear_Char

_xGlcd_Char_Width:

;eGlcd.c,779 :: 		unsigned short xGlcd_Char_Width(unsigned short ch) {
;eGlcd.c,782 :: 		cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
	MOV	#lo_addr(eGlcd_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eGlcd.c,783 :: 		cOffset = cOffset * (ch - xGlcdSelFontOffset);
	ZE	W10, W1
	MOV	#lo_addr(eGlcd_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eGlcd.c,784 :: 		CurCharDt = xGlcdSelFont + cOffset;
	MOV	#lo_addr(eGlcd_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eGlcd.c,785 :: 		return *CurCharDt;
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
;eGlcd.c,786 :: 		}
L_end_xGlcd_Char_Width:
	RETURN
; end of _xGlcd_Char_Width

_xGlcd_Write_Text:

;eGlcd.c,788 :: 		void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,791 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,792 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,793 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,794 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Write_Text128:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text274
	GOTO	L_xGlcd_Write_Text129
L__xGlcd_Write_Text274:
;eGlcd.c,795 :: 		posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1; //add 1 blank column
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
;eGlcd.c,796 :: 		curChar++;
	INC	W4
;eGlcd.c,794 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,797 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Write_Text128
L_xGlcd_Write_Text129:
;eGlcd.c,798 :: 		}
L_end_xGlcd_Write_Text:
	RETURN
; end of _xGlcd_Write_Text

_xGlcd_Clear_Text:

;eGlcd.c,800 :: 		void xGlcd_Clear_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
;eGlcd.c,803 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eGlcd.c,804 :: 		posX = x;
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eGlcd.c,805 :: 		curChar = text;
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eGlcd.c,806 :: 		for (i = 0; i < l; i++) {
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Clear_Text131:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Clear_Text276
	GOTO	L_xGlcd_Clear_Text132
L__xGlcd_Clear_Text276:
;eGlcd.c,807 :: 		posX = posX + xGlcd_Clear_Char(*curChar, posX, y, color) + 1; //add 1 blank column
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
;eGlcd.c,808 :: 		curChar++;
	INC	W4
;eGlcd.c,806 :: 		for (i = 0; i < l; i++) {
	INC.B	W3
;eGlcd.c,809 :: 		}
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Clear_Text131
L_xGlcd_Clear_Text132:
;eGlcd.c,810 :: 		}
L_end_xGlcd_Clear_Text:
	RETURN
; end of _xGlcd_Clear_Text

_xGlcd_Text_Width:

;eGlcd.c,812 :: 		unsigned short xGlcd_Text_Width(char *text) {
;eGlcd.c,814 :: 		l = strlen(text);
	CALL	_strlen
; l start address is: 12 (W6)
	MOV.B	W0, W6
;eGlcd.c,815 :: 		w = 0;
; w start address is: 16 (W8)
	CLR	W8
;eGlcd.c,816 :: 		for (i = 0; i < l; i++)
; i start address is: 14 (W7)
	CLR	W7
; w end address is: 16 (W8)
; l end address is: 12 (W6)
; i end address is: 14 (W7)
L_xGlcd_Text_Width134:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width278
	GOTO	L_xGlcd_Text_Width135
L__xGlcd_Text_Width278:
;eGlcd.c,817 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
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
;eGlcd.c,816 :: 		for (i = 0; i < l; i++)
	INC.B	W7
;eGlcd.c,817 :: 		w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
; l end address is: 12 (W6)
; w end address is: 0 (W0)
; i end address is: 14 (W7)
	MOV.B	W0, W8
	GOTO	L_xGlcd_Text_Width134
L_xGlcd_Text_Width135:
;eGlcd.c,818 :: 		return w;
; w start address is: 16 (W8)
	MOV.B	W8, W0
; w end address is: 16 (W8)
;eGlcd.c,819 :: 		}
L_end_xGlcd_Text_Width:
	RETURN
; end of _xGlcd_Text_Width

_xGLCD_Set_Transparency:

;eGlcd.c,821 :: 		void xGLCD_Set_Transparency(char active) {
;eGlcd.c,822 :: 		xGLCD_Transparency = active;
	MOV	#lo_addr(eGlcd_xGLCD_Transparency), W0
	MOV.B	W10, [W0]
;eGlcd.c,823 :: 		}
L_end_xGLCD_Set_Transparency:
	RETURN
; end of _xGLCD_Set_Transparency

eGlcd____?ag:

L_end_eGlcd___?ag:
	RETURN
; end of eGlcd____?ag
