/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Deque implemented with a circular array */
/* Constructor */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Array that stores the deque elements
    private var front: Int = 0 // Front pointer, pointing to the first element
    private var queSize: Int = 0 // Deque size

    /* Get the deque capacity */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the deque size */
    fun size(): Int {
        return queSize
    }

    /* Check whether the deque is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Calculate an index in the circular array */
    private fun index(i: Int): Int {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        return (i + capacity()) % capacity()
    }

    /* Enqueue at the front */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Deque is full")
            return
        }
        // Move the front pointer one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        front = index(front - 1)
        // Add num to the front
        nums[front] = num
        queSize++
    }

    /* Enqueue at the rear */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Deque is full")
            return
        }
        // Calculate the rear pointer, which points one position past the last element
        val rear = index(front + queSize)
        // Add num to the rear
        nums[rear] = num
        queSize++
    }

    /* Dequeue from the front */
    fun popFirst(): Int {
        val num = peekFirst()
        // Advance the front pointer by one position
        front = index(front + 1)
        queSize--
        return num
    }

    /* Dequeue from the rear */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Access the front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Access the rear element */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Calculate the index of the last element
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Return an array for printing */
    fun toArray(): IntArray {
        // Copy only the elements within the occupied range
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

/* Driver code */
fun main() {
    /* Initialize the deque */
    val deque = ArrayDeque(10)
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