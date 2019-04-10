cmake_minimum_required(VERSION 3.1...3.10)
set(CMAKE_BUILD_TYPE Release) # Debug or Release
project(crc
  VERSION 1.0
  DESCRIPTION "Test CMake"
  LANGUAGES CXX)
set(CMAKE_BUILD_TYPE "Debug") # Debug or Release

# Permet l'utilisation de dossier afin de créer le projet pour un IDE
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Permet d'empêcher l'execution de CMake dans un dossier de sources (contenant
# un CMakeLists.txt)
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
  message(FATAL_ERROR "Vous ne pouvez pas construire le projet dans un répertoire de sources")
endif()

# Permet de récupérer les sources avec deux méthodes :
#   * à l'aide d'une variable
#   * grace à la fonction file
# set(sources "src/main.cpp" "src/processing.cpp" "src/processing.h")
file(GLOB src src/*.cpp)
file(GLOB header src/*.h)

# Macro contenant une boucle qui affiche le contenu de la variable sources (qui
# est une liste)
function(showFiles allFiles)
  message("### Show Files ###")

  foreach(sourceFile IN LISTS allFiles)
    message("${sourceFile}")
  endforeach()

  message("##################")
endfunction(showFiles)

showFiles("${src};${header}")

# Fonction main, prend une liste de fichier en paramètre et construit la cible.
# Affiche diverse infos à des fins de test
function(main allFiles)
  showFiles("${allFiles}")
  message("CMake est réglé sur ${CMAKE_BUILD_TYPE}")
  message("PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
  message("PROJECT_BINARY_DIR = ${PROJECT_BINARY_DIR}")
  message("allFiles = ${allFiles}")
  add_executable(crc "${allFiles}")
endfunction(main)

# Important, ne pas mettre d'espace autour du point virgule
main("${src};${header}")

# Attention à la porté des variables
message("\n=========================================\n")
set(foo "Foo")
set(bar "Bar")
set(fooBar ${foo} ${bar})

function(myFunction arg1 arg2 arg3)
    message("Foo = ${foo}\nBar = ${bar}\nFooBar = ${fooBar}")
    message("ARGC = ${ARGC}\nARGV0 = ${ARGV0}\nARGV1 = ${ARGV1}\nARGV2 = ${ARGV2}")
    set(foo "bar")
endfunction(myFunction)

myFunction(${foo} ${bar} ${fooBar})
message("\n${foo}")
set(foo "bar")
message(${foo})

# Retour
# Foo = Foo
# Bar = Bar
# FooBar = Foo;Bar
# ARGC = 4
# ARGV0 = Foo
# ARGV1 = Bar
# ARGV2 = Foo
#
# Foo
# bar
