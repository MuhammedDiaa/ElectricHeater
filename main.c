#include "gpio.h"
#include "Interrupt.h"
#include <pic16f877a.h>
#include "SSD.h"
#include "Temp.h"
#include "push_button.h"
#include "Timer.h"

unsigned int  __at(0x2007) CONFIG = _HS_OSC & _WDT_OFF & _PWRTE_ON & _BODEN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _DEBUG_OFF & _CP_OFF;



void main(){

    PB_Init(PB_UP,PB_RELEASED);
    PB_Init(PB_DOWN,PB_RELEASED);

    SSD_Init(SSD_MR,SSD_OFF,SSD_NULL);
    SSD_Init(SSD_R,SSD_OFF,SSD_NULL);

    Heater_Init();
    Cooler_Init();
    LED_Init(LED_7,LED_OFF);

    Temprature_Init();

    Readings.Set_value = 40;

    TMR0_Init();
    TMR0_Start();

while(1){

}


}
