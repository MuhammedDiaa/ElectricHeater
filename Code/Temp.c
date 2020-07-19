#include "Temp.h"

void Temprature_Init(void){
    ADC_Init(1); // 250ns sampling rate
}


/*LM35 calculations
==================
5v  (vref+)      ===> 1023(ADC_max)
1.5v(max volt)   ===> max_ADC_value_for_temp_sensor

150(max_temp_value) ===> max_ADC_value_for_temp_sensor
temp                ===> ADC_READ_RESULT()
*/

static void Temprature_Read(void){
        if(Counters.Temp_counter == 10)
        {
            Readings.temp_read = ADC_GetResult(2);
            Readings.temp_read = (Readings.temp_read*150*5)/(1.5*1023);
            Counters.Temp_counter=0 ; // counter to read every 100ms one reading
        }
}

void Temprature_update(void){
    Temprature_Read();
    Counters.Temp_counter++;
}

