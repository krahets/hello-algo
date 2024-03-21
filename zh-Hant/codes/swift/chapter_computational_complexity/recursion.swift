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

/* 使用迭代模拟递归 */
func forLoopRecur(n: Int) -> Int {
    // 使用一个显式的栈来模拟系统调用栈
    var stack: [Int] = []
    var res = 0
    // 递：递归调用
    for i in (1 ... n).reversed() {
        // 通过“入栈操作”模拟“递”
        stack.append(i)
    }
    // 归：返回结果
    while !stack.isEmpty {
        // 通过“出栈操作”模拟“归”
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
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

        res = recursion.forLoopRecur(n: n)
        print("\n使用迭代模拟递归求和结果 res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\n尾递归函数的求和结果 res = \(res)")

        res = recursion.fib(n: n)
        print("\n斐波那契数列的第 \(n) 项为 \(res)")
    }
}
