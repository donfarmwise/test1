#!/bin/bash

echo "First argument is: $1"

echo $PWD

export ROOT=$PWD

#sudo git clone -b 

#fies


#wget -O Tegra_linux_sample-root-filesystem_r35.4.1_aarch64.tbz2 https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v4.1/release/tegra_linux_sample-root-filesystem_r35.4.1_aarch64.tbz2/

#wget -O public_sources.tbz2 https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v4.1/sources/public_sources.tbz2/

#wget -O aarch64--glibc--stable-final.tar.gz https://developer.nvidia.com/embedded/jetson-linux/bootlin-toolchain-gcc-93


#wget -O Jetson_Linux_R35.4.1_aarch64.tbz2 https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v4.1/release/jetson_linux_r35.4.1_aarch64.tbz2/

sudo tar -xvf Jetson_Linux_R35.4.1_aarch64.tbz2


cd $ROOT

sudo tar -xvf Tegra_linux_sample-root-filesystem_r35.4.1_aarch64.tbz2 -C Linux_for_Tegra/rootfs


cd $ROOT

cd Linux_for_Tegra/source

mkdir public

cd $ROOT

sudo tar -xvf public_sources.tbz2

#sudo tar -xjf public_sources.tbz2 -C Linux_for_Tegra/source/public --strip-components=3

# sudo tar -xjf public_sources.tbz2 -C Linux_for_Tegra/source/public


# sudo tar -xjf public_sources.tbz2



cd $ROOT

mkdir aarch64--glibc--stable-final

sudo tar -xvf aarch64--glibc--stable-final.tar.gz -C aarch64--glibc--stable-final




cd $ROOT

echo $PWD

cd Linux_for_Tegra/source/public/

sudo tar -xvf kernel_src.tbz2

cd $ROOT


cd Linux_for_Tegra/

sudo ./apply_binaries.sh
sudo ./tools/l4t_flash_prerequisites.sh


cd $ROOT


sudo touch Linux_for_Tegra/source/public/hardware/nvidia/platform/t23x/p3768/kernel-dts/cvb/tegra234-camera-rbpcv4-imx296.dtsi
sudo touch Linux_for_Tegra/source/public/hardware/nvidia/platform/t23x/p3768/kernel-dts/cvb/tegra234-p3768-camera-rbpcv4-imx296.dtsi
sudo touch Linux_for_Tegra/source/public/kernel/nvidia/drivers/media/i2c/imx296_mode_tbls.h
sudo touch Linux_for_Tegra/source/public/kernel/nvidia/drivers/media/i2c/nv_imx296.c


#sudo ./flashScri.sh $ROOT

sudo ./compile_kernel.sh $ROOT


#sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 -c
#tools/kernel_flash/flash_l4t_external.xml -p "-c bootloader/t186ref/cfg/flash_t234_qspi.xml" --showlogs --network usb0
#p3509-a02+p3767-0000 internal

#if [ $? -eq 0 ]; then
#echo -e "${RED}Flashing done${NOCOLOR}"
#else
#echo -e "${GREEN}Flasing Failed.....${NOCOLOR}"
#fi
