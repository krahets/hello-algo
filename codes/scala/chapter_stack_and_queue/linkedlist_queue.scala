
/**
 * File: linkedlist_queue.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 15:25
 */


/* 基于链表实现的队列 */
class linkedlist_queue {
  private var front: ListNode = _    // 队首指针
  private var rear: ListNode = _     // 队尾指针
  private var queSize: Int = 0



  /* 获取队列的长度 */
  def size: Int = queSize

  /* 判断队列是否为空 */
  def isEmpty: Boolean = queSize == 0


  /* 入队 */
  def push(num: Int): Unit = {
    // 在尾节点后添加 num
    val newNode = new ListNode(num)
    // 如果队列为空，则令头、尾节点都指向该节点
    if (isEmpty) {
      front = newNode
      rear = newNode
    } else {
      // 如果队列不为空，则将该节点添加到尾节点后
      rear.next = newNode
      rear = newNode
    }
    queSize += 1
  }

  /*访问队首元素 */
  def peek(): Int = {
    if (isEmpty) {
      throw new NoSuchElementException("Queue is empty")
    } else {
      front.value
    }
  }


  /* 出队 */
  def pop(): Int = {
    var num = peek()
    // 删除头节点
    front = front.next
    queSize -= 1
    num
  }

  /* 将链表转化为 Array 并返回 */
  def toArray(): Array[Int] = {
    var arr = new Array[Int](size)
    var node = front
    for (i <- 0 until size) {
      arr(i) = node.value
      node = node.next
    }
    arr
  }
}

object linkedlist_queue {
  def main(args: Array[String]): Unit = {
    val queue: linkedlist_queue = new linkedlist_queue()
    /* 元素入队 */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    // 打印队列
    println("队列 queue = " + queue.toArray().mkString(" "))

    // 访问队首元素
    val peek: Int = queue.peek()
    println(s"队首元素 peek = $peek")

    // 元素出队
    val pop: Int = queue.pop()
    println("出队元素 pop = " + pop + ",出队后 queue = " + queue.toArray().mkString(" "))

    // 获取队列的长度
    val size: Int = queue.size
    println(s"队列长度 size = $size")

    // 判断队列是否为空
    val isEmpty: Boolean = queue.isEmpty
    println(s"队列是否为空 = $isEmpty")

  }
}