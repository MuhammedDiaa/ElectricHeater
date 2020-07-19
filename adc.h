#ifndef __ADC_H__
#define __ADC_H__

#include <pic16f877a.h>


#define ADC_SELECT_CHANNEL(channel)	(CHS2 = ((channel & 0x4) >> 2));\
                                    (CHS1 = ((channel & 0x2) >> 1));\
                                    (CHS0 = (channel & 0x1))

#define ADC_SET_STATE(x)	(ADON = x)

#define ADC_SELECT_VREFP(x)
#define ADC_SELECT_VREFN(x)

#define ADC_SELECT_RESULT_JUSTIFICATION(justification)	(ADFM = justification)

#define ADC_READ_RESULT(justification) (justification)?(((unsigned int)((unsigned int)ADRESH)<<8)|(ADRESL)):((((unsigned int)ADRESH)<<2)|(ADRESL>>6))

#define ADC_START_CONVERSION() (GO = 1)

#define ADC_WAIT_FOR_RESULT()	while(GO == 1)

#define ADC_SELECT_CLOCK_SOURCE(clock)	(ADCS2 = ((clock) & 0x4 ) >> 2);\
										(ADCS1 = ((clock) & 0x2 ) >> 1);\
										(ADCS0 = (clock) & 0x1)

#define ADC_CONFIGURE_PORT(config)    (PCFG3 = ((config) & 0x8 ) >> 3);\
                                      (PCFG2 = ((config) & 0x4 ) >> 2);\
                                      (PCFG1 = ((config) & 0x2 ) >> 1);\
                                      (PCFG0 = (config) & 0x1 )

#define ADC_ON  1
#define ADC_OFF 0

#define RIGHT 1
#define LEFT  0

void ADC_Init(unsigned char clock_source);
void ADC_Update(void);
unsigned int ADC_GetResult(unsigned char channel);
void Start_conversion_Int(unsigned char channel);
#endif // __ADC_H__
