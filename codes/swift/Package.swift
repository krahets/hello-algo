// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "HelloAlgo",
    products: [
        // chapter_computational_complexity
        .executable(name: "time_complexity", targets: ["time_complexity"]),
        .executable(name: "worst_best_time_complexity", targets: ["worst_best_time_complexity"]),
        .executable(name: "space_complexity", targets: ["space_complexity"]),
        // chapter_array_and_linkedlist
        .executable(name: "array", targets: ["array"]),
        .executable(name: "linked_list", targets: ["linked_list"]),
        .executable(name: "list", targets: ["list"]),
        .executable(name: "my_list", targets: ["my_list"]),
        // chapter_stack_and_queue
        .executable(name: "stack", targets: ["stack"]),
        .executable(name: "linkedlist_stack", targets: ["linkedlist_stack"]),
        .executable(name: "array_stack", targets: ["array_stack"]),
        .executable(name: "queue", targets: ["queue"]),
        .executable(name: "linkedlist_queue", targets: ["linkedlist_queue"]),
        .executable(name: "array_queue", targets: ["array_queue"]),
        .executable(name: "deque", targets: ["deque"]),
        .executable(name: "linkedlist_deque", targets: ["linkedlist_deque"]),
        .executable(name: "array_deque", targets: ["array_deque"]),
        // chapter_hashing
        .executable(name: "hash_map", targets: ["hash_map"]),
        .executable(name: "array_hash_map", targets: ["array_hash_map"]),
        // chapter_tree
        .executable(name: "binary_tree", targets: ["binary_tree"]),
        .executable(name: "binary_tree_bfs", targets: ["binary_tree_bfs"]),
        .executable(name: "binary_tree_dfs", targets: ["binary_tree_dfs"]),
        .executable(name: "binary_search_tree", targets: ["binary_search_tree"]),
        .executable(name: "avl_tree", targets: ["avl_tree"]),
        // chapter_heap
        .executable(name: "my_heap", targets: ["my_heap"]),
        // chapter_graph
        .executable(name: "graph_adjacency_matrix", targets: ["graph_adjacency_matrix"]),
        .executable(name: "graph_adjacency_list", targets: ["graph_adjacency_list"]),
        .executable(name: "graph_bfs", targets: ["graph_bfs"]),
        .executable(name: "graph_dfs", targets: ["graph_dfs"]),
        // chapter_searching
        .executable(name: "binary_search", targets: ["binary_search"]),
        .executable(name: "binary_search_edge", targets: ["binary_search_edge"]),
        .executable(name: "two_sum", targets: ["two_sum"]),
        .executable(name: "linear_search", targets: ["linear_search"]),
        .executable(name: "hashing_search", targets: ["hashing_search"]),
        // chapter_sorting
        .executable(name: "selection_sort", targets: ["selection_sort"]),
        .executable(name: "bubble_sort", targets: ["bubble_sort"]),
        .executable(name: "insertion_sort", targets: ["insertion_sort"]),
        .executable(name: "quick_sort", targets: ["quick_sort"]),
        .executable(name: "merge_sort", targets: ["merge_sort"]),
        .executable(name: "heap_sort", targets: ["heap_sort"]),
        .executable(name: "bucket_sort", targets: ["bucket_sort"]),
        .executable(name: "counting_sort", targets: ["counting_sort"]),
        .executable(name: "radix_sort", targets: ["radix_sort"]),
        // chapter_backtracking
        .executable(name: "preorder_traversal_i_compact", targets: ["preorder_traversal_i_compact"]),
        .executable(name: "preorder_traversal_ii_compact", targets: ["preorder_traversal_ii_compact"]),
        .executable(name: "preorder_traversal_iii_compact", targets: ["preorder_traversal_iii_compact"]),
        .executable(name: "preorder_traversal_iii_template", targets: ["preorder_traversal_iii_template"]),
        .executable(name: "permutations_i", targets: ["permutations_i"]),
        .executable(name: "permutations_ii", targets: ["permutations_ii"]),
        .executable(name: "n_queens", targets: ["n_queens"]),
    ],
    targets: [
        // helper
        .target(name: "utils", path: "utils"),
        .target(name: "graph_adjacency_list_target", dependencies: ["utils"], path: "chapter_graph", sources: ["graph_adjacency_list_target.swift"], swiftSettings: [.define("TARGET")]),
        // chapter_computational_complexity
        .executableTarget(name: "time_complexity", path: "chapter_computational_complexity", sources: ["time_complexity.swift"]),
        .executableTarget(name: "worst_best_time_complexity", path: "chapter_computational_complexity", sources: ["worst_best_time_complexity.swift"]),
        .executableTarget(name: "space_complexity", dependencies: ["utils"], path: "chapter_computational_complexity", sources: ["space_complexity.swift"]),
        // chapter_array_and_linkedlist
        .executableTarget(name: "array", path: "chapter_array_and_linkedlist", sources: ["array.swift"]),
        .executableTarget(name: "linked_list", dependencies: ["utils"], path: "chapter_array_and_linkedlist", sources: ["linked_list.swift"]),
        .executableTarget(name: "list", path: "chapter_array_and_linkedlist", sources: ["list.swift"]),
        .executableTarget(name: "my_list", path: "chapter_array_and_linkedlist", sources: ["my_list.swift"]),
        // chapter_stack_and_queue
        .executableTarget(name: "stack", path: "chapter_stack_and_queue", sources: ["stack.swift"]),
        .executableTarget(name: "linkedlist_stack", dependencies: ["utils"], path: "chapter_stack_and_queue", sources: ["linkedlist_stack.swift"]),
        .executableTarget(name: "array_stack", path: "chapter_stack_and_queue", sources: ["array_stack.swift"]),
        .executableTarget(name: "queue", path: "chapter_stack_and_queue", sources: ["queue.swift"]),
        .executableTarget(name: "linkedlist_queue", dependencies: ["utils"], path: "chapter_stack_and_queue", sources: ["linkedlist_queue.swift"]),
        .executableTarget(name: "array_queue", path: "chapter_stack_and_queue", sources: ["array_queue.swift"]),
        .executableTarget(name: "deque", path: "chapter_stack_and_queue", sources: ["deque.swift"]),
        .executableTarget(name: "linkedlist_deque", path: "chapter_stack_and_queue", sources: ["linkedlist_deque.swift"]),
        .executableTarget(name: "array_deque", path: "chapter_stack_and_queue", sources: ["array_deque.swift"]),
        // chapter_hashing
        .executableTarget(name: "hash_map", dependencies: ["utils"], path: "chapter_hashing", sources: ["hash_map.swift"]),
        .executableTarget(name: "array_hash_map", path: "chapter_hashing", sources: ["array_hash_map.swift"]),
        // chapter_tree
        .executableTarget(name: "binary_tree", dependencies: ["utils"], path: "chapter_tree", sources: ["binary_tree.swift"]),
        .executableTarget(name: "binary_tree_bfs", dependencies: ["utils"], path: "chapter_tree", sources: ["binary_tree_bfs.swift"]),
        .executableTarget(name: "binary_tree_dfs", dependencies: ["utils"], path: "chapter_tree", sources: ["binary_tree_dfs.swift"]),
        .executableTarget(name: "binary_search_tree", dependencies: ["utils"], path: "chapter_tree", sources: ["binary_search_tree.swift"]),
        .executableTarget(name: "avl_tree", dependencies: ["utils"], path: "chapter_tree", sources: ["avl_tree.swift"]),
        // chapter_heap
        .executableTarget(name: "my_heap", dependencies: ["utils"], path: "chapter_heap", sources: ["my_heap.swift"]),
        // chapter_graph
        .executableTarget(name: "graph_adjacency_matrix", dependencies: ["utils"], path: "chapter_graph", sources: ["graph_adjacency_matrix.swift"]),
        .executableTarget(name: "graph_adjacency_list", dependencies: ["utils"], path: "chapter_graph", sources: ["graph_adjacency_list.swift"]),
        .executableTarget(name: "graph_bfs", dependencies: ["utils", "graph_adjacency_list_target"], path: "chapter_graph", sources: ["graph_bfs.swift"]),
        .executableTarget(name: "graph_dfs", dependencies: ["utils", "graph_adjacency_list_target"], path: "chapter_graph", sources: ["graph_dfs.swift"]),
        // chapter_searching
        .executableTarget(name: "binary_search", path: "chapter_searching", sources: ["binary_search.swift"]),
        .executableTarget(name: "binary_search_edge", path: "chapter_searching", sources: ["binary_search_edge.swift"]),
        .executableTarget(name: "two_sum", path: "chapter_searching", sources: ["two_sum.swift"]),
        .executableTarget(name: "linear_search", dependencies: ["utils"], path: "chapter_searching", sources: ["linear_search.swift"]),
        .executableTarget(name: "hashing_search", dependencies: ["utils"], path: "chapter_searching", sources: ["hashing_search.swift"]),
        // chapter_sorting
        .executableTarget(name: "selection_sort", path: "chapter_sorting", sources: ["selection_sort.swift"]),
        .executableTarget(name: "bubble_sort", path: "chapter_sorting", sources: ["bubble_sort.swift"]),
        .executableTarget(name: "insertion_sort", path: "chapter_sorting", sources: ["insertion_sort.swift"]),
        .executableTarget(name: "quick_sort", path: "chapter_sorting", sources: ["quick_sort.swift"]),
        .executableTarget(name: "merge_sort", path: "chapter_sorting", sources: ["merge_sort.swift"]),
        .executableTarget(name: "heap_sort", path: "chapter_sorting", sources: ["heap_sort.swift"]),
        .executableTarget(name: "bucket_sort", path: "chapter_sorting", sources: ["bucket_sort.swift"]),
        .executableTarget(name: "counting_sort", path: "chapter_sorting", sources: ["counting_sort.swift"]),
        .executableTarget(name: "radix_sort", path: "chapter_sorting", sources: ["radix_sort.swift"]),
        // chapter_backtracking
        .executableTarget(name: "preorder_traversal_i_compact", dependencies: ["utils"], path: "chapter_backtracking", sources: ["preorder_traversal_i_compact.swift"]),
        .executableTarget(name: "preorder_traversal_ii_compact", dependencies: ["utils"], path: "chapter_backtracking", sources: ["preorder_traversal_ii_compact.swift"]),
        .executableTarget(name: "preorder_traversal_iii_compact", dependencies: ["utils"], path: "chapter_backtracking", sources: ["preorder_traversal_iii_compact.swift"]),
        .executableTarget(name: "preorder_traversal_iii_template", dependencies: ["utils"], path: "chapter_backtracking", sources: ["preorder_traversal_iii_template.swift"]),
        .executableTarget(name: "permutations_i", path: "chapter_backtracking", sources: ["permutations_i.swift"]),
        .executableTarget(name: "permutations_ii", path: "chapter_backtracking", sources: ["permutations_ii.swift"]),
        .executableTarget(name: "n_queens", path: "chapter_backtracking", sources: ["n_queens.swift"]),
    ]
)
