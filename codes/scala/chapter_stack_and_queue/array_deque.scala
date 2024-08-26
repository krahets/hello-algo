
/**
 * File: array_deque.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 19:57
 */

/* 基于环形数组实现的双向队列 */
class array_deque {
  private var nums: Array[Int] = _ // 用于存储双向队列元素的数组
  private var front: Int = _ // 队首指针，指向队首元素
  private var queSize: Int = _ // 双向队列长度

  def this(capacity: Int) = {
    this()
    nums = new Array[Int](capacity) // 初始化数组大小
    front = 0
    queSize = 0
  }

  /* 获取双向队列的容量 */
  def capacity(): Int = nums.length

  /* 获取双向队列的长度 */
  def size(): Int = queSize

  /* 判断双向队列是否为空 */
  def isEmpty(): Boolean = queSize == 0

  /* 计算环形数组索引 */
  def index(i: Int): Int = {
    // 通过取余操作实现数组首尾相连
    // 当 i 越过数组尾部后，回到头部
    // 当 i 越过数组头部后，回到尾部
    (i + capacity()) % capacity()

  }

  /* 队首入队 */
  def pushFirst(num: Int): Unit = {
    if (queSize == capacity) {
      println("双向队列已满")
      return
    }
    // 队首指针向左移动一位
    // 通过取余操作实现 front 越过数组头部后回到尾部
    front = index(front - 1)
    // 将 num 添加至队首
    nums(front) = num
    queSize += 1
  }

  /* 队尾入队 */
  def pushLast(num: Int): Unit = {
    if (queSize == capacity) {
      println("双向队列已满")
      return
    }
    // 计算队尾指针，指向队尾索引 + 1
    val rear: Int = index(front + queSize)
    // 将 num 添加至队尾
    nums(rear) = num
    queSize += 1
  }

  /* 访问队首元素 */
  def peekFirst(): Int = {
    if (isEmpty) {
      println("双向队列为空")
      return -1
    }
    nums(front)
  }



  /* 队首出队 */
  def popFirst(): Int = {
    val num: Int = peekFirst()
    // 队首指针向后移动一位
    front = index(front + 1)
    queSize -= 1
    num
  }

  /* 队尾出队 */
  def popLast(): Int = {
    var num: Int = peekLast()
    queSize -= 1
    num
  }

  /* 访问队尾元素 */
  def peekLast(): Int = {
    if (isEmpty) {
      throw new IndexOutOfBoundsException("双向队列为空")
    }
    // 计算尾元素索引
    val last: Int = index(front + queSize - 1)
    nums(last)
  }

  /* 返回数组用于打印 */
  def toArray(): Array[Int] = {
    val arr: Array[Int] = new Array[Int](queSize)
    for (i <- 0 until queSize) {
      val j = front + i
      arr(i) = nums(index(j))
    }
    arr
  }
}

object array_deque {
  def main(args: Array[String]): Unit = {
    val deque = new array_deque(10)
    deque.pushFirst(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("双向队列 deque = " + deque.toArray().mkString(" "))

    /* 访问元素 */
    val peekFirst: Int = deque.peekFirst()
    println("队首元素 peekFirst = " + peekFirst)
    val peekLast: Int = deque.peekLast()
    println("队尾元素 peekLast = " + peekLast)

    /* 元素入队 */
    deque.pushLast(4)
    println("元素 4 队尾入队后 deque = " + deque.toArray().mkString(" "))
    deque.pushFirst(1)
    println("元素 1 队首入队后 deque = " + deque.toArray().mkString(" "))

    /* 元素出队 */
    val popLast: Int = deque.popLast()
    println("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + deque.toArray().mkString(" "))
    val popFirst: Int = deque.popFirst()
    println("队首出队元素 = " + popFirst + "，队首出队后 deque = " + deque.toArray().mkString(" "))

    /* 获取双向队列的长度 */
    val size: Int = deque.size()
    println("双向队列长度 size = " + size)

    /* 判断双向队列是否为空 */
    val isEmpty: Boolean = deque.isEmpty()
    println("双向队列是否为空 = " + isEmpty)

  }


}