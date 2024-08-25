
/**
 * File: climbing_stairs_constraint_dp.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 10:42
 */


object climbing_stairs_constraint_dp {
  def climbingStairsConstraintDP(n: Int): Int = {
    if ((n == 1) || (n == 2)) return 1
     // 初始化 dp 表，用于存储子问题的解
    val dp = Array.ofDim[Int](n + 1, 3)

    // 初始状态：预设最小子问题的解
    dp(1)(1) = 1
    dp(1)(2) = 0
    dp(2)(1) = 0
    dp(2)(2) = 1
    // 状态转移：从较小子问题逐步求解较大子问题
    var i = 3
    while (i <= n) {
      dp(i)(1) = dp(i - 1)(2)
      dp(i)(2) = dp(i - 2)(1) + dp(i - 2)(2)

      i += 1
    }
    dp(n)(1) + dp(n)(2)
  }

  def main(args: Array[String]): Unit = {
    val n: Int = 9
    val result: Int = climbingStairsConstraintDP(n)
    println(s"爬 ${n} 阶楼梯共有 ${result} 种方案")
    }
}
