/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Doubly linked list node */
class ListNode(var _val: Int) {
    // Node value
    var next: ListNode? = null // Reference to the next node
    var prev: ListNode? = null // Reference to the previous node
}

/* Deque backed by a doubly linked list */
class LinkedListDeque {
    private var front: ListNode? = null // Head node (front)
    private var rear: ListNode? = null // Tail node (rear)
    private var queSize: Int = 0 // Deque size

    /* Get the deque size */
    fun size(): Int {
        return queSize
    }

    /* Check whether the deque is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Add an element at either end */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // If the list is empty, point both front and rear at node
        if (isEmpty()) {
            rear = node
            front = rear
            // Add at the front
        } else if (isFront) {
            // Link node at the head of the list
            front?.prev = node
            node.next = front
            front = node // Update the head
            // Add at the rear
        } else {
            // Link node at the tail of the list
            rear?.next = node
            node.prev = rear
            rear = node // Update the tail
        }
        queSize++ // Update the deque size
    }

    /* Add an element at the front */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Add an element at the rear */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Remove an element from either end */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // When the deque contains one element, the head and tail point to the same node
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // Remove from the front
        else if (isFront) {
            _val = front!!._val // Save the head node's value
            // Remove the head node
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // Update the head
            // Remove from the rear
        } else {
            _val = rear!!._val // Save the tail node's value
            // Remove the tail node
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // Update the tail
        }
        queSize-- // Update the deque size
        return _val
    }

    /* Remove and return the front element */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Remove and return the rear element */
    fun popLast(): Int {
        return pop(false)
    }

    /* Peek at the front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Peek at the rear element */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* Return an array for printing */
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
    /* Initialize the deque */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("deque = ${deque.toArray().contentToString()}")

    /* Peek at the front and rear elements */
    val peekFirst = deque.peekFirst()
    println("Front element (peekFirst) = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element (peekLast) = $peekLast")

    /* Add elements to the deque */
    deque.pushLast(4)
    println("After adding 4 at the rear, deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("After adding 1 at the front, deque = ${deque.toArray().contentToString()}")

    /* Remove elements from both ends */
    val popLast = deque.popLast()
    println("Removed from the rear = ${popLast}, deque after removal = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Removed from the front = ${popFirst}, deque after removal = ${deque.toArray().contentToString()}")

    /* Get the deque size */
    val size = deque.size()
    println("Deque size = $size")

    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    println("Deque is empty = $isEmpty")
}