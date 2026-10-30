/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue implemented with a circular array */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Array that stores the queue elements
    private var front: Int = 0 // Front pointer, pointing to the first element
    private var queSize: Int = 0 // Queue size

    /* Get the queue capacity */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the queue size */
    fun size(): Int {
        return queSize
    }

    /* Check whether the queue is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Queue is full")
            return
        }
        // Calculate the rear pointer, which points one position past the last element
        // Use modulo to wrap rear to the beginning when it passes the end of the array
        val rear = (front + queSize) % capacity()
        // Add num to the rear
        nums[rear] = num
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Advance the front pointer by one position, wrapping to the beginning if it passes the end
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Access the front element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Return an array */
    fun toArray(): IntArray {
        // Copy only the elements within the occupied range
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[j % capacity()]
            i++
            j++
        }
        return res
    }
}

/* Driver code */
fun main() {
    /* Initialize the queue */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("Dequeued element: pop = ${pop}; queue after removal = ${queue.toArray().contentToString()}")

    /* Get the queue size */
    val size = queue.size()
    println("Queue size = $size")

    /* Check whether the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty? $isEmpty")

    /* Test the circular array */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("After enqueue and dequeue round $i: queue = ${queue.toArray().contentToString()}")
    }
}