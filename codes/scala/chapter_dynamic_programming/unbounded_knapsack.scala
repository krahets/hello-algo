
/**
 * File: unbounded_knapsack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:12
 */


object unbounded_knapsack {

  /* 完全背包：动态规划 */
  def unboundedKnapsackDP(wgt: Array[Int], value: Array[Int], cap: Int): Int = {
    val n = wgt.length
    // 初始化 dp 表
    val dp = Array.fill(n + 1)(Array.fill(cap + 1)(0))
    // 状态转移
    for (i <- 1 to n) {
      for (c <- 1 to cap) {
        if (wgt(i - 1) > c) {
          // 若超过背包容量，则不选物品 i
          dp(i)(c) = dp(i - 1)(c)
        }
        else {
          // 不选和选物品 i 这两种方案的较大值
          dp(i)(c) = Math.max(dp(i - 1)(c), dp(i)(c - wgt(i - 1)) + value(i - 1))
        }
      }
    }
    return dp(n)(cap)
  }

  /* 完全背包：空间优化后的动态规划 */
  def unboundedKnapsackDPComp(wgt: Array[Int], value: Array[Int], cap: Int): Int = {
    val n = wgt.length
    // 初始化 dp 表
    val dp = new Array[Int](cap + 1)
    // 状态转移
    for (i <- 1 to n) {
      for (c <- 1 to cap) {
        if (wgt(i - 1) > c) {
          // 若超过背包容量，则不选物品 i
          dp(c) = dp(c)
        }
        else {
          // 不选和选物品 i 这两种方案的较大值
          dp(c) = Math.max(dp(c), dp(c - wgt(i - 1)) + value(i - 1))
        }
      }
    }
    dp(cap)
  }

  def main (args: Array[String]): Unit = {
    val wgt: Array[Int] = Array(1, 2, 3)
    val value: Array[Int] = Array(5, 11, 15)
    val cap: Int = 4

    // 动态规划
    var res = unboundedKnapsackDP(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 " + res)

    // 空间优化后的动态规划
    res = unboundedKnapsackDPComp(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 " + res)
  }

}
