
/**
 * File: edit_distance.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:28
 */


object edit_distance {
  /* 编辑距离：暴力搜索 */
  def editDistanceDFS(s: String, t: String, i: Int, j: Int): Int = {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 && j == 0) return 0
    // 若 s 为空，则返回 t 长度
    if (i == 0) return j
    // 若 t 为空，则返回 s 长度
    if (j == 0) return i
    // 若两字符相等，则直接跳过此两字符
    if (s.charAt(i - 1) == t.charAt(j - 1)) return editDistanceDFS(s, t, i - 1, j - 1)
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // 返回最少编辑步数
    Math.min(Math.min(insert, delete), replace) + 1
  }

  /* 编辑距离：记忆化搜索 */
  def editDistanceDFSMem(s: String, t: String, mem: Array[Array[Int]],i: Int, j: Int): Int = {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 && j == 0) return 0
    // 若 s 为空，则返回 t 长度
    if (i == 0) return j
    // 若 t 为空，则返回 s 长度
    if (j == 0) return i
    // 若已有记录，则直接返回之
    if (mem(i)(j) != -1) return mem(i)(j)
    // 若两字符相等，则直接跳过此两字符
    if (s.charAt(i - 1) == t.charAt(j - 1)) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 记录并返回最少编辑步数// 记录并返回最少编辑步数
    mem(i)(j) = Math.min(Math.min(insert, delete), replace) + 1
    mem(i)(j)
  }

  /* 编辑距离：动态规划 */
  def editDistanceDP(s: String, t: String): Int = {
    val n = s.length
    val m = t.length
    val dp = Array.ofDim[Int](n + 1, m + 1)
    // 状态转移：首行首列
    for (i <- 1 to n) {
      dp(i)(0) = i
    }
    for (j <- 1 to m) {
      dp(0)(j) = j
    }
    // 状态转移：其余行和列
    for (i <- 1 to n) {
      for (j <- 1 to m) {
        if (s.charAt(i - 1) == t.charAt(j - 1)) {
          // 若两字符相等，则直接跳过此两字符
          dp(i)(j) = dp(i - 1)(j - 1)
        }
        else {
          // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
          dp(i)(j) = Math.min(Math.min(dp(i)(j - 1), dp(i - 1)(j)), dp(i - 1)(j - 1)) + 1
        }
      }
    }
    dp(n)(m)
  }

  /* 编辑距离：空间优化后的动态规划 */
  def editDistanceDPComp(s: String, t: String): Int = {
    val n = s.length
    val m = t.length
    val dp = new Array[Int](m + 1)
    // 状态转移：首行
    for (j <- 1 to m) {
      dp(j) = j
    }
    // 状态转移：其余行
    for (i <- 1 to n) {
      // 状态转移：首列
      var leftup = dp(0) // 暂存 dp[i-1, j-1]

      dp(0) = i
      // 状态转移：其余列
      for (j <- 1 to m) {
        val temp = dp(j)
        if (s.charAt(i - 1) == t.charAt(j - 1)) {
          // 若两字符相等，则直接跳过此两字符
          dp(j) = leftup
        }
        else {
          // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
          dp(j) = Math.min(Math.min(dp(j - 1), dp(j)), leftup) + 1
        }
        leftup = temp // 更新为下一轮的 dp[i-1, j-1]

      }
    }
    dp(m)
  }

  def main(args: Array[String]): Unit = {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // 暴力搜索
    var res = editDistanceDFS(s, t, n, m)
    println("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步")

    // 记忆化搜索
    val mem = Array.fill(n + 1, m + 1)(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步")

    // 动态规划
    res = editDistanceDP(s, t)
    println("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步")

    // 空间优化后的动态规划
    res = editDistanceDPComp(s, t)
    println("将 " + s + " 更改为 " + t + " 最少需要编辑 " + res + " 步")

  }


}
