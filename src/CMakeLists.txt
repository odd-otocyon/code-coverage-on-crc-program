add_library(processing processing.cpp)
message("Le CMAKE_CURRENT_SOURCE_DIR  de src est : ${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(processing PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# On lie processing est coverage_config, ainsi processing hérite des option de
# celle-ci grace à target_link_options déffini au CMakeLists à la racine.
target_link_libraries(processing PUBLIC coverage_config)
