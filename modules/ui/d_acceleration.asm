
_dAcc_init:

;d_acceleration.c,21 :: 		void dAcc_init(void) {
;d_acceleration.c,22 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,23 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,29 :: 		}
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,96 :: 		void dAcc_startAutoAcceleration(void){
;d_acceleration.c,97 :: 		if(!dAcc_autoAcceleration){
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration5
	GOTO	L_dAcc_startAutoAcceleration0
L__dAcc_startAutoAcceleration5:
;d_acceleration.c,98 :: 		dAcc_autoAcceleration = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,99 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,101 :: 		}
L_dAcc_startAutoAcceleration0:
;d_acceleration.c,102 :: 		}//*/
L_end_dAcc_startAutoAcceleration:
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,104 :: 		void dAcc_startClutchRelease(void){
;d_acceleration.c,105 :: 		if(!dAcc_releasingClutch){
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startClutchRelease7
	GOTO	L_dAcc_startClutchRelease1
L__dAcc_startClutchRelease7:
;d_acceleration.c,106 :: 		dAcc_releasingClutch = TRUE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,108 :: 		}
L_dAcc_startClutchRelease1:
;d_acceleration.c,110 :: 		}
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_stopAutoAcceleration:

;d_acceleration.c,112 :: 		void dAcc_stopAutoAcceleration(void) {
;d_acceleration.c,113 :: 		if(dAcc_autoAcceleration){
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration9
	GOTO	L_dAcc_stopAutoAcceleration2
L__dAcc_stopAutoAcceleration9:
;d_acceleration.c,114 :: 		dAcc_autoAcceleration = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,115 :: 		dAcc_releasingClutch = FALSE;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,117 :: 		}
L_dAcc_stopAutoAcceleration2:
;d_acceleration.c,118 :: 		}
L_end_dAcc_stopAutoAcceleration:
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,120 :: 		char dAcc_isAutoAccelerationActive(void) {
;d_acceleration.c,121 :: 		return dAcc_autoAcceleration;
	MOV	#lo_addr(d_acceleration_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,122 :: 		}
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_isReleasingClutch:

;d_acceleration.c,124 :: 		char dAcc_isReleasingClutch(void) {
;d_acceleration.c,125 :: 		return dAcc_releasingClutch;
	MOV	#lo_addr(d_acceleration_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,126 :: 		}
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch
