import scala.util.Random

/**
 * File: worst_best_time_complexity.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-09 15:18
 */


object worst_best_time_complexity {

  // 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
  def randomNumbers(n: Int): Array[Int] = {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    val nums = (1 to n).toArray
    // 随机打乱数组元素
    Random.shuffle(nums.toList).toArray
  }


  // 查找数组 nums 中数字 1 所在索引
  def findOne(nums: Array[Int]): Int = {
    for (i <- 0 until nums.length) {
      // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
      // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)

      if (nums(i) == 1) {
        return i
      }
    }
    -1 // 不存在返回-1
  }

  // Driver Code
  def main(args: Array[String]): Unit = {
    for (i <- 1 to 10) {
      val n = 100
      val nums = randomNumbers(n)
      val index = findOne(nums)
      println(s"\n数组 [1, 2, ..., $n] 被打乱后 = ${nums.mkString(", ")}")
      println(s"数字 1 的索引为 $index")
    }
  }


}
