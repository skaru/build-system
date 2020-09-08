cmake_minimum_required(VERSION 3.18.2)
include("build/config.cmake")

project(Foobar VERSION 1.0)

add_executable(${CMAKE_PROJECT_NAME} "main/main.c")
add_subdirectory(main)

macro(SUBDIR_LIST result curdir)
  file(GLOB children RELATIVE ${curdir} ${curdir}/*)
  set(dirlist "")
  foreach(child ${children})
    if(IS_DIRECTORY ${curdir}/${child})
      list(APPEND dirlist ${child})
    endif()
  endforeach()
  set(${result} ${dirlist})
endmacro()

SUBDIR_LIST(COMPONENTS "${PROJECT_SOURCE_DIR}/components")
foreach(component ${COMPONENTS})
    add_subdirectory("components/${component}")
endforeach()

#conditional link list
#target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC main ${COMPONENTS})