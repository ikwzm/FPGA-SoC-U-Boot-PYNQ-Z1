FPGA-SoC-U-Boot-PYNQ-Z1
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This Repository provides a U-Boot Image for PYNQ-Z1.

### Features

* U-Boot v2016.03 (customized)
  + Build for PYNQ-Z1
  + Customized boot by uEnv.txt
  + Customized boot by boot.scr
  + Enable bootmenu

Build U-boot for PYNQ-Z1
------------------------------------------------------------------------------------

There are two ways

1. run scripts/build-u-boot-2016.03-zynq-pynq-z1.sh (easy)
2. run this chapter step-by-step (annoying)

### Download U-boot Source

#### Clone from git.denx.de/u-boot.git

```console
shell$ git clone git://git.denx.de/u-boot.git u-boot-2016.03-zynq-pynq-z1
```

#### Checkout v2016.03

```console
shell$ cd u-boot-2016.03-zynq-pynq-z1
shell$ git checkout -b u-boot-2016.03-zynq-pynq-z1 refs/tags/v2016.03
```

### Patch for zynq-pynq-z1

```console
shell$ patch -p0 < ../files/u-boot-2016.03-zynq-pynq-z1.diff
shell$ git add --update
shell$ git add arch/arm/dts/zynq-pynqz1.dts
shell$ git add board/xilinx/zynq/pynqz1_hw_platform/*
shell$ git add configs/zynq_pynqz1_defconfig
shell$ git add include/configs/zynq_pynqz1.h
shell$ git commit -m "patch for zynq-pynq-z1"
shell$ git tag -a v2016.03-zynq-pynq-z1-1 -m "Release v2016.03-1 for PYNQ-Z1"
```

### Setup for Build 

```console
shell$ cd u-boot-2016.03-zynq-pynq-z1
shell$ export ARCH=arm
shell$ export CROSS_COMPILE=arm-linux-gnueabihf-
shell$ make zynq_pynqz1_defconfig
```

### Build u-boot

```console
shell$ make
```

### Copy u-boot.img, u-boot.elf and u-boot-spl.sfp to root directory

```console
shell$ cp spl/boot.bin  ../boot.bin
shell$ cp u-boot.img    ../u-boot.img
shell$ cp u-boot        ../u-boot.elf
```
