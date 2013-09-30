#!/bin/sh

# This script is setup for myself, on my OSX system, so please change the /Volumes/android to whatever your dir's are
# This Script is free to use
# -Lloir

# Make the directory where the modules will output to, and the kernel zimage

mkdir /Volumes/android/output
mkdir /Volumes/android/output/modules

# Export the arch 1st

export ARCH=arm

# Then setup the toolchain

export CROSS_COMPILE=/Volumes/android/toolchains/arm-eabi-linaro-4.6.2/bin/arm-eabi-

# Clean the build area

make mrproper

# now to start it all off

make frost_defconfig

# make spawns N jobs, where N is the number of CPU cores (or threads if different)

make -j$(nproc)

make modules

find . -name "*.ko" -exec cp {} ../Volumes/android/output \;
cp arch/arm/boot/zImage ../Volumes/android/output/zImage
