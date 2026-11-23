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
    // Descending: recursive calls
    val res = recur(n - 1)
    // Unwinding: return the result
    return n + res
}

/* Simulate recursion using iteration */
fun forLoopRecur(n: Int): Int {
    // Use an explicit stack to simulate the system call stack
    val stack = Stack<Int>()
    var res = 0
    // Descending: recursive calls
    for (i in n downTo 0) {
        // Simulate recursive calls by pushing onto the stack
        stack.push(i)
    }
    // Unwinding: return the result
    while (stack.isNotEmpty()) {
        // Simulate unwinding by popping from the stack
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Tail recursion */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Add the tailrec modifier to enable tail-call optimization
    // Base case
    if (n == 0)
        return res
    // Tail-recursive call
    return tailRecur(n - 1, res + n)
}

/* Fibonacci sequence: recursion */
fun fib(n: Int): Int {
    // Base cases: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Return the result f(n)
    return res
}

/* Driver code */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nSum from the recursive function: res = $res")

    res = forLoopRecur(n)
    println("\nSum from simulating recursion with iteration: res = $res")

    res = tailRecur(n, 0)
    println("\nSum from the tail-recursive function: res = $res")

    res = fib(n)
    println("\nTerm $n of the Fibonacci sequence is $res")
}