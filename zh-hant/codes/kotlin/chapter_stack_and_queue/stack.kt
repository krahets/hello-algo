/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化堆疊 */
    val stack = Stack<Int>()

    /* 元素入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = $stack")

    /* 訪問堆疊頂元素 */
    val peek = stack.peek()
    println("堆疊頂元素 peek = $peek")

    /* 元素出堆疊 */
    val pop = stack.pop()
    println("出堆疊元素 pop = $pop，出堆疊後 stack = $stack")

    /* 獲取堆疊的長度 */
    val size = stack.size
    println("堆疊的長度 size = $size")

    /* 判斷是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}