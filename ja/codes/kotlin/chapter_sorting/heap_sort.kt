/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // ノード i, l, r のうち値が最大のノードを ma とする
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if (ma == i) 
            break
        // 2 つのノードを交換
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // ループで上から下へヒープ化
        i = ma
    }
}

/* ヒープソート */
fun heapSort(nums: IntArray) {
    // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // ヒープから最大要素を取り出し、n-1 回繰り返す
    for (i in nums.size - 1 downTo 1) {
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // 根ノードを起点に、上から下へヒープ化
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("ヒープソート完了後 nums = ${nums.contentToString()}")
}