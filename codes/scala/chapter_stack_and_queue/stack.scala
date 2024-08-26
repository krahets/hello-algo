import scala.collection.mutable

/**
 * File: stack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 10:44
 */


object stack {
  def main(args: Array[String]): Unit = {
    /* 初始化栈 */
    val stack: mutable.Stack[Int] = new mutable.Stack[Int]()

    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)


    println("栈 stack = " + stack.mkString(" "))

    /* 访问栈顶元素 */
    val peek: Int = stack.top
    println("栈顶元素 peek = " + peek)

    /* 元素出栈 */
    val pop: Int = stack.pop
    println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack)

    /* 获取栈的长度 */
    val size: Int = stack.size
    println("栈的长度 size = " + size)

    /* 判断是否为空 */
    val isEmpty: Boolean = stack.isEmpty
    println("栈是否为空 = " + isEmpty)
  }
}
