
_setAllPinAsDigital:

;dsPIC.c,10 :: 		void setAllPinAsDigital(void) {
;dsPIC.c,11 :: 		ADPCFG = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;dsPIC.c,12 :: 		}
L_end_setAllPinAsDigital:
	RETURN
; end of _setAllPinAsDigital

_setInterruptPriority:

;dsPIC.c,14 :: 		void setInterruptPriority(unsigned char device, unsigned char priority) {
;dsPIC.c,15 :: 		switch (device) {
	GOTO	L_setInterruptPriority0
;dsPIC.c,16 :: 		case INT0_DEVICE:
L_setInterruptPriority2:
;dsPIC.c,17 :: 		INT0_PRIORITY = priority;
	MOV.B	W11, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IPC0bits), W0
	MOV.B	W1, [W0]
;dsPIC.c,18 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,19 :: 		case INT1_DEVICE:
L_setInterruptPriority3:
;dsPIC.c,20 :: 		INT1_PRIORITY = priority;
	MOV.B	W11, W1
	MOV	#lo_addr(IPC4bits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IPC4bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IPC4bits), W0
	MOV.B	W1, [W0]
;dsPIC.c,21 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,22 :: 		case INT2_DEVICE:
L_setInterruptPriority4:
;dsPIC.c,23 :: 		INT2_PRIORITY = priority;
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#12, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC5bits), W0
	XOR	W1, [W0], W1
	MOV	#28672, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC5bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC5bits
;dsPIC.c,24 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,25 :: 		case INT3_DEVICE:
L_setInterruptPriority5:
;dsPIC.c,26 :: 		INT3_PRIORITY = priority;
	MOV.B	W11, W1
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IPC9bits), W0
	MOV.B	W1, [W0]
;dsPIC.c,27 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,28 :: 		case INT4_DEVICE:
L_setInterruptPriority6:
;dsPIC.c,29 :: 		INT4_PRIORITY = priority;
	MOV.B	W11, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#112, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(IPC9bits), W0
	MOV.B	W3, [W0]
;dsPIC.c,30 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,31 :: 		case CN_DEVICE:
L_setInterruptPriority7:
;dsPIC.c,32 :: 		CN_PRIORITY = priority;
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#12, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC3bits), W0
	XOR	W1, [W0], W1
	MOV	#28672, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC3bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC3bits
;dsPIC.c,33 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,34 :: 		case TIMER1_DEVICE:
L_setInterruptPriority8:
;dsPIC.c,35 :: 		TIMER1_PRIORITY = priority;
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#12, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR	W1, [W0], W1
	MOV	#28672, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC0bits
;dsPIC.c,36 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,37 :: 		case TIMER2_DEVICE:
L_setInterruptPriority9:
;dsPIC.c,38 :: 		TIMER2_PRIORITY = priority;
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#8, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC1bits), W0
	XOR	W1, [W0], W1
	MOV	#1792, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC1bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC1bits
;dsPIC.c,39 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,40 :: 		case TIMER4_DEVICE:
L_setInterruptPriority10:
;dsPIC.c,41 :: 		TIMER4_PRIORITY = priority;
	MOV.B	W11, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(IPC5bits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#112, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(IPC5bits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(IPC5bits), W0
	MOV.B	W3, [W0]
;dsPIC.c,42 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,43 :: 		default:
L_setInterruptPriority11:
;dsPIC.c,44 :: 		break;
	GOTO	L_setInterruptPriority1
;dsPIC.c,45 :: 		}
L_setInterruptPriority0:
	CP.B	W10, #4
	BRA NZ	L__setInterruptPriority82
	GOTO	L_setInterruptPriority2
L__setInterruptPriority82:
	CP.B	W10, #5
	BRA NZ	L__setInterruptPriority83
	GOTO	L_setInterruptPriority3
L__setInterruptPriority83:
	CP.B	W10, #6
	BRA NZ	L__setInterruptPriority84
	GOTO	L_setInterruptPriority4
L__setInterruptPriority84:
	CP.B	W10, #7
	BRA NZ	L__setInterruptPriority85
	GOTO	L_setInterruptPriority5
L__setInterruptPriority85:
	CP.B	W10, #8
	BRA NZ	L__setInterruptPriority86
	GOTO	L_setInterruptPriority6
L__setInterruptPriority86:
	CP.B	W10, #9
	BRA NZ	L__setInterruptPriority87
	GOTO	L_setInterruptPriority7
L__setInterruptPriority87:
	CP.B	W10, #1
	BRA NZ	L__setInterruptPriority88
	GOTO	L_setInterruptPriority8
L__setInterruptPriority88:
	CP.B	W10, #2
	BRA NZ	L__setInterruptPriority89
	GOTO	L_setInterruptPriority9
L__setInterruptPriority89:
	CP.B	W10, #3
	BRA NZ	L__setInterruptPriority90
	GOTO	L_setInterruptPriority10
L__setInterruptPriority90:
	GOTO	L_setInterruptPriority11
L_setInterruptPriority1:
;dsPIC.c,46 :: 		}
L_end_setInterruptPriority:
	RETURN
; end of _setInterruptPriority

_setExternalInterrupt:

;dsPIC.c,48 :: 		void setExternalInterrupt(unsigned char device, char edge) {
;dsPIC.c,49 :: 		setInterruptPriority(device, MEDIUM_PRIORITY);
	PUSH	W11
	MOV.B	#4, W11
	CALL	_setInterruptPriority
	POP	W11
;dsPIC.c,50 :: 		switch (device) {
	GOTO	L_setExternalInterrupt12
;dsPIC.c,51 :: 		case INT0_DEVICE:
L_setExternalInterrupt14:
;dsPIC.c,52 :: 		INT0_TRIGGER_EDGE = edge;
	BTSS	W11, #0
	BCLR	INTCON2, #0
	BTSC	W11, #0
	BSET	INTCON2, #0
;dsPIC.c,53 :: 		INT0_OCCURRED = FALSE;
	BCLR	IFS0, #0
;dsPIC.c,54 :: 		INT0_ENABLE = TRUE;
	BSET	IEC0, #0
;dsPIC.c,55 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,56 :: 		case INT1_DEVICE:
L_setExternalInterrupt15:
;dsPIC.c,57 :: 		INT1_TRIGGER_EDGE = edge;
	BTSS	W11, #0
	BCLR	INTCON2, #1
	BTSC	W11, #0
	BSET	INTCON2, #1
;dsPIC.c,58 :: 		INT1_OCCURRED = FALSE;
	BCLR	IFS1, #0
;dsPIC.c,59 :: 		INT1_ENABLE = TRUE;
	BSET	IEC1, #0
;dsPIC.c,60 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,61 :: 		case INT2_DEVICE:
L_setExternalInterrupt16:
;dsPIC.c,62 :: 		INT2_TRIGGER_EDGE = edge;
	BTSS	W11, #0
	BCLR	INTCON2, #2
	BTSC	W11, #0
	BSET	INTCON2, #2
;dsPIC.c,63 :: 		INT2_OCCURRED = FALSE;
	BCLR	IFS1, #7
;dsPIC.c,64 :: 		INT2_ENABLE = TRUE;
	BSET	IEC1, #7
;dsPIC.c,65 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,66 :: 		case INT3_DEVICE:
L_setExternalInterrupt17:
;dsPIC.c,67 :: 		INT3_TRIGGER_EDGE = edge;
	BTSS	W11, #0
	BCLR	INTCON2, #3
	BTSC	W11, #0
	BSET	INTCON2, #3
;dsPIC.c,68 :: 		INT3_OCCURRED = FALSE;
	BCLR	IFS2, #4
;dsPIC.c,69 :: 		INT3_ENABLE = TRUE;
	BSET	IEC2, #4
;dsPIC.c,70 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,71 :: 		case INT4_DEVICE:
L_setExternalInterrupt18:
;dsPIC.c,72 :: 		INT4_TRIGGER_EDGE = edge;
	BTSS	W11, #0
	BCLR	INTCON2, #4
	BTSC	W11, #0
	BSET	INTCON2, #4
;dsPIC.c,73 :: 		INT4_OCCURRED = FALSE;
	BCLR	IFS2, #5
;dsPIC.c,74 :: 		INT4_ENABLE = TRUE;
	BSET	IEC2, #5
;dsPIC.c,75 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,76 :: 		case CN_DEVICE:
L_setExternalInterrupt19:
;dsPIC.c,77 :: 		CN_OCCURRED = FALSE;
	BCLR	IFS0, #15
;dsPIC.c,78 :: 		CN_ENABLE = TRUE;
	BSET	IEC0, #15
;dsPIC.c,79 :: 		CN14_ENABLE = TRUE;
	BSET	CNEN1, #14
;dsPIC.c,80 :: 		CN15_ENABLE = TRUE;
	BSET	CNEN1, #15
;dsPIC.c,81 :: 		default:
L_setExternalInterrupt20:
;dsPIC.c,82 :: 		break;
	GOTO	L_setExternalInterrupt13
;dsPIC.c,83 :: 		}
L_setExternalInterrupt12:
	CP.B	W10, #4
	BRA NZ	L__setExternalInterrupt92
	GOTO	L_setExternalInterrupt14
L__setExternalInterrupt92:
	CP.B	W10, #5
	BRA NZ	L__setExternalInterrupt93
	GOTO	L_setExternalInterrupt15
L__setExternalInterrupt93:
	CP.B	W10, #6
	BRA NZ	L__setExternalInterrupt94
	GOTO	L_setExternalInterrupt16
L__setExternalInterrupt94:
	CP.B	W10, #7
	BRA NZ	L__setExternalInterrupt95
	GOTO	L_setExternalInterrupt17
L__setExternalInterrupt95:
	CP.B	W10, #8
	BRA NZ	L__setExternalInterrupt96
	GOTO	L_setExternalInterrupt18
L__setExternalInterrupt96:
	CP.B	W10, #9
	BRA NZ	L__setExternalInterrupt97
	GOTO	L_setExternalInterrupt19
L__setExternalInterrupt97:
	GOTO	L_setExternalInterrupt20
L_setExternalInterrupt13:
;dsPIC.c,84 :: 		}
L_end_setExternalInterrupt:
	RETURN
; end of _setExternalInterrupt

_switchExternalInterruptEdge:

;dsPIC.c,86 :: 		void switchExternalInterruptEdge(unsigned char device) {
;dsPIC.c,87 :: 		switch (device) {
	GOTO	L_switchExternalInterruptEdge21
;dsPIC.c,88 :: 		case INT0_DEVICE:
L_switchExternalInterruptEdge23:
;dsPIC.c,89 :: 		if (INT0_TRIGGER_EDGE == NEGATIVE_EDGE) {
	BTSS	INTCON2, #0
	GOTO	L_switchExternalInterruptEdge24
;dsPIC.c,90 :: 		INT0_TRIGGER_EDGE = POSITIVE_EDGE;
	BCLR	INTCON2, #0
;dsPIC.c,91 :: 		} else {
	GOTO	L_switchExternalInterruptEdge25
L_switchExternalInterruptEdge24:
;dsPIC.c,92 :: 		INT0_TRIGGER_EDGE = NEGATIVE_EDGE;
	BSET	INTCON2, #0
;dsPIC.c,93 :: 		}
L_switchExternalInterruptEdge25:
;dsPIC.c,94 :: 		break;
	GOTO	L_switchExternalInterruptEdge22
;dsPIC.c,95 :: 		case INT1_DEVICE:
L_switchExternalInterruptEdge26:
;dsPIC.c,96 :: 		if (INT1_TRIGGER_EDGE == NEGATIVE_EDGE) {
	BTSS	INTCON2, #1
	GOTO	L_switchExternalInterruptEdge27
;dsPIC.c,97 :: 		INT1_TRIGGER_EDGE = POSITIVE_EDGE;
	BCLR	INTCON2, #1
;dsPIC.c,98 :: 		} else {
	GOTO	L_switchExternalInterruptEdge28
L_switchExternalInterruptEdge27:
;dsPIC.c,99 :: 		INT1_TRIGGER_EDGE = NEGATIVE_EDGE;
	BSET	INTCON2, #1
;dsPIC.c,100 :: 		}
L_switchExternalInterruptEdge28:
;dsPIC.c,101 :: 		break;
	GOTO	L_switchExternalInterruptEdge22
;dsPIC.c,102 :: 		case INT2_DEVICE:
L_switchExternalInterruptEdge29:
;dsPIC.c,103 :: 		if (INT2_TRIGGER_EDGE == NEGATIVE_EDGE) {
	BTSS	INTCON2, #2
	GOTO	L_switchExternalInterruptEdge30
;dsPIC.c,104 :: 		INT2_TRIGGER_EDGE = POSITIVE_EDGE;
	BCLR	INTCON2, #2
;dsPIC.c,105 :: 		} else {
	GOTO	L_switchExternalInterruptEdge31
L_switchExternalInterruptEdge30:
;dsPIC.c,106 :: 		INT2_TRIGGER_EDGE = NEGATIVE_EDGE;
	BSET	INTCON2, #2
;dsPIC.c,107 :: 		}
L_switchExternalInterruptEdge31:
;dsPIC.c,108 :: 		break;
	GOTO	L_switchExternalInterruptEdge22
;dsPIC.c,109 :: 		case INT3_DEVICE:
L_switchExternalInterruptEdge32:
;dsPIC.c,110 :: 		if (INT3_TRIGGER_EDGE == NEGATIVE_EDGE) {
	BTSS	INTCON2, #3
	GOTO	L_switchExternalInterruptEdge33
;dsPIC.c,111 :: 		INT3_TRIGGER_EDGE = POSITIVE_EDGE;
	BCLR	INTCON2, #3
;dsPIC.c,112 :: 		} else {
	GOTO	L_switchExternalInterruptEdge34
L_switchExternalInterruptEdge33:
;dsPIC.c,113 :: 		INT3_TRIGGER_EDGE = NEGATIVE_EDGE;
	BSET	INTCON2, #3
;dsPIC.c,114 :: 		}
L_switchExternalInterruptEdge34:
;dsPIC.c,115 :: 		break;
	GOTO	L_switchExternalInterruptEdge22
;dsPIC.c,116 :: 		case INT4_DEVICE:
L_switchExternalInterruptEdge35:
;dsPIC.c,117 :: 		if (INT4_TRIGGER_EDGE == NEGATIVE_EDGE) {
	BTSS	INTCON2, #4
	GOTO	L_switchExternalInterruptEdge36
;dsPIC.c,118 :: 		INT4_TRIGGER_EDGE = POSITIVE_EDGE;
	BCLR	INTCON2, #4
;dsPIC.c,119 :: 		} else {
	GOTO	L_switchExternalInterruptEdge37
L_switchExternalInterruptEdge36:
;dsPIC.c,120 :: 		INT4_TRIGGER_EDGE = NEGATIVE_EDGE;
	BSET	INTCON2, #4
;dsPIC.c,121 :: 		}
L_switchExternalInterruptEdge37:
;dsPIC.c,122 :: 		default:
L_switchExternalInterruptEdge38:
;dsPIC.c,123 :: 		break;
	GOTO	L_switchExternalInterruptEdge22
;dsPIC.c,124 :: 		}
L_switchExternalInterruptEdge21:
	CP.B	W10, #4
	BRA NZ	L__switchExternalInterruptEdge99
	GOTO	L_switchExternalInterruptEdge23
L__switchExternalInterruptEdge99:
	CP.B	W10, #5
	BRA NZ	L__switchExternalInterruptEdge100
	GOTO	L_switchExternalInterruptEdge26
L__switchExternalInterruptEdge100:
	CP.B	W10, #6
	BRA NZ	L__switchExternalInterruptEdge101
	GOTO	L_switchExternalInterruptEdge29
L__switchExternalInterruptEdge101:
	CP.B	W10, #7
	BRA NZ	L__switchExternalInterruptEdge102
	GOTO	L_switchExternalInterruptEdge32
L__switchExternalInterruptEdge102:
	CP.B	W10, #8
	BRA NZ	L__switchExternalInterruptEdge103
	GOTO	L_switchExternalInterruptEdge35
L__switchExternalInterruptEdge103:
	GOTO	L_switchExternalInterruptEdge38
L_switchExternalInterruptEdge22:
;dsPIC.c,125 :: 		}
L_end_switchExternalInterruptEdge:
	RETURN
; end of _switchExternalInterruptEdge

_getExternalInterruptEdge:

;dsPIC.c,127 :: 		char getExternalInterruptEdge(unsigned char device) {
;dsPIC.c,128 :: 		switch (device) {
	GOTO	L_getExternalInterruptEdge39
;dsPIC.c,129 :: 		case INT0_DEVICE:
L_getExternalInterruptEdge41:
;dsPIC.c,130 :: 		return INT0_TRIGGER_EDGE;
	CLR.B	W0
	BTSC	INTCON2, #0
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,131 :: 		case INT1_DEVICE:
L_getExternalInterruptEdge42:
;dsPIC.c,132 :: 		return INT1_TRIGGER_EDGE;
	CLR.B	W0
	BTSC	INTCON2, #1
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,133 :: 		case INT2_DEVICE:
L_getExternalInterruptEdge43:
;dsPIC.c,134 :: 		return INT2_TRIGGER_EDGE;
	CLR.B	W0
	BTSC	INTCON2, #2
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,135 :: 		case INT3_DEVICE:
L_getExternalInterruptEdge44:
;dsPIC.c,136 :: 		return INT3_TRIGGER_EDGE;
	CLR.B	W0
	BTSC	INTCON2, #3
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,137 :: 		case INT4_DEVICE:
L_getExternalInterruptEdge45:
;dsPIC.c,138 :: 		return INT4_TRIGGER_EDGE;
	CLR.B	W0
	BTSC	INTCON2, #4
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,139 :: 		default:
L_getExternalInterruptEdge46:
;dsPIC.c,140 :: 		return 0;
	CLR	W0
	GOTO	L_end_getExternalInterruptEdge
;dsPIC.c,141 :: 		}
L_getExternalInterruptEdge39:
	CP.B	W10, #4
	BRA NZ	L__getExternalInterruptEdge105
	GOTO	L_getExternalInterruptEdge41
L__getExternalInterruptEdge105:
	CP.B	W10, #5
	BRA NZ	L__getExternalInterruptEdge106
	GOTO	L_getExternalInterruptEdge42
L__getExternalInterruptEdge106:
	CP.B	W10, #6
	BRA NZ	L__getExternalInterruptEdge107
	GOTO	L_getExternalInterruptEdge43
L__getExternalInterruptEdge107:
	CP.B	W10, #7
	BRA NZ	L__getExternalInterruptEdge108
	GOTO	L_getExternalInterruptEdge44
L__getExternalInterruptEdge108:
	CP.B	W10, #8
	BRA NZ	L__getExternalInterruptEdge109
	GOTO	L_getExternalInterruptEdge45
L__getExternalInterruptEdge109:
	GOTO	L_getExternalInterruptEdge46
;dsPIC.c,142 :: 		}
L_end_getExternalInterruptEdge:
	RETURN
; end of _getExternalInterruptEdge

_clearExternalInterrupt:

;dsPIC.c,144 :: 		void clearExternalInterrupt(unsigned char device) {
;dsPIC.c,145 :: 		switch (device) {
	GOTO	L_clearExternalInterrupt47
;dsPIC.c,146 :: 		case INT0_DEVICE:
L_clearExternalInterrupt49:
;dsPIC.c,147 :: 		INT0_OCCURRED = FALSE;
	BCLR	IFS0, #0
;dsPIC.c,148 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,149 :: 		case INT1_DEVICE:
L_clearExternalInterrupt50:
;dsPIC.c,150 :: 		INT1_OCCURRED = FALSE;
	BCLR	IFS1, #0
;dsPIC.c,151 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,152 :: 		case INT2_DEVICE:
L_clearExternalInterrupt51:
;dsPIC.c,153 :: 		INT2_OCCURRED = FALSE;
	BCLR	IFS1, #7
;dsPIC.c,154 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,155 :: 		case INT3_DEVICE:
L_clearExternalInterrupt52:
;dsPIC.c,156 :: 		INT3_OCCURRED = FALSE;
	BCLR	IFS2, #4
;dsPIC.c,157 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,158 :: 		case INT4_DEVICE:
L_clearExternalInterrupt53:
;dsPIC.c,159 :: 		INT4_OCCURRED = FALSE;
	BCLR	IFS2, #5
;dsPIC.c,160 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,161 :: 		case CN_DEVICE:
L_clearExternalInterrupt54:
;dsPIC.c,162 :: 		CN_OCCURRED = FALSE;
	BCLR	IFS0, #15
;dsPIC.c,163 :: 		default:
L_clearExternalInterrupt55:
;dsPIC.c,164 :: 		break;
	GOTO	L_clearExternalInterrupt48
;dsPIC.c,165 :: 		}
L_clearExternalInterrupt47:
	CP.B	W10, #4
	BRA NZ	L__clearExternalInterrupt111
	GOTO	L_clearExternalInterrupt49
L__clearExternalInterrupt111:
	CP.B	W10, #5
	BRA NZ	L__clearExternalInterrupt112
	GOTO	L_clearExternalInterrupt50
L__clearExternalInterrupt112:
	CP.B	W10, #6
	BRA NZ	L__clearExternalInterrupt113
	GOTO	L_clearExternalInterrupt51
L__clearExternalInterrupt113:
	CP.B	W10, #7
	BRA NZ	L__clearExternalInterrupt114
	GOTO	L_clearExternalInterrupt52
L__clearExternalInterrupt114:
	CP.B	W10, #8
	BRA NZ	L__clearExternalInterrupt115
	GOTO	L_clearExternalInterrupt53
L__clearExternalInterrupt115:
	CP.B	W10, #9
	BRA NZ	L__clearExternalInterrupt116
	GOTO	L_clearExternalInterrupt54
L__clearExternalInterrupt116:
	GOTO	L_clearExternalInterrupt55
L_clearExternalInterrupt48:
;dsPIC.c,166 :: 		}
L_end_clearExternalInterrupt:
	RETURN
; end of _clearExternalInterrupt

_setTimer:

;dsPIC.c,171 :: 		void setTimer(unsigned char device, double timePeriod) {
;dsPIC.c,173 :: 		setInterruptPriority(device, MEDIUM_PRIORITY);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W11
	PUSH	W12
	MOV.B	#4, W11
	CALL	_setInterruptPriority
	POP	W12
	POP	W11
;dsPIC.c,175 :: 		prescalerIndex = getTimerPrescaler(timePeriod);
	PUSH	W11
	PUSH	W12
	PUSH	W10
	MOV	W11, W10
	MOV	W12, W11
	CALL	_getTimerPrescaler
	POP	W10
	POP	W12
	POP	W11
; prescalerIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dsPIC.c,176 :: 		switch (device) {
	GOTO	L_setTimer56
;dsPIC.c,177 :: 		case TIMER1_DEVICE:
L_setTimer58:
;dsPIC.c,178 :: 		TIMER1_PRESCALER = prescalerIndex;
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T1CONbits), W0
	MOV.B	W3, [W0]
;dsPIC.c,179 :: 		TIMER1_PERIOD = getTimerPeriod(timePeriod, prescalerIndex);
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR1
;dsPIC.c,180 :: 		TIMER1_ENABLE_INTERRUPT = TRUE;
	BSET	IEC0bits, #3
;dsPIC.c,181 :: 		TIMER1_ENABLE = TRUE;
	BSET	T1CONbits, #15
;dsPIC.c,182 :: 		break;
	GOTO	L_setTimer57
;dsPIC.c,183 :: 		case TIMER2_DEVICE:
L_setTimer59:
;dsPIC.c,184 :: 		TIMER2_PRESCALER = prescalerIndex;
; prescalerIndex start address is: 8 (W4)
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W3, [W0]
;dsPIC.c,185 :: 		TIMER2_PERIOD = getTimerPeriod(timePeriod, prescalerIndex);
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR2
;dsPIC.c,186 :: 		TIMER2_ENABLE_INTERRUPT = TRUE;
	BSET	IEC0bits, #6
;dsPIC.c,187 :: 		TIMER2_ENABLE = TRUE;
	BSET	T2CONbits, #15
;dsPIC.c,188 :: 		break;
	GOTO	L_setTimer57
;dsPIC.c,189 :: 		case TIMER4_DEVICE:
L_setTimer60:
;dsPIC.c,190 :: 		TIMER4_PRESCALER = prescalerIndex;
; prescalerIndex start address is: 8 (W4)
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T4CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T4CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T4CONbits), W0
	MOV.B	W3, [W0]
;dsPIC.c,191 :: 		TIMER4_PERIOD = getTimerPeriod(timePeriod, prescalerIndex);
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR4
;dsPIC.c,192 :: 		TIMER4_ENABLE_INTERRUPT = TRUE;
	BSET	IEC1bits, #5
;dsPIC.c,193 :: 		TIMER4_ENABLE = TRUE;
	BSET	T4CONbits, #15
;dsPIC.c,194 :: 		break;
	GOTO	L_setTimer57
;dsPIC.c,195 :: 		}
L_setTimer56:
; prescalerIndex start address is: 8 (W4)
	CP.B	W10, #1
	BRA NZ	L__setTimer118
	GOTO	L_setTimer58
L__setTimer118:
	CP.B	W10, #2
	BRA NZ	L__setTimer119
	GOTO	L_setTimer59
L__setTimer119:
	CP.B	W10, #3
	BRA NZ	L__setTimer120
	GOTO	L_setTimer60
L__setTimer120:
; prescalerIndex end address is: 8 (W4)
L_setTimer57:
;dsPIC.c,196 :: 		}
L_end_setTimer:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _setTimer

_clearTimer:

;dsPIC.c,198 :: 		void clearTimer(unsigned char device) {
;dsPIC.c,199 :: 		switch (device) {
	GOTO	L_clearTimer61
;dsPIC.c,200 :: 		case TIMER1_DEVICE:
L_clearTimer63:
;dsPIC.c,201 :: 		TIMER1_OCCURRED = FALSE;
	BCLR	IFS0bits, #3
;dsPIC.c,202 :: 		break;
	GOTO	L_clearTimer62
;dsPIC.c,203 :: 		case TIMER2_DEVICE:
L_clearTimer64:
;dsPIC.c,204 :: 		TIMER2_OCCURRED = FALSE;
	BCLR	IFS0bits, #6
;dsPIC.c,205 :: 		break;
	GOTO	L_clearTimer62
;dsPIC.c,206 :: 		case TIMER4_DEVICE:
L_clearTimer65:
;dsPIC.c,207 :: 		TIMER4_OCCURRED = FALSE;
	BCLR	IFS1bits, #5
;dsPIC.c,208 :: 		break;
	GOTO	L_clearTimer62
;dsPIC.c,209 :: 		}
L_clearTimer61:
	CP.B	W10, #1
	BRA NZ	L__clearTimer122
	GOTO	L_clearTimer63
L__clearTimer122:
	CP.B	W10, #2
	BRA NZ	L__clearTimer123
	GOTO	L_clearTimer64
L__clearTimer123:
	CP.B	W10, #3
	BRA NZ	L__clearTimer124
	GOTO	L_clearTimer65
L__clearTimer124:
L_clearTimer62:
;dsPIC.c,210 :: 		}
L_end_clearTimer:
	RETURN
; end of _clearTimer

_turnOnTimer:

;dsPIC.c,212 :: 		void turnOnTimer(unsigned char device) {
;dsPIC.c,213 :: 		switch (device) {
	GOTO	L_turnOnTimer66
;dsPIC.c,214 :: 		case TIMER1_DEVICE:
L_turnOnTimer68:
;dsPIC.c,215 :: 		TIMER1_ENABLE = TRUE;
	BSET	T1CONbits, #15
;dsPIC.c,216 :: 		break;
	GOTO	L_turnOnTimer67
;dsPIC.c,217 :: 		case TIMER2_DEVICE:
L_turnOnTimer69:
;dsPIC.c,218 :: 		TIMER2_ENABLE = TRUE;
	BSET	T2CONbits, #15
;dsPIC.c,219 :: 		break;
	GOTO	L_turnOnTimer67
;dsPIC.c,220 :: 		case TIMER4_DEVICE:
L_turnOnTimer70:
;dsPIC.c,221 :: 		TIMER4_ENABLE = TRUE;
	BSET	T4CONbits, #15
;dsPIC.c,222 :: 		break;
	GOTO	L_turnOnTimer67
;dsPIC.c,223 :: 		}
L_turnOnTimer66:
	CP.B	W10, #1
	BRA NZ	L__turnOnTimer126
	GOTO	L_turnOnTimer68
L__turnOnTimer126:
	CP.B	W10, #2
	BRA NZ	L__turnOnTimer127
	GOTO	L_turnOnTimer69
L__turnOnTimer127:
	CP.B	W10, #3
	BRA NZ	L__turnOnTimer128
	GOTO	L_turnOnTimer70
L__turnOnTimer128:
L_turnOnTimer67:
;dsPIC.c,224 :: 		}
L_end_turnOnTimer:
	RETURN
; end of _turnOnTimer

_turnOffTimer:

;dsPIC.c,226 :: 		void turnOffTimer(unsigned char device) {
;dsPIC.c,227 :: 		switch (device) {
	GOTO	L_turnOffTimer71
;dsPIC.c,228 :: 		case TIMER1_DEVICE:
L_turnOffTimer73:
;dsPIC.c,229 :: 		TIMER1_ENABLE = FALSE;
	BCLR	T1CONbits, #15
;dsPIC.c,230 :: 		break;
	GOTO	L_turnOffTimer72
;dsPIC.c,231 :: 		case TIMER2_DEVICE:
L_turnOffTimer74:
;dsPIC.c,232 :: 		TIMER2_ENABLE = FALSE;
	BCLR	T2CONbits, #15
;dsPIC.c,233 :: 		break;
	GOTO	L_turnOffTimer72
;dsPIC.c,234 :: 		case TIMER4_DEVICE:
L_turnOffTimer75:
;dsPIC.c,235 :: 		TIMER4_ENABLE = FALSE;
	BCLR	T4CONbits, #15
;dsPIC.c,236 :: 		break;
	GOTO	L_turnOffTimer72
;dsPIC.c,237 :: 		}
L_turnOffTimer71:
	CP.B	W10, #1
	BRA NZ	L__turnOffTimer130
	GOTO	L_turnOffTimer73
L__turnOffTimer130:
	CP.B	W10, #2
	BRA NZ	L__turnOffTimer131
	GOTO	L_turnOffTimer74
L__turnOffTimer131:
	CP.B	W10, #3
	BRA NZ	L__turnOffTimer132
	GOTO	L_turnOffTimer75
L__turnOffTimer132:
L_turnOffTimer72:
;dsPIC.c,238 :: 		}
L_end_turnOffTimer:
	RETURN
; end of _turnOffTimer

_getTimerPeriod:
	LNK	#8

;dsPIC.c,240 :: 		unsigned int getTimerPeriod(double timePeriod, unsigned char prescalerIndex) {
;dsPIC.c,241 :: 		return (unsigned int) ((timePeriod * 1000000) / (INSTRUCTION_PERIOD * PRESCALER_VALUES[prescalerIndex]));
	PUSH	W12
	MOV.D	W10, W0
	MOV	#9216, W2
	MOV	#18804, W3
	CALL	__Mul_FP
	POP	W12
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	ZE	W12, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_PRESCALER_VALUES), W0
	ADD	W0, W1, W2
	MOV	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15692, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	POP.D	W2
	CALL	__Float2Longint
;dsPIC.c,242 :: 		}
L_end_getTimerPeriod:
	ULNK
	RETURN
; end of _getTimerPeriod

_getTimerPrescaler:

;dsPIC.c,244 :: 		unsigned char getTimerPrescaler(double timePeriod) {
;dsPIC.c,247 :: 		exactTimerPrescaler = getExactTimerPrescaler(timePeriod);
	CALL	_getExactTimerPrescaler
; exactTimerPrescaler start address is: 8 (W4)
	MOV.D	W0, W4
;dsPIC.c,248 :: 		for (i = 0; i < sizeof(PRESCALER_VALUES); i += 1) {
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_getTimerPrescaler76:
; i start address is: 6 (W3)
; exactTimerPrescaler start address is: 8 (W4)
; exactTimerPrescaler end address is: 8 (W4)
	CP.B	W3, #8
	BRA LTU	L__getTimerPrescaler135
	GOTO	L_getTimerPrescaler77
L__getTimerPrescaler135:
; exactTimerPrescaler end address is: 8 (W4)
;dsPIC.c,249 :: 		if ((int) exactTimerPrescaler < PRESCALER_VALUES[i]) {
; exactTimerPrescaler start address is: 8 (W4)
	PUSH.D	W4
	PUSH	W3
	PUSH.D	W10
	MOV.D	W4, W0
	CALL	__Float2Longint
	POP.D	W10
	POP	W3
	POP.D	W4
	ZE	W3, W1
	SL	W1, #1, W2
	MOV	#lo_addr(_PRESCALER_VALUES), W1
	ADD	W1, W2, W2
	MOV	#___Lib_System_DefaultPage, W1
	MOV	W1, 52
	MOV	[W2], W1
	CP	W0, W1
	BRA LTU	L__getTimerPrescaler136
	GOTO	L_getTimerPrescaler79
L__getTimerPrescaler136:
; exactTimerPrescaler end address is: 8 (W4)
;dsPIC.c,250 :: 		return i;
	MOV.B	W3, W0
; i end address is: 6 (W3)
	GOTO	L_end_getTimerPrescaler
;dsPIC.c,251 :: 		}
L_getTimerPrescaler79:
;dsPIC.c,248 :: 		for (i = 0; i < sizeof(PRESCALER_VALUES); i += 1) {
; i start address is: 0 (W0)
; exactTimerPrescaler start address is: 8 (W4)
; i start address is: 6 (W3)
	ADD.B	W3, #1, W0
; i end address is: 6 (W3)
;dsPIC.c,252 :: 		}
; exactTimerPrescaler end address is: 8 (W4)
; i end address is: 0 (W0)
	MOV.B	W0, W3
	GOTO	L_getTimerPrescaler76
L_getTimerPrescaler77:
;dsPIC.c,253 :: 		i -= 1;
; i start address is: 6 (W3)
	ZE	W3, W0
; i end address is: 6 (W3)
	DEC	W0
;dsPIC.c,255 :: 		return i;
;dsPIC.c,256 :: 		}
L_end_getTimerPrescaler:
	RETURN
; end of _getTimerPrescaler

_getExactTimerPrescaler:

;dsPIC.c,261 :: 		double getExactTimerPrescaler(double timePeriod) {
;dsPIC.c,263 :: 		return (timePeriod * 1000000) / (INSTRUCTION_PERIOD * MAX_TIMER_COUNTER_VALUE);
	MOV.D	W10, W0
	MOV	#9216, W2
	MOV	#18804, W3
	CALL	__Mul_FP
	MOV	#52224, W2
	MOV	#17740, W3
	CALL	__Div_FP
;dsPIC.c,264 :: 		}
L_end_getExactTimerPrescaler:
	RETURN
; end of _getExactTimerPrescaler

_setupAnalogSampling:

;dsPIC.c,266 :: 		void setupAnalogSampling(void) {
;dsPIC.c,267 :: 		ANALOG_CONVERSION_TRIGGER_SOURCE = ACTS_AUTOMATIC;
	PUSH	W10
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	IOR.B	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	W1, [W0]
;dsPIC.c,268 :: 		ANALOG_DATA_OUTPUT_FORMAT = ADOF_UNSIGNED_INTEGER;
	MOV	ADCON1bits, W1
	MOV	#64767, W0
	AND	W1, W0, W0
	MOV	WREG, ADCON1bits
;dsPIC.c,269 :: 		ANALOG_IDLE_ENABLE = FALSE;
	BCLR	ADCON1bits, #13
;dsPIC.c,270 :: 		ANALOG_CH0_SCAN_ENABLE = TRUE;
	BSET	ADCON2bits, #10
;dsPIC.c,271 :: 		ANALOG_BUFFER_SIZE = ABS_16BIT;
	BCLR	ADCON2bits, #1
;dsPIC.c,272 :: 		ANALOG_ENABLE_ALTERNATING_MULTIPLEXER = FALSE;
	BCLR	ADCON2bits, #0
;dsPIC.c,273 :: 		ANALOG_CLOCK_SOURCE = ACS_EXTERNAL;
	BCLR	ADCON3bits, #7
;dsPIC.c,274 :: 		ANALOG_CHANNEL_B_NEGATIVE_INPUT = ACNI_VREF;
	BCLR	ADCHSbits, #12
;dsPIC.c,275 :: 		ANALOG_CHANNEL_A_NEGATIVE_INPUT = ACNI_VREF;
	BCLR	ADCHSbits, #4
;dsPIC.c,276 :: 		ANALOG_CHANNEL_B_POSITIVE_INPUT = 0;
	MOV	ADCHSbits, W1
	MOV	#61695, W0
	AND	W1, W0, W0
	MOV	WREG, ADCHSbits
;dsPIC.c,277 :: 		ANALOG_CHANNEL_A_POSITIVE_INPUT = 0;
	MOV	#lo_addr(ADCHSbits), W0
	MOV.B	[W0], W1
	MOV.B	#240, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCHSbits), W0
	MOV.B	W1, [W0]
;dsPIC.c,280 :: 		ANALOG_CLOCK_CONVERSION = getMinimumAnalogClockConversion();
	CALL	_getMinimumAnalogClockConversion
	MOV.B	W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(ADCON3bits), W0
	MOV.B	W1, [W0]
;dsPIC.c,281 :: 		ANALOG_AUTOMATIC_SAMPLING_TADS_INTERVAL = 1;
	MOV	#256, W0
	MOV	W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR	W1, [W0], W1
	MOV	#7936, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON3bits
;dsPIC.c,283 :: 		ANALOG_MODE_PORT = 0b1111111111111111; //All analog inputs are disabled
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;dsPIC.c,284 :: 		ANALOG_SCAN_PORT = 0; //Skipping pin scan
	CLR	ADCSSL
;dsPIC.c,286 :: 		setAutomaticSampling();
	CALL	_setAutomaticSampling
;dsPIC.c,287 :: 		setAnalogVoltageReference(AVR_AVDD_AVSS);
	CLR	W10
	CALL	_setAnalogVoltageReference
;dsPIC.c,288 :: 		unsetAnalogInterrupt();
	CALL	_unsetAnalogInterrupt
;dsPIC.c,289 :: 		startSampling();
	CALL	_startSampling
;dsPIC.c,290 :: 		}
L_end_setupAnalogSampling:
	POP	W10
	RETURN
; end of _setupAnalogSampling

_turnOnAnalogModule:

;dsPIC.c,292 :: 		void turnOnAnalogModule() {
;dsPIC.c,293 :: 		ANALOG_SAMPLING_ENABLE = TRUE;
	BSET	ADCON1bits, #15
;dsPIC.c,294 :: 		}
L_end_turnOnAnalogModule:
	RETURN
; end of _turnOnAnalogModule

_turnOffAnalogModule:

;dsPIC.c,296 :: 		void turnOffAnalogModule() {
;dsPIC.c,297 :: 		ANALOG_SAMPLING_ENABLE = FALSE;
	BCLR	ADCON1bits, #15
;dsPIC.c,298 :: 		}
L_end_turnOffAnalogModule:
	RETURN
; end of _turnOffAnalogModule

_startSampling:

;dsPIC.c,300 :: 		void startSampling(void) {
;dsPIC.c,301 :: 		ANALOG_SAMPLING_STATUS = TRUE;
	BSET	ADCON1bits, #1
;dsPIC.c,302 :: 		}
L_end_startSampling:
	RETURN
; end of _startSampling

_getAnalogValue:

;dsPIC.c,304 :: 		unsigned int getAnalogValue(void) {
;dsPIC.c,305 :: 		return ANALOG_BUFFER0;
	MOV	ADCBUF0, WREG
;dsPIC.c,306 :: 		}
L_end_getAnalogValue:
	RETURN
; end of _getAnalogValue

_setAnalogPIN:

;dsPIC.c,308 :: 		void setAnalogPIN(unsigned char pin) {
;dsPIC.c,309 :: 		ANALOG_MODE_PORT = ANALOG_MODE_PORT & ~(int) (TRUE << pin);
	ZE	W10, W1
	MOV	#1, W0
	SL	W0, W1, W2
	MOV	W2, W0
	COM	W0, W1
	MOV	#lo_addr(ADPCFG), W0
	AND	W1, [W0], [W0]
;dsPIC.c,310 :: 		ANALOG_SCAN_PORT = ANALOG_SCAN_PORT | (TRUE << pin);
	MOV	#lo_addr(ADCSSL), W0
	IOR	W2, [W0], [W0]
;dsPIC.c,311 :: 		}
L_end_setAnalogPIN:
	RETURN
; end of _setAnalogPIN

_unsetAnalogPIN:

;dsPIC.c,313 :: 		void unsetAnalogPIN(unsigned char pin) {
;dsPIC.c,314 :: 		ANALOG_MODE_PORT = ANALOG_MODE_PORT | (TRUE << pin);
	ZE	W10, W1
	MOV	#1, W0
	SL	W0, W1, W1
	MOV	#lo_addr(ADPCFG), W0
	IOR	W1, [W0], [W0]
;dsPIC.c,315 :: 		ANALOG_SCAN_PORT = ANALOG_SCAN_PORT & ~(int) (TRUE << pin);
	MOV	W1, W0
	COM	W0, W1
	MOV	#lo_addr(ADCSSL), W0
	AND	W1, [W0], [W0]
;dsPIC.c,316 :: 		}
L_end_unsetAnalogPIN:
	RETURN
; end of _unsetAnalogPIN

_setAnalogInterrupt:

;dsPIC.c,318 :: 		void setAnalogInterrupt(void) {
;dsPIC.c,319 :: 		clearAnalogInterrupt();
	CALL	_clearAnalogInterrupt
;dsPIC.c,320 :: 		ANALOG_INTERRUPT_ENABLE = TRUE;
	BSET	IEC0bits, #11
;dsPIC.c,321 :: 		}
L_end_setAnalogInterrupt:
	RETURN
; end of _setAnalogInterrupt

_unsetAnalogInterrupt:

;dsPIC.c,323 :: 		void unsetAnalogInterrupt(void) {
;dsPIC.c,324 :: 		clearAnalogInterrupt();
	CALL	_clearAnalogInterrupt
;dsPIC.c,325 :: 		ANALOG_INTERRUPT_ENABLE = FALSE;
	BCLR	IEC0bits, #11
;dsPIC.c,326 :: 		}
L_end_unsetAnalogInterrupt:
	RETURN
; end of _unsetAnalogInterrupt

_clearAnalogInterrupt:

;dsPIC.c,328 :: 		void clearAnalogInterrupt(void) {
;dsPIC.c,329 :: 		ANALOG_INTERRUPT_OCCURRED = FALSE;
	BCLR	IFS0bits, #11
;dsPIC.c,330 :: 		}
L_end_clearAnalogInterrupt:
	RETURN
; end of _clearAnalogInterrupt

_setAutomaticSampling:

;dsPIC.c,332 :: 		void setAutomaticSampling(void) {
;dsPIC.c,333 :: 		AUTOMATIC_SAMPLING = TRUE;
	BSET	ADCON1bits, #2
;dsPIC.c,334 :: 		}
L_end_setAutomaticSampling:
	RETURN
; end of _setAutomaticSampling

_unsetAutomaticSampling:

;dsPIC.c,336 :: 		void unsetAutomaticSampling(void) {
;dsPIC.c,337 :: 		AUTOMATIC_SAMPLING = FALSE;
	BCLR	ADCON1bits, #2
;dsPIC.c,338 :: 		}
L_end_unsetAutomaticSampling:
	RETURN
; end of _unsetAutomaticSampling

_setAnalogVoltageReference:

;dsPIC.c,340 :: 		void setAnalogVoltageReference(unsigned char mode) {
;dsPIC.c,341 :: 		ANALOG_VOLTAGE_REFERENCE = mode;
	ZE	W10, W0
	MOV	W0, W1
	MOV.B	#13, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(ADCON2bits), W0
	XOR	W1, [W0], W1
	MOV	#57344, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON2bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON2bits
;dsPIC.c,342 :: 		}
L_end_setAnalogVoltageReference:
	RETURN
; end of _setAnalogVoltageReference

_setAnalogDataOutputFormat:

;dsPIC.c,344 :: 		void setAnalogDataOutputFormat(unsigned char adof) {
;dsPIC.c,345 :: 		ANALOG_DATA_OUTPUT_FORMAT = adof;
	ZE	W10, W0
	MOV	W0, W1
	MOV.B	#8, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	XOR	W1, [W0], W1
	MOV	#768, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON1bits
;dsPIC.c,346 :: 		}
L_end_setAnalogDataOutputFormat:
	RETURN
; end of _setAnalogDataOutputFormat

_getMinimumAnalogClockConversion:

;dsPIC.c,348 :: 		int getMinimumAnalogClockConversion(void) {
;dsPIC.c,349 :: 		return (int) ((MINIMUM_TAD_PERIOD * OSC_FREQ_MHZ) / 500.0);
	MOV	#24, W0
;dsPIC.c,350 :: 		}
L_end_getMinimumAnalogClockConversion:
	RETURN
; end of _getMinimumAnalogClockConversion
