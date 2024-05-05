/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Initialize queue */
    val queue = LinkedList<Int>()

    /* Element enqueue */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("Queue queue = $queue")

    /* Access front element */
    val peek = queue.peek()
    println("Front element peek = $peek")

    /* Element dequeue */
    val pop = queue.poll()
    println("Dequeue element pop = $pop, queue after dequeue = $queue")

    /* Get the length of the queue */
    val size = queue.size
    println("Queue length size = $size")

    /* Determine if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty = $isEmpty")
}