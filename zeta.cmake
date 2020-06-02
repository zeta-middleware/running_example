message("[ZETA]: Running zeta.cmake")

execute_process(COMMAND zeta gen -b "${CMAKE_CURRENT_LIST_DIR}/build"
                        ${CMAKE_CURRENT_LIST_DIR}/zeta.yaml RESULT_VARIABLE ztcli_gen_exit_code)

if(ztcli_gen_exit_code GREATER 0)
  message( FATAL_ERROR "ZetaCli generation failed with exit code: ${ztcli_gen_exit_code}")
endif()

if(CONF_FILE)
elseif(DEFINED ENV{CONF_FILE})
  set(CONF_FILE $ENV{CONF_FILE})
elseif(EXISTS   ${CMAKE_CURRENT_SOURCE_DIR}/prj_${BOARD}.conf)
  set(CONF_FILE ${CMAKE_CURRENT_SOURCE_DIR}/prj_${BOARD}.conf)
elseif(EXISTS   ${CMAKE_CURRENT_SOURCE_DIR}/boards/${BOARD}.conf)
  set(CONF_FILE ${CMAKE_CURRENT_SOURCE_DIR}/prj.conf ${CMAKE_CURRENT_SOURCE_DIR}/boards/${BOARD}.conf)
elseif(EXISTS   ${CMAKE_CURRENT_SOURCE_DIR}/prj.conf)
  set(CONF_FILE ${CMAKE_CURRENT_SOURCE_DIR}/prj.conf)
endif()

list(APPEND CONF_FILE "${CMAKE_CURRENT_LIST_DIR}/build/zeta/zeta.conf")
list(APPEND HEADERS "${CMAKE_CURRENT_LIST_DIR}/build/zeta/include/")
list(APPEND SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/sensor.c" "${CMAKE_CURRENT_LIST_DIR}/src/core.c" "${CMAKE_CURRENT_LIST_DIR}/src/actuator.c")

set(ZEPHYR_EXTRA_MODULES "${CMAKE_CURRENT_LIST_DIR}/build/zeta")
