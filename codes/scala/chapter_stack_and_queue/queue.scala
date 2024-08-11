import scala.collection.mutable

/**
 * File: queue.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 11:50
 */


object queue {
  def main(args: Array[String]): Unit = {
    val queue: mutable.Queue[Int] = new mutable.Queue[Int]()

    /* 元素入队 */
    queue.enqueue(1)
    queue.enqueue(3)
    queue.enqueue(2)
    queue.enqueue(5)
    queue.enqueue(4)


    // 打印队列
    println(s"队列 queue = $queue")

    // 访问队首元素
    val peek: Int = queue.headOption.getOrElse(-1)
    println(s"队首元素 peek = $peek")

    // 元素出队
    val pop: Int = if (queue.nonEmpty) queue.dequeue() else -1
    println(s"出队元素 pop = $pop，出队后 queue = $queue")

    // 获取队列的长度
    val size: Int = queue.size
    println(s"队列长度 size = $size")

    // 判断队列是否为空
    val isEmpty: Boolean = queue.isEmpty
    println(s"队列是否为空 = $isEmpty")
  }

}
