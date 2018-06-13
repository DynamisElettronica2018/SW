
_dd_GraphicController_timerSetup:

;dd_graphic_controller.c,47 :: 		void dd_GraphicController_timerSetup(void) {
;dd_graphic_controller.c,48 :: 		setInterruptPriority(TIMER1_DEVICE, LOW_PRIORITY);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#5, W11
	MOV.B	#1, W10
	CALL	_setInterruptPriority
;dd_graphic_controller.c,49 :: 		setTimer(TIMER1_DEVICE, FRAME_PERIOD);
	MOV	#52429, W11
	MOV	#15820, W12
	MOV.B	#1, W10
	CALL	_setTimer
;dd_graphic_controller.c,50 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,51 :: 		}
L_end_dd_GraphicController_timerSetup:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_timerSetup

_dd_GraphicController_getTmrCounterLimit:

;dd_graphic_controller.c,56 :: 		unsigned char dd_GraphicController_getTmrCounterLimit(unsigned int period)
;dd_graphic_controller.c,58 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
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
;dd_graphic_controller.c,59 :: 		}
;dd_graphic_controller.c,58 :: 		return (unsigned char) floor(period/1000.0*FRAME_RATE);
;dd_graphic_controller.c,59 :: 		}
L_end_dd_GraphicController_getTmrCounterLimit:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_getTmrCounterLimit

_dd_GraphicController_startupLogo:

;dd_graphic_controller.c,61 :: 		void dd_GraphicController_startupLogo(void) {
;dd_graphic_controller.c,62 :: 		dd_onStartupCounterLimit = dd_GraphicController_getTmrCounterLimit(STARTUP_LOGO_PERIOD);
	PUSH	W10
	PUSH	W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_getTmrCounterLimit
	MOV	#lo_addr(_dd_onStartupCounterLimit), W1
	MOV.B	W0, [W1]
;dd_graphic_controller.c,65 :: 		dd_onStartup = 1;
	MOV	#lo_addr(_dd_onStartup), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,66 :: 		eGlcd(Glcd_Image(DYNAMIS_LOGO));
	MOV	#___Lib_System_DefaultPage, W0
	MOV	#lo_addr(dd_graphic_controller_DYNAMIS_LOGO), W10
	MOV	W0, W11
	CALL	_Glcd_Image
;dd_graphic_controller.c,67 :: 		}
L_end_dd_GraphicController_startupLogo:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_startupLogo

_dd_GraphicController_turnOnBacklight:

;dd_graphic_controller.c,69 :: 		void dd_GraphicController_turnOnBacklight(void) {
;dd_graphic_controller.c,70 :: 		DD_BACKLIGHT_PIN = TRUE;
	BSET	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,71 :: 		}
L_end_dd_GraphicController_turnOnBacklight:
	RETURN
; end of _dd_GraphicController_turnOnBacklight

_dd_GraphicController_turnOffBacklight:

;dd_graphic_controller.c,73 :: 		void dd_GraphicController_turnOffBacklight(void) {
;dd_graphic_controller.c,74 :: 		DD_BACKLIGHT_PIN = FALSE;
	BCLR	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,75 :: 		}
L_end_dd_GraphicController_turnOffBacklight:
	RETURN
; end of _dd_GraphicController_turnOffBacklight

_dd_GraphicController_switchBacklight:

;dd_graphic_controller.c,77 :: 		void dd_GraphicController_switchBacklight(void) {
;dd_graphic_controller.c,78 :: 		DD_BACKLIGHT_PIN = !DD_BACKLIGHT_PIN;
	BTG	RG13_bit, BitPos(RG13_bit+0)
;dd_graphic_controller.c,79 :: 		}
L_end_dd_GraphicController_switchBacklight:
	RETURN
; end of _dd_GraphicController_switchBacklight

_dd_GraphicController_init:

;dd_graphic_controller.c,81 :: 		void dd_GraphicController_init(void) {
;dd_graphic_controller.c,83 :: 		DD_BACKLIGHT_PIN_DIRECTION = OUTPUT;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	BCLR	TRISG13_bit, BitPos(TRISG13_bit+0)
;dd_graphic_controller.c,84 :: 		dd_GraphicController_turnOnBacklight();
	CALL	_dd_GraphicController_turnOnBacklight
;dd_graphic_controller.c,85 :: 		eGlcd_init();
	CALL	_eGlcd_init
;dd_graphic_controller.c,86 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,87 :: 		eGlcd_setFont(DD_Dashboard_Font);
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(dd_graphic_controller_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;dd_graphic_controller.c,88 :: 		if (!dHardReset_hasBeenReset()) {
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__dd_GraphicController_init30
	GOTO	L_dd_GraphicController_init0
L__dd_GraphicController_init30:
;dd_graphic_controller.c,89 :: 		dd_GraphicController_startupLogo();
	CALL	_dd_GraphicController_startupLogo
;dd_graphic_controller.c,90 :: 		}
L_dd_GraphicController_init0:
;dd_graphic_controller.c,91 :: 		dd_GraphicController_timerSetup();
	CALL	_dd_GraphicController_timerSetup
;dd_graphic_controller.c,92 :: 		dd_GraphicController_forceFullFrameUpdate();
	CALL	_dd_GraphicController_forceFullFrameUpdate
;dd_graphic_controller.c,93 :: 		}
L_end_dd_GraphicController_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_init

_dd_GraphicController_invertColors:

;dd_graphic_controller.c,95 :: 		void dd_GraphicController_invertColors(void) {
;dd_graphic_controller.c,96 :: 		dd_GraphicController_queueColorInversion();
	CALL	_dd_GraphicController_queueColorInversion
;dd_graphic_controller.c,97 :: 		eGlcd_invertColors();
	CALL	_eGlcd_invertColors
;dd_graphic_controller.c,98 :: 		dd_GraphicController_forceNextFrameUpdate();
	CALL	_dd_GraphicController_forceNextFrameUpdate
;dd_graphic_controller.c,99 :: 		}
L_end_dd_GraphicController_invertColors:
	RETURN
; end of _dd_GraphicController_invertColors

_dd_GraphicController_areColorsInverted:

;dd_graphic_controller.c,101 :: 		char dd_GraphicController_areColorsInverted(void) {
;dd_graphic_controller.c,102 :: 		return BLACK == PIXEL_OFF;
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__dd_GraphicController_areColorsInverted33
	INC.B	W0
L__dd_GraphicController_areColorsInverted33:
;dd_graphic_controller.c,103 :: 		}
L_end_dd_GraphicController_areColorsInverted:
	RETURN
; end of _dd_GraphicController_areColorsInverted

_dd_GraphicController_setInterface:

;dd_graphic_controller.c,105 :: 		void dd_GraphicController_setInterface(Interface interface) {
;dd_graphic_controller.c,106 :: 		dd_isInterfaceChangedFromLastFrame = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,107 :: 		dd_onInterfaceChange = TRUE;
	MOV	#lo_addr(_dd_onInterfaceChange), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,108 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,109 :: 		dd_onInterfaceChangeCounterLimit = dd_GraphicController_getTmrCounterLimit(OP_MODE_POPUP_PERIOD);
	PUSH	W10
	MOV	#700, W10
	CALL	_dd_GraphicController_getTmrCounterLimit
	POP	W10
	MOV	#lo_addr(_dd_onInterfaceChangeCounterLimit), W1
	MOV.B	W0, [W1]
;dd_graphic_controller.c,113 :: 		dd_currentInterface = interface;
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	W10, [W0]
;dd_graphic_controller.c,114 :: 		}
L_end_dd_GraphicController_setInterface:
	RETURN
; end of _dd_GraphicController_setInterface

_dd_GraphicController_setCollectionInterface:

;dd_graphic_controller.c,116 :: 		void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title) {
;dd_graphic_controller.c,118 :: 		dd_GraphicController_setInterface(interface);
	PUSH	W10
	PUSH.D	W12
	PUSH	W11
	CALL	_dd_GraphicController_setInterface
;dd_graphic_controller.c,120 :: 		dd_Interface_init[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
	POP	W11
	POP.D	W12
;dd_graphic_controller.c,121 :: 		if ( strlen(title) < MAX_INTERFACE_TITLE_LENGTH )
	MOV	W13, W10
	CALL	_strlen
	CP	W0, #20
	BRA LT	L__dd_GraphicController_setCollectionInterface36
	GOTO	L_dd_GraphicController_setCollectionInterface1
L__dd_GraphicController_setCollectionInterface36:
;dd_graphic_controller.c,122 :: 		strcpy(dd_currentInterfaceTitle, title);
	PUSH	W11
	MOV	W13, W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W10
	CALL	_strcpy
	POP	W11
L_dd_GraphicController_setCollectionInterface1:
;dd_graphic_controller.c,123 :: 		dd_currentIndicators = indicator_collection;
	MOV	W11, _dd_currentIndicators
;dd_graphic_controller.c,124 :: 		dd_currentIndicatorsCount = indicator_count;
	MOV	#lo_addr(_dd_currentIndicatorsCount), W0
	MOV.B	W12, [W0]
;dd_graphic_controller.c,129 :: 		}
L_end_dd_GraphicController_setCollectionInterface:
	POP	W10
	RETURN
; end of _dd_GraphicController_setCollectionInterface

_dd_GraphicController_getInterface:

;dd_graphic_controller.c,131 :: 		Interface dd_GraphicController_getInterface(void) {
;dd_graphic_controller.c,132 :: 		return dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,133 :: 		}
L_end_dd_GraphicController_getInterface:
	RETURN
; end of _dd_GraphicController_getInterface

_dd_GraphicController_saveCurrentInterface:

;dd_graphic_controller.c,135 :: 		void dd_GraphicController_saveCurrentInterface(void) {
;dd_graphic_controller.c,136 :: 		strcpy(dd_lastInterfaceTitle, dd_currentInterfaceTitle);
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dd_currentInterfaceTitle), W11
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterfaceTitle), W10
	CALL	_strcpy
;dd_graphic_controller.c,137 :: 		dd_lastInterface = dd_currentInterface;
	MOV	#lo_addr(dd_graphic_controller_dd_lastInterface), W1
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	MOV.B	[W0], [W1]
;dd_graphic_controller.c,138 :: 		}
L_end_dd_GraphicController_saveCurrentInterface:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_saveCurrentInterface

_dd_GraphicController_setNotificationTimeout:

;dd_graphic_controller.c,141 :: 		void dd_GraphicController_setNotificationTimeout(float time) {
;dd_graphic_controller.c,142 :: 		dd_notificationTicks = (unsigned int) ((time / FRAME_PERIOD) + 0.5);
	MOV	#52429, W2
	MOV	#15820, W3
	MOV.D	W10, W0
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16128, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	W0, _dd_notificationTicks
;dd_graphic_controller.c,143 :: 		}
L_end_dd_GraphicController_setNotificationTimeout:
	RETURN
; end of _dd_GraphicController_setNotificationTimeout

_dd_GraphicController_setNotificationFlag:

;dd_graphic_controller.c,145 :: 		void dd_GraphicController_setNotificationFlag (void){
;dd_graphic_controller.c,146 :: 		dd_notificationFlag = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,147 :: 		}
L_end_dd_GraphicController_setNotificationFlag:
	RETURN
; end of _dd_GraphicController_setNotificationFlag

_dd_GraphicController_unsetNotificationFlag:

;dd_graphic_controller.c,149 :: 		void dd_GraphicController_unsetNotificationFlag (void){
;dd_graphic_controller.c,150 :: 		dd_notificationFlag = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,151 :: 		}
L_end_dd_GraphicController_unsetNotificationFlag:
	RETURN
; end of _dd_GraphicController_unsetNotificationFlag

_dd_GraphicController_clearNotification:

;dd_graphic_controller.c,153 :: 		void dd_GraphicController_clearNotification(void) {
;dd_graphic_controller.c,154 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,155 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,156 :: 		dd_GraphicController_unsetNotificationFlag();
	CALL	_dd_GraphicController_unsetNotificationFlag
;dd_graphic_controller.c,157 :: 		}
L_end_dd_GraphicController_clearNotification:
	RETURN
; end of _dd_GraphicController_clearNotification

_dd_GraphicController_fireNotification:

;dd_graphic_controller.c,159 :: 		void dd_GraphicController_fireNotification(char *text, NotificationType type) {
;dd_graphic_controller.c,160 :: 		strcpy(dd_notificationText, text);
	PUSH	W10
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_strcpy
;dd_graphic_controller.c,161 :: 		dd_printMessage(dd_notificationText);
	MOV	#lo_addr(_dd_notificationText), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,162 :: 		dd_GraphicController_setNotificationFlag ();
	CALL	_dd_GraphicController_setNotificationFlag
;dd_graphic_controller.c,163 :: 		}
L_end_dd_GraphicController_fireNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireNotification

_dd_GraphicController_fireTimedNotification:

;dd_graphic_controller.c,168 :: 		void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type) {
;dd_graphic_controller.c,169 :: 		dd_GraphicController_getTmrCounterLimit(time);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W11
	CALL	_dd_GraphicController_getTmrCounterLimit
	POP	W11
	POP	W12
;dd_graphic_controller.c,170 :: 		dd_GraphicController_fireNotification(text, type);
	MOV	W11, W10
	MOV.B	W12, W11
	CALL	_dd_GraphicController_fireNotification
;dd_graphic_controller.c,171 :: 		}
L_end_dd_GraphicController_fireTimedNotification:
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_fireTimedNotification

_dd_GraphicController_handleNotification:

;dd_graphic_controller.c,173 :: 		void dd_GraphicController_handleNotification(void) {
;dd_graphic_controller.c,174 :: 		if (dd_notificationTicks > 0) {
	MOV	_dd_notificationTicks, W0
	CP	W0, #0
	BRA GTU	L__dd_GraphicController_handleNotification46
	GOTO	L_dd_GraphicController_handleNotification2
L__dd_GraphicController_handleNotification46:
;dd_graphic_controller.c,175 :: 		dd_notificationTicks -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_dd_notificationTicks), W0
	SUBR	W1, [W0], [W0]
;dd_graphic_controller.c,176 :: 		if (dd_notificationTicks == 0) {
	MOV	_dd_notificationTicks, W0
	CP	W0, #0
	BRA Z	L__dd_GraphicController_handleNotification47
	GOTO	L_dd_GraphicController_handleNotification3
L__dd_GraphicController_handleNotification47:
;dd_graphic_controller.c,177 :: 		dd_GraphicController_clearNotification();
	CALL	_dd_GraphicController_clearNotification
;dd_graphic_controller.c,178 :: 		}
L_dd_GraphicController_handleNotification3:
;dd_graphic_controller.c,179 :: 		}
L_dd_GraphicController_handleNotification2:
;dd_graphic_controller.c,180 :: 		}
L_end_dd_GraphicController_handleNotification:
	RETURN
; end of _dd_GraphicController_handleNotification

_dd_GraphicController_printFrame:

;dd_graphic_controller.c,182 :: 		void dd_GraphicController_printFrame(void) {
;dd_graphic_controller.c,183 :: 		if (dd_isColorInversionQueued) {
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_printFrame49
	GOTO	L_dd_GraphicController_printFrame4
L__dd_GraphicController_printFrame49:
;dd_graphic_controller.c,184 :: 		eGlcd_invertColors();
	CALL	_eGlcd_invertColors
;dd_graphic_controller.c,185 :: 		dd_isColorInversionQueued = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,186 :: 		}
L_dd_GraphicController_printFrame4:
;dd_graphic_controller.c,187 :: 		if (dd_isInterfaceChangedFromLastFrame || dd_isNextFrameUpdateForced) {
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W0
	CP0.B	[W0]
	BRA Z	L__dd_GraphicController_printFrame50
	GOTO	L__dd_GraphicController_printFrame22
L__dd_GraphicController_printFrame50:
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W0
	CP0.B	[W0]
	BRA Z	L__dd_GraphicController_printFrame51
	GOTO	L__dd_GraphicController_printFrame21
L__dd_GraphicController_printFrame51:
	GOTO	L_dd_GraphicController_printFrame7
L__dd_GraphicController_printFrame22:
L__dd_GraphicController_printFrame21:
;dd_graphic_controller.c,188 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,189 :: 		dd_GraphicController_forceFullFrameUpdate();
	CALL	_dd_GraphicController_forceFullFrameUpdate
;dd_graphic_controller.c,190 :: 		dd_isInterfaceChangedFromLastFrame = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,191 :: 		}
L_dd_GraphicController_printFrame7:
;dd_graphic_controller.c,192 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,193 :: 		if (dd_GraphicController_isFrameUpdateForced) {
	MOV	#lo_addr(_dd_GraphicController_isFrameUpdateForced), W0
	CP0	W0
	BRA NZ	L__dd_GraphicController_printFrame52
	GOTO	L_dd_GraphicController_printFrame8
L__dd_GraphicController_printFrame52:
;dd_graphic_controller.c,194 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,195 :: 		}
L_dd_GraphicController_printFrame8:
;dd_graphic_controller.c,196 :: 		if (dd_isNextFrameUpdateForced) {
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_printFrame53
	GOTO	L_dd_GraphicController_printFrame9
L__dd_GraphicController_printFrame53:
;dd_graphic_controller.c,197 :: 		dd_isNextFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,198 :: 		}
L_dd_GraphicController_printFrame9:
;dd_graphic_controller.c,199 :: 		}
L_end_dd_GraphicController_printFrame:
	RETURN
; end of _dd_GraphicController_printFrame

_dd_GraphicController_forceFullFrameUpdate:

;dd_graphic_controller.c,202 :: 		void dd_GraphicController_forceFullFrameUpdate(void) {              //inutile
;dd_graphic_controller.c,203 :: 		dd_isFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,204 :: 		}
L_end_dd_GraphicController_forceFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceFullFrameUpdate

_dd_GraphicController_releaseFullFrameUpdate:

;dd_graphic_controller.c,206 :: 		void dd_GraphicController_releaseFullFrameUpdate(void) {
;dd_graphic_controller.c,207 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,208 :: 		}
L_end_dd_GraphicController_releaseFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_releaseFullFrameUpdate

_dd_GraphicController_forceNextFrameUpdate:

;dd_graphic_controller.c,210 :: 		void dd_GraphicController_forceNextFrameUpdate(void) {
;dd_graphic_controller.c,211 :: 		dd_isNextFrameUpdateForced = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isNextFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,212 :: 		}
L_end_dd_GraphicController_forceNextFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceNextFrameUpdate

_dd_GraphicController_isFrameUpdateForced:

;dd_graphic_controller.c,214 :: 		char dd_GraphicController_isFrameUpdateForced(void) {
;dd_graphic_controller.c,215 :: 		return dd_isFrameUpdateForced;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,216 :: 		}
L_end_dd_GraphicController_isFrameUpdateForced:
	RETURN
; end of _dd_GraphicController_isFrameUpdateForced

_dd_GraphicController_queueColorInversion:

;dd_graphic_controller.c,218 :: 		void dd_GraphicController_queueColorInversion(void) {
;dd_graphic_controller.c,219 :: 		dd_isColorInversionQueued = TRUE;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,220 :: 		}
L_end_dd_GraphicController_queueColorInversion:
	RETURN
; end of _dd_GraphicController_queueColorInversion

_dd_GraphicController_isColorInversionQueued:

;dd_graphic_controller.c,222 :: 		char dd_GraphicController_isColorInversionQueued(void) {               //inutile
;dd_graphic_controller.c,223 :: 		return dd_isColorInversionQueued;
	MOV	#lo_addr(dd_graphic_controller_dd_isColorInversionQueued), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,224 :: 		}
L_end_dd_GraphicController_isColorInversionQueued:
	RETURN
; end of _dd_GraphicController_isColorInversionQueued

_dd_GraphicController_onTimerInterrupt:

;dd_graphic_controller.c,227 :: 		void dd_GraphicController_onTimerInterrupt(void)
;dd_graphic_controller.c,229 :: 		dRpm_updateLedStripe();
	PUSH	W10
	CALL	_dRpm_updateLedStripe
;dd_graphic_controller.c,255 :: 		if(dd_onStartup)
	MOV	#lo_addr(_dd_onStartup), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt61
	GOTO	L_dd_GraphicController_onTimerInterrupt10
L__dd_GraphicController_onTimerInterrupt61:
;dd_graphic_controller.c,258 :: 		dd_tmr1Counter++;
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_tmr1Counter), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,259 :: 		if(dd_tmr1Counter  >= dd_onStartupCounterLimit)
	MOV	#lo_addr(_dd_tmr1Counter), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_onStartupCounterLimit), W0
	CP.B	W1, [W0]
	BRA GEU	L__dd_GraphicController_onTimerInterrupt62
	GOTO	L_dd_GraphicController_onTimerInterrupt11
L__dd_GraphicController_onTimerInterrupt62:
;dd_graphic_controller.c,261 :: 		dd_onStartup = 0;
	MOV	#lo_addr(_dd_onStartup), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,262 :: 		dd_tmr1Counter = 0;
	MOV	#lo_addr(_dd_tmr1Counter), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,263 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,264 :: 		}
L_dd_GraphicController_onTimerInterrupt11:
;dd_graphic_controller.c,265 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt12
L_dd_GraphicController_onTimerInterrupt10:
;dd_graphic_controller.c,268 :: 		if(dd_isInterfaceChangedFromLastFrame)
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt63
	GOTO	L_dd_GraphicController_onTimerInterrupt13
L__dd_GraphicController_onTimerInterrupt63:
;dd_graphic_controller.c,270 :: 		eGlcd_clear();
	CALL	_eGlcd_clear
;dd_graphic_controller.c,272 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,274 :: 		dd_printMessage(dd_currentInterfaceTitle);
	MOV	#lo_addr(_dd_currentInterfaceTitle), W10
	CALL	_dd_printMessage
;dd_graphic_controller.c,276 :: 		dd_isInterfaceChangedFromLastFrame = 0;
	MOV	#lo_addr(dd_graphic_controller_dd_isInterfaceChangedFromLastFrame), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,277 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt14
L_dd_GraphicController_onTimerInterrupt13:
;dd_graphic_controller.c,278 :: 		else if (dd_notificationFlag) {
	MOV	#lo_addr(dd_graphic_controller_dd_notificationFlag), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt64
	GOTO	L_dd_GraphicController_onTimerInterrupt15
L__dd_GraphicController_onTimerInterrupt64:
;dd_graphic_controller.c,279 :: 		dd_GraphicController_handleNotification();
	CALL	_dd_GraphicController_handleNotification
;dd_graphic_controller.c,280 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt16
L_dd_GraphicController_onTimerInterrupt15:
;dd_graphic_controller.c,281 :: 		else if (dd_onInterfaceChange)
	MOV	#lo_addr(_dd_onInterfaceChange), W0
	CP0.B	[W0]
	BRA NZ	L__dd_GraphicController_onTimerInterrupt65
	GOTO	L_dd_GraphicController_onTimerInterrupt17
L__dd_GraphicController_onTimerInterrupt65:
;dd_graphic_controller.c,290 :: 		dd_tmr1Counter++;
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_tmr1Counter), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,291 :: 		if(dd_tmr1Counter  >= dd_onInterfaceChangeCounterLimit)
	MOV	#lo_addr(_dd_tmr1Counter), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_onInterfaceChangeCounterLimit), W0
	CP.B	W1, [W0]
	BRA GEU	L__dd_GraphicController_onTimerInterrupt66
	GOTO	L_dd_GraphicController_onTimerInterrupt18
L__dd_GraphicController_onTimerInterrupt66:
;dd_graphic_controller.c,294 :: 		dd_onInterfaceChange = 0;
	MOV	#lo_addr(_dd_onInterfaceChange), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,295 :: 		dd_tmr1Counter = 0;
	MOV	#lo_addr(_dd_tmr1Counter), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,296 :: 		eGlcd_fill(WHITE);
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W10
	CALL	_eGlcd_fill
;dd_graphic_controller.c,297 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,298 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,299 :: 		}
L_dd_GraphicController_onTimerInterrupt18:
;dd_graphic_controller.c,300 :: 		}
	GOTO	L_dd_GraphicController_onTimerInterrupt19
L_dd_GraphicController_onTimerInterrupt17:
;dd_graphic_controller.c,304 :: 		dd_Interface_print[dd_currentInterface]();
	MOV	#lo_addr(dd_graphic_controller_dd_currentInterface), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_Interface_print), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;dd_graphic_controller.c,305 :: 		dd_isFrameUpdateForced = FALSE;
	MOV	#lo_addr(dd_graphic_controller_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,306 :: 		}
L_dd_GraphicController_onTimerInterrupt19:
L_dd_GraphicController_onTimerInterrupt16:
L_dd_GraphicController_onTimerInterrupt14:
;dd_graphic_controller.c,310 :: 		}
L_dd_GraphicController_onTimerInterrupt12:
;dd_graphic_controller.c,312 :: 		clearTimer1();
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,324 :: 		}
L_end_dd_GraphicController_onTimerInterrupt:
	POP	W10
	RETURN
; end of _dd_GraphicController_onTimerInterrupt
