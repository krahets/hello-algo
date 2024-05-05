/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* Recursion */
fun recur(n: Int): Int {
    // Termination condition
    if (n == 1)
        return 1
    // Rec: Recursive call
    val res = recur(n - 1)
    // Return: Return result
    return n + res
}

/* Simulate recursion with iteration */
fun forLoopRecur(n: Int): Int {
    // Use an explicit stack to simulate the system call stack
    val stack = Stack<Int>()
    var res = 0
    // Rec: Recursive call
    for (i in n downTo 0) {
        // Simulate "recursive" by "pushing onto the stack"
        stack.push(i)
    }
    // Return: Return result
    while (stack.isNotEmpty()) {
        // Simulate "return" by "popping from the stack"
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Tail recursion */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Add tailrec keyword to enable tail recursion optimization
    // Termination condition
    if (n == 0)
        return res
    // Tail recursive call
    return tailRecur(n - 1, res + n)
}

/* Fibonacci sequence: Recursion */
fun fib(n: Int): Int {
    // Termination condition f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Recursive call f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Return result f(n)
    return res
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nResult of recursive sum function res = $res")

    res = forLoopRecur(n)
    println("\nSum result using iteration to simulate recursion res = $res")

    res = tailRecur(n, 0)
    println("\nResult of tail-recursive sum function res = $res")

    res = fib(n)
    println("\nThe $n-th term of the Fibonacci sequence is $res")
}