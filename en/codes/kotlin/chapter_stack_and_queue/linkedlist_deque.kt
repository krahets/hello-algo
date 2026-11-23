/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Doubly linked list node */
class ListNode(var _val: Int) {
    // The node value is stored in _val
    var next: ListNode? = null // Reference to the next node
    var prev: ListNode? = null // Reference to the previous node
}

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
    private var front: ListNode? = null // Head node front
    private var rear: ListNode? = null // Tail node rear
    private var queSize: Int = 0 // Deque size

    /* Get the deque size */
    fun size(): Int {
        return queSize
    }

    /* Check whether the deque is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Enqueue operation */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // If the linked list is empty, make both front and rear point to node
        if (isEmpty()) {
            rear = node
            front = rear
            // Enqueue at the front
        } else if (isFront) {
            // Add node to the head of the linked list
            front?.prev = node
            node.next = front
            front = node // Update the head node
            // Enqueue at the rear
        } else {
            // Add node to the tail of the linked list
            rear?.next = node
            node.prev = rear
            rear = node // Update the tail node
        }
        queSize++ // Update the queue size
    }

    /* Enqueue at the front */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Enqueue at the rear */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Dequeue operation */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // When the queue size is 1, the head and tail point to the same node
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // Dequeue from the front
        else if (isFront) {
            _val = front!!._val // Save the head node value
            // Remove the head node
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // Update the head node
            // Dequeue from the rear
        } else {
            _val = rear!!._val // Save the tail node value
            // Remove the tail node
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // Update the tail node
        }
        queSize-- // Update the queue size
        return _val
    }

    /* Dequeue from the front */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Dequeue from the rear */
    fun popLast(): Int {
        return pop(false)
    }

    /* Access the front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Access the rear element */
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
    println("Deque deque = ${deque.toArray().contentToString()}")

    /* Access an element */
    val peekFirst = deque.peekFirst()
    println("Front element: peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element: peekLast = $peekLast")

    /* Enqueue elements */
    deque.pushLast(4)
    println("After enqueuing 4 at the rear: deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("After enqueuing 1 at the front: deque = ${deque.toArray().contentToString()}")

    /* Dequeue an element */
    val popLast = deque.popLast()
    println("Element dequeued from the rear = ${popLast}; deque after removal = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Element dequeued from the front = ${popFirst}; deque after removal = ${deque.toArray().contentToString()}")

    /* Get the deque size */
    val size = deque.size()
    println("Deque size = $size")

    /* Check whether the deque is empty */
    val isEmpty = deque.isEmpty()
    println("Is the deque empty? $isEmpty")
}