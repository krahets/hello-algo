
/**
 * File: coin_change.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:16
 */


object coin_change {
  /* 零钱兑换：动态规划 */
  def coinChangeDP(coins: Array[Int], amt: Int): Int = {
    val n = coins.length
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = Array.ofDim[Int](n + 1, amt + 1)

    // 状态转移：首行首列
    for (a <- 1 to amt) {
      dp(0)(a) = MAX
    }

    // 状态转移：其余行和列
    for (i <- 1 to n) {
      for (a <- 1 to amt) {
        if (coins(i - 1) > a) {
          // 若超过目标金额，则不选硬币 i
          dp(i)(a) = dp(i - 1)(a)
        }
        else {
          // 不选和选硬币 i 这两种方案的较小值
          dp(i)(a) = Math.min(dp(i - 1)(a), dp(i)(a - coins(i - 1)) + 1)
        }
      }
    }
    if (dp(n)(amt) != MAX) dp(n)(amt)else -1
  }

  /* 零钱兑换：空间优化后的动态规划 */
  def coinChangeDPComp(coins: Array[Int], amt: Int): Int = {
    val n = coins.length
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = Array.fill(amt + 1)(MAX)


    dp(0) = 0
    // 状态转移
    for (i <- 1 to n) {
      for (a <- 1 to amt) {
        if (coins(i - 1) > a) {
          // 若超过目标金额，则不选硬币 i
          dp(a) = dp(a)
        }
        else {
          // 不选和选硬币 i 这两种方案的较小值
          dp(a) = Math.min(dp(a), dp(a - coins(i - 1)) + 1)
        }
      }
    }
    if (dp(amt) != MAX) dp(amt)else -1
  }

  def main(args: Array[String]): Unit = {
    val coins = Array(1, 2, 5)
    val amt = 4
    // 动态规划
    var res = coinChangeDP(coins, amt)
    println("凑到目标金额所需的最少硬币数量为 " + res)

    // 空间优化后的动态规划
    res = coinChangeDPComp(coins, amt)
    println("凑到目标金额所需的最少硬币数量为 " + res)
  }


}
