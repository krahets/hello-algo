

/**
 * File: linkedlist_stack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 10:52
 */


/* 基于链表实现的栈 */

class linkedlist_stack {
  private var stackPeek: ListNode = _ // 将头节点作为栈顶
  private var stkSize: Int = 0        // 栈的长度

  /* 获取栈的长度 */
  def size: Int = stkSize

  /* 判断栈是否为空 */
  def isEmpty: Boolean = stkSize == 0

  /* 入栈 */
  def push(num: Int): Unit = {
    val node: ListNode = new ListNode(num)
    node.next = stackPeek
    stackPeek = node
    stkSize += 1
  }

  /* 访问栈顶元素 */
  def peek(): Int = {
    if (isEmpty) throw new RuntimeException("Stack is empty")
    stackPeek.value
  }
  /* 出栈 */
  def pop(): Int = {
    val value: Int = peek()
    stackPeek = stackPeek.next
    stkSize -= 1
    value

  }

  /* 将 List 转化为 Array 并返回 */
  def toArray: Array[Int] = {
    var node: ListNode = stackPeek
    val result: Array[Int] = new Array[Int](stkSize)
    for(i <- 0 until stkSize) {
      result(i) = node.value
      node = node.next
    }
    result
  }
}

object linkedlist_stack {
  def main(args: Array[String]): Unit = {
    val stack: linkedlist_stack = new linkedlist_stack()
    /* 元素入栈 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("栈 stack = " + stack.toArray.mkString(" "))

    /* 访问栈顶元素 *//* 访问栈顶元素 */
    val peek: Int = stack.peek()
    println("栈顶元素 peek = " + peek)

    /* 元素出栈 *//* 元素出栈 */
    val pop: Int = stack.pop()
    println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack.toArray.mkString(" "))

    /* 获取栈的长度 *//* 获取栈的长度 */
    val size: Int = stack.size
    println("栈的长度 size = " + size)

    /* 判断是否为空 *//* 判断是否为空 */
    val isEmpty = stack.isEmpty
    println("栈是否为空 = " + isEmpty)

  }
}