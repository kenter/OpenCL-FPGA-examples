#include "macros.h"

#define BLOCK_SIZE 1024

__kernel
void SAXPY(
__global const float *restrict x,
__global float *restrict y,
const int a,
const int size)
{
    #pragma ivdep
    for (int i=0; i<size; i+=BLOCK_SIZE){
        float local_x[BLOCK_SIZE];
        float local_y[BLOCK_SIZE];
        __attribute__((opencl_unroll_hint(16)))
        for (int j=0; j<BLOCK_SIZE; j++){
            local_x[j] = x[i+j];
        }
        __attribute__((opencl_unroll_hint(16)))
        for (int j=0; j<BLOCK_SIZE; j++){
            local_y[j] = y[i+j];
        }
        __attribute__((opencl_unroll_hint(16)))
        for (int j=0; j<BLOCK_SIZE; j++){
            y[i+j] = a*local_x[j] + local_y[j];
        }
    }
}
