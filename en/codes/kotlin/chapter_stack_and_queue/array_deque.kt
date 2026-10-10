/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Double-ended queue based on circular array implementation */
/* Constructor */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Array for storing double-ended queue elements
    private var front: Int = 0 // Front pointer, points to the front of the queue element
    private var queSize: Int = 0 // Double-ended queue length

    /* Get the capacity of the double-ended queue */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the length of the double-ended queue */
    fun size(): Int {
        return queSize
    }

    /* Check if the double-ended queue is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Calculate circular array index */
    private fun index(i: Int): Int {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + capacity()) % capacity()
    }

    /* Front of the queue enqueue */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Double-ended queue is full")
            return
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        front = index(front - 1)
        // Add num to front of queue
        nums[front] = num
        queSize++
    }

    /* Rear of the queue enqueue */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Double-ended queue is full")
            return
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        val rear = index(front + queSize)
        // Front pointer moves one position backward
        nums[rear] = num
        queSize++
    }

    /* Rear of the queue dequeue */
    fun popFirst(): Int {
        val num = peekFirst()
        // Move front pointer backward by one position
        front = index(front + 1)
        queSize--
        return num
    }

    /* Access rear of the queue element */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Return list for printing */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Driver Code */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Initialize double-ended queue
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Return array for printing */
    fun toArray(): IntArray {
        // Elements enqueue
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[index(j)]
            i++
            j++
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* Get the length of the double-ended queue */
    val deque = ArrayDeque(10)
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