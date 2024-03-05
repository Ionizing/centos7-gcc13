#!/bin/bash

set -ex

curl -kLO https://sourceware.org/pub/gcc/releases/gcc-13.2.0/gcc-13.2.0.tar.xz
sha256sum *.tar.*
echo "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da " *.tar.* | sha256sum -c -
tar xf *.tar.*
mkdir build-gcc
cd build-gcc
yum -y install gcc-c++ make libmpc-devel
../gcc-*/configure --enable-languages=c,c++ --disable-multilib
make -j$(nproc)
make install-strip
echo -e '/usr/local/lib\n/usr/local/lib64' > /etc/ld.so.conf.d/local.conf && ldconfig

#cleanup
cd /
rm -rf /build-gcc /gcc-*
yum -y remove gcc-c++ make libmpc-devel
yum -y autoremove
yum -y install libmpc glibc-devel
yum -y clean all && rm -rf /var/cache
