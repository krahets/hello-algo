

/**
 * File: radix_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:57
 */

class radix_sort {
  /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
  def digit(num: Int, exp: Int): Int = {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    (num / exp) % 10
  }

  /* 计数排序（根据 nums 第 k 位排序） */
  def countingSortDigit(nums: Array[Int], exp: Int): Unit = {
    // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    val counter = new Array[Int](10)
    val n = nums.length
    for (i <- 0 until n) {
      val d = digit(nums(i), exp) // 获取 nums[i] 第 k 位，记为 d
      counter(d) += 1 // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”// 求前缀和，将“出现个数”转换为“数组索引”
    for (i <- 1 until 10) {
      counter(i) += counter(i - 1)
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入 res
    val res = new Array[Int](n)
    for (i <- n - 1 to 0 by -1) {
      val d = digit(nums(i), exp)
      val j = counter(d) - 1 // 获取 d 在数组中的索引 j
      res(j) = nums(i) // 将当前元素填入索引 j
      counter(d) -= 1 // 将 d 的数量减 1
    }
    // 使用结果覆盖原数组 nums// 使用结果覆盖原数组 nums
    for (i <- 0 until n) {
      nums(i) = res(i)
    }
  }

  /* 基数排序 */
  def radixSort(nums: Array[Int]): Unit = {
    // 获取数组的最大元素，用于判断最大位数
    var m = Integer.MIN_VALUE
    for (num <- nums) {
      if (num > m) m = num
    }
    // 按照从低位到高位的顺序遍历// 按照从低位到高位的顺序遍历
    var exp = 1
    while (exp <= m) {
      // 对数组元素的第 k 位执行计数排序
      // k = 1 -> exp = 1
      // k = 2 -> exp = 10
      // 即 exp = 10^(k-1)
      countingSortDigit(nums, exp)
      exp *= 10
    }
  }

}

object radix_sort {
  def main(args: Array[String]): Unit = {
    // 基数排序
    val nums = Array(10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337, 63832996)
    new radix_sort().radixSort(nums)
    println("基数排序完成后 nums = " + nums.mkString(", "))
  }
}
