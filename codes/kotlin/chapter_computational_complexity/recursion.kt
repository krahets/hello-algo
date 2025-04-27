/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* 递归 */
fun recur(n: Int): Int {
    // 终止条件
    if (n == 1)
        return 1
    // 递: 递归调用
    val res = recur(n - 1)
    // 归: 返回结果
    return n + res
}

/* 使用迭代模拟递归 */
fun forLoopRecur(n: Int): Int {
    // 使用一个显式的栈来模拟系统调用栈
    val stack = Stack<Int>()
    var res = 0
    // 递: 递归调用
    for (i in n downTo 0) {
        // 通过“入栈操作”模拟“递”
        stack.push(i)
    }
    // 归: 返回结果
    while (stack.isNotEmpty()) {
        // 通过“出栈操作”模拟“归”
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 尾递归 */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // 添加 tailrec 关键词，以开启尾递归优化
    // 终止条件
    if (n == 0)
        return res
    // 尾递归调用
    return tailRecur(n - 1, res + n)
}

/* 斐波那契数列：递归 */
fun fib(n: Int): Int {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // 递归调用 f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // 返回结果 f(n)
    return res
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\n递归函数的求和结果 res = $res")

    res = forLoopRecur(n)
    println("\n使用迭代模拟递归求和结果 res = $res")

    res = tailRecur(n, 0)
    println("\n尾递归函数的求和结果 res = $res")

    res = fib(n)
    println("\n斐波那契数列的第 $n 项为 $res")
}