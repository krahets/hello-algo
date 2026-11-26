/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 範例程式 */
fun main() {
    /* 初始化佇列 */
    val queue = LinkedList<Int>()

    /* 將元素加入佇列 */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("佇列 queue = $queue")

    /* 讀取隊首元素 */
    val peek = queue.peek()
    println("隊首元素 peek = $peek")

    /* 從佇列取出元素 */
    val pop = queue.poll()
    println("出隊元素 pop = $pop，出隊後 queue = $queue")

    /* 取得佇列長度 */
    val size = queue.size
    println("佇列長度 size = $size")

    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    println("佇列是否為空 = $isEmpty")
}