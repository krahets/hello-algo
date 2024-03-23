/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 初始化队列 */
    val queue = LinkedList<Int>()

    /* 元素入队 */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("队列 queue = $queue")

    /* 访问队首元素 */
    val peek = queue.peek()
    println("队首元素 peek = $peek")

    /* 元素出队 */
    val pop = queue.poll()
    println("出队元素 pop = $pop，出队后 queue = $queue")

    /* 获取队列的长度 */
    val size = queue.size
    println("队列长度 size = $size")

    /* 判断队列是否为空 */
    val isEmpty = queue.isEmpty()
    println("队列是否为空 = $isEmpty")
}