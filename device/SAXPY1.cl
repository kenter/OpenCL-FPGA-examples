#include "macros.h"

__kernel
void SAXPY(
__global const float *restrict x,
__global float *restrict y,
const int a,
const int size)
{
    for (int i=0; i<size; i++)
        y[i] = a*x[i] + y[i];
}
