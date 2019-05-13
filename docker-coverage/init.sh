#!/bin/bash

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~          Compilation           ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd /code
if (ls -d "build")
then
    rm -rf build
    echo "Dossier build écrasé"
fi

mkdir -p build/coverage/cobertura
mkdir -p build/coverage/html
cd build
cmake -D CODE_COVERAGE=ON ../
make

# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# echo "~          Déplacement           ~"
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# mkdir -p /coverage/tests
# mkdir -p /coverage/src
# cd /code/build
# cp -v src/libprocessing.a /coverage/src/libprocessing.a
# cp -v tests/crc /coverage/tests/crc
# find ./ -name "*.gcno" -exec mv -v {} /coverage/ \;

# cd /code
# rm -rf build

# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# echo "~             Shell              ~"
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# cd /coverage
# echo "Pour lancer le coverage entrez : "
# echo "gcovr -r ../ --html-details -o coverage/html/index.html"
sh

