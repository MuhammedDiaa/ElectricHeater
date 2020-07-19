;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:24 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"Timer.c"
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
	extern	_SettingMode_update
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_LED_Init
	extern	_LED_GetState
	extern	_LED_Update
	extern	_Heater_Init
	extern	_Heater_update
	extern	_Heater_GetState
	extern	_Cooler_Init
	extern	_Cooler_SetState
	extern	_Cooler_GetState
	extern	_Cooler_update
	extern	_I2C_Init
	extern	_I2C_Hold
	extern	_I2C_Begin
	extern	_I2C_End
	extern	_I2C_Write
	extern	_I2C_Read
	extern	_e2pext_r
	extern	_e2pext_w
	extern	_e2pex_update
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
	global	_TMR0_Update
	global	_TMR0_Start
	global	_TMR0_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_Timer_0	udata
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
code_Timer	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _TMR0_Update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PB_Update
;   _SSD_update
;   _Temprature_update
;   _LED_Update
;   _Heater_update
;   _Cooler_update
;   _SettingMode_update
;   _e2pex_update
;   _SettingMode_update
;   _Heater_update
;   _Cooler_update
;   _e2pex_update
;   _LED_Update
;   _PB_Update
;   _SSD_update
;   _Temprature_update
;   _LED_Update
;   _Heater_update
;   _Cooler_update
;   _SettingMode_update
;   _e2pex_update
;   _SettingMode_update
;   _Heater_update
;   _Cooler_update
;   _e2pex_update
;   _LED_Update
;1 compiler assigned register :
;   r0x1006
;; Starting pCode block
_TMR0_Update	;Function start
; 2 exit points
;	.line	20; "Timer.c"	if(Flags.Operation_Flag == ON_MODE)
	BANKSEL	_Flags
	MOVF	(_Flags + 4),W
	BANKSEL	r0x1006
	MOVWF	r0x1006
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	22; "Timer.c"	PB_Update();               //~0
	PAGESEL	_PB_Update
	CALL	_PB_Update
	PAGESEL	$
;	.line	23; "Timer.c"	SSD_update();             //~0,4ms
	PAGESEL	_SSD_update
	CALL	_SSD_update
	PAGESEL	$
;	.line	24; "Timer.c"	Temprature_update();     //~0 ,9ms
	PAGESEL	_Temprature_update
	CALL	_Temprature_update
	PAGESEL	$
;	.line	25; "Timer.c"	LED_Update();           //~0
	PAGESEL	_LED_Update
	CALL	_LED_Update
	PAGESEL	$
;	.line	26; "Timer.c"	Heater_update();       //~0
	PAGESEL	_Heater_update
	CALL	_Heater_update
	PAGESEL	$
;	.line	27; "Timer.c"	Cooler_update();      //~0
	PAGESEL	_Cooler_update
	CALL	_Cooler_update
	PAGESEL	$
;	.line	28; "Timer.c"	SettingMode_update();//~0,0.08ms(fixed)  0,.06ms(blinking)
	PAGESEL	_SettingMode_update
	CALL	_SettingMode_update
	PAGESEL	$
;	.line	29; "Timer.c"	e2pex_update();     // 1.5  , 6.5ms
	PAGESEL	_e2pex_update
	CALL	_e2pex_update
	PAGESEL	$
	GOTO	_00118_DS_
_00116_DS_
;	.line	31; "Timer.c"	else if(Flags.Operation_Flag == OFF_MODE)
	MOVLW	0x00
	BANKSEL	r0x1006
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00118_DS_
;	.line	33; "Timer.c"	SettingMode_update(); //~0 , 0.08 ms(fixed)  0 ms ,.06(blinking)
	PAGESEL	_SettingMode_update
	CALL	_SettingMode_update
	PAGESEL	$
;	.line	34; "Timer.c"	Heater_update();     //~0
	PAGESEL	_Heater_update
	CALL	_Heater_update
	PAGESEL	$
;	.line	35; "Timer.c"	Cooler_update();    //~0
	PAGESEL	_Cooler_update
	CALL	_Cooler_update
	PAGESEL	$
;	.line	36; "Timer.c"	e2pex_update();    //1.5 ,6.5ms
	PAGESEL	_e2pex_update
	CALL	_e2pex_update
	PAGESEL	$
;	.line	37; "Timer.c"	LED_Update();     //~0
	PAGESEL	_LED_Update
	CALL	_LED_Update
	PAGESEL	$
_00118_DS_
	RETURN	
; exit point of _TMR0_Update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _TMR0_Start	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_TMR0_Start	;Function start
; 2 exit points
;	.line	11; "Timer.c"	TMR0_SET_INTERRUPT_STATE(Interrupt);
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,5
;	.line	12; "Timer.c"	GIE = 1; //set global interrupt flag
	BSF	_INTCONbits,7
;	.line	13; "Timer.c"	TMR0_SELECT_CLOCK_SOURCE(Timer);
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	14; "Timer.c"	TMR0_state(TMR0_ON); //TMR0 on
	BCF	_OPTION_REGbits,5
	RETURN	
; exit point of _TMR0_Start

;***
;  pBlock Stats: dbName = C
;***
;entry:  _TMR0_Init	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_TMR0_Init	;Function start
; 2 exit points
;	.line	5; "Timer.c"	TMR0_state(TMR0_OFF);
	BANKSEL	_OPTION_REGbits
	BSF	_OPTION_REGbits,5
;	.line	6; "Timer.c"	TMR0_SELECT_PRESCALAR(N_256);
	BCF	_OPTION_REGbits,3
	BSF	_OPTION_REGbits,2
	BSF	_OPTION_REGbits,1
	BSF	_OPTION_REGbits,0
	RETURN	
; exit point of _TMR0_Init


;	code size estimation:
;	   35+   32 =    67 instructions (  198 byte)

	end
