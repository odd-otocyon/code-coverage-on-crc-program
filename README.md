# CRC
Initiation à la programation C++ via un programme de Contrôle de redondance cyclique, et à la création d'un projet avec CMake.

## Fonctionnement de la couverture de code

Pour ce programme la couverture de code passe par les étapes suivantes :
* CMake : ajout des options de compilation necessaires à la couverture de code
* GCC : compilation du programe
* Execution du programme : génére des fichiers \*.gcno et \*.gcda
* Gcov : utilise les fichiers \*.gcno et \*.gcda afin de prduire des données de couverture de code.
* FCov/Gcovr : permet de convertire ces données dans divers formats (HTML, XML, Text).  
À noter que GCov est appellé automatiquement par FCov ou Gcovr.

Pour mettre en place la couverture de code avec GCC il faut ajouter les options
de compilation suivantes, soit via CMake, soit dans le Makefile :
* -O0 : compilation sans optimisation
* -g : compilation en mode debug
* --coverage : active la couverture de code, cette option regroupe les trois suivantes :
    * -fprofile-arcs : compile en permettant la génération de données lors de l'execution du programme, celles-ci sont utilisées lors de la couverture de code.
    * -ftest-coverage : produit des fichiers utilisés par Gcov
    * -lgcov : permet de lier les fichiers générés

## CMakeLists

Pour ce projet il y'a trois CMakeLists :

#### /CMakeLists

On met en place le projet :
```CMake
cmake_minimum_required(VERSION 3.1...3.14)
project(crc
  VERSION 1.0
  DESCRIPTION "Code coverage test with CMake"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
```

On créer une cible librairie de type INTERFACE, elle contiendra les tags de compilation relatives à la couverture de code :
```CMake
add_library(coverage_config INTERFACE)
```

On créer une option afin d'activer ou non la couverture de code :
```CMake
option(CODE_COVERAGE "Enable coverage reporting" OFF)
```

On verifie que l'on est bien sur un compilateur GCC, et on ajoute les tags de compilation nécessaires à la cible *coverage_config*
```CMake
if(CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    message("Converture de code activée")
    target_compile_options(coverage_config INTERFACE
        -O0
        -g
        --coverage
    )
```

On fait en sorte qu'elle passe ces tags de compilation aux cibles avec lesquelles elle sera liées :
```CMake
    if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.13)
        target_link_options(coverage_config INTERFACE --coverage)
    else()
        target_link_libraries(coverage_config INTERFACE --coverage)
    endif()
endif()
```

On ajoute les sous répertoire *src* et *tests* au projet
```CMake
add_subdirectory(src)
add_subdirectory(tests)
```

### /src/CMakeLists

On ajoute une cible de type librarie
```CMake
add_library(processing processing.cpp)
```

On ajoute le dossier src à la cible, afin d'inclure les .h dans le Makefile généré par CMake, et d'éviter une erreur de compilation
```CMake
target_include_directories(processing PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
```

On lie processing est coverage_config, ainsi processing hérite des tags de compilation de celle-ci grace à target_link_options déffini au CMakeLists à la racine.
```CMake
target_link_libraries(processing PUBLIC coverage_config)
```

### /test/CMakeLists

On ajoute une cible de type executable, on la lie à *processing*. Comme *processing* est lié à *coverage_config*, les tags de compile de cette dernière sont aussi passés à *crc*
```CMake
add_executable(crc main.cpp)
target_link_libraries(crc PRIVATE processing)
```

## Liste des commandes de compilation et couverture de code

Voicie la liste des commandes permettant de compiler le programme et de lancer le
code coverage (notez que l'on utilise ici CMake), elles sont utilisées dans le fichier launchCompil.sh :
```shell
# On créer le dossier de build puis on se rend à l'interieur
mkdir build
cd build

# On lance CMake en activant l'option *CODE_COVERAGE*
cmake -D CODE_COVERAGE=ON ../

# On compile le projet
make

# On execute le programme afin que GCov génère les fichiers *.gcda*
./tests/tests
```

Avec Lcov ( rapport HTML )
```shell
# On collecte les données de coverage avec lcov
lcov --capture --directory . --output-file coverage.info

# On génére un fichier html
genhtml coverage.info --output-directory Coverage_html/
```

Avec Gcovr ( rapport text, HTML et XML/Cobertura )
```shell
# Prérequis : python3, pip3, installer gcovr via pip
pip3 install gcovr

# Générer un rapport HTML
gcovr -r ../ --html -o chemin/example.html

# Générer un rapport XML ( Cobertura )
gcovr -r ../ --xml-pretty

# Générer un rapport text
gcovr -r ../
```

## Liens
[Example CPP11 CMake](https://github.com/codecov/example-cpp11-cmake)  
[Doc Lcov](http://ltp.sourceforge.net/coverage/lcov.php)  
[Doc Gcovr](http://www.gcovr.com/en/stable/installation.html)  
