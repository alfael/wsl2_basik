#!/bin/bash
cd $(dirname $0)
#export PATH="/opt/gcc-latest/bin:$PATH"
#export CROSS_COMPILE=x86_64-pc-linux-gnu-
export KCONFIG_CONFIG=Microsoft/config-basik
export ARCH=x86_64
export SUBARCH=x86_64
export KBUILD_CFLAGS="-Wno-maybe-uninitialized -Wno-memset-elt-size -Wno-duplicate-decl-specifier"
#nice make  clean
#nice make  mrproper
#cp -rf Microsoft/config-wsl ./.config
nice make -j$(nproc --all) 2>&1 | tee build.log
