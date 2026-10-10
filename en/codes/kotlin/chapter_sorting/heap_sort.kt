/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Heap length is n, start heapifying node i, from top to bottom */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // Swap two nodes
        if (ma == i) 
            break
        // Swap two nodes
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // Loop downwards heapification
        i = ma
    }
}

/* Heap sort */
fun heapSort(nums: IntArray) {
    // Build heap operation: heapify all nodes except leaves
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for (i in nums.size - 1 downTo 1) {
        // Delete node
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("After heap sort, nums = ${nums.contentToString()}")
}