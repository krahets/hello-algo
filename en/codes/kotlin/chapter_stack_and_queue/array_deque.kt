/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Double-ended queue class based on circular array */
/* Constructor */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Array used to store elements of the double-ended queue
    private var front: Int = 0 // Front pointer, pointing to the front element
    private var queSize: Int = 0 // Length of the double-ended queue

    /* Get the capacity of the double-ended queue */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the length of the double-ended queue */
    fun size(): Int {
        return queSize
    }

    /* Determine if the double-ended queue is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Calculate circular array index */
    private fun index(i: Int): Int {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return (i + capacity()) % capacity()
    }

    /* Front enqueue */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Double-ended queue is full")
            return
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        front = index(front - 1)
        // Add num to the front
        nums[front] = num
        queSize++
    }

    /* Rear enqueue */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Double-ended queue is full")
            return
        }
        // Calculate rear pointer, pointing to rear index + 1
        val rear = index(front + queSize)
        // Add num to the rear
        nums[rear] = num
        queSize++
    }

    /* Front dequeue */
    fun popFirst(): Int {
        val num = peekFirst()
        // Move front pointer one position backward
        front = index(front + 1)
        queSize--
        return num
    }

    /* Rear dequeue */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Access front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Access rear element */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Calculate rear element index
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Return array for printing */
    fun toArray(): IntArray {
        // Only convert elements within valid length range
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
    /* Initialize double-ended queue */
    val deque = ArrayDeque(10)
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