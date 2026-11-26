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
    print("\nHeap after pushing $_val:\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Pop the root
    print("\nHeap after popping the root ($_val):\n")
    printHeap(heap)
}

/* Driver code */
fun main() {
    /* Initialize the heap */
    // Initialize a min-heap
    var minHeap = PriorityQueue<Int>()

    // Initialize a max-heap using a lambda expression to customize the Comparator
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nThe following example uses a max-heap")

    /* Push an element onto the heap */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Get the root element */
    val peek = maxHeap.peek()
    print("\nRoot element: $peek\n")

    /* Pop the root */
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

    /* Build a heap from the input list */
    // The time complexity is O(n), rather than O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nMin-heap built from the input list:")
    printHeap(minHeap)
}