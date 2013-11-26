Compiling mixed cpu/gpu code
=============

This tutorial will cover linking GPU code compiled with NVCC and CPU code compiled with the Cray compiler wrappers cc/CC/ftn. The Cray compiler wrappers work in conjunction with the modules system to link in needed libraries such as MPI; it is therefore recommended that the wrappers be used to compile the CPU portions of your code. To generate compiler portable code it is necessary to compile CUDA C and CUDA runtime containing code with NVCC. The resulting NVCC compiled object code must then be linked in with object code compiled with the Cray wrappers. NVCC preforms GNU style C++ name mangling on compiled functions so care must be taken in compiling and linking codes. 
