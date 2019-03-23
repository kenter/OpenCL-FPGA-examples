#include "macros.h"

__kernel
void vscale(
__global float16 *restrict x,
__global float16 *restrict y,
const float a,
const int size16)
{
    LABEL(vscale)
    for(int i=0; i<size16; i++){
        y[i] = x[i]*a;
    }
}
