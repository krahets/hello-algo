/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* ヒープを使って配列の上位 k 個の要素を求める */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 最小ヒープを初期化する
    val heap = PriorityQueue<Int>()
    // 配列の先頭 k 個の要素をヒープに入れる
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // k+1 番目の要素からはヒープのサイズを k に保つ
    for (i in k..<nums.size) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("上位 $k 個の要素：")
    printHeap(res)
}