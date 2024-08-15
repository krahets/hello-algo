

/**
 * File: counting_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:45
 */

class counting_sort {
  /* 计数排序 */
  // 简单实现，无法用于排序对象
  def countingSortNaive(nums: Array[Int]): Unit = {
    // 1. 统计数组最大元素 m
    var m = 0
    for (num <- nums) {
      m = Math.max(m, num)
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    val counter = new Array[Int](m + 1)
    for (num <- nums) {
      counter(num) += 1
    }

    // 3. 遍历 counter ，将各元素填入原数组 nums
    var i = 0
    for (num <- 0 until m + 1) {
      var j = 0
      while (j < counter(num)) {
        nums(i) = num
        j += 1
        i += 1
      }
    }
  }

  /* 计数排序 */
  // 完整实现，可排序对象，并且是稳定排序
  def countingSort(nums: Array[Int]): Unit = {
    // 1. 统计数组最大元素 m
    var m = 0
    for (num <- nums) {
      m = Math.max(m, num)
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    val counter = new Array[Int](m + 1)
    for (num <- nums) {
      counter(num) += 1
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for (i <- 0 until m) {
      counter(i + 1) += counter(i)
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    val n: Int = nums.length
    val res: Array[Int] = new Array[Int](n)
    for (i <- n - 1 to 0 by -1) {
      val num: Int = nums(i)
      res(counter(num) - 1) = num // 将 num 放置到对应索引处
      counter(num) -= 1 // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    for (i <- 0 until n) {
      nums(i) = res(i)
    }
  }
}

object counting_sort {
  def main(args: Array[String]): Unit = {
    val nums = Array(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    new counting_sort().countingSortNaive(nums)
    println("计数排序（无法排序对象）完成后 nums = " + nums.mkString(", "))
    val nums1 = Array(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    new counting_sort().countingSort(nums1)
    println("计数排序完成后 nums1 = " + nums1.mkString(", "))
  }
}
