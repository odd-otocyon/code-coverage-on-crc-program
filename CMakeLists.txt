cmake_minimum_required(VERSION 3.1...3.10)
set(CMAKE_BUILD_TYPE Release) # Debug or Release
project(crc
  VERSION 1.0
  DESCRIPTION "Test CMake"
  LANGUAGES CXX)
set(CMAKE_BUILD_TYPE "Debug") # Debug or Release

# Permet d'empêcher l'execution de CMake dans un dossier de sources (contenant
# un CMakeLists.txt)
# file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
#
# if(EXISTS "${LOC_PATH}")
#   message(FATAL_ERROR "Vous ne pouvez pas construire le projet dans un répertoire de sources")
# endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g --coverage")

# Créer la target et ajoute les fichiers necessaire à sa compilation
add_executable(crc
    src/main.cpp
    src/processing.cpp
)

# Ajoute des dossiers necessaires à la compilation
# target_include_directories(crc
#     PRIVATE
#         ${CMAKE_CURRENT_SOURCE_DIR}/src
# )
