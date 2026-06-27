/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Element enters heap
    print("\nAfter element $_val pushes to heap\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Time complexity is O(n), not O(nlogn)
    print("\nAfter heap top element $_val pops from heap\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* Initialize heap */
    // Python's heapq module implements min heap by default
    var minHeap = PriorityQueue<Int>()

    // Initialize max heap (modify Comparator using lambda expression)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nThe following test cases are for max heap")

    /* Element enters heap */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Check if heap is empty */
    val peek = maxHeap.peek()
    print("\nHeap top element is $peek\n")

    /* Time complexity is O(n), not O(nlogn) */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Get heap size */
    val size = maxHeap.size
    print("\nHeap size is $size\n")

    /* Check if heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs heap empty $isEmpty\n")

    /* Input list and build heap */
    // Time complexity is O(n), not O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nAfter inputting list and building min heap")
    printHeap(minHeap)
}