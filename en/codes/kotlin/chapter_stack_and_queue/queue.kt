/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    /* Initialize the queue */
    val queue = LinkedList<Int>()

    /* Enqueue elements */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("Queue queue = $queue")

    /* Access the front element */
    val peek = queue.peek()
    println("Front element: peek = $peek")

    /* Dequeue an element */
    val pop = queue.poll()
    println("Dequeued element: pop = $pop; queue after removal = $queue")

    /* Get the queue size */
    val size = queue.size
    println("Queue size = $size")

    /* Check whether the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty? $isEmpty")
}