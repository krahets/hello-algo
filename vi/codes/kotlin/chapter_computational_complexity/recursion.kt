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
    // Descend: recursive call
    val res = recur(n - 1)
    // Return: return result
    return n + res
}

/* Simulate recursion using iteration */
fun forLoopRecur(n: Int): Int {
    // Use an explicit stack to simulate the system call stack
    val stack = Stack<Int>()
    var res = 0
    // Descend: recursive call
    for (i in n downTo 0) {
        // Simulate "recurse" with "push"
        stack.push(i)
    }
    // Return: return result
    while (stack.isNotEmpty()) {
        // Simulate "return" with "pop"
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

/* Fibonacci sequence: recursion */
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
    println("\nRecursion sum result res = $res")

    res = forLoopRecur(n)
    println("\nUsing iteration to simulate recursion sum result res = $res")

    res = tailRecur(n, 0)
    println("\nTail recursion sum result res = $res")

    res = fib(n)
    println("\nThe ${n}th Fibonacci number is $res")
}