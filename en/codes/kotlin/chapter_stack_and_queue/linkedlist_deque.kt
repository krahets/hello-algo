/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Doubly linked list node */
class ListNode(var _val: Int) {
    // Node value
    var next: ListNode? = null // Successor node reference
    var prev: ListNode? = null // Predecessor node reference
}

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
    private var front: ListNode? = null // Head node front
    private var rear: ListNode? = null // Tail node rear
    private var queSize: Int = 0 // Length of the double-ended queue

    /* Get the length of the double-ended queue */
    fun size(): Int {
        return queSize
    }

    /* Check if the double-ended queue is empty */
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
            // Front of the queue enqueue operation
        } else if (isFront) {
            // Add node to the head of the linked list
            front?.prev = node
            node.next = front
            front = node // Update head node
            // Rear of the queue enqueue operation
        } else {
            // Add node to the tail of the linked list
            rear?.next = node
            node.prev = rear
            rear = node // Update tail node
        }
        queSize++ // Update queue length
    }

    /* Front of the queue enqueue */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Rear of the queue enqueue */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Dequeue operation */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // Temporarily store head node value
        if (isFront) {
            _val = front!!._val // Delete head node
            // Delete head node
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // Update head node
            // Temporarily store tail node value
        } else {
            _val = rear!!._val // Delete tail node
            // Update tail node
            val rPrev = rear!!.prev
            if (rPrev != null) {
                rPrev.next = null
                rear!!.prev = null
            }
            rear = rPrev // Update tail node
        }
        queSize-- // Update queue length
        return _val
    }

    /* Rear of the queue dequeue */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Access rear of the queue element */
    fun popLast(): Int {
        return pop(false)
    }

    /* Return list for printing */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Driver Code */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* Return array for printing */
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
    /* Get the length of the double-ended queue */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("Deque deque = ${deque.toArray().contentToString()}")

    /* Update element */
    val peekFirst = deque.peekFirst()
    println("Front element peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Rear element peekLast = $peekLast")

    /* Elements enqueue */
    deque.pushLast(4)
    println("After element 4 enqueues at rear, deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("After element 1 enqueues at front, deque = ${deque.toArray().contentToString()}")

    /* Element dequeue */
    val popLast = deque.popLast()
    println("Dequeue rear element = ${popLast}, after rear dequeue deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Dequeue front element = ${popFirst}, after front dequeue deque = ${deque.toArray().contentToString()}")

    /* Get the length of the double-ended queue */
    val size = deque.size()
    println("Deque length size = $size")

    /* Check if the double-ended queue is empty */
    val isEmpty = deque.isEmpty()
    println("Is deque empty = $isEmpty")
}