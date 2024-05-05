/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Double-linked list node */
class ListNode(var _val: Int) {
    // Node value
    var next: ListNode? = null // Reference to successor node
    var prev: ListNode? = null // Reference to predecessor node
}

/* Double-ended queue class based on double-linked list */
class LinkedListDeque {
    private var front: ListNode? = null // Head node front
    private var rear: ListNode? = null // Tail node rear
    private var queSize: Int = 0 // Length of the double-ended queue

    /* Get the length of the double-ended queue */
    fun size(): Int {
        return queSize
    }

    /* Determine if the double-ended queue is empty */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* Enqueue operation */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // If the list is empty, make front and rear both point to node
        if (isEmpty()) {
            rear = node
            front = rear
            // Front enqueue operation
        } else if (isFront) {
            // Add node to the head of the list
            front?.prev = node
            node.next = front
            front = node // Update head node
            // Rear enqueue operation
        } else {
            // Add node to the tail of the list
            rear?.next = node
            node.prev = rear
            rear = node // Update tail node
        }
        queSize++ // Update queue length
    }

    /* Front enqueue */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* Rear enqueue */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* Dequeue operation */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // Front dequeue operation
        if (isFront) {
            _val = front!!._val // Temporarily store the head node value
            // Remove head node
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // Update head node
            // Rear dequeue operation
        } else {
            _val = rear!!._val // Temporarily store the tail node value
            // Remove tail node
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

    /* Front dequeue */
    fun popFirst(): Int {
        return pop(true)
    }

    /* Rear dequeue */
    fun popLast(): Int {
        return pop(false)
    }

    /* Access front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* Access rear element */
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
    /* Initialize double-ended queue */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("Double-ended queue deque = ${deque.toArray().contentToString()}")

    /* Access element */
    val peekFirst = deque.peekFirst()
    println("Front element peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("Back element peekLast = $peekLast")

    /* Element enqueue */
    deque.pushLast(4)
    println("Element 4 enqueued at the back, deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("Element 1 enqueued at the front, deque = ${deque.toArray().contentToString()}")

    /* Element dequeue */
    val popLast = deque.popLast()
    println("Back dequeue element = ${popLast}, deque after back dequeue = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("Front dequeue element = ${popFirst}, deque after front dequeue = ${deque.toArray().contentToString()}")

    /* Get the length of the double-ended queue */
    val size = deque.size()
    println("Double-ended queue length size = $size")

    /* Determine if the double-ended queue is empty */
    val isEmpty = deque.isEmpty()
    println("Is the double-ended queue empty = $isEmpty")
}