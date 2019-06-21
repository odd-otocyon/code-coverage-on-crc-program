#!/bin/bash
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~               BUILD              ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
pwd
===========
ls -l
if (ls -d "build")
then
    echo "Dossier build écrasé"
    rm -rf build
fi

mkdir build/
cd build
cmake ../
make

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~               TEST               ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd tests/
./crc ../Makefile

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~             COVERAGE             ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd /code
filter=$(cat blacklist)
echo "$filter"
mkdir build/coverage/
echo "gcovr -v -r ./ --html-details -e "$filter" -o build/coverage/index.html"
gcovr -r ./ -e tests
# gcovr -v -r ./ --html-details -e "tests/" -o build/coverage/index.html
