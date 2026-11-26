/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 函式 */
@discardableResult
func function() -> Int {
    // 執行操作
    return 0
}

/* 常數階 */
func constant(n: Int) {
    // 常數、變數、物件占用 O(1) 空間
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // 迴圈內變數占用 O(1) 空間
    for _ in 0 ..< n {
        let c = 0
    }
    // 迴圈呼叫函式占用 O(1) 空間
    for _ in 0 ..< n {
        function()
    }
}

/* 線性階 */
func linear(n: Int) {
    // 長度為 n 的陣列占用 O(n) 空間
    let nums = Array(repeating: 0, count: n)
    // 長度為 n 的串列占用 O(n) 空間
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 長度為 n 的雜湊表占用 O(n) 空間
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* 線性階（遞迴實作） */
func linearRecur(n: Int) {
    print("遞迴 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* 平方階 */
func quadratic(n: Int) {
    // 二維串列占用 O(n^2) 空間
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* 平方階（遞迴實作） */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 陣列 nums 長度為 n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("遞迴 n = \(n) 時，nums 的長度 = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* 指數階（建完美二元樹） */
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
    /* 主程式 */
    static func main() {
        let n = 5
        // 常數階
        constant(n: n)
        // 線性階
        linear(n: n)
        linearRecur(n: n)
        // 平方階
        quadratic(n: n)
        quadraticRecur(n: n)
        // 指數階
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
