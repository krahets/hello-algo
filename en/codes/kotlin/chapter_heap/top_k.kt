/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Use a heap to find the k largest elements in an array */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // Initialize a min heap
    val heap = PriorityQueue<Int>()
    // Push the first k array elements onto the heap
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // Starting with element k+1, keep the heap size at k
    for (i in k..<nums.size) {
        // If the current element is larger than the heap top, pop the top element and push the current element
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* Driver code */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("The $k largest elements are:")
    printHeap(res)
}