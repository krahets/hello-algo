import scala.collection.mutable.ArrayBuffer

/**
 * File: array_stack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 11:08
 */


/* 基于数组实现的栈 */
class array_stack(var stack: ArrayBuffer[Int]) {

  // 初始化列表（动态数组）
  def this() = {
    this(ArrayBuffer())

  }

  /* 获取栈的长度 */
  def size(): Int = stack.size

  /* 判断栈是否为空 */
  def isEmpty(): Boolean = stack.size == 0

  /* 入栈 */
  def push(num: Int): Unit = stack += num

  /* 出栈 */
  def pop(): Int = {
    if (isEmpty()) throw new RuntimeException("Stack is empty")
    stack.remove(stack.size - 1)
  }

  /* 访问栈顶元素 */
  def peek(): Int = {
    if (isEmpty()) throw new RuntimeException("Stack is empty")
    stack(stack.size - 1)
  }
  /* 将 List 转化为 Array 并返回 */
  def toArray: Array[Int] = stack.toArray
}

object array_stack {
  def main(args: Array[String]): Unit = {
    /* 初始化栈 */
    val stack = new array_stack()

    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("栈 stack = " + stack.toArray.mkString(" "))

    /* 访问栈顶元素 */
    val peek: Int = stack.peek()
    println("栈顶元素 peek = " + peek)

    /* 元素出栈 */
    val pop: Int = stack.pop()
    println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack.toArray.mkString(" "))


    /* 获取栈的长度 */
    val size = stack.size()
    println("栈的长度 size = " + size)

    /* 判断是否为空 */
    val isEmpty = stack.isEmpty()
    println("栈是否为空 = " + isEmpty)
  }
}























