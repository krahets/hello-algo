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
    // Recurse: make a recursive call
    let res = recur(n: n - 1)
    // Unwind: return the result
    return n + res
}

/* Simulate recursion using iteration */
func forLoopRecur(n: Int) -> Int {
    // Use an explicit stack to simulate the system call stack
    var stack: [Int] = []
    var res = 0
    // Descending: simulate recursive calls
    for i in (1 ... n).reversed() {
        // Simulate recursive calls by pushing onto the stack
        stack.append(i)
    }
    // Unwinding: simulate returning results
    while !stack.isEmpty {
        // Simulate unwinding by popping from the stack
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
    // Tail-recursive call
    return tailRecur(n: n - 1, res: res + n)
}

/* Fibonacci sequence: recursion */
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
    /* Driver code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nSum from recursion: res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nSum from simulating recursion with iteration: res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nSum from tail recursion: res = \(res)")

        res = recursion.fib(n: n)
        print("\nFibonacci term \(n) is \(res)")
    }
}
