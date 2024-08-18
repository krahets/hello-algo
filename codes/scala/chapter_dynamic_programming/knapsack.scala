
/**
 * File: knapsack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:02
 */


object knapsack {

  /* 0-1 背包：暴力搜索 */
  def knapsackDFS(wgt: Array[Int], value: Array[Int], i: Int, c: Int): Int = {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 || c == 0) return 0
    // 若超过背包容量，则只能选择不放入背包
    if (wgt(i - 1) > c) return knapsackDFS(wgt, value, i - 1, c)
    // 计算不放入和放入物品 i 的最大价值
    val no = knapsackDFS(wgt, value, i - 1, c)
    val yes = knapsackDFS(wgt, value, i - 1, c - wgt(i - 1)) + value(i - 1)
    // 返回两种方案中价值更大的那一个
    Math.max(no, yes)
  }

  /* 0-1 背包：记忆化搜索 */
  def knapsackDFSMem(wgt: Array[Int], value: Array[Int], mem: Array[Array[Int]], i: Int, c: Int): Int = {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 || c == 0) return 0
    // 若已有记录，则直接返回
    if (mem(i)(c) != -1) return mem(i)(c)
    // 若超过背包容量，则只能选择不放入背包
    if (wgt(i - 1) > c) return knapsackDFSMem(wgt, value, mem, i - 1, c)
    // 计算不放入和放入物品 i 的最大价值
    val no = knapsackDFSMem(wgt, value, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, value, mem, i - 1, c - wgt(i - 1)) + value(i - 1)
    // 记录并返回两种方案中价值更大的那一个
    mem(i)(c) = Math.max(no, yes)
    mem(i)(c)
  }

  /* 0-1 背包：动态规划 */
  def knapsackDP(wgt: Array[Int], value: Array[Int], cap: Int): Int = {
    val n = wgt.length
    // 初始化 dp 表// 初始化 dp 表
    val dp = Array.fill(n + 1)(Array.fill(cap + 1)(0))
    // 状态转移// 状态转移
    for (i <- 1 to n) {
      for (c <- 1 to cap) {
        if (wgt(i - 1) > c) {
          // 若超过背包容量，则不选物品 i
          dp(i)(c) = dp(i - 1)(c)
        }
        else {
          // 不选和选物品 i 这两种方案的较大值
          dp(i)(c) = Math.max(dp(i - 1)(c), dp(i - 1)(c - wgt(i - 1)) + value(i - 1))
        }
      }
    }
    dp(n)(cap)
  }

  /* 0-1 背包：空间优化后的动态规划 */
  def knapsackDPComp(wgt: Array[Int], value: Array[Int], cap: Int): Int = {
    val n = wgt.length
    // 初始化 dp 表// 初始化 dp 表
    val dp = new Array[Int](cap + 1)
    // 状态转移// 状态转移
    for (i <- 1 to n) {
      // 倒序遍历
      for (c <- cap to 1 by -1) {
        if (wgt(i - 1) <= c) {
          // 不选和选物品 i 这两种方案的较大值
          dp(c) = Math.max(dp(c), dp(c - wgt(i - 1)) + value(i - 1))
        }
      }
    }
    dp(cap)
  }

  def main(args: Array[String]): Unit = {
    val wgt = Array(10, 20, 30, 40, 50)
    val value = Array(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.length

    // 暴力搜索
    var res = knapsackDFS(wgt, value, n, cap)
    println("不超过背包容量的最大物品价值为 " + res)

    // 记忆化搜索
    val mem = Array.fill(n + 1, cap + 1)(-1)
    res = knapsackDFSMem(wgt, value, mem, n, cap)
    println("不超过背包容量的最大物品价值为 " + res)

    // 动态规划
    res = knapsackDP(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 " + res)

    // 空间优化后的动态规划
    res = knapsackDPComp(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 " + res)
  }

}
