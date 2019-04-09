cmake_minimum_required(VERSION 3.1...3.10)
set(CMAKE_BUILD_TYPE Release) # Debug or Release
project(crc
  VERSION 1.0
  DESCRIPTION "Test CMake"
  LANGUAGES CXX)
set(CMAKE_BUILD_TYPE "Debug") # Debug or Release

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Permet d'empêcher l'execution de CMake dans un dossier de sources
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
  message(FATAL_ERROR "Vous ne pouvez pas construire le projet dans un répertoire de sources")
endif()

# Permet de récupérer les sources avec deux méthodes :
#   * à l'aide d'une variable
#   * grace à la fonction file
# set(sources "src/main.cpp" "src/processing.cpp" "src/processing.h")
file(GLOB src src/*.cpp src/*.h)

# Boucle qui affiche le contenu de la variable sources (qui est une liste)
function(showFiles src)
  foreach(sourceFile IN LISTS "${src}")
    message("${sourceFile}")
  endforeach()
endfunction()

# Fonction main, prend sources en paramètre et construit la cible. Affiche diverse
# infos à des fins de test
function(main src)
  message("CMake est réglé sur ${CMAKE_BUILD_TYPE}")
  message("PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
  message("PROJECT_BINARY_DIR = ${PROJECT_BINARY_DIR}")
  add_executable(crc "${src}")
endfunction()

main("${src}")
