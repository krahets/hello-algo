/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 範例程式 */
fun main() {
    /* 初始化堆疊 */
    val stack = Stack<Int>()

    /* 將元素推入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = $stack")

    /* 讀取堆疊頂端的元素 */
    val peek = stack.peek()
    println("堆疊頂端元素 peek = $peek")

    /* 從堆疊彈出元素 */
    val pop = stack.pop()
    println("彈出的元素 pop = $pop，彈出後 stack = $stack")

    /* 取得堆疊長度 */
    val size = stack.size
    println("堆疊長度 size = $size")

    /* 判斷堆疊是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}