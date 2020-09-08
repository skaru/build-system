if(CONFIG_FOO STREQUAL "y")
    add_library(foo STATIC foo.c)
    target_include_directories(foo PUBLIC include)
endif()