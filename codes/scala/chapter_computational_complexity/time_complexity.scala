
/**
 * File: time_complexity.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-09 11:41
 */


class time_complexity {
  // 时间复杂度
  // 在某平台下
  def algorithm(n: Int) = {
    var a: Int = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns

    // 循环 n 次
    for (i <- 1 until n) { // 1 ns
      println(0) // 5 ns
    }
  }

  // 统计时间增长趋势
  // 算法 A 的时间复杂度：常数阶
  def algorithm_A(n: Int) = {
    println(0) // 1 ns
  }

  // 算法 B 的时间复杂度：线性阶
  def algorithm_B(n: Int) = {
    for (i <- 1 until n) { // 1 ns
      println(0) // 5 ns
    }
  }

  // 算法 C 的时间复杂度：常数阶

  def algorithm_C(n: Int) = {
    for (i <- 0 until 1000000) {
      println(0)
    }
  }


  // 函数渐近上界
  def algorithm1(n: Int) = {
    var a: Int = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1

    // 循环 n 次
    for (i <- 1 until n) { // +1 (每轮都执行 i++)
      println(0) // +1
    }
  }

  // 推算方法
  def algorithm2(n: Int) = {
    var a: Int = 1 // +0 (技巧 1)
    a = a + n // +0 (技巧 1)
    // +n (技巧 2)
    for (i <- 0 until (5 * n + 1)) {
      println(0)
    }

    // +n*n(技巧 3)
    for (i <- 0 until (2 * n)) {
      for (j <- 0 until (n + 1)) {
        println(0)
      }
    }
  }

  /* 常数阶 */
  def constant(n: Int): Int = {
    var count: Int = 0
    var size: Int = 100000

    for (i <- 0 until size) {
      count += 1
    }
    count
  }

  /* 线性阶 */
  def linear(n: Int): Int = {
    var count: Int = 0
    for (i <- 0 until n) {
      count += 1
    }
    count
  }

  /* 线性阶（遍历数组） */
  def arrayTraversal(nums: Array[Int]): Int = {
    var count: Int = 0
    // 循环次数与数组长度成正比
    for (i <- 0 until nums.length) {
      count += 1
    }
    count
  }

  /* 平方阶 */
  def quadratic(n: Int): Int = {
    var count: Int = 0
    // 循环次数与数据大小 n 成平方关系
    for (i <- 0 until n) {
      for (j <- 0 until n) {
        count += 1
      }
    }
    count
  }


  /* 平方阶（冒泡排序） */
  def bubbleSort(nums: Array[Int]): Int = {
    var count: Int = 0 // 计数器

    // 外循环：未排序区间为 [0, i]
    for (i <- nums.length - 1 until 0 by -1) {
      // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
      for (j <- 0 until i) {
        if (nums(j) > nums(j + 1)) {
          // 交换 nums[j] 与 nums[j + 1]
          val temp = nums(j)
          nums(j) = nums(j + 1)
          nums(j + 1) = temp
          count += 3 // 元素交换包含 3 个单元操作

        }
      }
    }
    count
  }

  /* 指数阶（循环实现） */
  def exponential(n: Int): Int = {
    var count = 0
    var base = 1
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for (i <- 0 until n) {
      for (j <- 0 until base) {
        count += 1
      }
      base *= 2

    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
  }

  /* 指数阶（递归实现） */
  def expRecur(n: Int): Int = {
    if (n == 1) {
      return 1
    }
    expRecur(n - 1) + expRecur(n - 1) + 1
  }

  /* 对数阶（循环实现） */
  def logarithmic(initialN: Int): Int = {
    var n = initialN
    var count = 0
    while (n > 1) {
      n = n / 2
      count += 1
    }
    count
  }

  /* 对数阶（递归实现） */
  def logRecur(n: Int): Int = {
    if (n <= 1) {
      return 0
    }
    logRecur(n / 2) + 1
  }

  /* 线性对数阶 */

  def linearLogRecur(n: Int): Int = {
    if (n <= 1) {
      return 1
    }
    var count: Int = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (i <- 0 until n) {
      count += 1
    }
    count
  }

  /* 阶乘阶（递归实现） */
  def factorialRecur(n: Int): Int = {
    if (n == 0) {
      return 1
    }
    var count: Int = 0
    // 从 1 个分裂出 n 个

    for (i <- 0 until n) {
      count += factorialRecur(n - 1)
    }
    count
  }
}

object time_complexity {
  def main(args: Array[String]): Unit = {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    var n: Int = 8
    System.out.println("输入数据大小 n = " + n)

    val timeComplexity = new time_complexity()

    var count = timeComplexity.constant(n)
    println("常数阶的操作数量 = " + count)

    count = timeComplexity.linear(n)
    println("线性阶的操作数量 = " + count)
    count = timeComplexity.arrayTraversal(new Array[Int](n))
    println("线性阶（遍历数组）的操作数量 = " + count)

    count = timeComplexity.quadratic(n)
    println("平方阶的操作数量 = " + count)

    val nums = new Array[Int](n)
    for (i <- 0 until n) {
      nums(i) = n - i; // [n,n-1,...,2,1]
    }
    count = timeComplexity.bubbleSort(nums)
    println("平方阶（冒泡排序）的操作数量 = " + count)

    count = timeComplexity.exponential(n)
    println("指数阶（循环实现）的操作数量 = " + count)
    count = timeComplexity.expRecur(n)
    println("指数阶（递归实现）的操作数量 = " + count)

    count = timeComplexity.logarithmic(n)
    println("对数阶（循环实现）的操作数量 = " + count)
    count = timeComplexity.logRecur(n)
    println("对数阶（递归实现）的操作数量 = " + count)

    count = timeComplexity.linearLogRecur(n)
    println("线性对数阶（递归实现）的操作数量 = " + count)

    count = timeComplexity.factorialRecur(n)
    println("阶乘阶（递归实现）的操作数量 = " + count)
  }


}
