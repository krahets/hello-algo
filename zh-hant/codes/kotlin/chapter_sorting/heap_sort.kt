/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 堆積的長度為 n，從節點 i 開始由上而下調整堆積 */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // 找出節點 i、l、r 中值最大的節點，記為 ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
        if (ma == i) 
            break
        // 交換兩個節點
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // 以迴圈繼續向下調整堆積
        i = ma
    }
}

/* 堆積排序 */
fun heapSort(nums: IntArray) {
    // 建立堆積：對所有非葉節點執行堆積調整
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // 從堆積中取出最大元素，重複 n-1 輪
    for (i in nums.size - 1 downTo 1) {
        // 交換根節點與最右側的葉節點（即交換首尾元素）
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // 從根節點開始，由上而下調整堆積
        siftDown(nums, i, 0)
    }
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("堆積排序完成後 nums = ${nums.contentToString()}")
}