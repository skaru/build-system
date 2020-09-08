cmake_minimum_required(VERSION 3.18.2)
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

#conditional
SUBDIR_LIST(SUB_DIRS "${PROJECT_SOURCE_DIR}/components")
foreach(subdir ${SUB_DIRS})
    add_subdirectory("components/${subdir}")
endforeach()

#conditional link list
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC main bar)