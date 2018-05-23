# *CMakeList.txt*

cmake_minimum_required(VERSION 2.8.12)

project(cmake_tut)

include_directories(include)


set(SOURCE src/main.cpp src/get_pass.cpp)

file(GLOB SOURCES "src/*.cpp")

add_executable(cmake_tut ${SOURCE})

# curses library for get password
target_link_libraries(cmake_tut curses)
