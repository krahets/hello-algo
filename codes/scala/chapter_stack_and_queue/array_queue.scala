
/**
 * File: array_queue.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 15:42
 */

/* 基于环形数组实现的队列 */
class array_queue {
  private var nums: Array[Int] = null // 用于存储队列元素的数组

  private var front: Int = _ // 队首指针，指向队首元素

  private var queSize: Int = _ // 队列长度

  def this(capacity: Int) = {
    this()
    nums = new Array[Int](capacity)
    front = 0
    queSize = 0
  }


  /* 获取队列的容量 */
  def capacity(): Int = nums.length

  /* 获取队列的长度 */
  def size(): Int = queSize

  /* 判断队列是否为空 */
  def isEmpty(): Boolean = queSize == 0

  /* 入队 */
  def push(num: Int): Unit = {
    if (queSize == capacity()) {
      throw new Exception("队列已满")
      return
    }

    // 计算队尾指针，指向队尾索引 + 1
    // 通过取余操作实现 rear 越过数组尾部后回到头部
    val rear: Int = (front + queSize) % capacity()
    // 将 num 添加至队尾
    nums(rear) = num
    queSize += 1
  }

  /* 访问队首元素 */
  def peek(): Int = {
    if (isEmpty()) {
      throw new IndexOutOfBoundsException();
    }
    nums(front)
  }


  /* 出队 */
  def pop(): Int = {
    var num: Int = peek()
    // 队首指针向后移动一位，若越过尾部，则返回到数组头部
    front = (front + 1) % capacity()
    queSize -= 1
    num
  }

  /* 返回数组 */
  def toArray(): Array[Int] = {
    // 仅转换有效长度范围内的列表元素
    val arr: Array[Int] = new Array[Int](size())
    for (i <- 0 until queSize; j = front + i) {
      arr(i) = nums(j % capacity())
    }
    arr
  }
}

object array_queue {
  def main(args: Array[String]): Unit = {
    /* 初始化队列 */
    val queue = new array_queue(10)
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

    /* 测试环形数组 */
    for (i <- 0 until 10) {
      queue.push(i)
      queue.pop()
      println("第 " + i + " 轮入队 + 出队后 queue = " + queue.toArray().mkString(" "))
    }

  }
}






























