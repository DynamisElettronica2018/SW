
_d_UI_CruiseModeInit:

;d_operating_modes.c,110 :: 		void d_UI_CruiseModeInit() {
;d_operating_modes.c,111 :: 		dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Drive");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr69_d_operating_modes), W13
	MOV.B	#21, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	CLR	W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,112 :: 		}
L_end_d_UI_CruiseModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_CruiseModeInit

_d_UI_AccModeInit:

;d_operating_modes.c,114 :: 		void d_UI_AccModeInit(){
;d_operating_modes.c,115 :: 		dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Acceleration ");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr70_d_operating_modes), W13
	MOV.B	#21, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	CLR	W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,116 :: 		}
L_end_d_UI_AccModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_AccModeInit

_d_UI_DebugModeInit:

;d_operating_modes.c,118 :: 		void d_UI_DebugModeInit() {
;d_operating_modes.c,119 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carParameters, dd_carParametersCount, "Debug");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr71_d_operating_modes), W13
	MOV.B	#21, W12
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,120 :: 		}
L_end_d_UI_DebugModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_DebugModeInit

_d_UI_BoardDebugModeInit:

;d_operating_modes.c,122 :: 		void d_UI_BoardDebugModeInit() {
;d_operating_modes.c,123 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carBoards, dd_carBoardsCount, "Boards");
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(?lstr72_d_operating_modes), W13
	MOV.B	#13, W12
	MOV	#lo_addr(d_operating_modes_dd_carBoards), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,124 :: 		}
L_end_d_UI_BoardDebugModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_BoardDebugModeInit

_d_DashboardSetting_updateValue:

;d_operating_modes.c,176 :: 		void d_DashboardSetting_updateValue(IntegerIndicator* ind, int val) {
;d_operating_modes.c,179 :: 		ind->value = val;
	PUSH	W11
	ADD	W10, #20, W0
	MOV	W11, [W0]
;d_operating_modes.c,180 :: 		strcpy(ind->base.label, dd_carParameters[ind->value]->name);
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
;d_operating_modes.c,181 :: 		ind->base.labelLength = dd_carParameters[ind->value]->nameLength;
	ADD	W10, #9, W2
	ADD	W10, #20, W0
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	ADD	W0, #6, W0
	MOV.B	[W0], [W2]
;d_operating_modes.c,182 :: 		ind->base.pendingPrintUpdate = TRUE;
	ADD	W10, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,185 :: 		}
L_end_d_DashboardSetting_updateValue:
	POP	W11
	RETURN
; end of _d_DashboardSetting_updateValue

_d_UI_SettingsModeInit:

;d_operating_modes.c,187 :: 		void d_UI_SettingsModeInit() {
;d_operating_modes.c,191 :: 		d_DashboardSetting_updateValue(&sett_dash_top_left, TOP_LEFT);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W11
	MOV	#lo_addr(_sett_dash_top_left), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,192 :: 		d_DashboardSetting_updateValue(&sett_dash_top_right, TOP_RIGHT);
	MOV	#1, W11
	MOV	#lo_addr(_sett_dash_top_right), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,193 :: 		d_DashboardSetting_updateValue(&sett_dash_bottom_right, BOTTOM_RIGHT);
	MOV	#2, W11
	MOV	#lo_addr(_sett_dash_bottom_right), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,194 :: 		d_DashboardSetting_updateValue(&sett_dash_bottom_left, BOTTOM_LEFT);
	MOV	#3, W11
	MOV	#lo_addr(_sett_dash_bottom_left), W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,196 :: 		dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_settings, dd_settingsCount, "Settings");
	MOV	#lo_addr(?lstr85_d_operating_modes), W13
	MOV.B	#6, W12
	MOV	#lo_addr(_dd_settings), W11
	MOV.B	#1, W10
	CALL	_dd_GraphicController_setCollectionInterface
;d_operating_modes.c,197 :: 		}
L_end_d_UI_SettingsModeInit:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UI_SettingsModeInit

_d_UI_onSettingsChange:
	LNK	#6

;d_operating_modes.c,203 :: 		void d_UI_onSettingsChange(signed char movements) {
;d_operating_modes.c,206 :: 		Indicator* settingIndicator = dd_settings[dd_Menu_selectedLine()];
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
;d_operating_modes.c,209 :: 		switch (settingIndicator->id) {
	MOV	W0, [W14+4]
	GOTO	L_d_UI_onSettingsChange0
;d_operating_modes.c,210 :: 		case S_INVERT_COLORS:
L_d_UI_onSettingsChange2:
;d_operating_modes.c,211 :: 		dd_GraphicController_invertColors();
	CALL	_dd_GraphicController_invertColors
;d_operating_modes.c,212 :: 		dd_Indicator_switchBoolValueP(&sett_invert_colors.base);
	MOV	#lo_addr(_sett_invert_colors), W10
	CALL	_dd_Indicator_switchBoolValueP
;d_operating_modes.c,213 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,214 :: 		return;
	GOTO	L_end_d_UI_onSettingsChange
;d_operating_modes.c,215 :: 		case S_BYPASS_GEARS:
L_d_UI_onSettingsChange3:
;d_operating_modes.c,216 :: 		if (dGear_isShiftingCheckBypassed()) {
	CALL	_dGear_isShiftingCheckBypassed
	CP0.B	W0
	BRA NZ	L__d_UI_onSettingsChange24
	GOTO	L_d_UI_onSettingsChange4
L__d_UI_onSettingsChange24:
;d_operating_modes.c,217 :: 		dGear_enableShiftCheck();
	CALL	_dGear_enableShiftCheck
;d_operating_modes.c,218 :: 		dd_Indicator_setBoolValueP(&sett_bypass_gears.base, FALSE);
	CLR	W11
	MOV	#lo_addr(_sett_bypass_gears), W10
	CALL	_dd_Indicator_setBoolValueP
;d_operating_modes.c,219 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,220 :: 		} else {
	GOTO	L_d_UI_onSettingsChange5
L_d_UI_onSettingsChange4:
;d_operating_modes.c,221 :: 		dGear_disableShiftCheck();
	CALL	_dGear_disableShiftCheck
;d_operating_modes.c,222 :: 		dd_Indicator_setBoolValueP(&sett_bypass_gears.base, TRUE);
	MOV.B	#1, W11
	MOV	#lo_addr(_sett_bypass_gears), W10
	CALL	_dd_Indicator_setBoolValueP
;d_operating_modes.c,223 :: 		settingIndicator->pendingPrintUpdate = TRUE;
	MOV	[W14+0], W0
	ADD	W0, #8, W1
	MOV.B	[W1], W0
	XOR.B	W0, #1, W0
	AND.B	W0, #3, W0
	XOR.B	W0, [W1], W0
	MOV.B	W0, [W1]
;d_operating_modes.c,224 :: 		}
L_d_UI_onSettingsChange5:
;d_operating_modes.c,225 :: 		return;
	GOTO	L_end_d_UI_onSettingsChange
;d_operating_modes.c,226 :: 		default:
L_d_UI_onSettingsChange6:
;d_operating_modes.c,227 :: 		break;
	GOTO	L_d_UI_onSettingsChange1
;d_operating_modes.c,229 :: 		}
L_d_UI_onSettingsChange0:
	MOV	[W14+4], W1
	MOV.B	[W1], W0
	CP.B	W0, #30
	BRA NZ	L__d_UI_onSettingsChange25
	GOTO	L_d_UI_onSettingsChange2
L__d_UI_onSettingsChange25:
	MOV.B	[W1], W0
	CP.B	W0, #29
	BRA NZ	L__d_UI_onSettingsChange26
	GOTO	L_d_UI_onSettingsChange3
L__d_UI_onSettingsChange26:
	GOTO	L_d_UI_onSettingsChange6
L_d_UI_onSettingsChange1:
;d_operating_modes.c,236 :: 		dashboardIndicatorIndex = ((IntegerIndicator*)settingIndicator)->value;
	MOV	[W14+0], W0
	ADD	W0, #20, W0
; dashboardIndicatorIndex start address is: 8 (W4)
	MOV	[W0], W4
;d_operating_modes.c,239 :: 		if (movements) {
	CP0.B	W10
	BRA NZ	L__d_UI_onSettingsChange27
	GOTO	L__d_UI_onSettingsChange16
L__d_UI_onSettingsChange27:
;d_operating_modes.c,240 :: 		dashboardIndicatorIndex+=movements;
	SE	W10, W0
	ADD	W4, W0, W0
; dashboardIndicatorIndex end address is: 8 (W4)
; dashboardIndicatorIndex start address is: 2 (W1)
	MOV	W0, W1
;d_operating_modes.c,241 :: 		if (dashboardIndicatorIndex >= dd_carParametersCount) {
	CP	W0, #21
	BRA GE	L__d_UI_onSettingsChange28
	GOTO	L_d_UI_onSettingsChange8
L__d_UI_onSettingsChange28:
;d_operating_modes.c,242 :: 		dashboardIndicatorIndex -= dd_carParametersCount;
; dashboardIndicatorIndex start address is: 0 (W0)
	SUB	W1, #21, W0
; dashboardIndicatorIndex end address is: 2 (W1)
;d_operating_modes.c,243 :: 		}
; dashboardIndicatorIndex end address is: 0 (W0)
	GOTO	L_d_UI_onSettingsChange9
L_d_UI_onSettingsChange8:
;d_operating_modes.c,244 :: 		else if (dashboardIndicatorIndex < 0) {
; dashboardIndicatorIndex start address is: 2 (W1)
	CP	W1, #0
	BRA LT	L__d_UI_onSettingsChange29
	GOTO	L__d_UI_onSettingsChange15
L__d_UI_onSettingsChange29:
;d_operating_modes.c,245 :: 		dashboardIndicatorIndex += dd_carParametersCount;
; dashboardIndicatorIndex start address is: 0 (W0)
	ADD	W1, #21, W0
; dashboardIndicatorIndex end address is: 2 (W1)
; dashboardIndicatorIndex end address is: 0 (W0)
;d_operating_modes.c,246 :: 		}
	GOTO	L_d_UI_onSettingsChange10
L__d_UI_onSettingsChange15:
;d_operating_modes.c,244 :: 		else if (dashboardIndicatorIndex < 0) {
	MOV	W1, W0
;d_operating_modes.c,246 :: 		}
L_d_UI_onSettingsChange10:
; dashboardIndicatorIndex start address is: 0 (W0)
; dashboardIndicatorIndex end address is: 0 (W0)
L_d_UI_onSettingsChange9:
;d_operating_modes.c,247 :: 		}
; dashboardIndicatorIndex start address is: 0 (W0)
; dashboardIndicatorIndex end address is: 0 (W0)
	GOTO	L_d_UI_onSettingsChange7
L__d_UI_onSettingsChange16:
;d_operating_modes.c,239 :: 		if (movements) {
	MOV	W4, W0
;d_operating_modes.c,247 :: 		}
L_d_UI_onSettingsChange7:
;d_operating_modes.c,251 :: 		d_DashboardSetting_updateValue((IntegerIndicator*)settingIndicator, dashboardIndicatorIndex);
; dashboardIndicatorIndex start address is: 0 (W0)
	MOV	W0, W11
; dashboardIndicatorIndex end address is: 0 (W0)
	MOV	[W14+0], W10
	CALL	_d_DashboardSetting_updateValue
;d_operating_modes.c,252 :: 		}
L_end_d_UI_onSettingsChange:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _d_UI_onSettingsChange

_d_UI_ApplySettings:

;d_operating_modes.c,262 :: 		void d_UI_ApplySettings() {
;d_operating_modes.c,266 :: 		for (i=0; i<dd_dashboardSettingsCount; i++) {
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_d_UI_ApplySettings11:
; i start address is: 6 (W3)
	CP.B	W3, #4
	BRA LTU	L__d_UI_ApplySettings31
	GOTO	L_d_UI_ApplySettings12
L__d_UI_ApplySettings31:
;d_operating_modes.c,267 :: 		setting = (IntegerIndicator*)dd_dashboardSettings[i];
	ZE	W3, W0
	SL	W0, #1, W2
	MOV	#lo_addr(_dd_dashboardSettings), W0
	ADD	W2, [W0], W1
; setting start address is: 8 (W4)
	MOV	[W1], W4
;d_operating_modes.c,268 :: 		oldIndicator = dd_carParameters[i];
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W2, W2
; oldIndicator start address is: 10 (W5)
	MOV	[W2], W5
;d_operating_modes.c,269 :: 		dd_carParameters[i] = dd_carParameters[setting->value];
	MOV	[W1], W0
	ADD	W0, #20, W0
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	[W0], [W2]
;d_operating_modes.c,270 :: 		dd_carParameters[setting->value] = oldIndicator;
	ADD	W4, #20, W0
; setting end address is: 8 (W4)
	MOV	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_operating_modes_dd_carParameters), W0
	ADD	W0, W1, W0
	MOV	W5, [W0]
; oldIndicator end address is: 10 (W5)
;d_operating_modes.c,266 :: 		for (i=0; i<dd_dashboardSettingsCount; i++) {
	INC.B	W3
;d_operating_modes.c,271 :: 		}
; i end address is: 6 (W3)
	GOTO	L_d_UI_ApplySettings11
L_d_UI_ApplySettings12:
;d_operating_modes.c,272 :: 		if (dd_GraphicController_isColorInversionQueued){
	MOV	#lo_addr(_dd_GraphicController_isColorInversionQueued), W0
	CP0	W0
	BRA NZ	L__d_UI_ApplySettings32
	GOTO	L_d_UI_ApplySettings14
L__d_UI_ApplySettings32:
;d_operating_modes.c,274 :: 		}
L_d_UI_ApplySettings14:
;d_operating_modes.c,275 :: 		}
L_end_d_UI_ApplySettings:
	RETURN
; end of _d_UI_ApplySettings

_d_UI_SettingsModeClose:

;d_operating_modes.c,277 :: 		void d_UI_SettingsModeClose() {
;d_operating_modes.c,278 :: 		d_UI_ApplySettings();
	CALL	_d_UI_ApplySettings
;d_operating_modes.c,279 :: 		}
L_end_d_UI_SettingsModeClose:
	RETURN
; end of _d_UI_SettingsModeClose

d_operating_modes____?ag:

L_end_d_operating_modes___?ag:
	RETURN
; end of d_operating_modes____?ag
