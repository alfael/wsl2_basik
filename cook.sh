#!/bin/bash
cd $(dirname $0)
export KCONFIG_CONFIG=Microsoft/config-basik
export ARCH=x86_64
export SUBARCH=x86_64
export KBUILD_CFLAGS="-Wno-maybe-uninitialized -Wno-memset-elt-size -Wno-duplicate-decl-specifier"
nice make  clean
nice make  mrproper
nice make -j$(nproc --all) 2>&1 | tee build.log
cp -rf arch/x86/boot/bzImage /mnt/c/wsl2/basik
