/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // 判斷節點 i, l, r 中值最大的節點，記為 ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if (ma == i) 
            break
        // 交換兩節點
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // 迴圈向下堆積化
        i = ma
    }
}

/* 堆積排序 */
fun heapSort(nums: IntArray) {
    // 建堆積操作：堆積化除葉節點以外的其他所有節點
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // 從堆積中提取最大元素，迴圈 n-1 輪
    for (i in nums.size - 1 downTo 1) {
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // 以根節點為起點，從頂至底進行堆積化
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("堆積排序完成後 nums = ${nums.contentToString()}")
}