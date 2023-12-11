cmake_minimum_required(VERSION 3.18)
project(cuda_dev_template
  LANGUAGES C CXX CUDA)

include(CheckLanguage)
check_language(CUDA)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
message(STATUS PROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR})
set(LIB_DIR ${PROJECT_SOURCE_DIR}/src/lib)

# set _GLIBCXX_USE_CXX11_ABI for torch
if(NOT CMAKE_CXX_ABI)
  set(CMAKE_CXX_ABI 0 CACHE STRING
    "Choose the value for _GLIBCXX_USE_CXX11_ABI, options are: 0|1."
    FORCE)
endif(NOT CMAKE_CXX_ABI)
message(STATUS "CMAKE_CXX_ABI: _GLIBCXX_USE_CXX11_ABI=${CMAKE_CXX_ABI}")
add_definitions(-D_GLIBCXX_USE_CXX11_ABI=${CMAKE_CXX_ABI})

# PyBind11
add_subdirectory(${PROJECT_SOURCE_DIR}/extern/pybind11)
message(STATUS "PYTHON_INCLUDE_DIRS: ${PYTHON_INCLUDE_DIRS}")

# CUDA
message(STATUS "CUDA_INCLUDE_DIR: ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}")
set(CMAKE_CUDA_ARCHITECTURES 60 61 70 75 80 86)
set(CMAKE_CUDA_FLAGS "-fPIC --extended-lambda")

# Pytorch
include(cmake/TorchExtension.cmake)

# add targets
add_subdirectory(${PROJECT_SOURCE_DIR}/src)
