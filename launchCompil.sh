#!/bin/bash
# Compilation

if (ls -d "build")
then
    echo "Dossier build écrasé"
    rm -rf build
fi

mkdir -p build/coverage/
cd build
cmake -D CODE_COVERAGE=ON ../
make
# Execution
./tests/crc Makefile
# Génération de rapport avec Gcovr
gcovr -r ../ --xml -o build/coverage/coverage.xml
