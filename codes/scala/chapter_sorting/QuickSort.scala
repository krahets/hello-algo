

/**
 * File: QuickSort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:59
 */

/* 快速排序类 */

class QuickSort {
  /* 元素交换 */
  def swap(arr: Array[Int], i: Int, j: Int): Unit = {
    val temp = arr(i)
    arr(i) = arr(j)
    arr(j) = temp
  }

  /* 哨兵划分 */
  def partition(nums: Array[Int], left: Int, right: Int): Int = {
    // 以 nums[left] 为基准数
    var i = left
    var j = right
    while (i < j) {
      while (i < j && nums(j) >= nums(left)) j -= 1 // 从右向左找首个小于基准数的元素
      while (i < j && nums(i) <= nums(left)) i += 1 // 从左向右找首个大于基准数的元素)
      swap(nums, i, j)
    }
    swap(nums, i, left) // 将基准数交换至两子数组的分界线
    i
  }

  /* 快速排序 */
  def quickSort(nums: Array[Int], left: Int, right: Int): Unit = {
    // 子数组长度为 1 时终止递归
    if (left >= right) return

    // 哨兵划分
    val pivot = partition(nums, left, right)
    // 递归左子数组、右子数组
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
  }
}

