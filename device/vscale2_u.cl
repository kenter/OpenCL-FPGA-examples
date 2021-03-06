#include "macros.h"

__kernel
void vscale(
__global float *restrict x,
__global float *restrict y,
const float a,
const int size)
{
    __attribute__((opencl_unroll_hint(16)))
    LABEL(vscale)
    for(int i=0; i<size; i++){
        y[i] = x[i]*a;
    }
}
