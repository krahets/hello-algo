/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 最小ヒープを初期化
    val heap = PriorityQueue<Int>()
    // 配列の先頭 k 個の要素をヒープに追加
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for (i in k..<nums.size) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
    println("最大の $k 個の要素は")
    printHeap(res)
}