
_dd_GraphicController_timerSetup:

;dd_graphic_controller.c,50 :: 		void dd_GraphicController_timerSetup(void) {
;dd_graphic_controller.c,51 :: 		setInterruptPriority(TIMER1_DEVICE, LOW_PRIORITY);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#5, W11
	MOV.B	#1, W10
	CALL	_setInterruptPriority
;dd_graphic_controller.c,52 :: 		setTimer(TIMER1_DEVICE, FRAME_PERIOD);
	MOV	#52429, W11
	MOV	#15820, W12
	MOV.B	#1, W10
	CALL	_setTimer
;dd_graphic_controller.c,53 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,54 :: 		}
L_end_dd_GraphicController_timerSetup:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_timerSetup

_dd_GraphicController_getTmrCounterLimit:

;dd_graphic_controller.c,59 :: 		unsigned char dd_GraphicController_getTmrCounterLimit(unsigned int period)
;dd_graphic_controller.c,61 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
	PUSH	W10
	PUSH	W11
	MOV	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17530, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_floor
	CALL	__Float2Longint
;dd_graphic_controller.c,62 :: 		}
;dd_graphic_controller.c,61 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
;dd_graphic_controller.c,62 :: 		}
L_end_dd_GraphicController_getTmrCounterLimit:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_getTmrCounterLimit

_dd_GraphicController_startupLogo:

;dd_graphic_controller.c,66 :: 		void dd_GraphicController_startupLogo(void) {
;dd_graphic_controller.c,67 :: 		dd_onStartupCounterLimit = dd_GraphicController_getTmrCounterLimit(STARTUP_LOGO_PERIOD);
	PUSH	W10
	MOV	#1000, W10
	CALL	_dd_GraphicController_getTmrCounterLimit
	MOV	#lo_addr(_dd_onStartupCounterLimit), W1
	MOV.B	W0, [W1]
;dd_graphic_controller.c,70 :: 		dd_printLogoAnimation();
	CALL	_dd_printLogoAnimation
;dd_graphic_controller.c,71 :: 		dd_onStartup = 1;
	MOV	#lo_addr(_dd_onStartup), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,73 :: 		}
L_end_dd_GraphicController_startupLogo:
	POP	W10
	RETURN
; end of _dd_GraphicController_startupLogo

_dd_GraphicController_turnOnBacklight:

;dd_graphic_controller.c,75 :: 		void dd_GraphicController_turnOnBacklight(void) {
;dd_graphic_controller.c,76 :: 		DD_BACKLIGHT_PIN = TRUE;
	BSET	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,77 :: 		}
L_end_dd_GraphicController_turnOnBacklight:
	RETURN
; end of _dd_GraphicController_turnOnBacklight

_dd_GraphicController_turnOffBacklight:

;dd_graphic_controller.c,79 :: 		void dd_GraphicController_turnOffBacklight(void) {
;dd_graphic_controller.c,80 :: 		DD_BACKLIGHT_PIN = FALSE;
	BCLR	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,81 :: 		}
L_end_dd_GraphicController_turnOffBacklight:
	RETURN
; end of _dd_GraphicController_turnOffBacklight

_dd_GraphicController_switchBacklight:

;dd_graphic_controller.c,83 :: 		void dd_GraphicController_switchBacklight(void) {
;dd_graphic_controller.c,84 :: 		DD_BACKLIGHT_PIN = !DD_BACKLIGHT_PIN;
	BTG	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,85 :: 		}
L_end_dd_GraphicController_switchBacklight:
	RETURN
; end of _dd_GraphicController_switchBacklight

_dd_GraphicController_init:

;dd_graphic_controller.c,87 :: 		void dd_GraphicController_init(void) {
;dd_graphic_controller.c,89 :: 		DD_BACKLIGHT_PIN_DIRECTION = OUTPUT;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	BCLR	TRISG13_bit, BitPos(TRISG13_bit+0)
;dd_graphic_controller.c,90 :: 		dd_GraphicController_turnOnBacklight();
	CALL	_dd_GraphicController_turnOnBacklight
;dd_graphic_controller.c,91 :: 		eGlcd_init();
	CALL	_eGlcd_init
;dd_graphic_controller.c,92 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,93 :: 		eGlcd_setFont(DD_Dashboard_Font);
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_graphic_controller_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;dd_graphic_controller.c,94 :: 		if (!dHardReset_hasBeenReset()) {
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__dd_GraphicController_init37
	GOTO	L_dd_GraphicController_init0
L__dd_GraphicController_init37:
;dd_graphic_controller.c,95 :: 		dd_GraphicController_startupLogo();
	CALL	_dd_GraphicController_startupLogo
;dd_graphic_controller.c,96 :: 		}
L_dd_GraphicController_init0:
;dd_graphic_controller.c,97 :: 		dd_GraphicController_timerSetup();
	CALL	_dd_GraphicController_timerSetup
;dd_graphic_controller.c,98 :: 		dd_GraphicController_forceFullFrameUpdate();
	CALL	_dd_GraphicController_forceFullFrameUpdate
;dd_graphic_controller.c,99 :: 		}
L_end_dd_GraphicController_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_init

_dd_GraphicController_invertColors:

;dd_graphic_controller.c,101 :: 		void dd_GraphicController_invertColors(void) {
;dd_graphic_controller.c,102 :: 		dd_GraphicController_queueColorInversion();
	CALL	_dd_GraphicController_queueColorInversion
;dd_graphic_controller.c,103 :: 		eGlcd_invertColors();
	CALL	_eGlcd_invertColors
;dd_graphic_controller.c,104 :: 		dd_GraphicController_forceNextFrameUpdate();
	CALL	_dd_GraphicController_forceNextFrameUpdate
;dd_graphic_controller.c,105 :: 		}
L_end_dd_GraphicController_invertColors:
	RETURN
; end of _dd_GraphicController_invertColors

_dd_GraphicController_areColorsInverted:

;dd_graphic_controller.c,107 :: 		char dd_GraphicController_areColorsInverted(void) {
;dd_graphic_controller.c,108 :: 		return BLACK == PIXEL_OFF;
	MOV.B	#_BLACK, W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__dd_GraphicController_areColorsInverted40
	INC.B	W0
L__dd_GraphicController_areColorsInverted40:
;dd_graphic_controller.c,109 :: 		}
L_end_dd_GraphicController_areColorsInverted:
	RETURN
; end of _dd_GraphicController_areColorsInverted

_dd_GraphicController_setInterface:

;dd_graphic_controller.c,111 :: 		void dd_GraphicController_setInterface(Interface interface) {
;dd_graphic_controller.c,115 :: 		dd_currentInterface = interface;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	W10, [W0]
;dd_graphic_controller.c,117 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,118 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,119 :: 		dd_GraphicController_fireTimedNotification(OP_MODE_POPUP_PERIOD, dd_currentInterfaceTitle, MESSAGE);
	CLR	W12
	MOV	#lo_addr(_dd_currentInterfaceTitle), W11
	MOV	#700, W10
	CALL	_dd_GraphicController_fireTimedNotification
;dd_graphic_controller.c,123 :: 		}
L_end_dd_GraphicController_setInterface:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_setInterface

_dd_GraphicController_setCollectionInterface:

;dd_graphic_controller.c,125 :: 		void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title) {
;dd_graphic_controller.c,127 :: 		dd_GraphicController_setInterface(interface);
	PUSH	W10
	PUSH.D	W12
	PUSH	W11
	CALL	_dd_GraphicController_setInterface
;dd_graphic_controller.c,129 :: 		dd_Interface_init[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
	POP	W11
	POP.D	W12
;dd_graphic_controller.c,130 :: 		if ( strlen(title) < MAX_INTERFACE_TITLE_LENGTH )
	MOV	W13, W10
	CALL	_strlen
	CP	W0, #20
	BRA LT	L__dd_GraphicController_setCollectionInterface43
	GOTO	L_dd_GraphicController_setCollectionInterface1
L__dd_GraphicController_setCollectionInterface43:
;dd_graphic_controller.c,131 :: 		strcpy(dd_currentInterfaceTitle, title);
	PUSH	W11
	MOV	W13, W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W10
	CALL	_strcpy
	POP	W11
L_dd_GraphicController_setCollectionInterface1:
;dd_graphic_controller.c,132 :: 		dd_currentIndicators = indicator_collection;
	MOV	W11, _dd_currentIndicators
;dd_graphic_controller.c,133 :: 		dd_currentIndicatorsCount = indicator_count;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	MOV.B	W12, [W0]
;dd_graphic_controller.c,138 :: 		}
L_end_dd_GraphicController_setCollectionInterface:
	POP	W10
	RETURN
; end of _dd_GraphicController_setCollectionInterface

_dd_GraphicController_getInterface:

;dd_graphic_controller.c,140 :: 		Interface dd_GraphicController_getInterface(void) {
;dd_graphic_controller.c,141 :: 		return dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,142 :: 		}
L_end_dd_GraphicController_getInterface:
	RETURN
; end of _dd_GraphicController_getInterface

_dd_GraphicController_saveCurrentInterface:

;dd_graphic_controller.c,144 :: 		void dd_GraphicController_saveCurrentInterface(void) {
;dd_graphic_controller.c,145 :: 		strcpy(dd_lastInterfaceTitle, dd_currentInterfaceTitle);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W11
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterfaceTitle), W10
	CALL	_strcpy
;dd_graphic_controller.c,146 :: 		dd_lastInterface = dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterface), W1
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], [W1]
;dd_graphic_controller.c,147 :: 		}
L_end_dd_GraphicController_saveCurrentInterface:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_saveCurrentInterface

_dd_GraphicController_setNotificationFlag:

;dd_graphic_controller.c,149 :: 		void dd_GraphicController_setNotificationFlag (void){
;dd_graphic_controller.c,150 :: 		dd_notificationFlag = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,151 :: 		}
L_end_dd_GraphicController_setNotificationFlag:
	RETURN
; end of _dd_GraphicController_setNotificationFlag

_dd_GraphicController_unsetNotificationFlag:

;dd_graphic_controller.c,153 :: 		void dd_GraphicController_unsetNotificationFlag (void){
;dd_graphic_controller.c,154 :: 		dd_notificationFlag = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,155 :: 		}
L_end_dd_GraphicController_unsetNotificationFlag:
	RETURN
; end of _dd_GraphicController_unsetNotificationFlag

_dd_GraphicController_clearNotification:

;dd_graphic_controller.c,157 :: 		void dd_GraphicController_clearNotification(void) {
;dd_graphic_controller.c,158 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,159 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,160 :: 		dd_GraphicController_unsetNotificationFlag();
	CALL	_dd_GraphicController_unsetNotificationFlag
;dd_graphic_controller.c,161 :: 		}
L_end_dd_GraphicController_clearNotification:
	RETURN
; end of _dd_GraphicController_clearNotification

_dd_GraphicController_fireNotification:

;dd_graphic_controller.c,163 :: 		void dd_GraphicController_fireNotification(char *text, NotificationType type) {
;dd_graphic_controller.c,164 :: 		strcpy(dd_notificationText, text);
	PUSH	W10
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_strcpy
;dd_graphic_controller.c,165 :: 		dd_GraphicController_setNotificationFlag();
	CALL	_dd_GraphicController_setNotificationFlag
;dd_graphic_controller.c,166 :: 		dd_printMessage(dd_notificationText);
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,167 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,168 :: 		}
L_end_dd_GraphicController_fireNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireNotification

_dd_GraphicController_fireTimedNotification:

;dd_graphic_controller.c,173 :: 		void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type) {
;dd_graphic_controller.c,174 :: 		dd_notificationTimeoutCounter = dd_GraphicController_getTmrCounterLimit(time);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W11
	CALL	_dd_GraphicController_getTmrCounterLimit
	POP	W11
	POP	W12
	ZE	W0, W0
	MOV	W0, _dd_notificationTimeoutCounter
;dd_graphic_controller.c,175 :: 		dd_notificationIsTimed = 1;
	MOV	#lo_addr(_dd_notificationIsTimed), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,176 :: 		dd_GraphicController_fireNotification(text, type);
	MOV	W11, W10
	MOV.B	W12, W11
	CALL	_dd_GraphicController_fireNotification
;dd_graphic_controller.c,177 :: 		}
L_end_dd_GraphicController_fireTimedNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireTimedNotification

_dd_GraphicController_firePromptNotification:

;dd_graphic_controller.c,179 :: 		void dd_GraphicController_firePromptNotification(char *text) {
;dd_graphic_controller.c,180 :: 		if(dd_notificationFlag)
	PUSH	W11
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_firePromptNotification52
	GOTO	L_dd_GraphicController_firePromptNotification2
L__dd_GraphicController_firePromptNotification52:
;dd_graphic_controller.c,181 :: 		dd_GraphicController_clearNotification();
	PUSH	W10
	CALL	_dd_GraphicController_clearNotification
	POP	W10
	GOTO	L_dd_GraphicController_firePromptNotification3
L_dd_GraphicController_firePromptNotification2:
;dd_graphic_controller.c,183 :: 		eGlcd_clear();
	PUSH	W10
	CALL	_eGlcd_clear
	POP	W10
L_dd_GraphicController_firePromptNotification3:
;dd_graphic_controller.c,185 :: 		dd_notificationIsTimed = 0;
	MOV	#lo_addr(_dd_notificationIsTimed), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,186 :: 		dd_GraphicController_fireNotification(text, PROMPT);
	MOV.B	#3, W11
	CALL	_dd_GraphicController_fireNotification
;dd_graphic_controller.c,187 :: 		}
L_end_dd_GraphicController_firePromptNotification:
	POP	W11
	RETURN
; end of _dd_GraphicController_firePromptNotification

_dd_GraphicController_clearPrompt:

;dd_graphic_controller.c,189 :: 		void dd_GraphicController_clearPrompt()
;dd_graphic_controller.c,191 :: 		dd_GraphicController_clearNotification();
	CALL	_dd_GraphicController_clearNotification
;dd_graphic_controller.c,192 :: 		}
L_end_dd_GraphicController_clearPrompt:
	RETURN
; end of _dd_GraphicController_clearPrompt

_dd_GraphicController_handleNotification:

;dd_graphic_controller.c,194 :: 		void dd_GraphicController_handleNotification(void) {
;dd_graphic_controller.c,195 :: 		if (dd_notificationTimeoutCounter > 0) {
	MOV	_dd_notificationTimeoutCounter, W0
	CP	W0, #0
	BRA GTU	L__dd_GraphicController_handleNotification55
	GOTO	L_dd_GraphicController_handleNotification4
L__dd_GraphicController_handleNotification55:
;dd_graphic_controller.c,196 :: 		dd_notificationTimeoutCounter--;
	MOV	#1, W1
	MOV	#lo_addr(_dd_notificationTimeoutCounter), W0
	SUBR	W1, [W0], [W0]
;dd_graphic_controller.c,197 :: 		if (dd_notificationTimeoutCounter == 0) {
	MOV	_dd_notificationTimeoutCounter, W0
	CP	W0, #0
	BRA Z	L__dd_GraphicController_handleNotification56
	GOTO	L_dd_GraphicController_handleNotification5
L__dd_GraphicController_handleNotification56:
;dd_graphic_controller.c,198 :: 		dd_GraphicController_clearNotification();
	CALL	_dd_GraphicController_clearNotification
;dd_graphic_controller.c,200 :: 		}
L_dd_GraphicController_handleNotification5:
;dd_graphic_controller.c,201 :: 		}
L_dd_GraphicController_handleNotification4:
;dd_graphic_controller.c,204 :: 		}
L_end_dd_GraphicController_handleNotification:
	RETURN
; end of _dd_GraphicController_handleNotification

_dd_GraphicController_forceFullFrameUpdate:

;dd_graphic_controller.c,226 :: 		void dd_GraphicController_forceFullFrameUpdate(void) {              //inutile
;dd_graphic_controller.c,227 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,228 :: 		}
L_end_dd_GraphicController_forceFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceFullFrameUpdate

_dd_GraphicController_releaseFullFrameUpdate:

;dd_graphic_controller.c,230 :: 		void dd_GraphicController_releaseFullFrameUpdate(void) {
;dd_graphic_controller.c,231 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,232 :: 		}
L_end_dd_GraphicController_releaseFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_releaseFullFrameUpdate

_dd_GraphicController_forceNextFrameUpdate:

;dd_graphic_controller.c,234 :: 		void dd_GraphicController_forceNextFrameUpdate(void) {
;dd_graphic_controller.c,235 :: 		dd_isNextFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,236 :: 		}
L_end_dd_GraphicController_forceNextFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceNextFrameUpdate

_dd_GraphicController_isFrameUpdateForced:

;dd_graphic_controller.c,238 :: 		char dd_GraphicController_isFrameUpdateForced(void) {
;dd_graphic_controller.c,239 :: 		return dd_isFrameUpdateForced;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,240 :: 		}
L_end_dd_GraphicController_isFrameUpdateForced:
	RETURN
; end of _dd_GraphicController_isFrameUpdateForced

_dd_GraphicController_queueColorInversion:

;dd_graphic_controller.c,242 :: 		void dd_GraphicController_queueColorInversion(void) {
;dd_graphic_controller.c,243 :: 		dd_isColorInversionQueued = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,244 :: 		}
L_end_dd_GraphicController_queueColorInversion:
	RETURN
; end of _dd_GraphicController_queueColorInversion

_dd_GraphicController_isColorInversionQueued:

;dd_graphic_controller.c,246 :: 		char dd_GraphicController_isColorInversionQueued(void) {               //inutile
;dd_graphic_controller.c,247 :: 		return dd_isColorInversionQueued;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,248 :: 		}
L_end_dd_GraphicController_isColorInversionQueued:
	RETURN
; end of _dd_GraphicController_isColorInversionQueued

_dd_printLogoAnimation:
	LNK	#24

;dd_graphic_controller.c,250 :: 		void dd_printLogoAnimation() {
;dd_graphic_controller.c,251 :: 		char page = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;dd_graphic_controller.c,252 :: 		int i =0, j=0, k=0;
;dd_graphic_controller.c,253 :: 		signed char new_y = 0;
;dd_graphic_controller.c,254 :: 		signed char old_y = 0;
;dd_graphic_controller.c,255 :: 		int y_center = 19;
	MOV	#19, W0
	MOV	W0, [W14+8]
;dd_graphic_controller.c,257 :: 		signed char new_y_border = 0;
;dd_graphic_controller.c,259 :: 		eGlcd_LoadImage(DYNAMIS_LOGO);
	MOV	#lo_addr(dd_graphic_controller_DYNAMIS_LOGO), W10
	CALL	_eGlcd_loadImage
;dd_graphic_controller.c,263 :: 		for (k=5; k<=120; k++){
	MOV	#5, W0
	MOV	W0, [W14+4]
L_dd_printLogoAnimation6:
	MOV	#120, W1
	ADD	W14, #4, W0
	CP	W1, [W0]
	BRA GE	L__dd_printLogoAnimation64
	GOTO	L_dd_printLogoAnimation7
L__dd_printLogoAnimation64:
;dd_graphic_controller.c,264 :: 		resetTimer32();
	CALL	_resetTimer32
;dd_graphic_controller.c,265 :: 		cos_angle = cos(0.10466*k);
	MOV	[W14+4], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#22523, W2
	MOV	#15830, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_cos
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;dd_graphic_controller.c,266 :: 		new_y_border = round((cos_angle*17));
	MOV	#0, W2
	MOV	#16776, W3
	CALL	__Mul_FP
	MOV.D	W0, W10
	CALL	_round
	MOV.B	W0, [W14+10]
;dd_graphic_controller.c,267 :: 		if (new_y_border<0) new_y_border = -new_y_border;
	CP.B	W0, #0
	BRA LT	L__dd_printLogoAnimation65
	GOTO	L_dd_printLogoAnimation9
L__dd_printLogoAnimation65:
	MOV.B	[W14+10], W1
	ADD	W14, #10, W0
	SUBR.B	W1, #0, [W0]
L_dd_printLogoAnimation9:
;dd_graphic_controller.c,268 :: 		for (i=0; i<=17-new_y_border; i++)
; i start address is: 16 (W8)
	CLR	W8
; i end address is: 16 (W8)
L_dd_printLogoAnimation10:
; i start address is: 16 (W8)
	ADD	W14, #10, W0
	SE	[W0], W0
	SUBR	W0, #17, W0
	CP	W8, W0
	BRA LE	L__dd_printLogoAnimation66
	GOTO	L_dd_printLogoAnimation11
L__dd_printLogoAnimation66:
;dd_graphic_controller.c,270 :: 		for (j=0; j<8; j++)
; j start address is: 6 (W3)
	CLR	W3
; j end address is: 6 (W3)
; i end address is: 16 (W8)
	MOV	W3, W2
L_dd_printLogoAnimation13:
; j start address is: 4 (W2)
; i start address is: 16 (W8)
	CP	W2, #8
	BRA LT	L__dd_printLogoAnimation67
	GOTO	L_dd_printLogoAnimation14
L__dd_printLogoAnimation67:
;dd_graphic_controller.c,272 :: 		frameBuff[j*64+i] = 0xFF;
	SL	W2, #6, W0
	ADD	W0, W8, W1
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,273 :: 		frameBuff[j*64+i+y_center+new_y_border] = 0xFF;
	SL	W2, #6, W0
	ADD	W0, W8, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W1
	ADD	W14, #10, W0
	SE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,270 :: 		for (j=0; j<8; j++)
; j start address is: 6 (W3)
	ADD	W2, #1, W3
; j end address is: 4 (W2)
;dd_graphic_controller.c,274 :: 		}
; j end address is: 6 (W3)
	MOV	W3, W2
	GOTO	L_dd_printLogoAnimation13
L_dd_printLogoAnimation14:
;dd_graphic_controller.c,268 :: 		for (i=0; i<=17-new_y_border; i++)
	INC	W8
;dd_graphic_controller.c,275 :: 		}
; i end address is: 16 (W8)
	GOTO	L_dd_printLogoAnimation10
L_dd_printLogoAnimation11:
;dd_graphic_controller.c,276 :: 		for (new_y=-new_y_border; new_y<=new_y_border; new_y++)
	MOV.B	[W14+10], W1
	ADD	W14, #6, W0
	SUBR.B	W1, #0, [W0]
L_dd_printLogoAnimation16:
	MOV.B	[W14+6], W1
	ADD	W14, #10, W0
	CP.B	W1, [W0]
	BRA LE	L__dd_printLogoAnimation68
	GOTO	L_dd_printLogoAnimation17
L__dd_printLogoAnimation68:
;dd_graphic_controller.c,278 :: 		old_y = round(new_y/cos_angle);
	ADD	W14, #6, W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	MOV.D	W0, W10
	CALL	_round
; old_y start address is: 12 (W6)
	MOV.B	W0, W6
;dd_graphic_controller.c,279 :: 		for (page = 0; page<8; page++)
; page start address is: 14 (W7)
	CLR	W7
; page end address is: 14 (W7)
	MOV.B	W7, W4
L_dd_printLogoAnimation19:
; page start address is: 8 (W4)
; old_y start address is: 12 (W6)
; old_y end address is: 12 (W6)
	CP.B	W4, #8
	BRA LTU	L__dd_printLogoAnimation69
	GOTO	L_dd_printLogoAnimation20
L__dd_printLogoAnimation69:
; old_y end address is: 12 (W6)
;dd_graphic_controller.c,281 :: 		i = page*2*64+old_y+y_center;
; old_y start address is: 12 (W6)
	ZE	W4, W0
	SL	W0, #1, W0
	SL	W0, #6, W1
	SE	W6, W0
	ADD	W1, W0, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W3
;dd_graphic_controller.c,282 :: 		j = page*64+new_y+y_center;
	ZE	W4, W0
	SL	W0, #6, W1
	ADD	W14, #6, W0
	SE	[W0], W0
	ADD	W1, W0, W1
	ADD	W14, #8, W0
	ADD	W1, [W0], W1
;dd_graphic_controller.c,283 :: 		frameBuff[j] = DYNAMIS_LOGO[i];
	MOV	#lo_addr(_frameBuff), W0
	ADD	W1, [W0], W2
	MOV	#lo_addr(dd_graphic_controller_DYNAMIS_LOGO), W0
	ADD	W0, W3, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	MOV.B	W0, [W2]
;dd_graphic_controller.c,279 :: 		for (page = 0; page<8; page++)
; page start address is: 14 (W7)
	ADD.B	W4, #1, W7
; page end address is: 8 (W4)
;dd_graphic_controller.c,284 :: 		}
; old_y end address is: 12 (W6)
; page end address is: 14 (W7)
	MOV.B	W7, W4
	GOTO	L_dd_printLogoAnimation19
L_dd_printLogoAnimation20:
;dd_graphic_controller.c,276 :: 		for (new_y=-new_y_border; new_y<=new_y_border; new_y++)
	MOV.B	[W14+6], W1
	ADD	W14, #6, W0
	ADD.B	W1, #1, [W0]
;dd_graphic_controller.c,285 :: 		}
	GOTO	L_dd_printLogoAnimation16
L_dd_printLogoAnimation17:
;dd_graphic_controller.c,286 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,287 :: 		Delay_Cyc(floor(pow(k*8,2)/30000+new_y_border/10), k*700);
	MOV	[W14+4], W1
	MOV	#700, W0
	MUL.SS	W1, W0, W0
	MOV	W0, [W14+22]
	MOV	[W14+4], W0
	SL	W0, #3, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W12
	MOV	#16384, W13
	MOV.D	W0, W10
	CALL	_pow
	MOV	#24576, W2
	MOV	#18154, W3
	CALL	__Div_FP
	MOV	W0, [W14+18]
	MOV	W1, [W14+20]
	ADD	W14, #10, W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+18], W2
	MOV	[W14+20], W3
	CALL	__AddSub_FP
	MOV.D	W0, W10
	CALL	_floor
	CALL	__Float2Longint
	MOV	[W14+22], W2
	MOV	W2, W11
	MOV	W0, W10
	CALL	_Delay_Cyc
;dd_graphic_controller.c,263 :: 		for (k=5; k<=120; k++){
	MOV	[W14+4], W1
	ADD	W14, #4, W0
	ADD	W1, #1, [W0]
;dd_graphic_controller.c,288 :: 		}
	GOTO	L_dd_printLogoAnimation6
L_dd_printLogoAnimation7:
;dd_graphic_controller.c,289 :: 		}
L_end_dd_printLogoAnimation:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_printLogoAnimation

_dd_GraphicController_onTimerInterrupt:

;dd_graphic_controller.c,292 :: 		void dd_GraphicController_onTimerInterrupt(void)
;dd_graphic_controller.c,297 :: 		if ( __counter == 10 )
	PUSH	W10
	MOV	___counter, W0
	CP	W0, #10
	BRA Z	L__dd_GraphicController_onTimerInterrupt71
	GOTO	L_dd_GraphicController_onTimerInterrupt22
L__dd_GraphicController_onTimerInterrupt71:
;dd_graphic_controller.c,299 :: 		dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;dd_graphic_controller.c,300 :: 		}
L_dd_GraphicController_onTimerInterrupt22:
;dd_graphic_controller.c,301 :: 		if (__counter == 20)
	MOV	___counter, W0
	CP	W0, #20
	BRA Z	L__dd_GraphicController_onTimerInterrupt72
	GOTO	L_dd_GraphicController_onTimerInterrupt23
L__dd_GraphicController_onTimerInterrupt72:
;dd_graphic_controller.c,303 :: 		dSignalLed_unset(DSIGNAL_LED_RED_RIGHT);
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
;dd_graphic_controller.c,304 :: 		__counter = 0;
	CLR	W0
	MOV	W0, ___counter
;dd_graphic_controller.c,305 :: 		}
L_dd_GraphicController_onTimerInterrupt23:
;dd_graphic_controller.c,307 :: 		__counter++;
	MOV	#1, W1
	MOV	#lo_addr(___counter), W0
	ADD	W1, [W0], [W0]
;dd_graphic_controller.c,309 :: 		if(dd_onStartup)
	MOV	#lo_addr(_dd_onStartup), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt73
	GOTO	L_dd_GraphicController_onTimerInterrupt24
L__dd_GraphicController_onTimerInterrupt73:
;dd_graphic_controller.c,311 :: 		dd_tmr1Counter++;
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_tmr1Counter), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,312 :: 		if(dd_tmr1Counter  >= dd_onStartupCounterLimit)
	MOV	#lo_addr(_dd_tmr1Counter), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_onStartupCounterLimit), W0
	CP.B	W1, [W0]
	BRA GEU	L__dd_GraphicController_onTimerInterrupt74
	GOTO	L_dd_GraphicController_onTimerInterrupt25
L__dd_GraphicController_onTimerInterrupt74:
;dd_graphic_controller.c,314 :: 		dd_onStartup = 0;
	MOV	#lo_addr(_dd_onStartup), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,315 :: 		dd_tmr1Counter = 0;
	MOV	#lo_addr(_dd_tmr1Counter), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,316 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,317 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,318 :: 		}
L_dd_GraphicController_onTimerInterrupt25:
;dd_graphic_controller.c,319 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt26
L_dd_GraphicController_onTimerInterrupt24:
;dd_graphic_controller.c,322 :: 		if (dd_notificationFlag) {
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt75
	GOTO	L_dd_GraphicController_onTimerInterrupt27
L__dd_GraphicController_onTimerInterrupt75:
;dd_graphic_controller.c,323 :: 		if(dd_notificationIsTimed)
	MOV	#lo_addr(_dd_notificationIsTimed), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt76
	GOTO	L_dd_GraphicController_onTimerInterrupt28
L__dd_GraphicController_onTimerInterrupt76:
;dd_graphic_controller.c,324 :: 		dd_GraphicController_handleNotification();
	CALL	_dd_GraphicController_handleNotification
L_dd_GraphicController_onTimerInterrupt28:
;dd_graphic_controller.c,325 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt29
L_dd_GraphicController_onTimerInterrupt27:
;dd_graphic_controller.c,327 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,328 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,329 :: 		Lcd_PrintFrame();
	CALL	_Lcd_PrintFrame
;dd_graphic_controller.c,330 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,331 :: 		}
L_dd_GraphicController_onTimerInterrupt29:
;dd_graphic_controller.c,332 :: 		}
L_dd_GraphicController_onTimerInterrupt26:
;dd_graphic_controller.c,367 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,379 :: 		}
L_end_dd_GraphicController_onTimerInterrupt:
	POP	W10
	RETURN
; end of _dd_GraphicController_onTimerInterrupt
