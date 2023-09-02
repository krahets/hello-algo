/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 递归 */
func recur(n: Int) -> Int {
    // 终止条件
    if n == 1 {
        return 1
    }
    // 递：递归调用
    let res = recur(n: n - 1)
    // 归：返回结果
    return n + res
}

/* 尾递归 */
func tailRecur(n: Int, res: Int) -> Int {
    // 终止条件
    if n == 0 {
        return res
    }
    // 尾递归调用
    return tailRecur(n: n - 1, res: res + n)
}

/* 斐波那契数列：递归 */
func fib(n: Int) -> Int {
    // 终止条件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 返回结果 f(n)
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\n递归函数的求和结果 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n尾递归函数的求和结果 res = \(res)")

        res = recursion.fib(n: n)
        print("\n斐波那契数列的第 \(n) 项为 \(res)")
    }
}
