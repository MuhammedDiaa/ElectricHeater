#include "adc.h"

void ADC_Init(unsigned char clock_source)
{
	ADC_SET_STATE(ADC_OFF);
	ADC_SELECT_CLOCK_SOURCE(clock_source);
	ADC_SELECT_VREFP(0); //Internal VREF+
	ADC_SELECT_VREFN(0); //Internal VREF-
	ADC_CONFIGURE_PORT(2);
}

void  ADC_Update(void)
{
}

unsigned int ADC_GetResult(unsigned char channel)
{
	unsigned int ret = 0;

	ADC_SELECT_CHANNEL(channel);
	ADC_SELECT_RESULT_JUSTIFICATION(RIGHT);
	ADC_SET_STATE(ADC_ON);
	ADC_START_CONVERSION();
	ADC_WAIT_FOR_RESULT();
	ret = ADC_READ_RESULT(RIGHT);

	return ret;
}

//NOT USED IN THIS PROJECT
void Start_conversion_Int(unsigned char channel){

    ADC_SELECT_CHANNEL(channel);
	ADC_SELECT_RESULT_JUSTIFICATION(RIGHT);
	ADC_SET_STATE(ADC_ON);
	ADC_START_CONVERSION();
	GIE  = 1 ;
	PEIE = 1 ;
	ADIE = 1 ;
}
