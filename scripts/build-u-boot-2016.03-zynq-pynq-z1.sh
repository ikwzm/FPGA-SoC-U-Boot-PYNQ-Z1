#!/bin/bash

UBOOT_BUILD_DIR=u-boot-2016.03-zynq-pynq-z1

### Download U-Boot Source
git clone git://git.denx.de/u-boot.git $UBOOT_BUILD_DIR
cd $UBOOT_BUILD_DIR

#### Checkout v2016.03
git checkout -b u-boot-2016.03-zynq-pynq-z1 refs/tags/v2016.03

### Patch for PYNQ-Z1

patch -p0 < ../files/u-boot-2016.03-zynq-pynq-z1.diff
git add --update
git add arch/arm/dts/zynq-pynqz1.dts
git add board/xilinx/zynq/pynqz1_hw_platform/*
git add configs/zynq_pynqz1_defconfig
git add include/configs/zynq_pynqz1.h
git commit -m "patch for zynq-pynq-z1"
git tag -a v2016.03-zynq-pynqz1-1 -m "Release v2016.03-1 for PYNQ-Z1"

### Setup for Build 

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make zynq_pynqz1_defconfig

### Build u-boot

make

### Copy u-boot.img, u-boot.elf and u-boot-spl.sfp to root directory

cp spl/boot.bin  ../boot.bin
cp u-boot.img    ../u-boot.img
cp u-boot        ../u-boot.elf

cd ..
