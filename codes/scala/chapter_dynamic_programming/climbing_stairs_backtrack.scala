import scala.collection.mutable.ListBuffer

/**
 * File: climbing_stairs_backtrack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 16:59
 */

object climbing_stairs_backtrack {
  /* 回溯算法 */
  def backtrack(choices: List[Int], state: Int, n: Int, res: ListBuffer[Int]): Unit = {
    // 当爬到第 n 阶时，方案数量加 1
    if (state == n) {
      res(0) += 1
      return
    }

    // 遍历所有选择
    for (choice <- choices) {
      // 剪枝：不允许越过第 n 阶
      if (state + choice <= n) {
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res)
        // 回退// 回退
      }
    }
  }

  def climbingStairsBacktrack(n: Int): Int = {
    val choices = List(1, 2)
    val res = ListBuffer(0)
    val state = 0 // 从第 0 阶开始爬

    backtrack(choices, state, n, res)
    res(0)
  }

  def main(args: Array[String]): Unit = {
    val n: Int = 9
    val res: Int = climbingStairsBacktrack(n)
    println(s"爬 $n 阶楼梯共有 ${res} 种方案")
  }

}
