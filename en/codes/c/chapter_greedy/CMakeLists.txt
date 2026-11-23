add_executable(coin_change_greedy coin_change_greedy.c)
add_executable(fractional_knapsack fractional_knapsack.c)
add_executable(max_capacity max_capacity.c)
add_executable(max_product_cutting max_product_cutting.c)

if (NOT CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    target_link_libraries(max_product_cutting m)
endif()
