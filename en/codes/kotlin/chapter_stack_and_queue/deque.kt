/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    // [region]{init_deque}
    /* Initialize the deque */
    val deque = LinkedList<Int>()
    // [endregion]{init_deque}

    // [region]{push}
    /* Enqueue elements */
    deque.offerLast(2) // Add to the rear
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // Add to the front
    deque.offerFirst(1)
    // [endregion]{push}
    println("Deque deque = $deque")

    // [region]{peek_first}
    /* Access an element */
    val peekFirst = deque.peekFirst() // Front element
    // [endregion]{peek_first}
    println("Front element: peekFirst = $peekFirst")
    // [region]{peek_last}
    val peekLast = deque.peekLast() // Rear element
    // [endregion]{peek_last}
    println("Rear element: peekLast = $peekLast")

    // [region]{pop_first}
    /* Dequeue an element */
    val popFirst = deque.pollFirst() // Dequeue the front element
    // [endregion]{pop_first}
    println("Element dequeued from the front = $popFirst; deque after removal = $deque")
    // [region]{pop_last}
    val popLast = deque.pollLast() // Dequeue the rear element
    // [endregion]{pop_last}
    println("Element dequeued from the rear = $popLast; deque after removal = $deque")

    // [region]{size}
    /* Get the deque size */
    val size = deque.size
    // [endregion]{size}
    println("Deque size = $size")

    // [region]{is_empty}
    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    // [endregion]{is_empty}
    println("Is the deque empty? $isEmpty")
}