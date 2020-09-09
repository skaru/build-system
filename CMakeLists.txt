cmake_minimum_required(VERSION 3.18.2)
include("build/config.cmake")

project(Foobar VERSION 1.0)

add_executable(${CMAKE_PROJECT_NAME} $<TARGET_OBJECTS:main>)
add_subdirectory(main)

file(GLOB children RELATIVE "${PROJECT_SOURCE_DIR}/components" "${PROJECT_SOURCE_DIR}/components/*")
set(COMPONENTS "")
foreach(component ${children})
  if(IS_DIRECTORY "${PROJECT_SOURCE_DIR}/components/${component}")
    list(APPEND COMPONENTS ${component})
    add_subdirectory("components/${component}")
  endif()
endforeach()