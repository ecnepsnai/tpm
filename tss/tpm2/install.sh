#!/bin/sh
set -e

if [ "$(uname)" != "Linux" ]; then
    echo "tpm2-tss is only supported on Linux"
    exit 1
fi

ROOT=$(pwd)
TSS_VERSION=2.2.1
LOG=$(pwd)/tss-install.log
echo "Will download and compile TPM2-TSS Version ${TSS_VERSION}" > ${LOG}

# Download & Extract
curl -sS -L https://github.com/tpm2-software/tpm2-tss/archive/${TSS_VERSION}.tar.gz | tar -xzvf - >> ${LOG} 2>&1

# Make output dir
cd tpm2-tss-${TSS_VERSION}/
mkdir -p output/usr/lib

# Bootstrap and configure
./bootstrap >> ${LOG} 2>&1
./configure --disable-doxygen-doc --prefix $(readlink -f output/usr/lib) >> ${LOG} 2>&1

# Compile and install
make -j$(nproc) >> ${LOG} 2>&1
make install >> ${LOG} 2>&1

# Move compiled libraries out of install dir
rm -rf ${ROOT}/lib
mv output/usr/lib ${ROOT}/lib
cd ${ROOT}
rm -r tpm2-tss-${TSS_VERSION}/
