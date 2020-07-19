#include "Interrupt.h"

unsigned char flag = 0;

void RB0_INT_Init(void)
{
    GPIO_InitPortPin(PORT_B,0,GPIO_IN);
    GLOBAL_INT_ENABLE();
    RB0_EXINT_ENABLE();
    SET_RB0_EDGE(EDGE);//select edge from the header file
    CLEAR_RB0_EXINT_FLAG();
}

void RB0Int_update(void)
{
        Flags.Operation_Flag ^= 1 ; //toggle the mode once pressing power push button
}

void ISR(void)__interrupt 0
{
    //Software interrupt vector table
    if(TMR0IF)
    {
        flag = 1 ; //execute main program
        TMR0_InterruptFlag_Clear();
        TMR0_UPDATE_REGISTER(20);
    }

    if(INTF)
    {
        RB0Int_update();

        CLEAR_RB0_EXINT_FLAG();
    }
}
