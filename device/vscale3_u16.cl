#include "macros.h"

__kernel
void vscale(
__global float *restrict x,
__global float *restrict y,
const float a,
const int size)
{
    // attention, functionality only identical if size is multiple of 16
    const int size16 = size / 16;
    __attribute__((opencl_unroll_hint(16)))
    LABEL(vscale)
    for(int i=0; i<size16*16; i++){
        y[i] = x[i]*a;
    }
}
