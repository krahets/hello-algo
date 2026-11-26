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

/* Constant space */
func constant(n: Int) {
    // Constants, variables, and objects use O(1) space
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // Variables in the loop use O(1) space
    for _ in 0 ..< n {
        let c = 0
    }
    // Function calls in the loop use O(1) space
    for _ in 0 ..< n {
        function()
    }
}

/* Linear space */
func linear(n: Int) {
    // An array of length n uses O(n) space
    let nums = Array(repeating: 0, count: n)
    // A list of length n uses O(n) space
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // A hash table with n entries uses O(n) space
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* Linear space (recursive) */
func linearRecur(n: Int) {
    print("Recursive call: n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* Quadratic space */
func quadratic(n: Int) {
    // A two-dimensional list uses O(n^2) space
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* Quadratic space (recursive) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // The successive lengths of nums are n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("Recursive call: n = \(n), length of nums = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* Exponential space (build a perfect binary tree) */
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
        // Constant space
        constant(n: n)
        // Linear space
        linear(n: n)
        linearRecur(n: n)
        // Quadratic space
        quadratic(n: n)
        quadraticRecur(n: n)
        // Exponential space
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
