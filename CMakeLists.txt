cmake_minimum_required(VERSION 3.16)
project(cuda_dev_template
    LANGUAGES C CXX CUDA)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
message(STATUS PROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR})
set(LIB_DIR ${PROJECT_SOURCE_DIR}/src/lib)

# PyBind11
add_subdirectory(${PROJECT_SOURCE_DIR}/extern/pybind11)
message(STATUS "PYTHON_INCLUDE_DIRS: ${PYTHON_INCLUDE_DIRS}")

# add targets
add_subdirectory(${PROJECT_SOURCE_DIR}/src)
