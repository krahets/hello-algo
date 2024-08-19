
/**
 * File: min_path_sum.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 10:49
 */


object min_path_sum {
  /* 最小路径和：暴力搜索 */
  def minPathSumDFS(grid: Array[Array[Int]], i: Int, j: Int): Int = {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) return grid(0)(0)
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) return Integer.MAX_VALUE
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // 返回从左上角到 (i, j) 的最小路径代价
    Math.min(left, up) + grid(i)(j)
  }

  /* 最小路径和：记忆化搜索 */
  def minPathSumDFSMem(grid: Array[Array[Int]], mem: Array[Array[Int]], i: Int, j: Int): Int = {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) return grid(0)(0)
    // 若行列索引越界，则返回 +∞ 代价// 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) return Integer.MAX_VALUE
    // 若已有记录，则直接返回// 若已有记录，则直接返回
    if (mem(i)(j) != -1) return mem(i)(j)
    // 左边和上边单元格的最小路径代价// 左边和上边单元格的最小路径代价
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // 记录并返回左上角到 (i, j) 的最小路径代价// 记录并返回左上角到 (i, j) 的最小路径代价
    mem(i)(j) = Math.min(left, up) + grid(i)(j)
    mem(i)(j)
  }

  /* 最小路径和：动态规划 */
  def minPathSumDP(grid: Array[Array[Int]]): Int = {
    val n = grid.length
    val m = grid(0).length
    // 初始化 dp 表// 初始化 dp 表
    val dp = Array.ofDim[Int](n, m)
    dp(0)(0) = grid(0)(0)
    // 状态转移：首行// 状态转移：首行
    for (j <- 1 until m) {
      dp(0)(j) = dp(0)(j - 1) + grid(0)(j)
    }
    // 状态转移：首列// 状态转移：首列
    for (i <- 1 until n) {
      dp(i)(0) = dp(i - 1)(0) + grid(i)(0)
    }
    // 状态转移：其余行和列// 状态转移：其余行和列
    for (i <- 1 until n) {
      for (j <- 1 until m) {
        dp(i)(j) = Math.min(dp(i)(j - 1), dp(i - 1)(j)) + grid(i)(j)
      }
    }
    dp(n - 1)(m - 1)
  }

  /* 最小路径和：空间优化后的动态规划 */
  def minPathSumDPComp(grid: Array[Array[Int]]): Int = {
    val n = grid.length
    val m = grid(0).length
    // 初始化 dp 表// 初始化 dp 表
    val dp = new Array[Int](m)
    // 状态转移：首行// 状态转移：首行
    dp(0) = grid(0)(0)
    for (j <- 1 until m) {
      dp(j) = dp(j - 1) + grid(0)(j)
    }
    // 状态转移：其余行// 状态转移：其余行
    for (i <- 1 until n) {
      // 状态转移：首列
      dp(0) = dp(0) + grid(i)(0)
      // 状态转移：其余列
      for (j <- 1 until m) {
        dp(j) = Math.min(dp(j - 1), dp(j)) + grid(i)(j)
      }
    }
    dp(m - 1)
  }

  def main(args: Array[String]): Unit = {
    val grid = Array(
      Array(1, 3, 1, 5),
      Array(2, 2, 4, 2),
      Array(5, 3, 2, 1),
      Array(4, 3, 5, 2))
      val n = grid.length
      val m = grid(0).length

    // 暴力搜索
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("从左上角到右下角的最小路径和为 " + res)

    // 记忆化搜索
    val mem = Array.fill(n,m)(-1)

    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("从左上角到右下角的最小路径和为 " + res)

    // 动态规划
    res = minPathSumDP(grid)
    println("从左上角到右下角的最小路径和为 " + res)

    // 空间优化后的动态规划// 空间优化后的动态规划
    res = minPathSumDPComp(grid)
    println("从左上角到右下角的最小路径和为 " + res)
  }

}
