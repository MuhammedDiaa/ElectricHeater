#include "Interrupt.h"

void RB0_INT_Init()
{
    GPIO_InitPortPin(PORT_B,0,GPIO_IN);
    GLOBAL_INT_ENABLE();
    RB0_EXINT_ENABLE();
    SET_RB0_EDGE(EDGE);//select edge from the header file
    CLEAR_RB0_EXINT_FLAG();
}

void RB0Int_update(void)
{
    //code
        if(Flags.Operation_Flag == 1){ Flags.Operation_Flag = 0 ;
        }else if(Flags.Operation_Flag == 0){Flags.Operation_Flag = 1 ;}

}

void ISR(void)__interrupt 0
{
    //Software interrupt vector table
    if(TMR0IF)
    {
        TMR0_Update();
        TMR0_InterruptFlag_Clear();
        TMR0_UPDATE_REGISTER(5);
    }

    if(INTF)
    {
        RB0Int_update();

        CLEAR_RB0_EXINT_FLAG();
    }
}
