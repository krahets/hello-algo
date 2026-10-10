/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Find the largest k elements in array based on heap */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // Python's heapq module implements min heap by default
    val heap = PriorityQueue<Int>()
    // Enter the first k elements of array into heap
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // Starting from the (k+1)th element, maintain heap length as k
    for (i in k..<nums.size) {
        // If current element is greater than top element, top element exits heap, current element enters heap
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