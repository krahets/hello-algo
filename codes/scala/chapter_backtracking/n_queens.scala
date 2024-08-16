import scala.collection.mutable.ListBuffer

/**
 * File: n_queens.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 15:28
 */

object n_queens {
  /* 回溯算法：n 皇后 */
  def backtrack(row: Int, n: Int, state: Array[Array[String]], res: ListBuffer[List[List[String]]],
                cols: Array[Boolean], diags1: Array[Boolean], diags2: Array[Boolean]): Unit = {
    // 当放置完所有行时，记录解
    if (row == n) {
      // 创建 copyState，复制 state
      val copyState = state.map(_.toList).toList
      res += copyState
      return
    }
    // 遍历所有列
    for (col <- 0 until n) {
      // 计算该格子对应的主对角线和次对角线
      val diag1 = row - col + n - 1
      val diag2 = row + col
      // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
      if (!cols(col) && !diags1(diag1) && !diags2(diag2)) {
        // 尝试：将皇后放置在该格子
        state(row)(col) = "Q"
        cols(col) = true
        diags1(diag1) = true
        diags2(diag2) = true
        // 放置下一行
        backtrack(row + 1, n, state, res, cols, diags1, diags2)
        // 回退：将该格子恢复为空位
        state(row)(col) = "#"
        cols(col) = false
        diags1(diag1) = false
        diags2(diag2) = false
      }
    }
  }


  def nQueens(n: Int): List[List[List[String]]] = {
    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    val state = Array.fill(n, n)("#")
    val cols = Array.fill(n)(false) // 记录列是否有皇后
    val diags1 = Array.fill(2 * n - 1)(false) // 记录主对角线上是否有皇后
    val diags2 = Array.fill(2 * n - 1)(false) // 记录次对角线上是否有皇后
    var res = ListBuffer[List[List[String]]]()

    backtrack(0, n, state, res, cols, diags1, diags2)
    res.toList
  }

  def main(args: Array[String]): Unit = {
    val n = 4
    val res = nQueens(n)

    println(s"输入棋盘长宽为 $n")
    println(s"皇后放置方案共有 ${res.size} 种")
    for (state <- res) {
      println("--------------------")
      for (row <- state) {
        println(row.mkString(" "))
      }
    }
  }

}
