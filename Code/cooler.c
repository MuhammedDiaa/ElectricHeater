#include "cooler.h"

void Cooler_Init(void)
{
    GPIO_InitPortPin(PORT_C,2,GPIO_OUT);
}

void Cooler_SetState(unsigned char state)
{
    GPIO_SetPortPinState(PORT_C,2,state);
}

unsigned char Cooler_GetState(void)
{

    return GPIO_GetPortPinState(PORT_C,2);

}

void Cooler_update(void)
{
    Cooler_SetState(Flags.Cooler_Operation);
}
