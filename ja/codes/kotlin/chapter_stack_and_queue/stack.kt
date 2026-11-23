/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    val peek = stack.peek()
    println("スタックの先頭要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()
    println("ポップした要素 pop = $pop、ポップ後 stack = $stack")

    /* スタックの長さを取得する */
    val size = stack.size
    println("スタックの長さ size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}