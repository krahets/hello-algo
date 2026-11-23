/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* for ループ */
func forLoop(n: Int) -> Int {
    var res = 0
    // ループで 1, 2, ..., n-1, n の和を求める
    for i in 1 ... n {
        res += i
    }
    return res
}

/* while ループ */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // ループで 1, 2, ..., n-1, n の和を求める
    while i <= n {
        res += i
        i += 1 // 条件変数を更新する
    }
    return res
}

/* while ループ（2 回の更新） */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // ループで 1, 4, 10, ... の和を求める
    while i <= n {
        res += i
        // 条件変数を更新する
        i += 1
        i *= 2
    }
    return res
}

/* 二重 for ループ */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // i = 1, 2, ..., n-1, n のループ
    for i in 1 ... n {
        // j = 1, 2, ..., n-1, n のループ
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* 実行用コード */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nfor ループで求めた和 res = \(res)")

        res = whileLoop(n: n)
        print("\nwhile ループで求めた和 res = \(res)")

        res = whileLoopII(n: n)
        print("\nwhile ループ（2 回の更新）で求めた和 res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\n二重 for ループの走査結果 \(resStr)")
    }
}
