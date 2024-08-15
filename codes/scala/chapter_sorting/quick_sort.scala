

/**
 * File: quick_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:38
 */

/* 快速排序的测试类 */
object quick_sort {
  def main(args: Array[String]): Unit = {
    /* 快速排序 */
    val nums: Array[Int] = Array(2, 4, 1, 0, 3, 5)
    new QuickSort().quickSort(nums, 0, nums.length - 1)
    println("快速排序完成后 nums = " + nums.mkString(", "))

    /* 快速排序（中位基准数优化） *//* 快速排序（中位基准数优化） */
    val nums1: Array[Int] = Array(2, 4, 1, 0, 3, 5)
    new QuickSortMedian().quickSort(nums1, 0, nums1.length - 1)
    println("快速排序（中位基准数优化）完成后 nums1 = " + nums1.mkString(", "))

    /* 快速排序（尾递归优化） *//* 快速排序（尾递归优化） */
    val nums2: Array[Int] = Array(2, 4, 1, 0, 3, 5)
    new QuickSortTailCall().quickSort(nums2, 0, nums2.length - 1)
    println("快速排序（尾递归优化）完成后 nums2 = " + nums2.mkString(", "))
  }
}