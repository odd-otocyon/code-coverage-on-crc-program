#!/bin/bash
# Compilation
cd build
cmake -D CODE_COVERAGE=ON ../
make
# Execution
./tests/crc Makefile
# Génération de rapport avec Gcovr
gcovr -r ../
