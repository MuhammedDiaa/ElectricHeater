#include "SSD.h"

unsigned char display_flag = 1; // switch between two modes of displaying in Fixed mode (temp sensor value mode,user set value mode )

//Seven segment display lookup table
static const unsigned char symbols [11] =
{
    0b00111111,
    0b00000110,
    0b01011011,
    0b01001111,
    0b01100110,
    0b01101101,
    0b01111101,
    0b00000111,
    0b01111111,
    0b01101111,
    0b00000000
};

unsigned char SSD_symbols[SSD_NUMBER]= {SSD_NULL};

void SSD_Init(tSSD ssd,SSD_STATE initial_state, SSD_symbol initial_symbol)
{

    /*initialize the port that the ssd will be connected on then set it to null in the beginning*/
    GPIO_InitPort(SSD_DataPORT,GPIO_OUT);
    GPIO_SetPortState(SSD_DataPORT,symbols[SSD_NULL]);

    switch(ssd)
    {
    /*init enable pin for the ssd that the user will choose */
    case SSD_MR:
        GPIO_InitPortPin(SSD_En_PORT,SSD_MR_En_Pin,GPIO_OUT);
        break;
    case SSD_R :
        GPIO_InitPortPin(SSD_En_PORT,SSD_R_En_Pin,GPIO_OUT);
        break;
    default :
        //shouldn't be here
        break;
    }

    SSD_SET_state(ssd,initial_state);
    SSD_SET_Symbol(ssd, initial_symbol);
}

void SSD_SET_state(tSSD ssd,SSD_STATE state)
{
    switch(ssd)
    {
    /*init enable pin for the ssd that the user will choose */
    case SSD_MR:
        GPIO_SetPortPinState(SSD_En_PORT,SSD_MR_En_Pin,state);
        break;
    case SSD_R :
        GPIO_SetPortPinState(SSD_En_PORT,SSD_R_En_Pin,state);
        break;
    default :
        //shouldn't be here
        break;
    }

}

void SSD_SET_Symbol(tSSD ssd,SSD_symbol symbol)
{
    SSD_symbols[ssd] = symbol ;
}


SSD_STATE SSD_GET_state(tSSD ssd)
{
    switch(ssd)
    {
    /*init enable pin for the ssd that the user will choose */
    case SSD_MR:
        return GPIO_GetPortPinState(SSD_En_PORT,SSD_MR_En_Pin);
        break;
    case SSD_R:
        return GPIO_GetPortPinState(SSD_En_PORT,SSD_R_En_Pin);
        break;
    default:
        //shouldn't be here
        return 0;
        break;
    }
}



SSD_symbol SSD_GET_Symbol(tSSD ssd)
{

    SSD_symbol ret = SSD_NULL;

    ret = SSD_symbols[ssd];

    return ret;
}


void SSD_update()
{
    static unsigned char current_ssd = SSD_MR ;
    if(display_flag)//display the set value
    {
        SSD_SET_Symbol(SSD_MR,((Readings.Set_value%1000)%100)/10);
        SSD_SET_Symbol(SSD_R,Readings.Set_value%10);
    }
    else//display the current temp read in fixed mode
    {
        SSD_SET_Symbol(SSD_MR,((Readings.temp_read%1000)%100)/10);
        SSD_SET_Symbol(SSD_R,Readings.temp_read %10);
    }
    SSD_SET_state(SSD_MR,SSD_OFF);
    SSD_SET_state(SSD_R,SSD_OFF);
    GPIO_SetPortState(SSD_DataPORT,symbols[SSD_symbols[current_ssd]]);
    SSD_SET_state(current_ssd,Flags.next_state);
    if(current_ssd == SSD_R)
    {
        current_ssd  = SSD_MR;

    }
    else
    {
        current_ssd++;
    }
}
