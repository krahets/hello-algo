/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Push an element onto the heap
    print("\nAfter pushing $_val onto the heap:\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Pop the top element from the heap
    print("\nAfter popping the top element $_val from the heap:\n")
    printHeap(heap)
}

/* Driver code */
fun main() {
    /* Initialize heaps */
    // Initialize a min heap
    var minHeap = PriorityQueue<Int>()

    // Initialize a max heap by supplying a lambda expression as the Comparator
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nThe following example uses a max heap")

    /* Push an element onto the heap */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Get the top element of the heap */
    val peek = maxHeap.peek()
    print("\nTop element of the heap: $peek\n")

    /* Pop the top element from the heap */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Get the heap size */
    val size = maxHeap.size
    print("\nNumber of elements in the heap: $size\n")

    /* Check whether the heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs the heap empty? $isEmpty\n")

    /* Build a heap from an input list */
    // The time complexity is O(n), not O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nAfter building a min heap from the input list:")
    printHeap(minHeap)
}