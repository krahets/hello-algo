/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行例 */
fun main() {
    /* スタックを初期化する */
    val stack = Stack<Int>()

    /* 要素をプッシュする */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("スタック stack = $stack")

    /* スタックのトップを参照する */
    val peek = stack.peek()
    println("スタックのトップの要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()
    println("ポップした要素 pop = $pop、ポップ後の stack = $stack")

    /* スタックの要素数を取得する */
    val size = stack.size
    println("スタックの要素数 size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}