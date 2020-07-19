#include"heater.h"


void Heater_Init(void){
    GPIO_InitPortPin(PORT_C,5,GPIO_OUT);
}



static void Heater_SetState(unsigned char state){
    GPIO_SetPortPinState(PORT_C,5,state);
}


unsigned char Heater_GetState(void){
    return GPIO_GetPortPinState(PORT_C,5);
}

void Heater_update(void){
           Heater_SetState(Flags.Heater_Operation);
}
