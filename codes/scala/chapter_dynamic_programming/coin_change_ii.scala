
/**
 * File: coin_change_ii.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:23
 */


object coin_change_ii {
  /* 零钱兑换 II：动态规划 */
  def coinChangeIIDP(coins: Array[Int], amt: Int): Int = {
    val n = coins.length
    // 初始化 dp 表
    val dp = Array.ofDim[Int](n + 1, amt + 1)
    // 初始化首列
    for (i <- 0 to n) {
      dp(i)(0) = 1
    }
    // 状态转移
    for (i <- 1 to n) {
      for (a <- 1 to amt) {
        if (coins(i - 1) > a) {
          // 若超过目标金额，则不选硬币 i
          dp(i)(a) = dp(i - 1)(a)
        }
        else {
          // 不选和选硬币 i 这两种方案之和
          dp(i)(a) = dp(i - 1)(a) + dp(i)(a - coins(i - 1))
        }
      }
    }
    dp(n)(amt)
  }

  /* 零钱兑换 II：空间优化后的动态规划 */
  def coinChangeIIDPComp(coins: Array[Int], amt: Int): Int = {
    val n = coins.length
    // 初始化 dp 表// 初始化 dp 表
    val dp = new Array[Int](amt + 1)
    dp(0) = 1
    // 状态转移// 状态转移
    for (i <- 1 to n) {
      for (a <- 1 to amt) {
        if (coins(i - 1) > a) {
          // 若超过目标金额，则不选硬币 i
          dp(a) = dp(a)
        }
        else {
          // 不选和选硬币 i 这两种方案之和
          dp(a) = dp(a) + dp(a - coins(i - 1))
        }
      }
    }
    dp(amt)

  }

  def main(args: Array[String]): Unit = {
    val coins = Array(1, 2, 5)
    val amt = 5

    // 动态规划// 动态规划
    var res = coinChangeIIDP(coins, amt)
    println("凑出目标金额的硬币组合数量为 " + res)

    // 空间优化后的动态规划// 空间优化后的动态规划
    res = coinChangeIIDPComp(coins, amt)
    println("凑出目标金额的硬币组合数量为 " + res)
  }
}
