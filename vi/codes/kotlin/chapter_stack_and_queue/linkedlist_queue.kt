/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue based on linked list implementation */
class LinkedListQueue(
    // Head node front, tail node rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* Get the length of the queue */
    fun size(): Int {
        return queSize
    }

    /* Check if the queue is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        // Add num after the tail node
        val node = ListNode(num)
        // If the queue is empty, make both front and rear point to the node
        if (front == null) {
            front = node
            rear = node
            // If the queue is not empty, add the node after the tail node
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Delete head node
        front = front?.next
        queSize--
        return num
    }

    /* Return list for printing */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Convert linked list to Array and return */
    fun toArray(): IntArray {
        var node = front
        val res = IntArray(size())
        for (i in res.indices) {
            res[i] = node!!._val
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* Access front of the queue element */
    val queue = LinkedListQueue()

    /* Elements enqueue */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Queue queue = ${queue.toArray().contentToString()}")

    /* Return list for printing */
    val peek = queue.peek()
    println("Front element peek = $peek")

    /* Element dequeue */
    val pop = queue.pop()
    println("Dequeue element pop = $pop, after dequeue queue = ${queue.toArray().contentToString()}")

    /* Get the length of the queue */
    val size = queue.size()
    println("Queue length size = $size")

    /* Check if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is queue empty = $isEmpty")
}