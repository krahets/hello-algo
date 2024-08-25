

/**
 * File: binary_search_insertion.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 09:57
 */

class binary_search_insertion {
  /* 二分查找插入点（无重复元素） */
  def binarySearchInsertionSimple(nums: Array[Int], target: Int): Int = {
    var i: Int = 0
    var j: Int = nums.length - 1 // 初始化双闭区间 [0, n-1]

    while (i <= j) {
      val m: Int = (i + j) / 2 // 计算中点索引 m
      if (nums(m) < target) {
        i = m + 1 // target 在区间 [m+1, j] 中
      } else if (nums(m) > target) {
        j = m - 1 // target 在区间 [i, m-1] 中
      } else {
        return m // 找到 target ，返回插入点 m
      }
    }
    // 未找到 target ，返回插入点 i
    i
  }

  /* 二分查找插入点（存在重复元素） */
  def binarySearchInsertion(nums: Array[Int], target: Int): Int = {
    var i: Int = 0
    var j: Int = nums.length - 1 // 初始化双闭区间 [0, n-1]
    while (i <= j) {
      val m: Int = (i + j) / 2 // 计算中点索引 m
      if (nums(m) < target) {
        i = m + 1 // target 在区间 [m+1, j] 中
      } else if (nums(m) > target) {
        j = m - 1 // target 在区间 [i, m-1] 中
      } else {
        j = m - 1 // 首个小于 target 的元素在区间 [i, m-1] 中
      }
    }
    // 返回插入点 i
    i
  }
}

object binary_search_insertion {
  def main(args: Array[String]): Unit = {
    // 无重复元素的数组
    val binarySearchInsertion = new binary_search_insertion()
    val nums: Array[Int] = Array(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n数组 nums = " + nums.mkString(", "))

    // 二分查找插入点
    val insertNums = Array(6, 9)
    for(target <- insertNums) {
      val index: Int =binarySearchInsertion.binarySearchInsertionSimple(nums, target)
      println("元素 " + target + " 的插入点的索引为 " + index)
    }

    // 包含重复元素的数组
    val nums2: Array[Int] = Array(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n数组 nums = " + nums2.mkString(", "))
    // 二分查找插入点

    val insertNums2 = Array(2, 6, 20)
    for(target <- insertNums2) {
      val index: Int =binarySearchInsertion.binarySearchInsertion(nums2, target)
      println("元素 " + target + " 的插入点的索引为 " + index)
    }


  }
}

