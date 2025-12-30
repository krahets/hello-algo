/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Get the length of the double-ended queue */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("Deque deque = $deque")

    /* Update element */
    val peekFirst = deque.peekFirst()
    println("Front element peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element peekLast = $peekLast")

    /* Elements enqueue */
    deque.offerLast(4)
    println("After element 4 enqueues at rear, deque = $deque")
    deque.offerFirst(1)
    println("After element 1 enqueues at front, deque = $deque")

    /* Element dequeue */
    val popLast = deque.pollLast()
    println("Dequeue rear element = $popLast, after rear dequeue deque = $deque")
    val popFirst = deque.pollFirst()
    println("Dequeue front element = $popFirst, after front dequeue deque = $deque")

    /* Get the length of the double-ended queue */
    val size = deque.size
    println("Deque length size = $size")

    /* Check if the double-ended queue is empty */
    val isEmpty = deque.isEmpty()
    println("Is deque empty = $isEmpty")
}