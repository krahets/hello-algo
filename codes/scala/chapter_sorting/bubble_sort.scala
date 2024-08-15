

/**
 * File: bubble_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 14:26
 */


object bubble_sort {
  /* 冒泡排序 */
  def bubbleSort(nums: Array[Int]): Unit = {
    // 外循环：未排序区间为 [0, i]
    for (i <- nums.length - 1 until 0 by -1) {
      // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
      for (j <- 0 until i) {
        if (nums(j) > nums(j + 1)) {
          // 交换 nums[j] 与 nums[j + 1]
          val tmp = nums(j)
          nums(j) = nums(j + 1)
          nums(j + 1) = tmp
        }
      }
    }
  }

  /* 冒泡排序（标志优化） */
  def bubbleSortWithFlag(nums: Array[Int]): Unit = {
    // 外循环：未排序区间为 [0, i]
    for (i <- nums.length - 1 until 0 by -1) {
      var flag = false // 初始化标志位
      // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
      for (j <- 0 until i) {
        if (nums(j) > nums(j + 1)) {
          // 交换 nums[j] 与 nums[j + 1]
          val tmp = nums(j)
          nums(j) = nums(j + 1)
          nums(j + 1) = tmp
          flag = true // 记录交换元素
        }
      }

      if (!flag) { // 此轮“冒泡”未交换任何元素，直接跳出
        return
      }
    }
  }

  def main(args: Array[String]): Unit = {
    val nums = Array(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("冒泡排序完成后 nums  = " + nums.mkString(", "))

    val nums1 = Array(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("冒泡排序完成后 nums1 = " + nums1.mkString(", "))
  }

}

