all: clean checkEnv setFlags mixed_c mixed_cpp mixed_f mixed_f_iso_c

.PHONY: checkEnv setFlags clean

checkEnv:
ifndef CRAY_CUDATOOLKIT_VERSION
    $(error cudatoolkit module not loaded)
endif

setFlags:
ifdef CRAY_PRGENVPGI
        CPPFLAGS = --gnu
endif

mixed_c: C/vecAddWrapperC.cu C/vecAdd.c
	mkdir -p bin
	nvcc -c C/vecAddWrapperC.cu
	cc -o bin/mixed_c C/vecAdd.c vecAddWrapperC.o
mixed_cpp: C++/vecAddWrapperCXX.cu C++/vecAdd.cxx
	mkdir -p bin
	nvcc -c C++/vecAddWrapperCXX.cu
	CC $(CPPFLAGS) -o bin/mixed_cpp C++/vecAdd.cxx vecAddWrapperCXX.o
mixed_f: F/vecAddWrapperF90.cu F/vecAdd.f90
	mkdir -p bin
	nvcc -c F/vecAddWrapperF90.cu
	ftn -o bin/mixed_f vecAddWrapperF90.o F/vecAdd.f90
mixed_f_iso_c: F_ISO_C/vecAddWrapperISO.cu F_ISO_C/vecAddISO.f90
	mkdir -p bin
	nvcc -c F_ISO_C/vecAddWrapperISO.cu
	ftn -o bin/mixed_f_iso_c vecAddWrapperISO.o F_ISO_C/vecAddISO.f90

clean:
	rm -f *.o
	rm -f *.mod
	rm -rf bin
