

/**
 * File: selection_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:20
 */

object selection_sort {
  /* 选择排序 */
  def selectionSort(nums: Array[Int]): Unit = {
    val n = nums.length
    // 外循环：未排序区间为 [i, n-1]
    for (i <- 0 until n - 1) {
      // 内循环：找到未排序区间内的最小元素
      var k = i
      for(j <- i + 1 until n) {
        if (nums(j) < nums(k)) {
          k = j // 记录最小元素的索引
        }
      }
      // 将该最小元素与未排序区间的首个元素交换
      val temp = nums(i)
      nums(i) = nums(k)
      nums(k) = temp
    }
  }

  def main(args: Array[String]): Unit = {
    val nums = Array(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("选择排序完成后 nums = " + nums.mkString(", "))
  }
}
