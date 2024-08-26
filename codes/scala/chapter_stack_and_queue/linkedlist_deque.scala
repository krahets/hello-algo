
/**
 * File: linkedlist_deque.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 16:13
 */


/* 基于双向链表实现的双向队列 */
class linkedlist_deque {

  private var front: DListNode = _ // 头节点 front

  private var rear: DListNode = _ // 尾节点 rear

  private var queSize = 0 // 双向队列的长度

  /* 获取双向队列的长度 */
  def size(): Int = queSize

  /* 判断双向队列是否为空 */
  def isEmpty(): Boolean = queSize == 0

  /* 入队操作 */
  def push(num: Int, isFront: Boolean): Unit = {
    val newNode = new DListNode(num)
    // 若链表为空，则令 front 和 rear 都指向 node
    if (isEmpty()) {
      front = newNode
      rear = newNode
    } else if (isFront) {
      // 将 node 添加至链表头部
      front.prev = newNode
      newNode.next = front
      front = newNode // 更新头节点
      // 队尾入队操作
    } else {

      // 将 node 添加至链表尾部
      rear.next = newNode
      newNode.prev = rear
      rear = newNode // 更新尾节点
      // 队头入队操作
    }
    queSize += 1
  }

  /* 队首入队 */
  def pushFirst(num: Int): Unit = {
    push(num, true)
  }

  /* 队尾入队 */
  def pushLast(num: Int): Unit = {
    push(num, false)
  }

  /* 出队操作 */
  def pop(isFront: Boolean): Int = {
    if (isEmpty()) {
      throw new IndexOutOfBoundsException
    }
    var value: Int = 0
    // 队首出队操作
    if (isFront) {
      // 暂存头节点值
      value = front.value
      // 删除头节点
      val fNext: DListNode = front.next
      if (fNext != null) {
        fNext.prev = null
        front.next = null
      }
      front = fNext // 更新头节点

      // 队尾出队操作
    }else {
      // 暂存尾节点值
      value = rear.value
      // 删除尾节点
      val rPrev: DListNode = rear.prev
      if (rPrev != null) {
        rPrev.next = null
        rear.prev = null
      }
      rear = rPrev // 更新尾节点
    }
    queSize -= 1
     value
  }

  /* 队首出队 */
  def popFirst(): Int = {
    pop(true)
  }

  /* 队尾出队 */
  def popLast(): Int = {
    pop(false)
  }

  /* 获取队首元素 */
  def peekFirst(): Int = {
    if (isEmpty()) {
      throw new IndexOutOfBoundsException()
    }
    front.value
  }

  /* 获取队尾元素 */
  def peekLast(): Int = {
    if (isEmpty()) {
      throw new IndexOutOfBoundsException()
    }
    rear.value
  }

  /* 返回数组用于打印 */

  def toArray(): Array[Int] = {
    val arr = new Array[Int](size())
    var node: DListNode = front
    for(i <- 0 until size()) {
      arr(i) = node.value
      node = node.next
    }
    arr
  }
}

object linkedlist_deque {
  def main(args: Array[String]): Unit = {
    val deque = new linkedlist_deque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("双向队列 deque = " + deque.toArray().mkString(" "))

    /* 访问元素 */
    val peekFirst: Int = deque.peekFirst()
    println("队首元素 peekFirst = " + peekFirst)
    val peekLast: Int = deque.peekLast()
    println("队尾元素 peekLast = " + peekLast)

    /* 元素入队 *//* 元素入队 */
    deque.pushLast(4)
    println("元素 4 队尾入队后 deque = " + deque.toArray().mkString(" "))
    deque.pushFirst(1)
    println("元素 1 队首入队后 deque = " + deque.toArray().mkString(" "))

    /* 元素出队 *//* 元素出队 */
    val popLast: Int = deque.popLast()
    println("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + deque.toArray().mkString(" "))
    val popFirst: Int = deque.popFirst()
    println("队首出队元素 = " + popFirst + "，队首出队后 deque = " + deque.toArray().mkString(" "))

    /* 获取双向队列的长度 *//* 获取双向队列的长度 */
    val size: Int = deque.size()
    println("双向队列长度 size = " + size)

    /* 判断双向队列是否为空 *//* 判断双向队列是否为空 */
    val isEmpty: Boolean = deque.isEmpty()
    println("双向队列是否为空 = " + isEmpty)

  }

}





