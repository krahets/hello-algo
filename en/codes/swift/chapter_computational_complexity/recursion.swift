/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Recursion */
func recur(n: Int) -> Int {
    // Base case
    if n == 1 {
        return 1
    }
    // Descend: make a recursive call
    let res = recur(n: n - 1)
    // Unwind: return the result
    return n + res
}

/* Simulate recursion with iteration */
func forLoopRecur(n: Int) -> Int {
    // Use an explicit stack to simulate the call stack
    var stack: [Int] = []
    var res = 0
    // Descend: make a recursive call
    for i in (1 ... n).reversed() {
        // Push to simulate descending
        stack.append(i)
    }
    // Unwind: return the result
    while !stack.isEmpty {
        // Pop to simulate unwinding
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* Tail recursion */
func tailRecur(n: Int, res: Int) -> Int {
    // Base case
    if n == 0 {
        return res
    }
    // Tail call
    return tailRecur(n: n - 1, res: res + n)
}

/* Fibonacci sequence using recursion */
func fib(n: Int) -> Int {
    // Base cases: f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // Return the result f(n)
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nRecursive sum: res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nSum using simulated recursion: res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nTail-recursive sum: res = \(res)")

        res = recursion.fib(n: n)
        print("\nFibonacci term \(n) is \(res)")
    }
}
