file(GLOB GELU_SRC_FILES "*.cpp")
file(GLOB GELU_CUDA_SRC_FILES "*.cu")

add_pytorch_extension(gelu ${GELU_SRC_FILES} ${GELU_CUDA_SRC_FILES})

install(TARGETS gelu DESTINATION ${LIB_DIR})
