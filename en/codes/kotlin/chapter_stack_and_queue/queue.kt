/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    // [region]{init_queue}
    /* Initialize the queue */
    val queue = LinkedList<Int>()
    // [endregion]{init_queue}

    // [region]{push}
    /* Enqueue elements */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    // [endregion]{push}
    println("Queue queue = $queue")

    // [region]{peek}
    /* Access the front element */
    val peek = queue.peek()
    // [endregion]{peek}
    println("Front element: peek = $peek")

    // [region]{pop}
    /* Dequeue an element */
    val pop = queue.poll()
    // [endregion]{pop}
    println("Dequeued element: pop = $pop; queue after removal = $queue")

    // [region]{size}
    /* Get the queue size */
    val size = queue.size
    // [endregion]{size}
    println("Queue size = $size")

    // [region]{is_empty}
    /* Check whether the queue is empty */
    val isEmpty = queue.isEmpty()
    // [endregion]{is_empty}
    println("Is the queue empty? $isEmpty")
}