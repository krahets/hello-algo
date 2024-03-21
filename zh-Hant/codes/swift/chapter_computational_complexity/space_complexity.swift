/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 函数 */
@discardableResult
func function() -> Int {
    // 执行某些操作
    return 0
}

/* 常数阶 */
func constant(n: Int) {
    // 常量、变量、对象占用 O(1) 空间
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // 循环中的变量占用 O(1) 空间
    for _ in 0 ..< n {
        let c = 0
    }
    // 循环中的函数占用 O(1) 空间
    for _ in 0 ..< n {
        function()
    }
}

/* 线性阶 */
func linear(n: Int) {
    // 长度为 n 的数组占用 O(n) 空间
    let nums = Array(repeating: 0, count: n)
    // 长度为 n 的列表占用 O(n) 空间
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 长度为 n 的哈希表占用 O(n) 空间
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* 线性阶（递归实现） */
func linearRecur(n: Int) {
    print("递归 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* 平方阶 */
func quadratic(n: Int) {
    // 二维列表占用 O(n^2) 空间
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* 平方阶（递归实现） */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("递归 n = \(n) 中的 nums 长度 = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* 指数阶（建立满二叉树） */
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
        // 常数阶
        constant(n: n)
        // 线性阶
        linear(n: n)
        linearRecur(n: n)
        // 平方阶
        quadratic(n: n)
        quadraticRecur(n: n)
        // 指数阶
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
