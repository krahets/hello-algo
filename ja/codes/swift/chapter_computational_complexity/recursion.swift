/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 再帰 */
func recur(n: Int) -> Int {
    // 終了条件
    if n == 1 {
        return 1
    }
    // 再帰：再帰呼び出し
    let res = recur(n: n - 1)
    // 帰りがけ：結果を返す
    return n + res
}

/* 反復で再帰を模擬する */
func forLoopRecur(n: Int) -> Int {
    // 明示的なスタックを使ってシステムコールスタックを模擬する
    var stack: [Int] = []
    var res = 0
    // 再帰：再帰呼び出し
    for i in (1 ... n).reversed() {
        // 「スタックへのプッシュ」で「再帰」を模擬する
        stack.append(i)
    }
    // 帰りがけ：結果を返す
    while !stack.isEmpty {
        // 「スタックから取り出す操作」で「帰り」をシミュレート
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* 末尾再帰 */
func tailRecur(n: Int, res: Int) -> Int {
    // 終了条件
    if n == 0 {
        return res
    }
    // 末尾再帰呼び出し
    return tailRecur(n: n - 1, res: res + n)
}

/* フィボナッチ数列：再帰 */
func fib(n: Int) -> Int {
    // 終了条件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // f(n) = f(n-1) + f(n-2) を再帰的に呼び出す
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 結果 f(n) を返す
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\n再帰関数による総和結果 res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\n反復で再帰をシミュレートした総和結果 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n末尾再帰関数による総和結果 res = \(res)")

        res = recursion.fib(n: n)
        print("\nフィボナッチ数列の第 \(n) 項は \(res)")
    }
}
