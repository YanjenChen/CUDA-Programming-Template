file(GLOB EXAMPLE_SRC_FILES "*.cpp")

pybind11_add_module(example ${EXAMPLE_SRC_FILES})

install(TARGETS example DESTINATION ${LIB_DIR})
