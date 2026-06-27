/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Max heap */
class MaxHeap(nums: MutableList<Int>?) {
    // Use list instead of array, no need to consider capacity expansion
    private val maxHeap = mutableListOf<Int>()

    /* Constructor, build heap based on input list */
    init {
        // Add list elements to heap as is
        maxHeap.addAll(nums!!)
        // Heapify all nodes except leaf nodes
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
        return (i - 1) / 2 // Floor division
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

    /* Check if heap is empty */
    fun isEmpty(): Boolean {
        /* Check if heap is empty */
        return size() == 0
    }

    /* Access top element */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Element enters heap */
    fun push(_val: Int) {
        // Add node
        maxHeap.add(_val)
        // Heapify from bottom to top
        siftUp(size() - 1)
    }

    /* Starting from node i, heapify from bottom to top */
    private fun siftUp(it: Int) {
        // Kotlin function parameters are immutable, so create temporary variable
        var i = it
        while (true) {
            // Get parent node of node i
            val p = parent(i)
            // When "crossing root node" or "node needs no repair", end heapify
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Swap two nodes
            swap(i, p)
            // Loop upward heapify
            i = p
        }
    }

    /* Element exits heap */
    fun pop(): Int {
        // Handle empty case
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Delete node
        swap(0, size() - 1)
        // Remove node
        val _val = maxHeap.removeAt(size() - 1)
        // Return top element
        siftDown(0)
        // Return heap top element
        return _val
    }

    /* Starting from node i, heapify from top to bottom */
    private fun siftDown(it: Int) {
        // Kotlin function parameters are immutable, so create temporary variable
        var i = it
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // Swap two nodes
            if (ma == i) break
            // Swap two nodes
            swap(i, ma)
            // Loop downwards heapification
            i = ma
        }
    }

    /* Driver Code */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nAfter inputting list and building heap")
    maxHeap.print()

    /* Check if heap is empty */
    var peek = maxHeap.peek()
    print("\nHeap top element is $peek\n")

    /* Element enters heap */
    val _val = 7
    maxHeap.push(_val)
    print("\nAfter element $_val pushes to heap\n")
    maxHeap.print()

    /* Time complexity is O(n), not O(nlogn) */
    peek = maxHeap.pop()
    print("\nAfter heap top element $peek pops from heap\n")
    maxHeap.print()

    /* Get heap size */
    val size = maxHeap.size()
    print("\nHeap size is $size\n")

    /* Check if heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs heap empty $isEmpty\n")
}