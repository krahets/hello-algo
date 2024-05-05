/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Function */
@discardableResult
func function() -> Int {
    // Perform some operations
    return 0
}

/* Constant complexity */
func constant(n: Int) {
    // Constants, variables, objects occupy O(1) space
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // Variables in a loop occupy O(1) space
    for _ in 0 ..< n {
        let c = 0
    }
    // Functions in a loop occupy O(1) space
    for _ in 0 ..< n {
        function()
    }
}

/* Linear complexity */
func linear(n: Int) {
    // Array of length n occupies O(n) space
    let nums = Array(repeating: 0, count: n)
    // A list of length n occupies O(n) space
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // A hash table of length n occupies O(n) space
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* Linear complexity (recursive implementation) */
func linearRecur(n: Int) {
    print("Recursion n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* Quadratic complexity */
func quadratic(n: Int) {
    // A two-dimensional list occupies O(n^2) space
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* Quadratic complexity (recursive implementation) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // Array nums length = n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("Recursion n = \(n) with nums length = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* Exponential complexity (building a full binary tree) */
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: 0)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}

@main
enum SpaceComplexity {
    /* Driver Code */
    static func main() {
        let n = 5
        // Constant complexity
        constant(n: n)
        // Linear complexity
        linear(n: n)
        linearRecur(n: n)
        // Quadratic complexity
        quadratic(n: n)
        quadraticRecur(n: n)
        // Exponential complexity
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
