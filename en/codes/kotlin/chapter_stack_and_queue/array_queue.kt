/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue class based on circular array */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Array for storing queue elements
    private var front: Int = 0 // Front pointer, pointing to the front element
    private var queSize: Int = 0 // Queue length

    /* Get the capacity of the queue */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the length of the queue */
    fun size(): Int {
        return queSize
    }

    /* Determine if the queue is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Queue is full")
            return
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        val rear = (front + queSize) % capacity()
        // Add num to the rear
        nums[rear] = num
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Access front element */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Return array */
    fun toArray(): IntArray {
        // Only convert elements within valid length range
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

/* Driver Code */
fun main() {
    /* Initialize queue */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("Dequeue element pop = ${pop}, queue after dequeue =  ${queue.toArray().contentToString()}")

    /* Get the length of the queue */
    val size = queue.size()
    println("Queue length size = $size")

    /* Determine if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is the queue empty = $isEmpty")

    /* Test circular array */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("Queue after the $i-th round of enqueue + dequeue = ${queue.toArray().contentToString()}")
    }
}