#include "macros.h"

PIPE float p_y __attribute__((xcl_reqd_pipe_depth(32)));

__kernel
void readY(
__global float *restrict y,
const int size)
{
    for (int i=0; i<size; i++){
        float y_in = y[i];
        PIPE_WRITE(p_y, y_in);
    }
}

__kernel
void SAXPY(
__global const float *restrict x,
__global float *restrict y,
const int a,
const int size)
{
    for (int i=0; i<size; i++){
        float y_in;
        PIPE_READ(p_y, y_in);
        y[i] = a*x[i] + y_in;
    }
}
