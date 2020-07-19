;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:22 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"Interrupt.c"
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
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
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
	extern	___sdcc_saved_fsr

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
	global	_ISR
	global	_RB0Int_update
	global	_RB0_INT_Init
	global	_flag

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_Interrupt_0	udata
r0x1008	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_Interrupt_0	idata
_flag
	db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _ISR	;Function start
; 0 exit points
;functions called:
;   _RB0Int_update
;   _RB0Int_update
;; Starting pCode block
_ISR	;Function start
; 0 exit points
;	.line	19; "Interrupt.c"	void ISR(void)__interrupt 0
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	22; "Interrupt.c"	if(TMR0IF)
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00114_DS_
;	.line	24; "Interrupt.c"	flag = 1 ; //execute main program
	MOVLW	0x01
	BANKSEL	_flag
	MOVWF	_flag
;	.line	25; "Interrupt.c"	TMR0_InterruptFlag_Clear();
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;	.line	26; "Interrupt.c"	TMR0_UPDATE_REGISTER(20);
	MOVLW	0x60
	MOVWF	_TMR0
_00114_DS_
;	.line	29; "Interrupt.c"	if(INTF)
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,1
	GOTO	_00117_DS_
;	.line	31; "Interrupt.c"	RB0Int_update();
	PAGESEL	_RB0Int_update
	CALL	_RB0Int_update
	PAGESEL	$
;	.line	33; "Interrupt.c"	CLEAR_RB0_EXINT_FLAG();
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,1
_00117_DS_
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_Interrupt	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _RB0Int_update	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
_RB0Int_update	;Function start
; 2 exit points
;	.line	16; "Interrupt.c"	Flags.Operation_Flag ^= 1 ; //toggle the mode once pressing power push button
	BANKSEL	_Flags
	MOVF	(_Flags + 4),W
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVLW	0x01
	XORWF	r0x1008,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1008,W
	BANKSEL	_Flags
	MOVWF	(_Flags + 4)
	RETURN	
; exit point of _RB0Int_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _RB0_INT_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;2 compiler assigned registers:
;   STK01
;   STK00
;; Starting pCode block
_RB0_INT_Init	;Function start
; 2 exit points
;	.line	7; "Interrupt.c"	GPIO_InitPortPin(PORT_B,0,GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	8; "Interrupt.c"	GLOBAL_INT_ENABLE();
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	9; "Interrupt.c"	RB0_EXINT_ENABLE();
	BSF	_INTCONbits,4
;	.line	10; "Interrupt.c"	SET_RB0_EDGE(EDGE);//select edge from the header file
	BANKSEL	_OPTION_REGbits
	BSF	_OPTION_REGbits,6
;	.line	11; "Interrupt.c"	CLEAR_RB0_EXINT_FLAG();
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,1
	RETURN	
; exit point of _RB0_INT_Init


;	code size estimation:
;	   48+   18 =    66 instructions (  168 byte)

	end
