import scala.collection.mutable

/**
 * File: two_sum.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 10:26
 */

class two_sum {
  /* 方法一：暴力枚举 */
  def twoSumBruteForce(nums: Array[Int], target: Int): Array[Int] = {
    val size = nums.length
    // 两层循环，时间复杂度为 O(n^2)
    for (i <- 0 until size - 1) {
      for (j <- i + 1 until size) {
        if (nums(i) + nums(j) == target) {
          return Array(i, j)
        }
      }
    }
    Array(0, 0)
  }

  /* 方法二：辅助哈希表 */
  def twoSumHashTable(nums: Array[Int], target: Int): Array[Int] = {
    val size = nums.length
    // 辅助哈希表，空间复杂度为 O(n)
    val dic = new mutable.HashMap[Int, Int]()
    // 单层循环，时间复杂度为 O(n)
    for (i <- 0 until size) {
      val complement = target - nums(i)
      if (dic.contains(complement)) {
        return Array(dic(complement), i)
      }
      dic.put(nums(i), i)
    }
    Array(0, 0)
  }
}

object two_sum {
  def main(args: Array[String]): Unit = {
    val nums = Array(2, 7, 11, 15)
    val target = 13

    val twoSum = new two_sum()
    // 方法一
    var res: Array[Int] = twoSum.twoSumBruteForce(nums, target)
    println("方法一 res = [" + res.mkString(", ") + "]")
    // 方法二
    res = twoSum.twoSumHashTable(nums, target)
    println("方法二 res = [" + res.mkString(", ") + "]")
  }
}