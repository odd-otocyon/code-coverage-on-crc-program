#!/bin/bash
# Coverage

# Génération du rapport XML avec Gcovr
gcovr -r ./ --html-details -o coverage/html/index.html