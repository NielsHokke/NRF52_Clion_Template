#-DCMAKE_TOOLCHAIN_FILE=NRF52832.cmake

INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
#CMAKE_FORCE_C_COMPILER("C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-gcc.exe" GNU)
set(CMAKE_C_COMPILER "C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-gcc.exe")
set(CMAKE_C_COMPILER_ID_RUN TRUE)
set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_C_COMPILER_FORCED TRUE)

#CMAKE_FORCE_CXX_COMPILER("C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-g++.exe" GNU)
set(CMAKE_CXX_COMPILER "C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-g++.exe")
set(CMAKE_CXX_COMPILER_ID_RUN TRUE)
set(CMAKE_CXX_COMPILER_ID GNU)
set(CMAKE_CXX_COMPILER_FORCED TRUE)


SET(SDK_ROOT ../../SDK)
#SET(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/pca10040/blank/armgcc/blinky_gcc_nrf52.ld)
SET(LINKER_SCRIPT "blinky_gcc_nrf52.ld")

SET(OPT "-O3 -g3")
#SET(COMMON_FLAGS "-mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=soft -ffunction-sections -fdata-sections -g -fno-common -fmessage-length=0")
SET(COMMON_FLAGS "-g3 -mcpu=cortex-m4 -mthumb -mabi=aapcs -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DBOARD_PCA10040 -DBSP_DEFINES_ONLY -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD -DNRF52 -DNRF52832_XXAA -DNRF52_PAN_74") # OUD -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -g -fno-common -fmessage-length=0
SET(CMAKE_CXX_FLAGS "${COMMON_FLAGS} -std=c++11")
SET(CMAKE_C_FLAGS "${COMMON_FLAGS} -std=gnu99")
SET(CMAKE_EXE_LINKER_FLAGS "${OPT} -mthumb -mabi=aapcs -L${SDK_ROOT}/modules/nrfx/mdk -T${LINKER_SCRIPT} -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -Wl,--gc-sections --specs=nano.specs") # -Wl,-gc-sections -T ${LINKER_SCRIPT}

