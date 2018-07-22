
_d_UI_CruiseModeInit:

;d_operating_modes.c,144 :: 		void d_UI_CruiseModeInit() {
;d_operating_modes.c,145 :: 		dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Race");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr77_d_operating_modes), W13
	MOV.B	#25, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	CLR	W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,146 :: 		d_traction_control_setOldValue();
	CALL	_d_traction_control_setOldValue
;d_operating_modes.c,147 :: 		}
L_end_d_UI_CruiseModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_CruiseModeInit

_d_UI_AccModeInit:

;d_operating_modes.c,149 :: 		void d_UI_AccModeInit(){
;d_operating_modes.c,150 :: 		dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Acceleration");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr78_d_operating_modes), W13
	MOV.B	#25, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	CLR	W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,151 :: 		}
L_end_d_UI_AccModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_AccModeInit

_d_UI_DebugModeInit:

;d_operating_modes.c,153 :: 		void d_UI_DebugModeInit() {
;d_operating_modes.c,154 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carParameters, dd_carParametersCount, "Debug");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr79_d_operating_modes), W13
	MOV.B	#25, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,155 :: 		}
L_end_d_UI_DebugModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_DebugModeInit

_d_UI_BoardDebugModeInit:

;d_operating_modes.c,157 :: 		void d_UI_BoardDebugModeInit() {
;d_operating_modes.c,158 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carBoards, dd_carBoardsCount, "Boards");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr80_d_operating_modes), W13
	MOV.B	#13, W12
	MOV	#lo_addr(d_operating_modes_dd_carBoards), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,159 :: 		}
L_end_d_UI_BoardDebugModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_BoardDebugModeInit

_d_UI_AutocrossModeInit:

;d_operating_modes.c,161 :: 		void d_UI_AutocrossModeInit() {
;d_operating_modes.c,162 :: 		dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Autocross");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr81_d_operating_modes), W13
	MOV.B	#25, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	CLR	W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,163 :: 		d_traction_control_setOldValue();
	CALL	_d_traction_control_setOldValue
;d_operating_modes.c,164 :: 		}
L_end_d_UI_AutocrossModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_AutocrossModeInit

_d_UI_CruiseModeClose:

;d_operating_modes.c,167 :: 		void d_UI_CruiseModeClose(){
;d_operating_modes.c,168 :: 		}
L_end_d_UI_CruiseModeClose:
	RETURN
; end of _d_UI_CruiseModeClose

_d_UI_AccModeClose:

;d_operating_modes.c,170 :: 		void d_UI_AccModeClose(){
;d_operating_modes.c,171 :: 		dAcc_stopAutoAccelerationFromSW();
	CALL	_dAcc_stopAutoAccelerationFromSW
;d_operating_modes.c,172 :: 		}
L_end_d_UI_AccModeClose:
	RETURN
; end of _d_UI_AccModeClose

_d_UI_DebugModeClose:

;d_operating_modes.c,174 :: 		void d_UI_DebugModeClose(){
;d_operating_modes.c,175 :: 		}
L_end_d_UI_DebugModeClose:
	RETURN
; end of _d_UI_DebugModeClose

_d_UI_BoardDebugModeClose:

;d_operating_modes.c,177 :: 		void d_UI_BoardDebugModeClose(){
;d_operating_modes.c,178 :: 		}
L_end_d_UI_BoardDebugModeClose:
	RETURN
; end of _d_UI_BoardDebugModeClose

_d_UI_AutocrossModeClose:

;d_operating_modes.c,180 :: 		void d_UI_AutocrossModeClose(){
;d_operating_modes.c,181 :: 		dAutocross_stopAutocrossFromSW();
	CALL	_dAutocross_stopAutocrossFromSW
;d_operating_modes.c,182 :: 		}
L_end_d_UI_AutocrossModeClose:
	RETURN
; end of _d_UI_AutocrossModeClose

_d_DashboardSetting_updateValue:

;d_operating_modes.c,232 :: 		void d_DashboardSetting_updateValue(IntegerIndicator* ind, int val) {
;d_operating_modes.c,233 :: 		ind->value = val;
	PUSH	W11
	ADD	W10, #20, W0
	MOV	W11, [W0]
;d_operating_modes.c,234 :: 		strcpy(ind->base.label, dd_carParameters[ind->value]->name);
	ADD	W10, #20, W0
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	ADD	W0, #2, W1
	ADD	W10, #10, W0
	PUSH	W10
	MOV	[W1], W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W10
;d_operating_modes.c,235 :: 		ind->base.labelLength = dd_carParameters[ind->value]->nameLength;
	ADD	W10, #9, W2
	ADD	W10, #20, W0
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	ADD	W0, #6, W0
	MOV.B	[W0], [W2]
;d_operating_modes.c,236 :: 		ind->base.pendingPrintUpdate = TRUE;
	ADD	W10, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,237 :: 		}
L_end_d_DashboardSetting_updateValue:
	POP	W11
	RETURN
; end of _d_DashboardSetting_updateValue

_d_UI_SettingsModeInit:

;d_operating_modes.c,239 :: 		void d_UI_SettingsModeInit() {
;d_operating_modes.c,242 :: 		d_DashboardSetting_updateValue(&sett_dash_top_left, TOP_LEFT);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W11
	MOV	#lo_addr(_sett_dash_top_left), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,243 :: 		d_DashboardSetting_updateValue(&sett_dash_top_right, TOP_RIGHT);
	MOV	#1, W11
	MOV	#lo_addr(_sett_dash_top_right), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,244 :: 		d_DashboardSetting_updateValue(&sett_dash_bottom_right, BOTTOM_RIGHT);
	MOV	#2, W11
	MOV	#lo_addr(_sett_dash_bottom_right), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,245 :: 		d_DashboardSetting_updateValue(&sett_dash_bottom_left, BOTTOM_LEFT);
	MOV	#3, W11
	MOV	#lo_addr(_sett_dash_bottom_left), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,247 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_settings, dd_settingsCount, "Settings");
	MOV	#lo_addr(?lstr94_d_operating_modes), W13
	MOV.B	#6, W12
	MOV	#lo_addr(_dd_settings), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,248 :: 		}
L_end_d_UI_SettingsModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_SettingsModeInit

_d_UI_onSettingsChange:
	LNK	#6

;d_operating_modes.c,254 :: 		void d_UI_onSettingsChange(signed char movements) {
;d_operating_modes.c,257 :: 		Indicator* settingIndicator = dd_settings[dd_Menu_selectedLine()];
	PUSH	W10
	PUSH	W11
	PUSH	W10
	CALL	_dd_Menu_selectedLine
	POP	W10
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_dd_settings), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
;d_operating_modes.c,259 :: 		switch (settingIndicator->id) {
	MOV	W0, [W14+4]
	GOTO	L_d_UI_onSettingsChange0
;d_operating_modes.c,260 :: 		case S_INVERT_COLORS:
L_d_UI_onSettingsChange2:
;d_operating_modes.c,261 :: 		dd_GraphicController_invertColors();
	CALL	_dd_GraphicController_invertColors
;d_operating_modes.c,262 :: 		dd_Indicator_switchBoolValueP(&sett_invert_colors.base);
	MOV	#lo_addr(_sett_invert_colors), W10
	CALL	_dd_Indicator_switchBoolValueP
;d_operating_modes.c,263 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,264 :: 		return;
	GOTO	L_end_d_UI_onSettingsChange
;d_operating_modes.c,265 :: 		case S_BYPASS_GEARS:
L_d_UI_onSettingsChange3:
;d_operating_modes.c,266 :: 		if (dGear_isShiftingCheckBypassed()) {
	CALL	_dGear_isShiftingCheckBypassed
	CP0.B	W0
	BRA NZ	L__d_UI_onSettingsChange30
	GOTO	L_d_UI_onSettingsChange4
L__d_UI_onSettingsChange30:
;d_operating_modes.c,267 :: 		dGear_enableShiftCheck();
	CALL	_dGear_enableShiftCheck
;d_operating_modes.c,268 :: 		dd_Indicator_setBoolValueP(&sett_bypass_gears.base, FALSE);
	CLR	W11
	MOV	#lo_addr(_sett_bypass_gears), W10
	CALL	_dd_Indicator_setBoolValueP
;d_operating_modes.c,269 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,270 :: 		} else {
	GOTO	L_d_UI_onSettingsChange5
L_d_UI_onSettingsChange4:
;d_operating_modes.c,271 :: 		dGear_disableShiftCheck();
	CALL	_dGear_disableShiftCheck
;d_operating_modes.c,272 :: 		dd_Indicator_setBoolValueP(&sett_bypass_gears.base, TRUE);
	MOV.B	#1, W11
	MOV	#lo_addr(_sett_bypass_gears), W10
	CALL	_dd_Indicator_setBoolValueP
;d_operating_modes.c,273 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,274 :: 		}
L_d_UI_onSettingsChange5:
;d_operating_modes.c,275 :: 		return;
	GOTO	L_end_d_UI_onSettingsChange
;d_operating_modes.c,276 :: 		default:
L_d_UI_onSettingsChange6:
;d_operating_modes.c,277 :: 		break;
	GOTO	L_d_UI_onSettingsChange1
;d_operating_modes.c,278 :: 		}
L_d_UI_onSettingsChange0:
	MOV	[W14+4], W2
	MOV.B	[W2], W1
	MOV.B	#34, W0
	CP.B	W1, W0
	BRA NZ	L__d_UI_onSettingsChange31
	GOTO	L_d_UI_onSettingsChange2
L__d_UI_onSettingsChange31:
	MOV.B	[W2], W1
	MOV.B	#33, W0
	CP.B	W1, W0
	BRA NZ	L__d_UI_onSettingsChange32
	GOTO	L_d_UI_onSettingsChange3
L__d_UI_onSettingsChange32:
	GOTO	L_d_UI_onSettingsChange6
L_d_UI_onSettingsChange1:
;d_operating_modes.c,285 :: 		dashboardIndicatorIndex = ((IntegerIndicator*)settingIndicator)->value;
	MOV	[W14+0], W0
	ADD	W0, #20, W0
; dashboardIndicatorIndex start address is: 8 (W4)
	MOV	[W0], W4
;d_operating_modes.c,286 :: 		if (movements) {
	CP0.B	W10
	BRA NZ	L__d_UI_onSettingsChange33
	GOTO	L__d_UI_onSettingsChange16
L__d_UI_onSettingsChange33:
;d_operating_modes.c,287 :: 		dashboardIndicatorIndex+=movements;
	SE	W10, W0
	ADD	W4, W0, W0
; dashboardIndicatorIndex end address is: 8 (W4)
; dashboardIndicatorIndex start address is: 2 (W1)
	MOV	W0, W1
;d_operating_modes.c,288 :: 		if (dashboardIndicatorIndex >= dd_carParametersCount) {
	CP	W0, #25
	BRA GE	L__d_UI_onSettingsChange34
	GOTO	L_d_UI_onSettingsChange8
L__d_UI_onSettingsChange34:
;d_operating_modes.c,289 :: 		dashboardIndicatorIndex -= dd_carParametersCount;
; dashboardIndicatorIndex start address is: 0 (W0)
	SUB	W1, #25, W0
; dashboardIndicatorIndex end address is: 2 (W1)
;d_operating_modes.c,290 :: 		}
; dashboardIndicatorIndex end address is: 0 (W0)
	GOTO	L_d_UI_onSettingsChange9
L_d_UI_onSettingsChange8:
;d_operating_modes.c,291 :: 		else if (dashboardIndicatorIndex < 0) {
; dashboardIndicatorIndex start address is: 2 (W1)
	CP	W1, #0
	BRA LT	L__d_UI_onSettingsChange35
	GOTO	L__d_UI_onSettingsChange15
L__d_UI_onSettingsChange35:
;d_operating_modes.c,292 :: 		dashboardIndicatorIndex += dd_carParametersCount;
; dashboardIndicatorIndex start address is: 0 (W0)
	ADD	W1, #25, W0
; dashboardIndicatorIndex end address is: 2 (W1)
; dashboardIndicatorIndex end address is: 0 (W0)
;d_operating_modes.c,293 :: 		}
	GOTO	L_d_UI_onSettingsChange10
L__d_UI_onSettingsChange15:
;d_operating_modes.c,291 :: 		else if (dashboardIndicatorIndex < 0) {
	MOV	W1, W0
;d_operating_modes.c,293 :: 		}
L_d_UI_onSettingsChange10:
; dashboardIndicatorIndex start address is: 0 (W0)
; dashboardIndicatorIndex end address is: 0 (W0)
L_d_UI_onSettingsChange9:
;d_operating_modes.c,294 :: 		}
; dashboardIndicatorIndex start address is: 0 (W0)
; dashboardIndicatorIndex end address is: 0 (W0)
	GOTO	L_d_UI_onSettingsChange7
L__d_UI_onSettingsChange16:
;d_operating_modes.c,286 :: 		if (movements) {
	MOV	W4, W0
;d_operating_modes.c,294 :: 		}
L_d_UI_onSettingsChange7:
;d_operating_modes.c,295 :: 		d_DashboardSetting_updateValue((IntegerIndicator*)settingIndicator, dashboardIndicatorIndex);
; dashboardIndicatorIndex start address is: 0 (W0)
	MOV	W0, W11
; dashboardIndicatorIndex end address is: 0 (W0)
	MOV	[W14+0], W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,296 :: 		}
L_end_d_UI_onSettingsChange:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _d_UI_onSettingsChange

_d_UI_ApplySettings:

;d_operating_modes.c,306 :: 		void d_UI_ApplySettings() {
;d_operating_modes.c,310 :: 		for (i=0; i<dd_dashboardSettingsCount; i++) {
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_d_UI_ApplySettings11:
; i start address is: 6 (W3)
	CP.B	W3, #4
	BRA LTU	L__d_UI_ApplySettings37
	GOTO	L_d_UI_ApplySettings12
L__d_UI_ApplySettings37:
;d_operating_modes.c,311 :: 		setting = (IntegerIndicator*)dd_dashboardSettings[i];
	ZE	W3, W0
	SL	W0, #1, W2
	MOV	#lo_addr(_dd_dashboardSettings), W0
	ADD	W2, [W0], W1
; setting start address is: 8 (W4)
	MOV	[W1], W4
;d_operating_modes.c,312 :: 		oldIndicator = dd_carParameters[i];
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W2, W2
; oldIndicator start address is: 10 (W5)
	MOV	[W2], W5
;d_operating_modes.c,313 :: 		dd_carParameters[i] = dd_carParameters[setting->value];
	MOV	[W1], W0
	ADD	W0, #20, W0
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	[W0], [W2]
;d_operating_modes.c,314 :: 		dd_carParameters[setting->value] = oldIndicator;
	ADD	W4, #20, W0
; setting end address is: 8 (W4)
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	W5, [W0]
; oldIndicator end address is: 10 (W5)
;d_operating_modes.c,310 :: 		for (i=0; i<dd_dashboardSettingsCount; i++) {
	INC.B	W3
;d_operating_modes.c,315 :: 		}
; i end address is: 6 (W3)
	GOTO	L_d_UI_ApplySettings11
L_d_UI_ApplySettings12:
;d_operating_modes.c,316 :: 		if (dd_GraphicController_isColorInversionQueued){
	MOV	#lo_addr(_dd_GraphicController_isColorInversionQueued), W0
	CP0	W0
	BRA NZ	L__d_UI_ApplySettings38
	GOTO	L_d_UI_ApplySettings14
L__d_UI_ApplySettings38:
;d_operating_modes.c,318 :: 		}
L_d_UI_ApplySettings14:
;d_operating_modes.c,319 :: 		}
L_end_d_UI_ApplySettings:
	RETURN
; end of _d_UI_ApplySettings

_d_UI_SettingsModeClose:

;d_operating_modes.c,321 :: 		void d_UI_SettingsModeClose() {
;d_operating_modes.c,322 :: 		d_UI_ApplySettings();
	CALL	_d_UI_ApplySettings
;d_operating_modes.c,323 :: 		}
L_end_d_UI_SettingsModeClose:
	RETURN
; end of _d_UI_SettingsModeClose

d_operating_modes____?ag:

L_end_d_operating_modes___?ag:
	RETURN
; end of d_operating_modes____?ag
