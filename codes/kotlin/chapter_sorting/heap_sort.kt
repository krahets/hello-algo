/**
 * File: heap_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
fun siftDown(nums: IntArray, n: Int, li: Int) {
    var i = li
    while (true) {
        // 判断节点 i, l, r 中值最大的节点，记为 ma
        val l = 2 * i + 1
        val r = 2 * i + 2
        var ma = i
        if (l < n && nums[l] > nums[ma]) 
            ma = l
        if (r < n && nums[r] > nums[ma]) 
            ma = r
        // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if (ma == i) 
            break
        // 交换两节点
        val temp = nums[i]
        nums[i] = nums[ma]
        nums[ma] = temp
        // 循环向下堆化
        i = ma
    }
}

/* 堆排序 */
fun heapSort(nums: IntArray) {
    // 建堆操作：堆化除叶节点以外的其他所有节点
    for (i in nums.size / 2 - 1 downTo 0) {
        siftDown(nums, nums.size, i)
    }
    // 从堆中提取最大元素，循环 n-1 轮
    for (i in nums.size - 1 downTo 1) {
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        val temp = nums[0]
        nums[0] = nums[i]
        nums[i] = temp
        // 以根节点为起点，从顶至底进行堆化
        siftDown(nums, i, 0)
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    heapSort(nums)
    println("堆排序完成后 nums = ${nums.contentToString()}")
}