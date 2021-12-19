#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
mka mkbootimg
mka hybris-boot
mka halium-boot
mka recoveryimage
mka systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/hermes/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/hermes/recovery.img
md5sum $ANDROID_ROOT/out/target/product/hermes/system.img
