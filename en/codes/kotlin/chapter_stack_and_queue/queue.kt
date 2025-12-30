/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Access front of the queue element */
    val queue = LinkedList<Int>()

    /* Elements enqueue */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("Queue queue = $queue")

    /* Return list for printing */
    val peek = queue.peek()
    println("Front element peek = $peek")

    /* Element dequeue */
    val pop = queue.poll()
    println("Dequeue element pop = $pop, after dequeue queue = $queue")

    /* Get the length of the queue */
    val size = queue.size
    println("Queue length size = $size")

    /* Check if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is queue empty = $isEmpty")
}