#include<pic16f877a.h>


#define _XTAL_FREQ 8000000


void I2C_Init(const unsigned long feq_K);
void I2C_Hold();
void I2C_Begin();
void I2C_End();
void I2C_Write(unsigned data);
unsigned short I2C_Read(unsigned short ack);


