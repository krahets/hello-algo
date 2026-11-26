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
        // Let ma be the index of the largest of nodes i, l, and r
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // Stop if i is the largest or both child indices l and r are out of bounds
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
    // Build the heap by sifting down from each non-leaf node
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Extract the maximum from the heap in each of n-1 rounds
    for (i in nums.size - 1 downTo 1) {
        // Swap the root and rightmost leaf (the first and last elements)
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // Sift down from the root
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("After heap sort, nums = ${nums.contentToString()}")
}