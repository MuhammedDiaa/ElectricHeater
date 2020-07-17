;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3f32
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
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_Cooler_Init
	extern	_Cooler_SetState
	extern	_Cooler_GetState
	extern	_Cooler_update
	extern	_Heater_Init
	extern	_Heater_SetState
	extern	_Heater_GetState
	extern	_Heater_update
	extern	_SettingMode_update
	extern	_SettingMode_Get_SSD_state
	extern	_SettingMode_OFF_mode
	extern	_SSD_Init
	extern	_SSD_SET_Symbol
	extern	_SSD_SET_state
	extern	_SSD_GET_state
	extern	_SSD_GET_Symbol
	extern	_SSD_update
	extern	_LED_Init
	extern	_LED_Update
	extern	_LED_GetState
	extern	_LED_SetState
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
	extern	_RB0_INT_Init
	extern	_RB0Int_update
	extern	_ISR
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
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PB_Init
;   _PB_Init
;   _SSD_Init
;   _SSD_Init
;   _Heater_Init
;   _Cooler_Init
;   _LED_Init
;   _Temprature_Init
;   _TMR0_Init
;   _TMR0_Start
;   _PB_Init
;   _PB_Init
;   _SSD_Init
;   _SSD_Init
;   _Heater_Init
;   _Cooler_Init
;   _LED_Init
;   _Temprature_Init
;   _TMR0_Init
;   _TMR0_Start
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	15; "main.c"	PB_Init(PB_UP,PB_RELEASED);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_PB_Init
	CALL	_PB_Init
	PAGESEL	$
;	.line	16; "main.c"	PB_Init(PB_DOWN,PB_RELEASED);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_PB_Init
	CALL	_PB_Init
	PAGESEL	$
;	.line	18; "main.c"	SSD_Init(SSD_MR,SSD_OFF,SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	19; "main.c"	SSD_Init(SSD_R,SSD_OFF,SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	21; "main.c"	Heater_Init();
	PAGESEL	_Heater_Init
	CALL	_Heater_Init
	PAGESEL	$
;	.line	22; "main.c"	Cooler_Init();
	PAGESEL	_Cooler_Init
	CALL	_Cooler_Init
	PAGESEL	$
;	.line	24; "main.c"	LED_Init(LED_7,LED_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_LED_Init
	CALL	_LED_Init
	PAGESEL	$
;	.line	26; "main.c"	Temprature_Init();
	PAGESEL	_Temprature_Init
	CALL	_Temprature_Init
	PAGESEL	$
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;	.line	28; "main.c"	Readings.Set_value = 40;
	MOVLW	0x28
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	CLRF	(_Readings + 5)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	CLRF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	CLRF	(_Readings + 7)
;	.line	30; "main.c"	TMR0_Init();
	PAGESEL	_TMR0_Init
	CALL	_TMR0_Init
	PAGESEL	$
;	.line	31; "main.c"	TMR0_Start();
	PAGESEL	_TMR0_Start
	CALL	_TMR0_Start
	PAGESEL	$
_00106_DS_
;	.line	33; "main.c"	while(1){
	GOTO	_00106_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   36+   21 =    57 instructions (  156 byte)

	end
