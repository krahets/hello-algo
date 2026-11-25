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
    println("deque = $deque")

    /* Peek at the front and rear elements */
    val peekFirst = deque.peekFirst()
    println("Front element (peekFirst) = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element (peekLast) = $peekLast")

    /* Add elements to the deque */
    deque.offerLast(4)
    println("After adding 4 at the rear, deque = $deque")
    deque.offerFirst(1)
    println("After adding 1 at the front, deque = $deque")

    /* Remove elements from both ends */
    val popLast = deque.pollLast()
    println("Removed from the rear = $popLast, deque after removal = $deque")
    val popFirst = deque.pollFirst()
    println("Removed from the front = $popFirst, deque after removal = $deque")

    /* Get the deque size */
    val size = deque.size
    println("Deque size = $size")

    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    println("Deque is empty = $isEmpty")
}