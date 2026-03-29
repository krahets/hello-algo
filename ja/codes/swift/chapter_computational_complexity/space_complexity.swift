/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 関数 */
@discardableResult
func function() -> Int {
    // 何らかの処理を行う
    return 0
}

/* 定数階 */
func constant(n: Int) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // ループ内の変数は O(1) の空間を占める
    for _ in 0 ..< n {
        let c = 0
    }
    // ループ内の関数は O(1) の空間を占める
    for _ in 0 ..< n {
        function()
    }
}

/* 線形階 */
func linear(n: Int) {
    // 長さ n の配列は O(n) の空間を使用
    let nums = Array(repeating: 0, count: n)
    // 長さ n のリストは O(n) の空間を使用
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* 線形時間（再帰実装） */
func linearRecur(n: Int) {
    print("再帰 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* 二乗階 */
func quadratic(n: Int) {
    // 二次元リストは O(n^2) の空間を使用
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* 二次時間（再帰実装） */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 配列 nums の長さは n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("再帰 n = \(n) における nums の長さ = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* 指数時間（完全二分木の構築） */
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
        // 定数階
        constant(n: n)
        // 線形階
        linear(n: n)
        linearRecur(n: n)
        // 二乗階
        quadratic(n: n)
        quadraticRecur(n: n)
        // 指数オーダー
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
