

/**
 * File: climbing_stairs_dfs_mem.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 17:17
 */

object climbing_stairs_dfs_mem {

  /* 记忆化搜索 */
  def dfs(i: Int, mem: Array[Int]): Int = {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 || i == 2) return i
    // 若存在记录 dp[i] ，则直接返回之
    if (mem(i) != -1) return mem(i)
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // 记录 dp[i]
    mem(i) = count
    count
  }

  /* 爬楼梯：记忆化搜索 */
  def climbingStairsDFSMem(n: Int): Int = {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    val mem = Array.fill(n + 1)(-1)
    dfs(n, mem)
  }

  def main(args: Array[String]): Unit = {
    val n: Int = 9
    val res: Int = climbingStairsDFSMem(n)
    println(s"爬 $n 阶楼梯共有 ${res} 种方案")
  }
}
