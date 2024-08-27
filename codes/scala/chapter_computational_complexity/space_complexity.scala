
import scala.collection.mutable

/**
 * File: space_complexity.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-09 15:31
 */


class space_complexity {
  /* 函数 */
  def function(): Int = {
    // 执行某些操作
    0
  }

  def constant(n: Int): Unit = {
    // 常量、变量、对象占用 O(1) 空间
    val a: Int = 0
    var b: Int = 0
    val nums: Array[Int] = new Array[Int](10000)
    val node: ListNode = new ListNode(0)
    // 循环中的变量占用 O(1) 空间
    for (i <- 1 until n) {
      var c: Int = 0
    }
    // 循环中的函数占用 O(1) 空间
    for (i <- 1 until n) {
      function()
    }

  }

  /* 线性阶 */
  def linear(n: Int): Unit = {
    // 长度为 n 的数组占用 O(n) 空间
    val nums: Array[Int] = new Array[Int](n)
    // 长度为 n 的列表占用 O(n) 空间
    var nodes: List[ListNode] = List()
    for (i <- 1 until n) {
      nodes = nodes :+ new ListNode(i)
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    var map: mutable.HashMap[Int, String] = new mutable.HashMap()
    for (i <- 1 until n) {
      map.put(i, i.toString)
    }
  }

  /* 线性阶（递归实现） */
  def linearRecur(n: Int): Unit = {
    println("递归 n = " + n)
    if (n == 1) {
      return
    }
    linearRecur(n - 1)

  }

  /* 平方阶 */
  def quadratic(n: Int): Unit = {
    // 矩阵占用 O(n^2) 空间
    var numMatrix: Array[Array[Int]] = Array.ofDim[Int](n, n)
    // 二维列表占用 O(n^2) 空间
    var numList: List[List[Int]] = List.fill(n)(List.fill(n)(0))
    for (i <- 0 until n) {
      var tmp: List[Int] = List[Int]()
      for (j <- 0 until n) {
        tmp = tmp :+ 0
      }

      numList = numList :+ tmp
    }
  }

  /* 平方阶（递归实现） */
  def quadraticRecur(n: Int): Int = {
    if (n <= 0) {
      return 0
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    var nums: Array[Int] = new Array[Int](n)
    println("递归 n = " + n + " 中的 nums 长度 = " + nums.length)
    quadraticRecur(n - 1)
  }


  /* 指数阶（建立满二叉树） */
  def buildTree(n: Int): TreeNode = {
    if (n == 0) {
      return null
    }
    val root = new TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    root
  }

}


/* Driver Code */
object space_complexity {
  def main(args: Array[String]): Unit = {
    val n: Int = 5
    val spaceComplexity = new space_complexity()
    // 常数阶
    spaceComplexity.constant(n)
    // 线性阶// 线性阶
    spaceComplexity.linear(n)
    spaceComplexity.linearRecur(n)
    // 平方阶// 平方阶
    spaceComplexity.quadratic(n)
    spaceComplexity.quadraticRecur(n)

    // 指数阶// 指数阶
    val root = spaceComplexity.buildTree(n)
    val printUtil = new PrintUtil()
    printUtil.printTree(root)

  }
}
