/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 以堆積找出陣列中最大的 k 個元素 */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 初始化最小堆積
    val heap = PriorityQueue<Int>()
    // 將陣列的前 k 個元素加入堆積
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // 從第 k+1 個元素開始，讓堆積大小維持在 k
    for (i in k..<nums.size) {
        // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
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
    println("最大的 $k 個元素為")
    printHeap(res)
}