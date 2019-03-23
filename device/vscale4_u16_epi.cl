#include "macros.h"

__kernel
void vscale(
__global float *restrict x,
__global float *restrict y,
const float a,
const int size)
{
    const int size16 = size / 16;
    __attribute__((opencl_unroll_hint(16)))
    LABEL(vscale_vec)
    for(int i=0; i<size16*16; i++){
        y[i] = x[i]*a;
    }
    const int rest = size - size16;
    LABEL(vscale_epi)
    for(int i=size16*16; i<size16*16+rest; i++){
        y[i] = x[i]*a;
    }
}
