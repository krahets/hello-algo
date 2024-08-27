import scala.collection.mutable

/**
 * File: recursion.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-09 11:10
 */


class recursion {
  /* 递归 */
  def recur(n: Int): Int = {
    // 终止条件
    if (n == 1){
      return 1
    }
    // 递：递归调用
    var res: Int = recur(n - 1)
    // 归：返回结果
    res + n
  }

  /* 使用迭代模拟递归 */
  def forLoopRecur(n: Int): Int = {
    // 使用一个显式的栈来模拟系统调用栈
    var stack : mutable.Stack[Integer] = new mutable.Stack
    var res: Int = 0
    // 递：递归调用
    for(n <- n to 1 by -1){
      // 通过“入栈操作”模拟“递”
      stack.push(n)
    }
    // 归：返回结果
    while (stack.nonEmpty){
      // 通过“出栈操作”模拟“归”
      res += stack.pop
    }
    // res = 1+2+3+...+n
    res
  }


  /* 尾递归 */
  def tailRecur(n: Int, res: Int): Int = {
    // 终止条件
    if (n == 0){
      return res
    }
    // 尾递归调用
    tailRecur(n - 1, res + n)
  }

  /* 斐波那契数列：递归 */
  def fib(n: Int): Int = {

    // 终止条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2){
      return n - 1
    }

    // 递归调用 f(n) = f(n-1) + f(n-2)
    val res: Int = fib(n - 1) + fib(n - 2)

    // 返回结果 f(n)
    res
  }

}


/* Driver Code */
object  recursion{
  def main(args: Array[String]): Unit = {
    val recur = new recursion
    val n: Int = 5
    var res: Int = 0

    res = recur.recur(n)
    println("\n递归函数的求和结果 res = " + res)

    res = recur.forLoopRecur(n)
    println("\n使用迭代模拟递归求和结果 res = " + res)

    res = recur.tailRecur(n, 0)
    println("\n尾递归函数的求和结果 res = " + res)

    res = recur.fib(n)
    println("\n斐波那契数列的第 " + n + " 项为 " + res)


  }
}


