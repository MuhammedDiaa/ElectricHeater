#include "Timer.h"

void TMR0_Init(void)
{
    TMR0_state(TMR0_OFF);
    TMR0_SELECT_PRESCALAR(N_256);
}

void TMR0_Start(void)
{
    TMR0_SET_INTERRUPT_STATE(Interrupt);
    GIE = 1; //set global interrupt flag
    TMR0_SELECT_CLOCK_SOURCE(Timer);
    TMR0_state(TMR0_ON); //TMR0 on
}


void TMR0_Update(void)
{
    if(Flags.Operation_Flag == ON_MODE)
    {
        PB_Update();               //~0
        SSD_update();             //~0,4ms
        Temprature_update();     //~0 ,9ms
        LED_Update();           //~0
        Heater_update();       //~0
        Cooler_update();      //~0
        SettingMode_update();//~0,0.08ms(fixed)  0,.06ms(blinking)
        e2pex_update();     // 1.5  , 6.5ms
    }
    else if(Flags.Operation_Flag == OFF_MODE)
    {
        SettingMode_update(); //~0 , 0.08 ms(fixed)  0 ms ,.06(blinking)
        Heater_update();     //~0
        Cooler_update();    //~0
        e2pex_update();    //1.5 ,6.5ms
        LED_Update();     //~0
    }
}
