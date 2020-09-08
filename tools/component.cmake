function(register_component)
    set(options)
    set(oneValueArg)
    set(multiValueArg SRCS DEPS)
    cmake_parse_arguments(_ "${options}" "${oneValueArg}" "${multiValueArg}" ${ARGN})
    get_component_name(COMPONENT_NAME)
    string(TOUPPER ${COMPONENT_NAME} CONFIG_NAME)

    if("CONFIG_${CONFIG_NAME}_ENABLE" IN_LIST CONFIGS_LIST)
        if("CONFIG_${CONFIG_NAME}_ENABLE" STREQUAL "")
            return()
        endif()
    endif()

    add_library(${COMPONENT_NAME} STATIC ${__SRCS})
    target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${COMPONENT_NAME})
    target_include_directories(${COMPONENT_NAME} PUBLIC include "${PROJECT_SOURCE_DIR}/build")

    foreach(component ${__DEPS})
        if("CONFIG_${CONFIG_NAME}_ENABLE" IN_LIST CONFIGS_LIST)
            if("CONFIG_${CONFIG_NAME}_ENABLE" STREQUAL "")
                continue()
            endif()
        endif()
        target_link_libraries(${COMPONENT_NAME} PUBLIC ${component})
    endforeach()
endfunction()

function(get_component_name result)
    get_filename_component(COMPONENT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
    string(REPLACE " " "_" COMPONENT_NAME ${COMPONENT_NAME})

    set (${result} ${COMPONENT_NAME} PARENT_SCOPE)
endfunction()