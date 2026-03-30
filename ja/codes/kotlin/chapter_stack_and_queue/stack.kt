/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* スタックを初期化 */
    val stack = Stack<Int>()

    /* 要素をプッシュ */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("スタック stack = $stack")

    /* スタックトップの要素にアクセス */
    val peek = stack.peek()
    println("スタックトップ要素 peek = $peek")

    /* 要素をポップ */
    val pop = stack.pop()
    println("ポップした要素 pop = $pop、ポップ後 stack = $stack")

    /* スタックの長さを取得 */
    val size = stack.size
    println("スタックの長さ size = $size")

    /* 空かどうかを判定 */
    val isEmpty = stack.isEmpty()
    println("スタックが空かどうか = $isEmpty")
}