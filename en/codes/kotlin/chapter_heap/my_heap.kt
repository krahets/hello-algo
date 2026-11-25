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
    // Use a list instead of an array so it can grow as needed
    private val maxHeap = mutableListOf<Int>()

    /* Constructor: build a heap from the input list */
    init {
        // Copy the list elements into the heap in their original order
        maxHeap.addAll(nums!!)
        // Heapify all non-leaf nodes
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* Get the left child index */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* Get the right child index */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* Get the parent index */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // Floor division
    }

    /* Swap elements */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* Get the heap size */
    fun size(): Int {
        return maxHeap.size
    }

    /* Check whether the heap is empty */
    fun isEmpty(): Boolean {
        /* Check whether the heap is empty */
        return size() == 0
    }

    /* Peek at the root */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* Push an element onto the heap */
    fun push(_val: Int) {
        // Add a node
        maxHeap.add(_val)
        // Sift up
        siftUp(size() - 1)
    }

    /* Sift up from node i */
    private fun siftUp(it: Int) {
        // Kotlin function parameters are read-only, so create a temporary variable
        var i = it
        while (true) {
            // Get the parent of node i
            val p = parent(i)
            // Stop sifting at the root or when the node already satisfies the heap property
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // Swap the two nodes
            swap(i, p)
            // Continue sifting up
            i = p
        }
    }

    /* Pop an element from the heap */
    fun pop(): Int {
        // Handle an empty heap
        if (isEmpty()) throw IndexOutOfBoundsException()
        // Swap the root and the rightmost leaf (the first and last elements)
        swap(0, size() - 1)
        // Remove the node
        val _val = maxHeap.removeAt(size() - 1)
        // Sift down
        siftDown(0)
        // Return the root element
        return _val
    }

    /* Sift down from node i */
    private fun siftDown(it: Int) {
        // Kotlin function parameters are read-only, so create a temporary variable
        var i = it
        while (true) {
            // Store the index of the largest of nodes i, l, and r in ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // Stop if i is already largest or both child indices l and r are out of bounds
            if (ma == i) break
            // Swap the two nodes
            swap(i, ma)
            // Continue sifting down
            i = ma
        }
    }

    /* Print the heap as a binary tree */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver code */
fun main() {
    /* Initialize a max-heap */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nHeap built from the input list:")
    maxHeap.print()

    /* Get the root element */
    var peek = maxHeap.peek()
    print("\nRoot element: $peek\n")

    /* Push an element onto the heap */
    val _val = 7
    maxHeap.push(_val)
    print("\nHeap after pushing $_val:\n")
    maxHeap.print()

    /* Pop the root */
    peek = maxHeap.pop()
    print("\nHeap after popping the root ($peek):\n")
    maxHeap.print()

    /* Get the heap size */
    val size = maxHeap.size()
    print("\nNumber of elements in the heap: $size\n")

    /* Check whether the heap is empty */
    val isEmpty = maxHeap.isEmpty()
    print("\nIs the heap empty? $isEmpty\n")
}