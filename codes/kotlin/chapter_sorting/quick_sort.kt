/**
 * File: quick_sort.kt
 * Created Time: 2024-1-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Driver Code */
fun main() {
    /* 快速排序 */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    chapter_sorting.QuickSort.quickSort(nums, 0, nums.size - 1)
    println("快速排序完成后 nums = ${nums.contentToString()}")

    /* 快速排序（中位基准数优化） */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    chapter_sorting.QuickSort.quickSort(nums1, 0, nums1.size - 1)
    println("快速排序（中位基准数优化）完成后 nums1 = ${nums1.contentToString()}")

    /* 快速排序（尾递归优化） */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    chapter_sorting.QuickSort.quickSort(nums2, 0, nums2.size - 1)
    println("快速排序（尾递归优化）完成后 nums2 = ${nums2.contentToString()}")
}