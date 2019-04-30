#!/bin/bash
# Compilation

if (ls -d "build")
then
    echo "Dossier build écrasé"
    rm -rf build
fi

mkdir -p build/coverage/{html,cobertura}
cd build
cmake -D CODE_COVERAGE=ON ../
make
# Execution
./tests/crc Makefile
# Génération du rapport XML avec Gcovr
gcovr -r ../ --xml -o coverage/cobertura/coverage.xml
# Génération du rapport XML avec Gcovr
gcovr -r ../ --html-details -o coverage/html/index.html
