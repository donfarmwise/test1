#!/bin/bash

echo "First argument is: $1"



export CROSS_COMPILE_AARCH64_PATH=$1/aarch64--glibc--stable-final

export CROSS_COMPILE_AARCH64=$1/aarch64--glibc--stable-final/bin/aarch64-buildroot-linux-gnu-

#cd /home/engineering/Downloads/VVDN_DON/Linux_for_Tegra/source/public/
cd $1/Linux_for_Tegra/source/public/

mkdir kernel_out
./nvbuild.sh -o $PWD/kernel_out

if [ $? -eq 0 ]; then
echo -e "${RED}***********BUILDING DONE**************${NOCOLOR}"
else
echo -e "${GREEN}***********BUILDING FAILED************${NOCOLOR}"
fi

sudo cp kernel_out/drivers/gpu/nvgpu/nvgpu.ko ../../../Linux_for_Tegra/rootfs/usr/lib/modules/5.10.120-tegra/kernel/drivers/gpu/nvgpu/nvgpu.ko

sudo cp kernel_out/arch/arm64/boot/dts/nvidia/* ../../../Linux_for_Tegra/kernel/dtb

cp kernel_out/arch/arm64/boot/Image ../../../Linux_for_Tegra/kernel/Image

cd ../../../Linux_for_Tegra/rootfs/usr

sudo tar --owner root --group root -cjf kernel_supplements.tbz2 lib/modules

sudo cp ../../../Linux_for_Tegra/rootfs/usr/kernel_supplements.tbz2 ../../../Linux_for_Tegra/kernel/

cd ../../../Linux_for_Tegra/

echo -e "before flashing"

#echo -e "${RED}Kindly put the board in recovery mode else just ignore the
#warning${NOCOLOR}"

#sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 -c
#tools/kernel_flash/flash_l4t_external.xml -p "-c bootloader/t186ref/cfg/flash_t234_qspi.xml" --showlogs --network usb0
#p3509-a02+p3767-0000 internal

#if [ $? -eq 0 ]; then
#echo -e "${RED}Flashing done${NOCOLOR}"
#else
#echo -e "${GREEN}Flasing Failed.....${NOCOLOR}"
#fi
