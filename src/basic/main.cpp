#include <iostream>

#include <pybind11/pybind11.h>

int VectorAdd(void);  // Create symbol for the function in the CUDA code

int add(int i, int j) { return i + j; }

PYBIND11_MODULE(example, m) {
    m.doc() = "pybind11 example plugin";  // optional module docstring

    m.def("add", &add, "A function which adds two numbers");
    m.def("cudaAdd", &VectorAdd, "A CUDA function which adds two vectors");
}
