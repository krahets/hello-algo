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
    // 往路：再帰呼び出し
    val res = recur(n - 1)
    // 復路：結果を返す
    return n + res
}

/* 反復を使って再帰を再現する */
fun forLoopRecur(n: Int): Int {
    // 明示的なスタックを使って、システムの呼び出しスタックを再現する
    val stack = Stack<Int>()
    var res = 0
    // 往路：再帰呼び出し
    for (i in n downTo 0) {
        // 「プッシュ操作」で再帰の「往路」を再現する
        stack.push(i)
    }
    // 復路：結果を返す
    while (stack.isNotEmpty()) {
        // 「ポップ操作」で再帰の「復路」を再現する
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* 末尾再帰 */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // tailrec キーワードを追加し、末尾再帰の最適化を有効にする
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

/* 実行用コード */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\n再帰関数で求めた和 res = $res")

    res = forLoopRecur(n)
    println("\n反復で再帰を再現して求めた和 res = $res")

    res = tailRecur(n, 0)
    println("\n末尾再帰関数で求めた和 res = $res")

    res = fib(n)
    println("\nフィボナッチ数列の第 $n 項は $res")
}