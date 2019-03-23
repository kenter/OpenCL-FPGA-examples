#include "macros.h"

PIPE float16 p_y __attribute__((xcl_reqd_pipe_depth(32)));

__kernel
void readY(
__global float16 *restrict y,
const int size16)
{
    for (int i=0; i<size16; i++){
        float16 y_in = y[i];
        PIPE_WRITE(p_y, y_in);
    }
}

__kernel
void SAXPY(
__global const float16 *restrict x,
__global float16 *restrict y,
const int a,
const int size16)
{
    for (int i=0; i<size16; i++){
        float16 y_in;
        PIPE_READ(p_y, y_in);
        y[i] = a*x[i] + y_in;
    }
}
