import scala.collection.mutable.ListBuffer

/**
 * File: hanota.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 16:51
 */

class hanota {

  /* 移动一个圆盘 */
  def move(src: ListBuffer[Int], tar: ListBuffer[Int]): Unit = {
    // 从 src 顶部拿出一个圆盘
    val pan = src.remove(src.size - 1)
    // 将圆盘放入 tar 顶部
    tar += pan
  }

  /* 求解汉诺塔问题 f(i) */
  def dfs(i: Int, src: ListBuffer[Int], buf: ListBuffer[Int], tar: ListBuffer[Int]): Unit = {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if (i == 1) {
      move(src, tar)
      return
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf)
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar)
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar)
  }

  /* 求解汉诺塔问题 */
  def solveHanota(A: ListBuffer[Int], B: ListBuffer[Int], C: ListBuffer[Int]): Unit = {
    val n = A.size
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C)
  }
}
object hanota {
  def main(args: Array[String]): Unit = {
    // 列表尾部是柱子顶部
    val A = ListBuffer(5, 4, 3, 2, 1)
    val B = new ListBuffer[Int]
    val C = new ListBuffer[Int]
    println("初始状态下：")
    println("A = " + A)
    println("B = " + B)
    println("C = " + C)

    new hanota().solveHanota(A, B, C)

    println("圆盘移动完成后：")
    println("A = " + A)
    println("B = " + B)
   println("C = " + C)
  }
}
