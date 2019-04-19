# CRC
Initiation à la programation C++ via un programme de Contrôle de redondance cyclique, et à la création d'un projet avec CMake.

## Liens
[Example CPP11 CMake](https://github.com/codecov/example-cpp11-cmake)  
[Doc Gcov](http://ltp.sourceforge.net/coverage/lcov.php)  
[Doc Lcov](http://www.gcovr.com/en/stable/installation.html)  

## Liste des commandes

Voicie la liste des commandes permettant de compiler le programme de lancer le
code coverage :

    # On créer le dossier de build puis on se rend à l'interieur
    mkdir build
    cd build

    # On lance CMake avec en activant l'option *CODE_COVERAGE*
    cmake -D CODE_COVERAGE=ON ../

    # On compile le projet
    make

    # On execute le programme afin que GCov génère les fichiers *.gcda*
    ./tests/tests

Avec Lcov ( rapport HTML )

    # On collecte les données de coverage avec lcov
    lcov --capture --directory . --output-file coverage.info

    # On génére un fichier html
    genhtml coverage.info --output-directory Coverage_html/

Avec Gcovr ( rapport text, HTML et XML/Cobertura )

    # Prérequis : python3, pip3, installer gcovr via pip
    pip3 install gcovr

    # Générer un rapport HTML
    gcovr -r . --html -o chemin/example.html

    # Générer un rapport XML ( Cobertura )
    gcovr -r . --xml-pretty

    # Générer un rapport text
    gcovr -r .
