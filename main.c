#include <pic16f877a.h>
#include "push_button.h"
#include "Interrupt.h"
#include "SSD.h"
#include "heater.h"
#include "cooler.h"
#include "led.h"
#include "Temp.h"
#include "i2c.h"
#include "Timer.h"
#include "eeprom_ext.h"

unsigned int  __at(0x2007) CONFIG = _HS_OSC & _WDT_OFF & _PWRTE_ON & _BODEN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _DEBUG_OFF & _CP_OFF;

extern unsigned char flag ; //This flag handles the interrupt in main's while 1 ;

void main(){
/*Push buttons initialization*/
    PB_Init(PB_UP,PB_RELEASED);
    PB_Init(PB_DOWN,PB_RELEASED);
    RB0_INT_Init();

/*seven segment display initialization*/
    SSD_Init(SSD_MR,SSD_OFF,SSD_NULL);
    SSD_Init(SSD_R,SSD_OFF,SSD_NULL);

/*Heating elements initialization*/
    Heater_Init();
    Cooler_Init();
    LED_Init(LED_7,LED_OFF);

/*Temperature sensor initialization*/
    Temprature_Init();

/*I2C initialization*/
    I2C_Init(488);//we choose this value because the system operates at 8MHz frequency.
    Flags.e2prom_flag = 0;

    TMR0_Init();
    TMR0_Start();

while(1){

        while(flag == 0){

        }
        flag = 0;

        TMR0_Update(); //the whole program logic is called in this function.

}

}
