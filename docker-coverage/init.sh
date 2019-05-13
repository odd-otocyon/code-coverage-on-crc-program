#!/bin/bash

# Conteneur servant à effectuer des tests de cross-profiling

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~                Compilation                 ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd /code
if (ls -d "build")
then
    rm -rf build
    echo "Dossier build écrasé"
fi

mkdir -p build/coverage/
cd build
cmake -D CODE_COVERAGE=ON ../
make

find / -name "*.gcno" -exec mv -v {} /code/build/coverage/ \;

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~          Déplacement des binaires          ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
mkdir -v /test
mv -v /code/build/tests/crc /test/

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~                  Coverage                  ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# Variable d'environement du cross-profiling
echo "Set des varaibles d'environement"
export GCOV_PREFIX=./
export GCOV_PREFIX_STRIP=5

cd /test
./crc crc

find / -name "*.gcda" -exec mv -v {} /code/build/coverage/ \;

cd /code
gcovr -r ./