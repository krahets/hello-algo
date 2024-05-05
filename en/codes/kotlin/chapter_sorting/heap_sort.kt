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
        // Determine the largest node among i, l, r, noted as ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
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
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
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
    println("Heap sort completed, nums = ${nums.contentToString()}")
}