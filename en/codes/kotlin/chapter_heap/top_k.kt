/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Using heap to find the largest k elements in an array */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // Initialize min-heap
    val heap = PriorityQueue<Int>()
    // Enter the first k elements of the array into the heap
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // From the k+1th element, keep the heap length as k
    for (i in k..<nums.size) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("The largest $k elements are")
    printHeap(res)
}