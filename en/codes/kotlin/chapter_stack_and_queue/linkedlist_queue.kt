/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue implemented with a linked list */
class LinkedListQueue(
    // Head node front and tail node rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* Get the queue size */
    fun size(): Int {
        return queSize
    }

    /* Check whether the queue is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        // Add num after the tail node
        val node = ListNode(num)
        // If the queue is empty, make both the head and tail point to this node
        if (front == null) {
            front = node
            rear = node
            // If the queue is not empty, add this node after the tail node
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Remove the head node
        front = front?.next
        queSize--
        return num
    }

    /* Access the front element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Convert the linked list to an array and return it */
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

/* Driver code */
fun main() {
    /* Initialize the queue */
    val queue = LinkedListQueue()

    /* Enqueue elements */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Queue queue = ${queue.toArray().contentToString()}")

    /* Access the front element */
    val peek = queue.peek()
    println("Front element: peek = $peek")

    /* Dequeue an element */
    val pop = queue.pop()
    println("Dequeued element: pop = $pop; queue after removal = ${queue.toArray().contentToString()}")

    /* Get the queue size */
    val size = queue.size()
    println("Queue size = $size")

    /* Check whether the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty? $isEmpty")
}