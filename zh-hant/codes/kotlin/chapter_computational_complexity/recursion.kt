/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* 遞迴 */
fun recur(n: Int): Int {
    // 終止條件
    if (n == 1)
        return 1
    // 遞：遞迴呼叫
    val res = recur(n - 1)
    // 迴：回傳結果
    return n + res
}

/* 以迭代模擬遞迴 */
fun forLoopRecur(n: Int): Int {
    // 自行建立堆疊，模擬系統的呼叫堆疊
    val stack = Stack<Int>()
    var res = 0
    // 遞：遞迴呼叫
    for (i in n downTo 0) {
        // 以「推入堆疊」模擬「遞」
        stack.push(i)
    }
    // 迴：回傳結果
    while (stack.isNotEmpty()) {
        // 以「彈出堆疊」模擬「迴」
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 尾端遞迴 */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // 加上 tailrec 關鍵字，以啟用尾端遞迴最佳化
    // 終止條件
    if (n == 0)
        return res
    // 尾端遞迴呼叫
    return tailRecur(n - 1, res + n)
}

/* 費氏數列：遞迴 */
fun fib(n: Int): Int {
    // 終止條件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // 回傳結果 f(n)
    return res
}

/* 主程式 */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\n遞迴函式的總和 res = $res")

    res = forLoopRecur(n)
    println("\n以迭代模擬遞迴的總和 res = $res")

    res = tailRecur(n, 0)
    println("\n尾端遞迴函式總和 res = $res")

    res = fib(n)
    println("\n費氏數列的第 $n 項為 $res")
}