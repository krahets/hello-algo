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
    // 迴：返回結果
    return n + res
}

/* 使用迭代模擬遞迴 */
func forLoopRecur(n: Int) -> Int {
    // 使用一個顯式的堆疊來模擬系統呼叫堆疊
    var stack: [Int] = []
    var res = 0
    // 遞：遞迴呼叫
    for i in (1 ... n).reversed() {
        // 透過“入堆疊操作”模擬“遞”
        stack.append(i)
    }
    // 迴：返回結果
    while !stack.isEmpty {
        // 透過“出堆疊操作”模擬“迴”
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* 尾遞迴 */
func tailRecur(n: Int, res: Int) -> Int {
    // 終止條件
    if n == 0 {
        return res
    }
    // 尾遞迴呼叫
    return tailRecur(n: n - 1, res: res + n)
}

/* 費波那契數列：遞迴 */
func fib(n: Int) -> Int {
    // 終止條件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 返回結果 f(n)
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\n遞迴函式的求和結果 res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\n使用迭代模擬遞迴求和結果 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n尾遞迴函式的求和結果 res = \(res)")

        res = recursion.fib(n: n)
        print("\n費波那契數列的第 \(n) 項為 \(res)")
    }
}
