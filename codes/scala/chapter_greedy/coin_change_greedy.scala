
/**
 * File: coin_change_greedy.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:41
 */


object coin_change_greedy {
  /* 零钱兑换：贪心 */
  def coinChangeGreedy(coins: Array[Int], amt: Int): Int = {
    var temp: Int = amt

    // 假设 coins 列表有序
    var i = coins.length - 1
    var count = 0
    // 循环进行贪心选择，直到无剩余金额
    while (temp > 0) {
      // 找到小于且最接近剩余金额的硬币
      while (i > 0 && coins(i) > temp) i -= 1
      // 选择 coins[i]
      temp -= coins(i)
      count += 1
    }
    // 若未找到可行方案，则返回 -1
    if (temp == 0) count else -1
  }

  def main(args: Array[String]): Unit = {
    // 贪心：能够保证找到全局最优解
    var coins = Array(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = " + coins.mkString(", ") + ", amt = " + amt)
    println("凑到 " + amt + " 所需的最少硬币数量为 " + res)

    // 贪心：无法保证找到全局最优解
    coins = Array[Int](1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = " + coins.mkString(", ") + ", amt = " + amt)
    println("凑到 " + amt + " 所需的最少硬币数量为 " + res)
    println("实际上需要的最少数量为 3 ，即 20 + 20 + 20")

    // 贪心：无法保证找到全局最优解
    coins = Array[Int](1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = " + coins.mkString(", ") + ", amt = " + amt)
    println("凑到 " + amt + " 所需的最少硬币数量为 " + res)
    println("实际上需要的最少数量为 2 ，即 49 + 49")

  }


}
