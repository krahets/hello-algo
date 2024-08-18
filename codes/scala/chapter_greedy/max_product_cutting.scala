
/**
 * File: max_product_cutting.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:50
 */


object max_product_cutting {
  /* 最大切分乘积：贪心 */
  def maxProductCutting(n: Int): Int = {
    // 当 n <= 3 时，必须切分出一个 1
    if (n <= 3) return 1 * (n - 1)
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    val a = n / 3
    val b = n % 3
    if (b == 1) {
      // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
      return Math.pow(3, a - 1).toInt * 2 * 2
    }
    if (b == 2) {
      // 当余数为 2 时，不做处理
      return Math.pow(3, a).toInt * 2
    }
    // 当余数为 0 时，不做处理
    Math.pow(3, a).toInt
  }

  def main(args: Array[String]): Unit = {
    val n = 58

    // 贪心算法
    val res = maxProductCutting(n)
    println("最大切分乘积为 " + res)

  }

}
