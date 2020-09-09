include("${PROJECT_SOURCE_DIR}/tools/component.cmake")
register_component(SRCS main.c DEPS foo bar TYPE OBJECT)