#!/bin/bash
set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy source code
mkdir -p ${HOME}/src
cp -r src/* ${HOME}/src/

# Install yed
cd ${HOME}/src/yed
./clean.sh && ./build.sh && sudo ./install.sh
mkdir -p ${HOME}/.yed
cp ${BASEDIR}/.yed/init.c ${HOME}/.yed/
cd ${HOME}/.yed
gcc -shared -fPIC -g -O3 init.c -lyed -o init.so
