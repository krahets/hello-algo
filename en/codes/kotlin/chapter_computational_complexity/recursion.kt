/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* Recursion */
fun recur(n: Int): Int {
    // Base case
    if (n == 1)
        return 1
    // Descend: make a recursive call
    val res = recur(n - 1)
    // Unwind: return the result
    return n + res
}

/* Simulate recursion with iteration */
fun forLoopRecur(n: Int): Int {
    // Use an explicit stack to simulate the call stack
    val stack = Stack<Int>()
    var res = 0
    // Descend: make a recursive call
    for (i in n downTo 0) {
        // Push to simulate descending
        stack.push(i)
    }
    // Unwind: return the result
    while (stack.isNotEmpty()) {
        // Pop to simulate unwinding
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Tail recursion */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Add the tailrec keyword to enable tail-call optimization
    // Base case
    if (n == 0)
        return res
    // Tail call
    return tailRecur(n - 1, res + n)
}

/* Fibonacci sequence using recursion */
fun fib(n: Int): Int {
    // Base cases: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Return the result f(n)
    return res
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nRecursive sum: res = $res")

    res = forLoopRecur(n)
    println("\nSum using simulated recursion: res = $res")

    res = tailRecur(n, 0)
    println("\nTail-recursive sum: res = $res")

    res = fib(n)
    println("\nFibonacci term $n is $res")
}