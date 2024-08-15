

/**
 * File: t.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:59
 */


/* 快速排序类（中位基准数优化） */
class QuickSortMedian {
  /* 元素交换 */
  def swap(arr: Array[Int], i: Int, j: Int): Unit = {
    val temp = arr(i)
    arr(i) = arr(j)
    arr(j) = temp
  }

  /* 选取三个候选元素的中位数 */
  def medianThree(nums: Array[Int], left: Int, mid: Int, right: Int): Int = {
    val l = nums(left)
    val m = nums(mid)
    val r = nums(right)
    if((l <= m && m <= r) || (r <= m && m <= l)){
      return mid // m 在 l 和 r 之间
    }
    if((m <= l && l <= r) || (r <= l && l <= m)){
      return left // l 在 m 和 r 之间
    }
    right
  }

  /* 哨兵划分（三数取中值） */
  def partition(nums: Array[Int], left: Int, right: Int): Int = {
    // 选取三个候选元素的中位数
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 将中位数交换至数组最左端
    swap(nums, left, med)
    // 以 nums[left] 为基准数
    var i = left
    var j = right

    while (i < j) {
      while (i < j && nums(j) >= nums(left)) j -= 1 // 从右向左找首个小于基准数的元素
      while (i < j && nums(i) <= nums(left)) i += 1 // 从左向右找首个大于基准数的元素
      swap(nums, i, j)
    }
    swap(nums, i, left) // 将基准数交换至两子数组的分界线
    i // 返回基准数的索引
  }

  /* 快速排序 */
  def quickSort(nums: Array[Int], left: Int, right: Int): Unit = {
    // 子数组长度为 1 时终止递归
    if(left >= right) return

    // 哨兵划分
    val pivot = partition(nums, left, right)
    // 递归左子数组、右子数组
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
  }
}
