/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Deque backed by a circular array */
/* Constructor */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // Array that stores the deque elements
    private var front: Int = 0 // Index of the front element
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

    /* Compute the circular array index */
    private fun index(i: Int): Int {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + capacity()) % capacity()
    }

    /* Add an element at the front */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("Deque is full")
            return
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        front = index(front - 1)
        // Add num at the front
        nums[front] = num
        queSize++
    }

    /* Add an element at the rear */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("Deque is full")
            return
        }
        // Compute the index one slot past the rear element
        val rear = index(front + queSize)
        // Add num at the rear
        nums[rear] = num
        queSize++
    }

    /* Remove and return the front element */
    fun popFirst(): Int {
        val num = peekFirst()
        // Advance the front index by one
        front = index(front + 1)
        queSize--
        return num
    }

    /* Remove and return the rear element */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* Peek at the front element */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Peek at the rear element */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Compute the index of the rear element
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* Return an array for printing */
    fun toArray(): IntArray {
        // Copy only the elements currently in the deque
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