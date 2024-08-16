

/**
 * File: min_cost_climbing_stairs_dp.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 17:24
 */

object min_cost_climbing_stairs_dp {

  /* 爬楼梯最小代价：动态规划 */
  def minCostClimbingStairsDP(cost: Array[Int]): Int = {
    val n = cost.length - 1
    if (n == 1 || n == 2) return cost(n)
    // 初始化 dp 表，用于存储子问题的解
    val dp = new Array[Int](n + 1)
    // 初始状态：预设最小子问题的解
    dp(1) = cost(1)
    dp(2) = cost(2)
    // 状态转移：从较小子问题逐步求解较大子问题
    for (i <- 3 to n) {
      dp(i) = Math.min(dp(i - 1), dp(i - 2)) + cost(i)
    }
    dp(n)
  }

  /* 爬楼梯最小代价：空间优化后的动态规划 */
  def minCostClimbingStairsDPComp(cost: Array[Int]): Int = {
    val n = cost.length - 1
    if (n == 1 || n == 2) return cost(n)
    var a = cost(1)
    var b = cost(2)
    for (i <- 3 to n) {
      val tmp = b
      b = Math.min(a, tmp) + cost(i)
      a = tmp
    }
    b
  }
  def main(args: Array[String]): Unit = {
    val cost = Array(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println(s"输入楼梯的代价列表为 ${cost.mkString(", ")}")
    val resDP = minCostClimbingStairsDP(cost)
    println(s"爬完楼梯的最低代价为 $resDP")

    val resDPComp = minCostClimbingStairsDPComp(cost)
    println(s"爬完楼梯的最低代价为 $resDPComp")
  }

}
