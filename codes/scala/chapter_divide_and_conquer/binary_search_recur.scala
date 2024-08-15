

/**
 * File: binary_search_recur.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 16:37
 */

class binary_search_recur {
  /* 二分查找：问题 f(i, j) */
  def dfs(nums: Array[Int], target: Int, i: Int, j: Int): Int = {
    // 若区间为空，代表无目标元素，则返回 -1
    if (i > j) return -1
    // 计算中点索引 m
    val m = (i + j) / 2
    if (nums(m) < target) {
      // 递归子问题 f(m+1, j)
      dfs(nums, target, m + 1, j)
    }
    else if (nums(m) > target) {
      // 递归子问题 f(i, m-1)
      dfs(nums, target, i, m - 1)
    }
    else {
      // 找到目标元素，返回其索引
      m
    }
  }

  /* 二分查找 */
  def binarySearch(nums: Array[Int], target: Int): Int = {
    val n = nums.length
    // 求解问题 f(0, n-1)
    dfs(nums, target, 0, n - 1)
  }
}

object binary_search_recur {
  def main(args: Array[String]): Unit = {
    val target = 6
    val nums = Array(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // 二分查找（双闭区间）// 二分查找（双闭区间）
    val index = new binary_search_recur().binarySearch(nums, target)
    println("目标元素 6 的索引 = " + index)
  }
}
