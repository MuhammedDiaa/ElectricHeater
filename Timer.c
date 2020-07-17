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
    if(Flags.Operation_Flag == 1)
    {
        PB_Update();
        SSD_update();
        Temprature_update();
        LED_Update();
        Heater_update();
        Cooler_update();
        SettingMode_update();
        //e2pex_update();
    }
    else if(Flags.Operation_Flag == 0)
    {
        SettingMode_OFF_mode();
        Heater_update();
        Cooler_update();
    }
  /*  if(Operation_Flag == 1){
        PB_Update();
        SSD_update();
    }else if(Operation_Flag == 0){
        SSD_SET_state(SSD_MR,SSD_OFF);
        SSD_SET_state(SSD_R,SSD_OFF);
    }*/
}
