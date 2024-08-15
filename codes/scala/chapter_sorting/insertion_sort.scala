

/**
 * File: insertion_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:33
 */

object insertion_sort {
  /* 插入排序 */
  def insertionSort(nums: Array[Int]): Unit = {
    // 外循环：已排序区间为 [0, i-1]
    for (i <- 1 until nums.length) {
      var base = nums(i)
      var j = i - 1
      // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
      while (j >= 0 && nums(j) > base) {
        nums(j + 1) = nums(j) // 将 nums[j] 向右移动一位
        j -= 1
      }
      nums(j + 1) = base // 将 base 赋值到正确位置
    }
  }

  def main(args: Array[String]): Unit = {
    val nums = Array(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("插入排序完成后 nums = " + nums.mkString(" "))
  }
}
