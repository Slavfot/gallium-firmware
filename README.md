# Gallium Wireless Keyboard Firmware
Firmware for Nordic MCUs used in the Gallium wireless Keyboard, contains precompiled .hex files, as well as sources buildable with the Nordic SDK <br>
This firmware was derived from [Mattdibis' Redox-w](https://github.com/mattdibi/redox-w-firmware), [Reversebias' Mitosis](https://github.com/reversebias/mitosis) and [Durburz's Interphase](https://github.com/Durburz/interphase-firmware/) firmware.

## Gallium's documentation page
For additional information about the Gallium keyboard visit:
- [Gallium's Github page](https://github.com/slavfot/gallium-keyboard)

## Instructions on how to flash the firmware to the MCU is found at 
[Gallium's Github page](https://github.com/slavfot/gallium-keyboard)

# Firmware Compiling on Windows

## Install dependencies

[MSYS2](https://www.msys2.org/) - it contains the GNU gcc, wich is the compiler.
Download and install Msys2 and follow every installation step on the site.
We will use the included mingw64 terminal to make the files.

## Download Nordic SDK

Nordic does not allow redistribution of their SDK or components, so download and extract from their site:

https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v11.x.x/nRF5_SDK_11.0.0_89a8197.zip

Unzip at any location. This is the folder that you are going to work from when building the firmware.

Firmware written and tested with version 11

## Download and install GNU Arm Embedded Toolchain

Download and install GNU Arm Embedded Toolchain

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

Firmware written and tested with version gcc-arm-none-eabi-9-2019-q4-major-win32-sha2

## Edit Makefile.windows

In the nRF5_SDK_11 folder that you unziped earlier you need to edit the makefile.windows to match your pathway and version to GNU Arm Embedded toolchain.

It is located in nRF5_SDK_11\components\toolchain\gcc

Open Makefile.windows and edit these lines to match your pathway and version of GNU Tools Arm Embedded:

```
GNU_INSTALL_ROOT := C:\pathway\to\gnu\GNU Tools Arm Embedded\9 2019-q4-major
GNU_VERSION := 9
```

## Make Commands

clone gallium-firmware repository inside nRF5_SKD_11/

Launch mingw64 and cd to gallium-firmware and run the make command to compile.

```
make -C redox-w-receiver-basic/custom/armgcc
make -C redox-w-keyboard-basic/custom/armgcc keyboard_side=left
make -C redox-w-keyboard-basic/custom/armgcc keyboard_side=right 
```

The keyboard left and right make command writes the files to the same folder and rewrites the files current in that folder.
Make sure to make a copy of the .hex file before compiling the .hex for the other side of the keyboard.

Keyboard files builds to gallium-firmware\gallium-keyboard-basic\custom\armgcc\_build

Receiver files builds to gallium-firmware\gallium-receiver-basic\custom\armgcc\_build

# Firmware Compiling on Linux

## Install dependencies

Tested on Ubuntu 16.04.2, but should be able to find alternatives on all distros.

```
sudo apt install openocd gcc-arm-none-eabi
```

## Download Nordic SDK

Nordic does not allow redistribution of their SDK or components, so download and extract from their site:

https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v11.x.x/nRF5_SDK_11.0.0_89a8197.zip

Firmware written and tested with version 11

```
unzip nRF5_SDK_11.0.0_89a8197.zip -d nRF5_SDK_11
cd nRF5_SDK_11
```

## Toolchain set-up

A cofiguration file that came with the SDK needs to be changed. Assuming you installed gcc-arm with apt, the compiler root path needs to be changed in /components/toolchain/gcc/Makefile.posix, the line:

```
GNU_INSTALL_ROOT := /usr/local/gcc-arm-none-eabi-4_9-2015q1
```

Replaced with:

```
GNU_INSTALL_ROOT := /usr/
```

## Clone repository
Inside nRF5_SDK_11/

```
git clone https://github.com/mattdibi/redox-w-firmware
```

Now you are ready to build firmware with the Nordic SDK.

make -C gallium-receiver-basic/custom/armgcc
make -C gallium-keyboard-basic/custom/armgcc keyboard_side=left
make -C gallium-keyboard-basic/custom/armgcc keyboard_side=right

## Automatic make and programming scripts
To use the automatic build scripts:
* keyboard-left: `./gallium-keyboard-basic/program_left.sh`
* keyboard-right: `./gallium-keyboard-basic/program_right.sh`
* receiver: `./gallium-receiver-basic/program.sh`