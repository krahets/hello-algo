/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 遞迴 */
func recur(n: Int) -> Int {
    // 終止條件
    if n == 1 {
        return 1
    }
    // 遞：遞迴呼叫
    let res = recur(n: n - 1)
    // 迴：回傳結果
    return n + res
}

/* 以迭代模擬遞迴 */
func forLoopRecur(n: Int) -> Int {
    // 自行建立堆疊，模擬系統的呼叫堆疊
    var stack: [Int] = []
    var res = 0
    // 遞：遞迴呼叫
    for i in (1 ... n).reversed() {
        // 以「推入堆疊」模擬「遞」
        stack.append(i)
    }
    // 迴：回傳結果
    while !stack.isEmpty {
        // 以「彈出堆疊」模擬「迴」
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* 尾端遞迴 */
func tailRecur(n: Int, res: Int) -> Int {
    // 終止條件
    if n == 0 {
        return res
    }
    // 尾端遞迴呼叫
    return tailRecur(n: n - 1, res: res + n)
}

/* 費氏數列：遞迴 */
func fib(n: Int) -> Int {
    // 終止條件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 回傳結果 f(n)
    return res
}

@main
enum Recursion {
    /* 主程式 */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\n遞迴函式的總和 res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\n以迭代模擬遞迴的總和 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n尾端遞迴函式總和 res = \(res)")

        res = recursion.fib(n: n)
        print("\n費氏數列的第 \(n) 項為 \(res)")
    }
}
