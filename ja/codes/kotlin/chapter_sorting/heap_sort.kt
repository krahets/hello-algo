/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 長さ n のヒープを、ノード i から下向きにヒープ化する */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if (ma == i) 
            break
        // 2 つのノードを交換する
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // 下向きのヒープ化を繰り返す
        i = ma
    }
}

/* ヒープソート */
fun heapSort(nums: IntArray) {
    // ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for (i in nums.size - 1 downTo 1) {
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // 根ノードから下向きにヒープ化する
        siftDown(nums, i, 0)
    }
}

/* 実行用コード */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("ヒープソート完了後 nums = ${nums.contentToString()}")
}