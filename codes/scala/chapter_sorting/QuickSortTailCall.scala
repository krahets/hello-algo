

/**
 * File: QuickSortTailCall.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:00
 */

/* 快速排序类（尾递归优化） */
class QuickSortTailCall {
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
      swap(nums, i, j) // 交换这两个元素
    }
    swap(nums, i, left) // 将基准数交换至两子数组的分界线
    i // 返回基准数的索引
  }
  /* 快速排序（尾递归优化） */
  def quickSort(nums: Array[Int], left: Int, right: Int): Unit = {
    var tempLeft = left
    var tempRight = right


    // 子数组长度为 1 时终止递归
    while (tempLeft < tempRight) {
      // 哨兵划分操作
      val pivot = partition(nums, tempLeft, tempRight)
      // 对两个子数组中较短的那个执行快速排序
      if (pivot - tempLeft < tempRight - pivot) {
        quickSort(nums, tempLeft, pivot - 1) // 递归排序左子数组
        tempLeft = pivot + 1 // 剩余未排序区间为 [pivot + 1, tempRight]
      } else {
        quickSort(nums, pivot + 1, right) // 递归排序右子数组
        tempRight = pivot - 1 // 剩余未排序区间为 [tempLeft, pivot - 1]
      }
    }
  }
}

