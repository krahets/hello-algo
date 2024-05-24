/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 合并左子数组和右子数组 */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
    // 创建一个临时数组 tmp ，用于存放合并后的结果
    val tmp = IntArray(right - left + 1)
    // 初始化左子数组和右子数组的起始索引
    var i = left
    var j = mid + 1
    var k = 0
    // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // 将左子数组和右子数组的剩余元素复制到临时数组中
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* 归并排序 */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // 终止条件
    if (left >= right) return  // 当子数组长度为 1 时终止递归
    // 划分阶段
    val mid = left + (right - left) / 2 // 计算中点
    mergeSort(nums, left, mid) // 递归左子数组
    mergeSort(nums, mid + 1, right) // 递归右子数组
    // 合并阶段
    merge(nums, left, mid, right)
}

/* Driver Code */
fun main() {
    /* 归并排序 */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("归并排序完成后 nums = ${nums.contentToString()}")
}
