add_library(bar STATIC bar.c)
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC bar)
target_include_directories(bar PUBLIC include "${PROJECT_SOURCE_DIR}/build")