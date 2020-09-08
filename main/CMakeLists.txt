add_library(main STATIC main.c)

#conditional
target_link_libraries(main PUBLIC bar)
target_include_directories(main PUBLIC include)