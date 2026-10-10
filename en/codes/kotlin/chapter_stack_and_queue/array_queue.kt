/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* Queue based on circular array implementation */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // Array for storing queue elements
    private var front: Int = 0 // Front pointer, points to the front of the queue element
    private var queSize: Int = 0 // Queue length

    /* Get the capacity of the queue */
    fun capacity(): Int {
        return nums.size
    }

    /* Get the length of the queue */
    fun size(): Int {
        return queSize
    }

    /* Check if the queue is empty */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* Enqueue */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("Queue is full")
            return
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        val rear = (front + queSize) % capacity()
        // Front pointer moves one position backward
        nums[rear] = num
        queSize++
    }

    /* Dequeue */
    fun pop(): Int {
        val num = peek()
        // Move front pointer backward by one position, if it passes the tail, return to array head
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* Return list for printing */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* Return array */
    fun toArray(): IntArray {
        // Elements enqueue
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
    /* Access front of the queue element */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* Elements enqueue */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("Queue queue = ${queue.toArray().contentToString()}")

    /* Return list for printing */
    val peek = queue.peek()
    println("Front element peek = $peek")

    /* Element dequeue */
    val pop = queue.pop()
    println("Dequeue element pop = ${pop}, after dequeue queue =  ${queue.toArray().contentToString()}")

    /* Get the length of the queue */
    val size = queue.size()
    println("Queue length size = $size")

    /* Check if the queue is empty */
    val isEmpty = queue.isEmpty()
    println("Is queue empty = $isEmpty")

    /* Test circular array */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("After round $i enqueue + dequeue, queue = ${queue.toArray().contentToString()}")
    }
}