#!/bin/bash
# Compilation

if (ls -d "build")
then
    echo "Dossier build écrasé"
    rm -rf build
fi

mkdir -p build/
cd build
cmake ../
make
