;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:44 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"utilities.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_UTIL_DelayMS

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_utilities_0	udata
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_utilities	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _UTIL_DelayMS	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;; Starting pCode block
_UTIL_DelayMS	;Function start
; 2 exit points
;	.line	3; "utilities.c"	void UTIL_DelayMS(unsigned char delay_ms)
	BANKSEL	r0x1000
	MOVWF	r0x1000
;	.line	8; "utilities.c"	for (x = 0; x < delay_ms; x++)
	CLRF	r0x1001
	CLRF	r0x1002
_00111_DS_
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	MOVWF	r0x1003
	CLRF	r0x1004
	MOVLW	0x00
	SUBWF	r0x1002,W
	BTFSS	STATUS,2
	GOTO	_00128_DS_
	MOVF	r0x1003,W
	SUBWF	r0x1001,W
_00128_DS_
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;	.line	10; "utilities.c"	for(y = 0; y <120; y++)
	MOVLW	0x78
	BANKSEL	r0x1003
	MOVWF	r0x1003
	CLRF	r0x1004
_00109_DS_
	MOVLW	0xff
	BANKSEL	r0x1003
	ADDWF	r0x1003,W
	MOVWF	r0x1005
	MOVLW	0xff
	MOVWF	r0x1006
	MOVF	r0x1004,W
	BTFSC	STATUS,0
	INCFSZ	r0x1004,W
	ADDWF	r0x1006,F
	MOVF	r0x1005,W
	MOVWF	r0x1003
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1005,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00109_DS_
;	.line	8; "utilities.c"	for (x = 0; x < delay_ms; x++)
	INCF	r0x1001,F
	BTFSC	STATUS,2
	INCF	r0x1002,F
	GOTO	_00111_DS_
_00113_DS_
	RETURN	
; exit point of _UTIL_DelayMS


;	code size estimation:
;	   39+    4 =    43 instructions (   94 byte)

	end
