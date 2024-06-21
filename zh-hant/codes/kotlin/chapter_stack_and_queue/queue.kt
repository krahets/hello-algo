/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化佇列 */
    val queue = LinkedList<Int>()

    /* 元素入列 */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("佇列 queue = $queue")

    /* 訪問佇列首元素 */
    val peek = queue.peek()
    println("佇列首元素 peek = $peek")

    /* 元素出列 */
    val pop = queue.poll()
    println("出列元素 pop = $pop，出列後 queue = $queue")

    /* 獲取佇列的長度 */
    val size = queue.size
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")
}