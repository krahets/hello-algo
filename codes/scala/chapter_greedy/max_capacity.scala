
/**
 * File: maxCapacity.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:48
 */


object max_capacity {

  /* 最大容量：贪心 */
  def maxCapacity(ht: Array[Int]) = {
    // 初始化 i, j，使其分列数组两端
    var i = 0
    var j = ht.length - 1
    // 初始最大容量为 0
    var res = 0
    // 循环贪心选择，直至两板相遇
    while (i < j) {
      // 更新最大容量
      val cap = Math.min(ht(i), ht(j)) * (j - i)
      res = Math.max(res, cap)
      // 向内移动短板
      if (ht(i) < ht(j)) i += 1
      else j -= 1
    }
    res
  }

  def main(args: Array[String]): Unit = {
    val ht = Array(3, 8, 5, 2, 7, 7, 3, 4)

    // 贪心算法// 贪心算法
    val res = maxCapacity(ht)
    println("最大容量为 " + res)

  }

}
