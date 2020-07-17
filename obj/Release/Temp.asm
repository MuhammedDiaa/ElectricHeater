;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"Temp.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
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
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
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
	extern	_SettingMode_update
	extern	_SettingMode_Get_SSD_state
	extern	_SettingMode_OFF_mode
	extern	__mullong
	extern	___ulong2fs
	extern	___fsdiv
	extern	___fs2ulong
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
	global	_Temprature_update
	global	_Temprature_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_Temp_0	udata
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1014	res	1
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
code_Temp	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _Temprature_update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Temprature_Read
;   _ADC_GetResult
;   __mullong
;   ___ulong2fs
;   ___fsdiv
;   ___fs2ulong
;14 compiler assigned registers:
;   r0x1014
;   r0x100E
;   r0x100F
;   STK00
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;; Starting pCode block
_Temprature_update	;Function start
; 2 exit points
_Temprature_Read
;	.line	17; "Temp.c"	if(Counters.Temp_counter == 20)
	BANKSEL	_Counters
	MOVF	(_Counters + 5),W
	BANKSEL	r0x100E
	MOVWF	r0x100E
	XORLW	0x14
	BTFSS	STATUS,2
	GOTO	_00111_DS_
;	.line	19; "Temp.c"	Readings.temp_read = ADC_GetResult(2);
	MOVLW	0x02
	PAGESEL	_ADC_GetResult
	CALL	_ADC_GetResult
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x100E
	BANKSEL	_Readings
	MOVWF	(_Readings + 0)
	BANKSEL	r0x1010
	MOVWF	r0x1010
;;99	MOVF	r0x100F,W
;;1	CLRF	r0x1012
;;1	CLRF	r0x1013
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;;100	MOVF	r0x1010,W
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	MOVF	r0x1011,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	MOVLW	0x00
	MOVWF	(_Readings + 2)
	MOVWF	(_Readings + 3)
;	.line	20; "Temp.c"	Readings.temp_read = (Readings.temp_read*150*5)/(1.5*1023);
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	MOVWF	STK06
	MOVF	r0x1011,W
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0xee
	MOVWF	STK02
	MOVLW	0x02
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mullong
	CALL	__mullong
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1010
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100E
	MOVWF	STK02
	MOVF	r0x100F,W
	MOVWF	STK01
	MOVF	r0x1010,W
	MOVWF	STK00
	MOVF	r0x1011,W
	PAGESEL	___ulong2fs
	CALL	___ulong2fs
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1010
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100E
	MOVLW	0x00
	MOVWF	STK06
	MOVLW	0xd0
	MOVWF	STK05
	MOVLW	0xbf
	MOVWF	STK04
	MOVLW	0x44
	MOVWF	STK03
	MOVF	r0x100E,W
	MOVWF	STK02
	MOVF	r0x100F,W
	MOVWF	STK01
	MOVF	r0x1010,W
	MOVWF	STK00
	MOVF	r0x1011,W
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1010
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100E
	MOVWF	STK02
	MOVF	r0x100F,W
	MOVWF	STK01
	MOVF	r0x1010,W
	MOVWF	STK00
	MOVF	r0x1011,W
	PAGESEL	___fs2ulong
	CALL	___fs2ulong
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1010
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100E
	BANKSEL	_Readings
	MOVWF	(_Readings + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	BANKSEL	r0x1011
	MOVF	r0x1011,W
	BANKSEL	_Readings
	MOVWF	(_Readings + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	21; "Temp.c"	Counters.Temp_counter=0 ; // counter to read every 100ms one reading
	BANKSEL	_Counters
	CLRF	(_Counters + 5)
_00111_DS_
;	.line	27; "Temp.c"	Counters.Temp_counter++;
	BANKSEL	_Counters
	MOVF	(_Counters + 5),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	INCF	r0x1014,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1014,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 5)
	RETURN	
; exit point of _Temprature_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _Temprature_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _ADC_Init
;   _ADC_Init
;; Starting pCode block
_Temprature_Init	;Function start
; 2 exit points
;	.line	4; "Temp.c"	ADC_Init(1); // 250ns sampling rate
	MOVLW	0x01
	PAGESEL	_ADC_Init
	CALL	_ADC_Init
	PAGESEL	$
	RETURN	
; exit point of _Temprature_Init


;	code size estimation:
;	  109+   34 =   143 instructions (  354 byte)

	end
