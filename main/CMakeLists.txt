add_library(main STATIC main.c)
target_link_libraries(main PUBLIC bar)
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC main)
target_include_directories(main PUBLIC include "${PROJECT_SOURCE_DIR}/build")

if(CONFIG_FOO_ENABLE STREQUAL "y")
    target_link_libraries(main PUBLIC foo)
endif()