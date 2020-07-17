;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"setting_mode.c"
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
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_SettingMode_Get_SSD_state
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
	global	_SettingMode_OFF_mode
	global	_SettingMode_update
	global	_Counters
	global	_Readings
	global	_Flags

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_setting_mode_0	udata
_Counters	res	6

UD_setting_mode_1	udata
_Readings	res	8

UD_setting_mode_2	udata
_Flags	res	5

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_setting_mode_0	udata
r0x1021	res	1
r0x1022	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1013	res	1
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
code_setting_mode	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _SettingMode_OFF_mode	;Function start
; 2 exit points
;has an exit
;functions called:
;   _SSD_SET_state
;   _SSD_SET_state
;   _SSD_SET_state
;   _SSD_SET_state
;1 compiler assigned register :
;   STK00
;; Starting pCode block
_SettingMode_OFF_mode	;Function start
; 2 exit points
;	.line	61; "setting_mode.c"	SSD_SET_state(SSD_MR,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SET_state
	CALL	_SSD_SET_state
	PAGESEL	$
;	.line	62; "setting_mode.c"	SSD_SET_state(SSD_R,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SET_state
	CALL	_SSD_SET_state
	PAGESEL	$
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	64; "setting_mode.c"	Flags.Heater_Operation = 0 ; //Turn off The heater element
	BANKSEL	_Flags
	CLRF	(_Flags + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	65; "setting_mode.c"	Flags.Cooler_Operation = 0 ; //Turn off Heater element
	CLRF	(_Flags + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	67; "setting_mode.c"	Flags.Toggle_led = 3;        //Turn off Warning Led
	MOVLW	0x03
	MOVWF	(_Flags + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
;	.line	69; "setting_mode.c"	Counters.FixedMode_counter    = 0 ;
	BANKSEL	_Counters
	CLRF	(_Counters + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
;	.line	70; "setting_mode.c"	Counters.Blink_counter      = 0 ;
	CLRF	(_Counters + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;	.line	71; "setting_mode.c"	Readings.temp_read          = 0 ;
	BANKSEL	_Readings
	CLRF	(_Readings + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	CLRF	(_Readings + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	CLRF	(_Readings + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	CLRF	(_Readings + 3)
	RETURN	
; exit point of _SettingMode_OFF_mode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SettingMode_Blinking_mode	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1013
;   r0x1014
;; Starting pCode block
_SettingMode_Blinking_mode	;Function start
; 2 exit points
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	45; "setting_mode.c"	Flags.Heater_Operation = 0 ; //Turn off The heater element
	BANKSEL	_Flags
	CLRF	(_Flags + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	46; "setting_mode.c"	Flags.Cooler_Operation = 0 ;//Turn off Heater element
	CLRF	(_Flags + 3)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	47; "setting_mode.c"	Flags.Toggle_led = 3;      //Turn off Warning Led
	MOVLW	0x03
	MOVWF	(_Flags + 1)
;	.line	49; "setting_mode.c"	if(Counters.Blink_counter == 100)
	BANKSEL	_Counters
	MOVF	(_Counters + 2),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	BANKSEL	_Counters
	MOVF	(_Counters + 3),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1013,W
	XORLW	0x64
	BTFSS	STATUS,2
	GOTO	_00133_DS_
	MOVF	r0x1014,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00133_DS_
;	.line	51; "setting_mode.c"	Flags.next_state^=1; //toggle SSD State
	BANKSEL	_Flags
	MOVF	(_Flags + 0),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVLW	0x01
	XORWF	r0x1013,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1013,W
	BANKSEL	_Flags
	MOVWF	(_Flags + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
;	.line	52; "setting_mode.c"	Counters.Blink_counter = 0 ;
	BANKSEL	_Counters
	CLRF	(_Counters + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 3)
_00133_DS_
;	.line	54; "setting_mode.c"	Counters.Blink_counter ++;
	BANKSEL	_Counters
	MOVF	(_Counters + 2),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	BANKSEL	_Counters
	MOVF	(_Counters + 3),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	INCF	r0x1013,F
	BTFSC	STATUS,2
	INCF	r0x1014,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1013,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 3)
;	.line	55; "setting_mode.c"	Counters.FixedMode_counter++;
	MOVF	(_Counters + 0),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	BANKSEL	_Counters
	MOVF	(_Counters + 1),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	INCF	r0x1013,F
	BTFSC	STATUS,2
	INCF	r0x1014,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1013,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 1)
	RETURN	
; exit point of _SettingMode_Blinking_mode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SettingMode_Fixed_mode	;Function start
; 2 exit points
;has an exit
;12 compiler assigned registers:
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
_SettingMode_Fixed_mode	;Function start
; 2 exit points
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	26; "setting_mode.c"	Flags.next_state = 1 ; //make the SSD go into normal operation
	MOVLW	0x01
	BANKSEL	_Flags
	MOVWF	(_Flags + 0)
;	.line	28; "setting_mode.c"	if(Readings.temp_read <= (Readings.Set_value-5))
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x101A
	MOVWF	r0x101A
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x101B
	MOVWF	r0x101B
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x101C
	MOVWF	r0x101C
	MOVLW	0xfb
	ADDWF	r0x1019,W
	MOVWF	r0x101D
	MOVLW	0xff
	MOVWF	r0x101E
	MOVF	r0x101A,W
	BTFSC	STATUS,0
	INCFSZ	r0x101A,W
	ADDWF	r0x101E,F
	MOVLW	0xff
	MOVWF	r0x101F
	MOVF	r0x101B,W
	BTFSC	STATUS,0
	INCFSZ	r0x101B,W
	ADDWF	r0x101F,F
	MOVLW	0xff
	MOVWF	r0x1020
	MOVF	r0x101C,W
	BTFSC	STATUS,0
	INCFSZ	r0x101C,W
	ADDWF	r0x1020,F
	MOVF	r0x1018,W
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVF	r0x1017,W
	SUBWF	r0x101F,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVF	r0x1016,W
	SUBWF	r0x101E,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVF	r0x1015,W
	SUBWF	r0x101D,W
_00126_DS_
	BTFSS	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	30; "setting_mode.c"	Flags.Toggle_led = 1 ;        //the led will toggle
	MOVLW	0x01
;	.line	31; "setting_mode.c"	Flags.Heater_Operation = 1 ; //Turn on The Heater element
	BANKSEL	_Flags
	MOVWF	(_Flags + 1)
	MOVWF	(_Flags + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	32; "setting_mode.c"	Flags.Cooler_Operation = 0 ;//Turn off Cooler element
	CLRF	(_Flags + 3)
	GOTO	_00118_DS_
_00116_DS_
;	.line	34; "setting_mode.c"	else if(Readings.temp_read >= (Readings.Set_value+5))
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVLW	0x05
	ADDWF	r0x1019,F
	BTFSC	STATUS,0
	INCF	r0x101A,F
	BTFSC	STATUS,2
	INCF	r0x101B,F
	BTFSC	STATUS,2
	INCF	r0x101C,F
	MOVF	r0x101C,W
	SUBWF	r0x1018,W
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVF	r0x101B,W
	SUBWF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVF	r0x101A,W
	SUBWF	r0x1016,W
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVF	r0x1019,W
	SUBWF	r0x1015,W
_00127_DS_
	BTFSS	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3247: created from rifx:027A5DF4
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	36; "setting_mode.c"	Flags.Toggle_led   = 0 ;      //the led will turn on without toggling
	BANKSEL	_Flags
	CLRF	(_Flags + 1)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	37; "setting_mode.c"	Flags.Heater_Operation = 0 ; //Turn on The Heater element
	CLRF	(_Flags + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	38; "setting_mode.c"	Flags.Cooler_Operation = 1 ;//Turn off Heater element
	MOVLW	0x01
	MOVWF	(_Flags + 3)
_00118_DS_
	RETURN	
; exit point of _SettingMode_Fixed_mode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SettingMode_update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _SettingMode_Fixed_mode
;   _SettingMode_Blinking_mode
;   _SettingMode_Fixed_mode
;   _SettingMode_Blinking_mode
;2 compiler assigned registers:
;   r0x1021
;   r0x1022
;; Starting pCode block
_SettingMode_update	;Function start
; 2 exit points
;	.line	11; "setting_mode.c"	if(Counters.FixedMode_counter == 1000) //if 5s are run out without pressing up or down buttons the system goes into fixed mode
	BANKSEL	_Counters
	MOVF	(_Counters + 0),W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	BANKSEL	_Counters
	MOVF	(_Counters + 1),W
	BANKSEL	r0x1022
	MOVWF	r0x1022
	MOVF	r0x1021,W
	XORLW	0xe8
	BTFSS	STATUS,2
	GOTO	_00106_DS_
	MOVF	r0x1022,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	13; "setting_mode.c"	SettingMode_Fixed_mode();
	CALL	_SettingMode_Fixed_mode
	GOTO	_00108_DS_
_00106_DS_
;	.line	18; "setting_mode.c"	SettingMode_Blinking_mode();
	CALL	_SettingMode_Blinking_mode
_00108_DS_
	RETURN	
; exit point of _SettingMode_update


;	code size estimation:
;	  181+   60 =   241 instructions (  602 byte)

	end
