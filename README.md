# NRF52 Clion project template

A NRF52 Blinky project template which can be used in both keil and Clion

## Getting Started






### Prerequisites

nrfjprog TODO

NRF52 SDK LINK

folder structure

SDK
Projects/NRF52_Clion_Template

or update line 5 in makefile: SDK_ROOT := ../../SDK


MinGW

gnu arm toolchain https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads

SDK\components\toolchain\gcc\makefile.windows update GNU_INSTALL_ROOT := C:\Program Files (x86)\GNU Tools ARM Embedded\7 2017-q4-major\bin/

	check add path to enviroment variable

gnuWin32 http://gnuwin32.sourceforge.net/packages/make.htm

add C:\Program Files (x86)\GnuWin32\bin to path varialables

visual studio not found, click configure, add toolchain, download

next to build dropdown select NRF52

edit run configuarations (dropdown next to build)

	Executable change to jlinkProgramRun.bat

	Program arguments _build//nrf52832_xxaa.hex





