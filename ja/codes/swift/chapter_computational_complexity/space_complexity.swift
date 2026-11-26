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

/* 定数オーダー */
func constant(n: Int) {
    // 定数・変数・オブジェクトが使う領域は O(1)
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // ループ内の変数が使う領域は O(1)
    for _ in 0 ..< n {
        let c = 0
    }
    // ループ内の関数が使う領域は O(1)
    for _ in 0 ..< n {
        function()
    }
}

/* 線形オーダー */
func linear(n: Int) {
    // 長さ n の配列が使う領域は O(n)
    let nums = Array(repeating: 0, count: n)
    // 長さ n のリストが使う領域は O(n)
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 長さ n のハッシュテーブルが使う領域は O(n)
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* 線形オーダー（再帰による実装） */
func linearRecur(n: Int) {
    print("再帰 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* 二次オーダー */
func quadratic(n: Int) {
    // 二次元リストが使う領域は O(n^2)
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* 二次オーダー（再帰による実装） */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 配列 nums の長さは順に n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("再帰 n = \(n) での nums の長さ = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* 指数オーダー（すべての葉が同じ深さの完全二分木を構築） */
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
    /* 実行例 */
    static func main() {
        let n = 5
        // 定数オーダー
        constant(n: n)
        // 線形オーダー
        linear(n: n)
        linearRecur(n: n)
        // 二次オーダー
        quadratic(n: n)
        quadraticRecur(n: n)
        // 指数オーダー
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
