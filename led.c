#include "led.h"

void LED_Init(tLED led, tLED_State initial_state)
{
    /* Initialize led pin as an output */
    switch(led)
    {
    case LED_1:
        //TRISB0 = 0;
        GPIO_InitPortPin(PORT_B, 0, GPIO_OUT);
        break;
    case LED_2:
        //TRISB1 = 0;
        GPIO_InitPortPin(PORT_B, 1, GPIO_OUT);
        break;
    case LED_3:
        //TRISB2 = 0;
        GPIO_InitPortPin(PORT_B, 2, GPIO_OUT);
        break;
    case LED_4:
        //TRISB3 = 0;
        GPIO_InitPortPin(PORT_B, 3, GPIO_OUT);
        break;
    case LED_7:
        //TRISB3 = 0;
        GPIO_InitPortPin(PORT_B, 7, GPIO_OUT);
        break;
    default:
        /* Should not be here */
        break;
    }

    /* Set led state with initial_state */
    LED_SetState(led, initial_state);
}

void LED_Update(void)
{
    switch(Flags.Toggle_led)
    {
    case 0:
        LED_SetState(LED_7,LED_ON);
        break;
    case 1:
        if(Counters.Led_counter == 50)
        {
            LED_Toggle(LED_7);
            Counters.Led_counter = 0 ;
        }
        Counters.Led_counter++ ;
        break;
    case 3:
        LED_SetState(LED_7,LED_OFF);
        break;
    default:
        break;
    }
}


tLED_State LED_GetState(tLED led)
{
    tLED_State ret = LED_OFF;

    switch(led)
    {
    case LED_1:
        ret = GPIO_GetPortPinState(PORT_B, 0);
        break;
    case LED_2:
        ret = GPIO_GetPortPinState(PORT_B, 1);
        break;
    case LED_3:
        ret = GPIO_GetPortPinState(PORT_B, 2);
        break;
    case LED_4:
        ret = GPIO_GetPortPinState(PORT_B, 3);
        break;
    case LED_7:
        ret = GPIO_GetPortPinState(PORT_B, 7);
        break;
    default:
        /* Should not be here */
        break;
    }

    return ret;

}
void LED_SetState(tLED led, tLED_State state)
{
    switch(led)
    {
    case LED_1:
        GPIO_SetPortPinState(PORT_B, 0, state);
        break;
    case LED_2:
        GPIO_SetPortPinState(PORT_B, 1, state);
        break;
    case LED_3:
        GPIO_SetPortPinState(PORT_B, 2, state);
        break;
    case LED_4:
        GPIO_SetPortPinState(PORT_B, 3, state);
        break;
    case LED_7:
        GPIO_SetPortPinState(PORT_B, 7, state);
        break;
    default:
        /* Should not be here */
        break;
    }

}

static void LED_Toggle(tLED led)
{
    if (LED_GetState(led) == LED_ON)
    {
        LED_SetState(led, LED_OFF);
    }
    else
    {
        LED_SetState(led, LED_ON);
    }
}
