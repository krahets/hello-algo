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
    ]
)
