

/**
 * File: climbing_stairs_dfs.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 17:08
 */

object climbing_stairs_dfs {

  /* 搜索 */
  def dfs(i: Int): Int = {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    count
  }

  /* 爬楼梯：搜索 */
  def climbingStairsDFS(n: Int): Int = return dfs(n)

  def main(args: Array[String]): Unit = {
    val n: Int = 9
    val res: Int = climbingStairsDFS(n)
    println(s"爬 $n 阶楼梯共有 ${res} 种方案")
  }

}
