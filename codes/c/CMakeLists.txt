cmake_minimum_required(VERSION 3.10)
project(hello_algo C)

set(CMAKE_C_STANDARD 11)

include_directories(./include)

add_subdirectory(include)
add_subdirectory(chapter_computational_complexity)
add_subdirectory(chapter_array_and_linkedlist)
add_subdirectory(chapter_sorting)
add_subdirectory(chapter_tree)
