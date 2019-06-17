#!/bin/bash
# Coverage

mkdir build/coverage/
# Génération du rapport XML avec Gcovr
gcovr -r ./ --html-details -o build/coverage/index.html