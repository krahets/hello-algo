

/**
 * File: climbing_stairs_dp.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 17:22
 */

object climbing_stairs_dp {

  /* 爬楼梯：动态规划 */
  def climbingStairsDP(n: Int): Int = {
    if (n == 1 || n == 2) return n
    // 初始化 dp 表，用于存储子问题的解
    val dp = new Array[Int](n + 1)
    // 初始状态：预设最小子问题的解
    dp(1) = 1
    dp(2) = 2
    // 状态转移：从较小子问题逐步求解较大子问题
    for (i <- 3 to n) {
      dp(i) = dp(i - 1) + dp(i - 2)
    }
    dp(n)
  }

  /* 爬楼梯：空间优化后的动态规划 */
  def climbingStairsDPComp(n: Int): Int = {
    if (n == 1 || n == 2) return n
    var a = 1
    var b = 2
    for (i <- 3 to n) {
      val tmp = b
      b = a + b
      a = tmp
    }
    b
  }

  def main(args: Array[String]): Unit = {
    val n: Int = 9
    val res: Int = climbingStairsDPComp(n)
    println(s"爬 $n 阶楼梯共有 ${res} 种方案")
  }
}
