/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Push the element into heap
    print("\nElement $_val pushed onto heap\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Pop the element at the heap top
    print("\nElement $_val popped from heap\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* Initialize the heap */
    // Initialize min-heap
    var minHeap = PriorityQueue<Int>()

    // Initialize the max-heap (using lambda expression to modify Comparator if necessary)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nThe following test case is for max-heap")

    /* Push the element into heap */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Access heap top element */
    val peek = maxHeap.peek()
    print("\nTop element of the heap $peek\n")

    /* Pop the element at the heap top */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Get heap size */
    val size = maxHeap.size
    print("\nNumber of elements in the heap $size\n")

    /* Determine if heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs the heap empty $isEmpty\n")

    /* Enter list and build heap */
    // Time complexity is O(n), not O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nEnter list and build min-heap")
    printHeap(minHeap)
}