/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 基于堆查找数组中最大的 k 个元素 */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 初始化小顶堆
    val heap = PriorityQueue<Int>()
    // 将数组的前 k 个元素入堆
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (i in k..<nums.size) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
    println("最大的 $k 个元素为")
    printHeap(res)
}