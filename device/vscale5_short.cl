#include "macros.h"

__kernel
void vscale(
__global short16 *restrict x,
__global short16 *restrict y,
const short a,
const int size)
{
    LABEL(vscale)
    for(int i=0; i<size; i++){
        y[i] = x[i]*a;
    }
}
