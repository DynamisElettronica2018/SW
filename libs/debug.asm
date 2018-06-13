
_Debug_UART_Init:

;debug.c,12 :: 		void Debug_UART_Init()
;debug.c,14 :: 		UART2_Init(9600);
	PUSH	W10
	PUSH	W11
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART2_Init
;debug.c,15 :: 		delay_ms(100);
	MOV	#11, W8
	MOV	#11309, W7
L_Debug_UART_Init0:
	DEC	W7
	BRA NZ	L_Debug_UART_Init0
	DEC	W8
	BRA NZ	L_Debug_UART_Init0
;debug.c,16 :: 		}
L_end_Debug_UART_Init:
	POP	W11
	POP	W10
	RETURN
; end of _Debug_UART_Init

_Debug_Timer4_Init:

;debug.c,18 :: 		void Debug_Timer4_Init(){
;debug.c,19 :: 		setTimer(TIMER4_DEVICE, 0.001);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#3, W10
	CALL	_setTimer
;debug.c,20 :: 		}
L_end_Debug_Timer4_Init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Debug_Timer4_Init

_Debug_UART_Write:

;debug.c,22 :: 		void Debug_UART_Write(char* text){
;debug.c,23 :: 		UART2_Write_Text(text);
	CALL	_UART2_Write_Text
;debug.c,24 :: 		}
L_end_Debug_UART_Write:
	RETURN
; end of _Debug_UART_Write

_printf:

;debug.c,26 :: 		void printf(char* string) {
;debug.c,27 :: 		delay_ms(500);
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#51, W8
	MOV	#56549, W7
L_printf2:
	DEC	W7
	BRA NZ	L_printf2
	DEC	W8
	BRA NZ	L_printf2
;debug.c,28 :: 		eGlcd_setFont(DD_Dashboard_Font) ;
	PUSH	W10
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(debug_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;debug.c,29 :: 		eGlcd_drawRect(0, 43, 127, 20);
	MOV.B	#20, W13
	MOV.B	#127, W12
	MOV.B	#43, W11
	CLR	W10
	CALL	_eGlcd_drawRect
	POP	W10
;debug.c,30 :: 		eGlcd(eGlcd_writeText(string, 0, 45));
	MOV.B	#45, W12
	CLR	W11
	CALL	_eGlcd_writeText
;debug.c,31 :: 		delay_ms(500);
	MOV	#51, W8
	MOV	#56549, W7
L_printf4:
	DEC	W7
	BRA NZ	L_printf4
	DEC	W8
	BRA NZ	L_printf4
;debug.c,32 :: 		}
L_end_printf:
	POP	W13
	POP	W12
	POP	W11
	RETURN
; end of _printf

_initTimer32:

;debug.c,35 :: 		void initTimer32(){
;debug.c,36 :: 		PR2 = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PR2
;debug.c,37 :: 		PR3 = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, PR3
;debug.c,38 :: 		T2CONbits.T32 = 1;
	BSET	T2CONbits, #3
;debug.c,39 :: 		T2CONbits.TCS = 0;
	BCLR	T2CONbits, #1
;debug.c,40 :: 		T2CONbits.TGATE = 0;
	BCLR	T2CONbits, #6
;debug.c,41 :: 		T2CONbits.TCKPS = 2;
	MOV.B	#32, W0
	MOV.B	W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W1, [W0]
;debug.c,46 :: 		}
L_end_initTimer32:
	RETURN
; end of _initTimer32

_resetTimer32:

;debug.c,48 :: 		void resetTimer32()
;debug.c,50 :: 		T2CONbits.TON = 0;
	BCLR	T2CONbits, #15
;debug.c,51 :: 		TMR3HLD = 0;
	CLR	TMR3HLD
;debug.c,52 :: 		TMR2 = 0;
	CLR	TMR2
;debug.c,53 :: 		T2CONbits.TON = 1;
	BSET	T2CONbits, #15
;debug.c,54 :: 		}
L_end_resetTimer32:
	RETURN
; end of _resetTimer32

_getExecTime:

;debug.c,57 :: 		double getExecTime()
;debug.c,59 :: 		unsigned long a=0;
;debug.c,60 :: 		unsigned int b=0;
;debug.c,61 :: 		double c = 0;
;debug.c,62 :: 		b = TMR2;
; b start address is: 8 (W4)
	MOV	TMR2, W4
;debug.c,63 :: 		a = TMR3HLD;
; a start address is: 0 (W0)
	MOV	TMR3HLD, WREG
	CLR	W1
;debug.c,64 :: 		a = a<<16;
	MOV	W0, W3
	CLR	W2
; a end address is: 0 (W0)
;debug.c,65 :: 		a += b;
	MOV	W4, W0
	CLR	W1
; b end address is: 8 (W4)
	ADD	W2, W0, W0
	ADDC	W3, W1, W1
;debug.c,66 :: 		c = a*3.2e-6;
	CALL	__Long2Float
	MOV	#49045, W2
	MOV	#13910, W3
	CALL	__Mul_FP
;debug.c,67 :: 		return c;
;debug.c,68 :: 		}
L_end_getExecTime:
	RETURN
; end of _getExecTime

_stopTimer32:

;debug.c,70 :: 		void stopTimer32()
;debug.c,72 :: 		T2CONbits.TON = 0;
	BCLR	T2CONbits, #15
;debug.c,73 :: 		}
L_end_stopTimer32:
	RETURN
; end of _stopTimer32

_startTimer32:

;debug.c,75 :: 		void startTimer32()
;debug.c,77 :: 		T2CONbits.TON = 1;
	BSET	T2CONbits, #15
;debug.c,78 :: 		}
L_end_startTimer32:
	RETURN
; end of _startTimer32
