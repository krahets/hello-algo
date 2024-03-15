/**
 * File: QuickSortTailCall.kt
 * Created Time: 2024-1-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting.QuickSortTailCall

/* 元素交换 */
fun swap(nums: IntArray, i: Int, j: Int) {
    nums[i] = nums[j].also { nums[j] = nums[i] }
}

/* 哨兵划分 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // 以 nums[left] 为基准数
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 从右向左找首个小于基准数的元素
        while (i < j && nums[i] <= nums[left])
            i++           // 从左向右找首个大于基准数的元素
        swap(nums, i, j)  // 交换这两个元素
    }
    swap(nums, i, left)   // 将基准数交换至两子数组的分界线
    return i              // 返回基准数的索引
}

/* 快速排序（尾递归优化） */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 子数组长度为 1 时终止
    var l = left
    var r = right
    while (l < r) {
        // 哨兵划分操作
        val pivot = partition(nums, l, r)
        // 对两个子数组中较短的那个执行快速排序
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 递归排序左子数组
            l = pivot + 1 // 剩余未排序区间为 [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // 递归排序右子数组
            r = pivot - 1 // 剩余未排序区间为 [left, pivot - 1]
        }
    }
}