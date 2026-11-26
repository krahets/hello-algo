/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* 再帰 */
fun recur(n: Int): Int {
    // 終了条件
    if (n == 1)
        return 1
    // 行き：再帰呼び出し
    val res = recur(n - 1)
    // 帰り：結果を返す
    return n + res
}

/* 反復で再帰を模擬 */
fun forLoopRecur(n: Int): Int {
    // 明示的なスタックでシステムの呼び出しスタックを模擬
    val stack = Stack<Int>()
    var res = 0
    // 行き：再帰呼び出し
    for (i in n downTo 0) {
        // プッシュで「行き」を模擬
        stack.push(i)
    }
    // 帰り：結果を返す
    while (stack.isNotEmpty()) {
        // ポップで「帰り」を模擬
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 末尾再帰 */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // tailrec キーワードを付けて末尾再帰最適化を有効にする
    // 終了条件
    if (n == 0)
        return res
    // 末尾再帰呼び出し
    return tailRecur(n - 1, res + n)
}

/* フィボナッチ数列：再帰 */
fun fib(n: Int): Int {
    // 終了条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // 結果 f(n) を返す
    return res
}

/* 実行例 */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\n再帰関数による総和 res = $res")

    res = forLoopRecur(n)
    println("\n反復で再帰を模擬して求めた総和 res = $res")

    res = tailRecur(n, 0)
    println("\n末尾再帰関数による総和 res = $res")

    res = fib(n)
    println("\nフィボナッチ数列の第 $n 項は $res")
}