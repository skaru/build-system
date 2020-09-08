cmake_minimum_required(VERSION 3.10)

# set the project name
project(Test VERSION 1.0)

# add the executable
add_executable(Test)

target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")