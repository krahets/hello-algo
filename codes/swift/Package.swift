// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "HelloAlgo",
    products: [
        .executable(name: "time_complexity", targets: ["time_complexity"]),
        .executable(name: "worst_best_time_complexity", targets: ["worst_best_time_complexity"]),
        .executable(name: "space_complexity", targets: ["space_complexity"]),
        .executable(name: "leetcode_two_sum", targets: ["leetcode_two_sum"]),
        .executable(name: "array", targets: ["array"]),
        .executable(name: "linked_list", targets: ["linked_list"]),
        .executable(name: "list", targets: ["list"]),
        .executable(name: "my_list", targets: ["my_list"]),
        .executable(name: "stack", targets: ["stack"]),
        .executable(name: "linkedlist_stack", targets: ["linkedlist_stack"]),
        .executable(name: "array_stack", targets: ["array_stack"]),
        .executable(name: "queue", targets: ["queue"]),
        .executable(name: "linkedlist_queue", targets: ["linkedlist_queue"]),
        .executable(name: "array_queue", targets: ["array_queue"]),
        .executable(name: "deque", targets: ["deque"]),
    ],
    targets: [
        .target(name: "utils", path: "utils"),
        .executableTarget(name: "time_complexity", path: "chapter_computational_complexity", sources: ["time_complexity.swift"]),
        .executableTarget(name: "worst_best_time_complexity", path: "chapter_computational_complexity", sources: ["worst_best_time_complexity.swift"]),
        .executableTarget(name: "space_complexity", dependencies: ["utils"], path: "chapter_computational_complexity", sources: ["space_complexity.swift"]),
        .executableTarget(name: "leetcode_two_sum", path: "chapter_computational_complexity", sources: ["leetcode_two_sum.swift"]),
        .executableTarget(name: "array", path: "chapter_array_and_linkedlist", sources: ["array.swift"]),
        .executableTarget(name: "linked_list", dependencies: ["utils"], path: "chapter_array_and_linkedlist", sources: ["linked_list.swift"]),
        .executableTarget(name: "list", path: "chapter_array_and_linkedlist", sources: ["list.swift"]),
        .executableTarget(name: "my_list", path: "chapter_array_and_linkedlist", sources: ["my_list.swift"]),
        .executableTarget(name: "stack", path: "chapter_stack_and_queue", sources: ["stack.swift"]),
        .executableTarget(name: "linkedlist_stack", dependencies: ["utils"], path: "chapter_stack_and_queue", sources: ["linkedlist_stack.swift"]),
        .executableTarget(name: "array_stack", path: "chapter_stack_and_queue", sources: ["array_stack.swift"]),
        .executableTarget(name: "queue", path: "chapter_stack_and_queue", sources: ["queue.swift"]),
        .executableTarget(name: "linkedlist_queue", dependencies: ["utils"], path: "chapter_stack_and_queue", sources: ["linkedlist_queue.swift"]),
        .executableTarget(name: "array_queue", path: "chapter_stack_and_queue", sources: ["array_queue.swift"]),
        .executableTarget(name: "deque", path: "chapter_stack_and_queue", sources: ["deque.swift"]),
    ]
)
