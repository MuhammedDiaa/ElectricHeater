;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"push_button.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_GPIO_InitPortPin
	extern	_GPIO_InitPort
	extern	_GPIO_Update
	extern	_GPIO_SetPortPinState
	extern	_GPIO_SetPortState
	extern	_GPIO_GetPortPinState
	extern	_UTIL_DelayMS
	extern	_SSD_Init
	extern	_SSD_SET_Symbol
	extern	_SSD_SET_state
	extern	_SSD_GET_state
	extern	_SSD_GET_Symbol
	extern	_SSD_update
	extern	_Heater_Init
	extern	_Heater_SetState
	extern	_Heater_GetState
	extern	_Heater_update
	extern	_Cooler_Init
	extern	_Cooler_SetState
	extern	_Cooler_GetState
	extern	_Cooler_update
	extern	_LED_Init
	extern	_LED_Update
	extern	_LED_GetState
	extern	_LED_SetState
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_SettingMode_update
	extern	_SettingMode_Get_SSD_state
	extern	_SettingMode_OFF_mode
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_SSPCON2bits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_EECON1bits
	extern	_Counters
	extern	_Flags
	extern	_Readings
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	__mulchar

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
	global	_PB_GetState
	global	_PB_Update
	global	_PB_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_push_button_0	udata
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
_pb_info	res	12
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
code_push_button	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _SetValue_update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;4 compiler assigned registers:
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
_SetValue_update	;Function start
; 2 exit points
;	.line	133; "push_button.c"	if(Readings.Set_value <= 75 && Readings.Set_value >= 35)
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1021
	MOVWF	r0x1021
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4C=76), size=4
	MOVLW	0x00
	SUBWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00234_DS_
	MOVLW	0x00
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00234_DS_
	MOVLW	0x00
	SUBWF	r0x101F,W
	BTFSS	STATUS,2
	GOTO	_00234_DS_
	MOVLW	0x4c
	SUBWF	r0x101E,W
_00234_DS_
	BTFSC	STATUS,0
	GOTO	_00214_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;;unsigned compare: left < lit(0x23=35), size=4
	MOVLW	0x00
	BANKSEL	r0x1021
	SUBWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00235_DS_
	MOVLW	0x00
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00235_DS_
	MOVLW	0x00
	SUBWF	r0x101F,W
	BTFSS	STATUS,2
	GOTO	_00235_DS_
	MOVLW	0x23
	SUBWF	r0x101E,W
_00235_DS_
	BTFSS	STATUS,0
	GOTO	_00214_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;	.line	135; "push_button.c"	if(PB_GetState(PB_UP) == PB_PRE_RELEASED)
	MOVLW	0x02
	CALL	_PB_GetState
	BANKSEL	r0x101E
	MOVWF	r0x101E
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00209_DS_
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
;	.line	137; "push_button.c"	Counters.FixedMode_counter = 0; //count new 5 seconds
	BANKSEL	_Counters
	CLRF	(_Counters + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 1)
;	.line	138; "push_button.c"	Readings.Set_value+=5 ;
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVLW	0x05
	ADDWF	r0x101E,F
	BTFSC	STATUS,0
	INCF	r0x101F,F
	BTFSC	STATUS,2
	INCF	r0x1020,F
	BTFSC	STATUS,2
	INCF	r0x1021,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
	MOVF	r0x101E,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 7)
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4C=76), size=4
;	.line	139; "push_button.c"	if(Readings.Set_value > 75)
	MOVLW	0x00
	BANKSEL	r0x1021
	SUBWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00236_DS_
	MOVLW	0x00
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00236_DS_
	MOVLW	0x00
	SUBWF	r0x101F,W
	BTFSS	STATUS,2
	GOTO	_00236_DS_
	MOVLW	0x4c
	SUBWF	r0x101E,W
_00236_DS_
	BTFSS	STATUS,0
	GOTO	_00214_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;	.line	141; "push_button.c"	Readings.Set_value = 75 ;
	MOVLW	0x4b
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	CLRF	(_Readings + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	CLRF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	CLRF	(_Readings + 7)
	GOTO	_00214_DS_
_00209_DS_
;	.line	144; "push_button.c"	else if(PB_GetState(PB_DOWN) == PB_PRE_RELEASED)
	MOVLW	0x01
	CALL	_PB_GetState
	BANKSEL	r0x101E
	MOVWF	r0x101E
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00214_DS_
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
;	.line	146; "push_button.c"	Counters.FixedMode_counter = 0; //count new 5 seconds
	BANKSEL	_Counters
	CLRF	(_Counters + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 1)
;	.line	147; "push_button.c"	Readings.Set_value-= 5 ;
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVLW	0xfb
	ADDWF	r0x101E,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x101F,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x1020,F
	MOVLW	0xff
	BTFSS	STATUS,0
	ADDWF	r0x1021,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
	MOVF	r0x101E,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 7)
;;unsigned compare: left < lit(0x23=35), size=4
;	.line	148; "push_button.c"	if(Readings.Set_value < 35)
	MOVLW	0x00
	BANKSEL	r0x1021
	SUBWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00237_DS_
	MOVLW	0x00
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00237_DS_
	MOVLW	0x00
	SUBWF	r0x101F,W
	BTFSS	STATUS,2
	GOTO	_00237_DS_
	MOVLW	0x23
	SUBWF	r0x101E,W
_00237_DS_
	BTFSC	STATUS,0
	GOTO	_00214_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;	.line	150; "push_button.c"	Readings.Set_value = 35 ;
	MOVLW	0x23
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	CLRF	(_Readings + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	CLRF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	CLRF	(_Readings + 7)
_00214_DS_
	RETURN	
; exit point of _SetValue_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PB_GetState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;5 compiler assigned registers:
;   r0x101A
;   STK00
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
_PB_GetState	;Function start
; 2 exit points
;	.line	121; "push_button.c"	tPB_State PB_GetState(tPB pb)
	BANKSEL	r0x101A
	MOVWF	r0x101A
;	.line	125; "push_button.c"	ret = pb_info[pb].state;
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x101A,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x101B
	MOVWF	r0x101B
	CLRF	r0x101C
	MOVF	r0x101B,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x101A
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x101D
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x101C,W
	ADDWF	r0x101D,F
	MOVLW	0x02
	ADDWF	r0x101A,F
	BTFSC	STATUS,0
	INCF	r0x101D,F
	MOVF	r0x101A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101D
	BTFSC	r0x101D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;	.line	127; "push_button.c"	return ret;
	BANKSEL	r0x101B
	MOVWF	r0x101B
	RETURN	
; exit point of _PB_GetState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PB_Update	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   __mulchar
;   _SetValue_update
;   __mulchar
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   __mulchar
;   _SetValue_update
;9 compiler assigned registers:
;   r0x1022
;   STK00
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
_PB_Update	;Function start
; 2 exit points
;	.line	59; "push_button.c"	for (current_button = PB_POWER; current_button <= PB_UNUSED; current_button++)
	BANKSEL	r0x1022
	CLRF	r0x1022
_00155_DS_
;	.line	62; "push_button.c"	pb_info[current_button].samples[0] = pb_info[current_button].samples[1];
	MOVLW	0x03
	MOVWF	STK00
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	CLRF	r0x1024
	MOVF	r0x1023,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1025
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x1026
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDWF	r0x1026,F
	MOVF	r0x1023,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1023
	MOVF	r0x1024,W
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDLW	high (_pb_info + 0)
	MOVWF	r0x1024
	INCF	r0x1023,F
	BTFSC	STATUS,2
	INCF	r0x1024,F
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1027
	MOVWF	r0x1027
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	MOVF	r0x1027,W
	BANKSEL	INDF
	MOVWF	INDF
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	64; "push_button.c"	switch(current_button)
	MOVLW	0x04
	BANKSEL	r0x1022
	SUBWF	r0x1022,W
	BTFSC	STATUS,0
	GOTO	_00137_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00191_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00191_DS_
	BANKSEL	r0x1022
	ADDWF	r0x1022,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00191_DS_
	GOTO	_00132_DS_
	GOTO	_00133_DS_
	GOTO	_00134_DS_
	GOTO	_00135_DS_
_00132_DS_
;	.line	67; "push_button.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 0);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	MOVF	r0x1025,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	68; "push_button.c"	break;
	GOTO	_00137_DS_
_00133_DS_
;	.line	70; "push_button.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	MOVF	r0x1025,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	71; "push_button.c"	break;
	GOTO	_00137_DS_
_00134_DS_
;	.line	73; "push_button.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	MOVF	r0x1025,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	74; "push_button.c"	break;
	GOTO	_00137_DS_
_00135_DS_
;	.line	76; "push_button.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 3);
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	MOVF	r0x1025,W
	BANKSEL	INDF
	MOVWF	INDF
_00137_DS_
;	.line	84; "push_button.c"	switch(pb_info[current_button].state)
	MOVLW	0x03
	MOVWF	STK00
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	CLRF	r0x1024
	MOVF	r0x1023,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1023
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDLW	high (_pb_info + 0)
	MOVWF	r0x1024
	MOVLW	0x02
	ADDWF	r0x1023,W
	MOVWF	r0x1025
	CLRF	r0x1026
	RLF	r0x1026,F
	MOVF	r0x1024,W
	ADDWF	r0x1026,F
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1027
	MOVWF	r0x1027
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
	MOVLW	0x04
	SUBWF	r0x1027,W
	BTFSC	STATUS,0
	GOTO	_00156_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00193_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00193_DS_
	BANKSEL	r0x1027
	ADDWF	r0x1027,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_
	MOVWF	PCL
_00193_DS_
	GOTO	_00138_DS_
	GOTO	_00142_DS_
	GOTO	_00145_DS_
	GOTO	_00149_DS_
_00138_DS_
;	.line	87; "push_button.c"	if((pb_info[current_button].samples[0] == PB_PRESSED_VOLTAGE) &&
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1027
	MOVWF	r0x1027
	MOVF	r0x1027,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	88; "push_button.c"	(pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE))
	MOVLW	0x01
	ADDWF	r0x1023,W
	MOVWF	r0x1027
	CLRF	r0x1028
	RLF	r0x1028,F
	MOVF	r0x1024,W
	ADDWF	r0x1028,F
	MOVF	r0x1027,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1028
	BTFSC	r0x1028,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	r0x1029,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	90; "push_button.c"	pb_info[current_button].state = PB_PRE_PRESSED;
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	92; "push_button.c"	break;
	GOTO	_00156_DS_
_00142_DS_
;	.line	94; "push_button.c"	if(pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE)
	MOVLW	0x01
	BANKSEL	r0x1023
	ADDWF	r0x1023,W
	MOVWF	r0x1027
	CLRF	r0x1028
	RLF	r0x1028,F
	MOVF	r0x1024,W
	ADDWF	r0x1028,F
	MOVF	r0x1027,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1028
	BTFSC	r0x1028,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	r0x1029,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	96; "push_button.c"	pb_info[current_button].state = PB_PRESSED;
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
;	.line	98; "push_button.c"	break;
	GOTO	_00156_DS_
_00145_DS_
;	.line	100; "push_button.c"	if((pb_info[current_button].samples[0] == PB_RELEASED_VOLTAGE) &&
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1027
	MOVWF	r0x1027
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	101; "push_button.c"	(pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE))
	MOVLW	0x01
	ADDWF	r0x1023,W
	MOVWF	r0x1027
	CLRF	r0x1028
	RLF	r0x1028,F
	MOVF	r0x1024,W
	ADDWF	r0x1028,F
	MOVF	r0x1027,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1028
	BTFSC	r0x1028,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	103; "push_button.c"	pb_info[current_button].state = PB_PRE_RELEASED;
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
;	.line	105; "push_button.c"	break;
	GOTO	_00156_DS_
_00149_DS_
;	.line	107; "push_button.c"	if(pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE)
	BANKSEL	r0x1023
	INCF	r0x1023,F
	BTFSC	STATUS,2
	INCF	r0x1024,F
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1027
	MOVWF	r0x1027
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	109; "push_button.c"	pb_info[current_button].state = PB_RELEASED;
	MOVF	r0x1025,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1026
	BTFSC	r0x1026,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00156_DS_
;	.line	59; "push_button.c"	for (current_button = PB_POWER; current_button <= PB_UNUSED; current_button++)
	BANKSEL	r0x1022
	INCF	r0x1022,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
	MOVLW	0x04
	SUBWF	r0x1022,W
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;	.line	118; "push_button.c"	SetValue_update(); //fn to check for the push buttons to decrement and increment the user set value
	CALL	_SetValue_update
	RETURN	
; exit point of _PB_Update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PB_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   __mulchar
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   __mulchar
;7 compiler assigned registers:
;   r0x102A
;   STK00
;   r0x102B
;   STK01
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
_PB_Init	;Function start
; 2 exit points
;	.line	14; "push_button.c"	void PB_Init(tPB pb, tPB_State initial_state)
	BANKSEL	r0x102A
	MOVWF	r0x102A
	MOVF	STK00,W
	MOVWF	r0x102B
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	17; "push_button.c"	switch(pb)
	MOVLW	0x04
	SUBWF	r0x102A,W
	BTFSC	STATUS,0
	GOTO	_00110_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00125_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00125_DS_
	BANKSEL	r0x102A
	ADDWF	r0x102A,W
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00003_DS_
	MOVWF	PCL
_00125_DS_
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
_00105_DS_
;	.line	20; "push_button.c"	GPIO_InitPortPin(PORT_B, 0,GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	21; "push_button.c"	break;
	GOTO	_00110_DS_
_00106_DS_
;	.line	23; "push_button.c"	GPIO_InitPortPin(PORT_B, 1,GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	24; "push_button.c"	break;
	GOTO	_00110_DS_
_00107_DS_
;	.line	26; "push_button.c"	GPIO_InitPortPin(PORT_B, 2,GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	27; "push_button.c"	break;
	GOTO	_00110_DS_
_00108_DS_
;	.line	29; "push_button.c"	GPIO_InitPortPin(PORT_B, 3,GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00110_DS_
;	.line	37; "push_button.c"	pb_info[pb].state = initial_state;
	MOVLW	0x03
	MOVWF	STK00
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x102C
	MOVWF	r0x102C
	CLRF	r0x102D
	MOVF	r0x102C,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x102C
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x102A
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x102D,W
	ADDWF	r0x102A,F
	MOVLW	0x02
	ADDWF	r0x102C,W
	MOVWF	r0x102D
	CLRF	r0x102E
	RLF	r0x102E,F
	MOVF	r0x102A,W
	ADDWF	r0x102E,F
	MOVF	r0x102D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102E
	BTFSC	r0x102E,0
	BSF	STATUS,7
	MOVF	r0x102B,W
	BANKSEL	INDF
	MOVWF	INDF
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	40; "push_button.c"	switch (initial_state)
	MOVLW	0x04
	BANKSEL	r0x102B
	SUBWF	r0x102B,W
	BTFSC	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00127_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00127_DS_
	BANKSEL	r0x102B
	ADDWF	r0x102B,W
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00004_DS_
	MOVWF	PCL
_00127_DS_
	GOTO	_00112_DS_
	GOTO	_00114_DS_
	GOTO	_00114_DS_
	GOTO	_00112_DS_
_00112_DS_
;	.line	44; "push_button.c"	pb_info[pb].samples[0] = PB_RELEASED_VOLTAGE;
	BANKSEL	r0x102C
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102A
	BTFSC	r0x102A,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	45; "push_button.c"	pb_info[pb].samples[1] = PB_RELEASED_VOLTAGE;
	MOVLW	0x01
	BANKSEL	r0x102C
	ADDWF	r0x102C,W
	MOVWF	r0x102B
	CLRF	r0x102D
	RLF	r0x102D,F
	MOVF	r0x102A,W
	ADDWF	r0x102D,F
	MOVF	r0x102B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102D
	BTFSC	r0x102D,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	46; "push_button.c"	break;
	GOTO	_00116_DS_
_00114_DS_
;	.line	49; "push_button.c"	pb_info[pb].samples[0] = PB_PRESSED_VOLTAGE;
	BANKSEL	r0x102C
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102A
	BTFSC	r0x102A,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	50; "push_button.c"	pb_info[pb].samples[1] = PB_PRESSED_VOLTAGE;
	BANKSEL	r0x102C
	INCF	r0x102C,F
	BTFSC	STATUS,2
	INCF	r0x102A,F
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102A
	BTFSC	r0x102A,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00116_DS_
;	.line	52; "push_button.c"	}
	RETURN	
; exit point of _PB_Init


;	code size estimation:
;	  584+  186 =   770 instructions ( 1912 byte)

	end
