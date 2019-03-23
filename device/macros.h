#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#pragma OPENCL EXTENSION cl_intel_channels : enable

#if defined(__xilinx__)
    #define PIPE pipe
    #define PIPE_READ(name, val) read_pipe_block(name, &val)
    #define PIPE_WRITE(name, val) write_pipe_block(name, &val)
    #define LABEL(x) x:
#elif defined(INTELFPGA_CL)
    #define PIPE channel
    #define PIPE_READ(name, val) val = read_channel_intel(name)
    #define PIPE_WRITE(name, val) write_channel_intel(name, val)
    #define LABEL(x)
#endif

#define TYPE float