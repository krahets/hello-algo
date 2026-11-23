/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Sift down from node i in a heap of size n */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // Find the node with the largest value among i, l, and r, and store its index in ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // Stop if node i is largest or both child indices l and r are out of bounds
        if (ma == i) 
            break
        // Swap the two nodes
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // Continue sifting down
        i = ma
    }
}

/* Heap sort */
fun heapSort(nums: IntArray) {
    // Build the heap by sifting down from every non-leaf node
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Extract the largest element from the heap, repeating for n-1 rounds
    for (i in nums.size - 1 downTo 1) {
        // Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // Sift down starting at the root
        siftDown(nums, i, 0)
    }
}

/* Driver code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("After heap sort: nums = ${nums.contentToString()}")
}