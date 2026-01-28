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

/* Constant order */
func constant(n: Int) {
    // Constants, variables, objects occupy O(1) space
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // Variables in the loop occupy O(1) space
    for _ in 0 ..< n {
        let c = 0
    }
    // Functions in the loop occupy O(1) space
    for _ in 0 ..< n {
        function()
    }
}

/* Linear order */
func linear(n: Int) {
    // Array of length n uses O(n) space
    let nums = Array(repeating: 0, count: n)
    // A list of length n occupies O(n) space
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // A hash table of length n occupies O(n) space
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* Linear order (recursive implementation) */
func linearRecur(n: Int) {
    print("Recursion n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* Exponential order */
func quadratic(n: Int) {
    // 2D list uses O(n^2) space
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* Quadratic order (recursive implementation) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // Array nums has length n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("In recursion n = \(n), nums length = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* Driver Code */
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
        // Constant order
        constant(n: n)
        // Linear order
        linear(n: n)
        linearRecur(n: n)
        // Exponential order
        quadratic(n: n)
        quadraticRecur(n: n)
        // Exponential order
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
