file(GLOB EXAMPLE_SRC_FILES "*.cpp")
file(GLOB EXAMPLE_CUDA_SRC_FILES "*.cu")

# First, compile the CUDA code into a shared library
add_library(example_cuda STATIC ${EXAMPLE_CUDA_SRC_FILES})
target_include_directories(example_cuda PRIVATE ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

# Second, compile the C++ wrapper code with the built CUDA library and pybind11
pybind11_add_module(example MODULE ${EXAMPLE_SRC_FILES})
target_link_libraries(example PRIVATE example_cuda)

install(TARGETS example DESTINATION ${LIB_DIR})
