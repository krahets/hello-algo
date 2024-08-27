
/**
 * File: iteration.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-09 10:50
 */


class iteration {
  /* for 循环 */
  def forLoop(n: Int): Int = {
    var res: Int = 0
    // 循环求和 1, 2, ..., n-1, n
    for (i <- 1 to n) {
      res += i
    }
    res
  }

  /* while 循环 */
  def whileLoop(n: Int): Int = {
    var res: Int = 0
    var i: Int = 1 // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
      res += i
      i += 1 // 更新条件变量
    }
    res
  }

  /* while 循环（两次更新） */
  def whileLoopII(n: Int): Int = {
    var res: Int = 0
    var i: Int = 1 // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while (i <= n) {
      res += i
      // 更新条件变量
      i += 1
      i *= 2
    }
    res
  }

  /* 双层 for 循环 */
  def nestedForLoop(n: Int): String = {
    var res: StringBuilder = new StringBuilder()
    // 循环 i = 1, 2, ..., n-1, n
    for (i <- 1 to n) {
      // 循环 j = 1, 2, ..., n-1, n
      for (j <- 1 to n) {
        res.append("(" + i + ", " + j + "), ")
      }
    }
    res.toString()

  }

}

/* Driver Code */
object iteration {
  def main(args: Array[String]): Unit = {
    var n: Int = 5
    var res: Int = 0

    val iter = new iteration()
    res = iter.forLoop(n)
    println("\nfor 循环的求和结果 res = " + res)

    res = iter.whileLoop(n)
    println("\nwhile 循环的求和结果 res = " + res)

    res = iter.whileLoopII(n)
    println("\nwhile 循环（两次更新）求和结果 res = " + res)

    val resStr = iter.nestedForLoop(n)
    println("\n双层 for 循环的遍历结果 " + resStr)
  }
}
