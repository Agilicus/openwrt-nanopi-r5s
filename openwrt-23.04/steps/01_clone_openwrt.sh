#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/LICENSE" ]; then
    echo "Please run from root"
    exit 1
fi

cd $ROOTDIR
mkdir build
cd build

OPENWRT_FOLDER=openwrt-fresh-23.04

# for now use master, switch to 23.04 when branch is created
#git clone -b openwrt-23.04 --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER
git clone --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER

cat << EOF > $OPENWRT_FOLDER/package/base-files/files/etc/banner

  █████╗  ██████╗ ██╗██╗     ██╗ ██████╗██╗   ██╗███████╗
 ██╔══██╗██╔════╝ ██║██║     ██║██╔════╝██║   ██║██╔════╝
 ███████║██║  ███╗██║██║     ██║██║     ██║   ██║███████╗
 ██╔══██║██║   ██║██║██║     ██║██║     ██║   ██║╚════██║
 ██║  ██║╚██████╔╝██║███████╗██║╚██████╗╚██████╔╝███████║
 ╚═╝  ╚═╝ ╚═════╝ ╚═╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
 --------------------------------------------------------
 %D %V, %C
 --------------------------------------------------------
EOF

cd $OPENWRT_FOLDER
echo "Current OpenWRT commit"
git rev-parse HEAD

# (cd package; git clone https://github.com/jerrykuku/luci-theme-argon.git)
# (cd package; git clone https://github.com/jerrykuku/luci-app-argon-config)
# (cd package; git clone https://github.com/muink/luci-app-netdata)
