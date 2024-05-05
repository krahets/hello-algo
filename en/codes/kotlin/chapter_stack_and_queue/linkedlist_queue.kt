/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue class based on linked list */
class LinkedListQueue(
    // Front node front, back node rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* Get the length of the queue */
    fun size(): Int {
        return queSize
    }

    /* Determine if the queue is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        // Add num behind the tail node
        val node = ListNode(num)
        // If the queue is empty, make the head and tail nodes both point to that node
        if (front == null) {
            front = node
            rear = node
            // If the queue is not empty, add that node behind the tail node
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Remove head node
        front = front?.next
        queSize--
        return num
    }

    /* Access front element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Convert the linked list to Array and return */
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
    /* Initialize queue */
    val queue = LinkedListQueue()

    /* Element enqueue */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Queue queue = ${queue.toArray().contentToString()}")

    /* Access front element */
    val peek = queue.peek()
    println("Front element peek = $peek")

    /* Element dequeue */
    val pop = queue.pop()
    println("Dequeue element pop = $pop, queue after dequeue = ${queue.toArray().contentToString()}")

    /* Get the length of the queue */
    val size = queue.size()
    println("Queue length size = $size")

    /* Determine if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty = $isEmpty")
}