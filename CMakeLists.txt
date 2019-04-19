cmake_minimum_required(VERSION 3.1...3.14)
project(crc
  VERSION 1.0
  DESCRIPTION "Code coverage test with CMake"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Configuration de la couverture de code
add_library(coverage_config INTERFACE)

# création d'une option pour activer ou non la couverture de code
option(CODE_COVERAGE "Enable coverage reporting" OFF)
if(CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    message("Converture de code activée")
    target_compile_options(coverage_config INTERFACE
        # -O0
        # -g
        # --coverage
        -fprofile-arcs
        -ftest-coverage
        -g
        -O0
    )
    # target_link_options apparaît avec CMake 3.13
    # target_link_options spécifi les options à utiliser lorsque cette librairie
    # est liée à une autre cible,
    # target_link_libraries fonctionne de façon similaire
    if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.13)
        target_link_options(coverage_config INTERFACE --coverage)
    else()
        target_link_libraries(coverage_config INTERFACE --coverage)
    endif()
endif()

add_subdirectory(src)
add_subdirectory(tests)
