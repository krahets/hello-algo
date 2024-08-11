import java.util
import scala.collection.mutable

/**
 * File: dqueue.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 15:58
 */


object dque {
  def main(args: Array[String]): Unit = {

    /* 初始化双向队列 */
    //Scala 标准库中并没有直接提供 Deque 实现。不过，
    // 可以使用 java.util.ArrayDeque 来实现双向队列的功能。
    val deque: util.ArrayDeque[Int] = new util.ArrayDeque[Int]()
    deque.add(3)
    deque.add(2)
    deque.add(5)
    println("双向队列 deque = " + deque)

    /* 访问元素 */
    val peekFirst: Int = deque.peekFirst()
    println("队首元素 peekFirst = " + peekFirst)
    val peekLast: Int = deque.peekLast()
    println("队尾元素 peekLast = " + peekLast)

    /* 元素入队 */
    deque.addLast(4)
    println("元素 4 队尾入队后 deque = " + deque)
    deque.addFirst(1)
    println("元素 1 队首入队后 deque = " + deque)

    /* 元素出队 */
    val popLast = deque.pollLast
    println("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + deque)
    val popFirst: Int = deque.pollFirst
    println("队首出队元素 = " + popFirst + "，队首出队后 deque = " + deque)

    /* 获取双向队列的长度 *//* 获取双向队列的长度 */
    val size: Int = deque.size
    println("双向队列长度 size = " + size)

    /* 判断双向队列是否为空 *//* 判断双向队列是否为空 */
    val isEmpty: Boolean = deque.isEmpty
    println("双向队列是否为空 = " + isEmpty)


  }

}
