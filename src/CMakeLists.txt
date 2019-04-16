add_library(processing processing.cpp)
# On ajoute le dossier src à la cible, afin d'inclure les .h dans le Makefile
# généré par CMake, et d'éviter une erreur de compilation
target_include_directories(processing PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# On lie processing est coverage_config, ainsi processing hérite des option de
# celle-ci grace à target_link_options déffini au CMakeLists à la racine.
target_link_libraries(processing PUBLIC coverage_config)
