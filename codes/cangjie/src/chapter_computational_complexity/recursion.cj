/**
 * File: recursion.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import cangjie.utils.ArrayStack
import std.collection.ArrayList

/* 递归 */
func recur(n: Int64): Int64 {
    // 终止条件
    if (n == 1) {
        return 1
    }
    // 递：递归调用
    var res = recur(n - 1)
    // 归：返回结果
    return n + res
}

/* 使用迭代模拟递归 */
func forLoopRecur(n: Int64): Int64 {
    // 使用一个显式的栈来模拟系统调用栈
    let stack = ArrayStack<Int64>(ArrayList<Int64>())
    var res = 0
    // 递：递归调用
    for (i in n..0 : -1) {
        // 通过“入栈操作”模拟“递”
        stack.push(i)
    }
    // 归：返回结果
    while (!stack.isEmpty()) {
        // 通过“出栈操作”模拟“归”
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 尾递归 */
func tailRecur(n: Int64, res: Int64): Int64 {
    // 终止条件
    if (n == 0) {
        return res
    }
    // 尾递归调用
    return tailRecur(n - 1, res + n)
}

/* 斐波那契数列：递归 */
func fib(n: Int64): Int64 {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2) {
        return n - 1
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2)
    return res
}
