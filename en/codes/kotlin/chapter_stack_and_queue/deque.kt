/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver code */
fun main() {
    /* Initialize the deque */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("Deque deque = $deque")

    /* Access an element */
    val peekFirst = deque.peekFirst()
    println("Front element: peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element: peekLast = $peekLast")

    /* Enqueue elements */
    deque.offerLast(4)
    println("After enqueuing 4 at the rear: deque = $deque")
    deque.offerFirst(1)
    println("After enqueuing 1 at the front: deque = $deque")

    /* Dequeue an element */
    val popLast = deque.pollLast()
    println("Element dequeued from the rear = $popLast; deque after removal = $deque")
    val popFirst = deque.pollFirst()
    println("Element dequeued from the front = $popFirst; deque after removal = $deque")

    /* Get the deque size */
    val size = deque.size
    println("Deque size = $size")

    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    println("Is the deque empty? $isEmpty")
}