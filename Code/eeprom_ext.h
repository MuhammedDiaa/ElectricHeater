#include <pic16f877a.h>
#include "i2c.h"
#include "setting_mode.h"

unsigned char e2pext_r(unsigned int addr);
void e2pext_w(unsigned int addr, unsigned char val);
void e2pex_update(void);
