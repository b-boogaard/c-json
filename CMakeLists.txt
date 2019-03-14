cmake_minimum_required (VERSION 3.13)
project (c_json C)

set (CMAKE_C_STANDARD 11)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

include (GNUInstallDirs)

add_executable(c_json main.c)

find_package(YAJL 2.1.1 REQUIRED)
target_link_libraries(c_json YAJL)
