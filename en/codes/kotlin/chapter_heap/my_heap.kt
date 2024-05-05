/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Max-heap */
class MaxHeap(nums: MutableList<Int>?) {
    // Use list instead of array to avoid the need for resizing
    private val maxHeap = mutableListOf<Int>()

    /* Constructor, build heap based on input list */
    init {
        // Add all list elements into the heap
        maxHeap.addAll(nums!!)
        // Heapify all nodes except leaves
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* Get index of left child node */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Get index of right child node */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Get index of parent node */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // Integer division down
    }

    /* Swap elements */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* Get heap size */
    fun size(): Int {
        return maxHeap.size
    }

    /* Determine if heap is empty */
    fun isEmpty(): Boolean {
        /* Determine if heap is empty */
        return size() == 0
    }

    /* Access heap top element */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Push the element into heap */
    fun push(_val: Int) {
        // Add node
        maxHeap.add(_val)
        // Heapify from bottom to top
        siftUp(size() - 1)
    }

    /* Start heapifying node i, from bottom to top */
    private fun siftUp(it: Int) {
        // Kotlin's function parameters are immutable, therefore temporary variables are created
        var i = it
        while (true) {
            // Get parent node of node i
            val p = parent(i)
            // When "crossing the root node" or "node does not need repair", end heapification
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Swap two nodes
            swap(i, p)
            // Loop upwards heapification
            i = p
        }
    }

    /* Element exits heap */
    fun pop(): Int {
        // Empty handling
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        swap(0, size() - 1)
        // Remove node
        val _val = maxHeap.removeAt(size() - 1)
        // Heapify from top to bottom
        siftDown(0)
        // Return heap top element
        return _val
    }

    /* Start heapifying node i, from top to bottom */
    private fun siftDown(it: Int) {
        // Kotlin's function parameters are immutable, therefore temporary variables are created
        var i = it
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i) break
            // Swap two nodes
            swap(i, ma)
            // Loop downwards heapification
            i = ma
        }
    }

    /* Print heap (binary tree) */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* Initialize max-heap */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nEnter list and build heap")
    maxHeap.print()

    /* Access heap top element */
    var peek = maxHeap.peek()
    print("\nTop element of the heap $peek\n")

    /* Push the element into heap */
    val _val = 7
    maxHeap.push(_val)
    print("\nElement $_val pushed onto heap\n")
    maxHeap.print()

    /* Pop the element at the heap top */
    peek = maxHeap.pop()
    print("\nElement $peek popped from heap\n")
    maxHeap.print()

    /* Get heap size */
    val size = maxHeap.size()
    print("\nNumber of elements in the heap $size\n")

    /* Determine if heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs the heap empty $isEmpty\n")
}