cmake_minimum_required(VERSION 2.8.4)
project(NRF_CLION)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_custom_target(NRF52 COMMAND make
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

SET(SDK_ROOT ../../SDK)
SET(CMSIS "C:/Keil_v5/ARM/PACK/ARM/CMSIS/4.5.0/Device/ARM/ARMCM4/Source/ARM")

add_definitions(-DCLION)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY build)

file(GLOB_RECURSE USER_SOURCES "*.c")
file(GLOB_RECURSE NRF_SOURCES   "${SDK_ROOT}/modules/nrfx/mdk/gcc_startup_nrf52.S"
                                "${SDK_ROOT}/components/boards/boards.c"
                                "${SDK_ROOT}/components/libraries/util/app_error.c"
                                "${SDK_ROOT}/components/libraries/util/app_error_handler_gcc.c"
                                "${SDK_ROOT}/components/libraries/util/app_error_weak.c"
                                "${SDK_ROOT}/components/libraries/util/app_util_platform.c"
                                "${SDK_ROOT}/components/libraries/util/nrf_assert.c"
                                "${SDK_ROOT}/components/libraries/strerror/nrf_strerror.c"
                                "${SDK_ROOT}/modules/nrfx/mdk/system_nrf52.c")

add_library(CMSIS
        keil/RTE/Device/nRF52832_xxAA/system_nrf52.c
        keil/RTE/Device/nRF52832_xxAA/arm_startup_nrf52.s)

include_directories(${SDK_ROOT}/components)
include_directories(${SDK_ROOT}/components/libraries/experimental_memobj)
include_directories(${SDK_ROOT}/components/libraries/experimental_section_vars)
include_directories(${SDK_ROOT}/modules/nrfx/mdk)
include_directories(${SDK_ROOT}/modules/nrfx/hal)
include_directories(${SDK_ROOT}/components/libraries/balloc)
include_directories(${SDK_ROOT}/components/libraries/experimental_log)
include_directories(${SDK_ROOT}/components/libraries/experimental_log/src)
include_directories(${SDK_ROOT}/components/libraries/delay)
include_directories(${SDK_ROOT}/components/libraries/util)
include_directories(${SDK_ROOT}/integration/nrfx)
include_directories(${SDK_ROOT}/components/libraries/bsp)
include_directories(${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd)
include_directories(config)
include_directories(${SDK_ROOT}/components/libraries/strerror)
include_directories(${SDK_ROOT}/components/boards)
#include_directories(${SDK_ROOT}/components/toolchain/cmsis/include)
include_directories(${SDK_ROOT}/modules/nrfx)
include_directories(./)
include_directories(/components/libraries/util)
include_directories("C:/Keil_v5/ARM/PACK/ARM/CMSIS/4.5.0/CMSIS/Include")


if (TARGET CMSIS) # OR TARGET NRF52
    add_executable(${PROJECT_NAME}.elf ${USER_SOURCES} ${NRF_SOURCES} ${LINKER_SCRIPT})
    target_link_libraries(${PROJECT_NAME}.elf CMSIS)

    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Map=${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.map")
    set(HEX_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.hex)
    set(BIN_FILE ${PROJECT_SOURCE_DIR}/build/${PROJECT_NAME}.bin)
    add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${HEX_FILE}
            COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}.elf> ${BIN_FILE}
            COMMENT "Building ${HEX_FILE} \nBuilding ${BIN_FILE}")
endif()
