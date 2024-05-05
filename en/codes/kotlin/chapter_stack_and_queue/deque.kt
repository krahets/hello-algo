/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* Initialize double-ended queue */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("Double-ended queue deque = $deque")

    /* Access element */
    val peekFirst = deque.peekFirst()
    println("Front element peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Back element peekLast = $peekLast")

    /* Element enqueue */
    deque.offerLast(4)
    println("Element 4 enqueued at the back, deque = $deque")
    deque.offerFirst(1)
    println("Element 1 enqueued at the front, deque = $deque")

    /* Element dequeue */
    val popLast = deque.pollLast()
    println("Back dequeue element = $popLast, deque after back dequeue = $deque")
    val popFirst = deque.pollFirst()
    println("Front dequeue element = $popFirst, deque after front dequeue = $deque")

    /* Get the length of the double-ended queue */
    val size = deque.size
    println("Double-ended queue length size = $size")

    /* Determine if the double-ended queue is empty */
    val isEmpty = deque.isEmpty()
    println("Is the double-ended queue empty = $isEmpty")
}