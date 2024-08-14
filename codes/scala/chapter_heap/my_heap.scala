import scala.annotation.tailrec
import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, ListBuffer}

/**
 * File: my_heap.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 09:08
 */

/* 大顶堆 */
class my_heap(nums: List[Int]) {

  //使用可变数组实现堆
  val maxHeap: ArrayBuffer[Int] = ArrayBuffer(nums: _*)
  // 堆化除叶节点以外的其他所有节点
  for (i <- 0 until size()) {
    siftDown(i)
  }


  /* 获取左子节点的索引 */
  def left(i: Int): Int = {
    2 * i + 1
  }

  /* 获取右子节点的索引 */
  def right(i: Int): Int = {
    2 * i + 2
  }

  /* 获取父节点的索引 */
  def parent(i: Int): Int = {
    (i - 1) / 2
  }

  /* 交换元素 */
  def swap(i: Int, j: Int): Unit = {
    val temp = maxHeap(i)
    maxHeap(i) = maxHeap(j)
    maxHeap(j) = temp
  }

  /* 获取堆大小 */
  def size(): Int = {
    maxHeap.size
  }

  /* 判断堆是否为空 */
  def isEmpty(): Boolean = {
    size == 0
  }

  /* 访问堆顶元素 */
  def peek(): Int = {
    maxHeap(0)
  }

  /* 元素入堆 */
  def push(value: Int) = {
    maxHeap += value
    siftUp(size() - 1)
  }

  /* 从节点 i 开始，从底至顶堆化 */
  def siftUp(i: Int): Unit = {
    var index: Int = i
    while (index > 0) {
      // 获取节点 i 的父节点
      val p: Int = parent(index)
      // 当“越过根节点”或“节点无须修复”时，结束堆化
      if (p < 0 || maxHeap(p) >= maxHeap(index)) {
        return
      }
      // 交换两节点
      swap(index, p)
      // 循环向上堆化
      index = p
    }
  }

  /* 元素出堆 */
  def pop(): Int = {
    // 判空处理
    if (isEmpty()) throw new IndexOutOfBoundsException
    // 交换根节点与最右叶节点（交换首元素与尾元素）
    swap(0, size() - 1)
    // 删除节点
    val result: Int = maxHeap.remove(size() - 1)
    // 从顶至底堆化
    siftDown(0)
    // 返回堆顶元素
    result
  }

  /* 从节点 i 开始，从顶至底堆化 */
  def siftDown(i: Int): Unit = {
    var index: Int = i
    while (true) {
      // 判断节点 i, l, r 中值最大的节点，记为 ma
      val l: Int = left(index)
      val r: Int = right(index)
      var ma: Int = index
      if (l < size() && maxHeap(l) > maxHeap(ma)) {
        ma = l
      }
      if (r < size() && maxHeap(r) > maxHeap(ma)) {
        ma = r
      }
      // 若节点 temp 最大或索引 l, r 越界，则无须继续堆化，跳出
      if (ma == index) {
        return

      }
      // 交换两节点
      swap(index, ma)
      // 循环向下堆化// 循环向下堆化
      index = ma
    }
  }

  /* 打印堆（二叉树） */
  def print(): Unit = {
    val queue: mutable.PriorityQueue[Int] = new mutable.PriorityQueue[Int]()
    for (num <- maxHeap) {
      queue.enqueue(num)
    }
    new PrintUtil().printHeap(queue)
  }

}

object my_heap {
  def main(args: Array[String]): Unit = {
    /* 初始化大顶堆 */
    var nums: List[Int] = List(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2)
    val maxHeap: my_heap = new my_heap(nums)

    println("\n输入列表并建堆后")
    maxHeap.print()

    /* 获取堆顶元素 */
    val peek: Int = maxHeap.peek()
    println("\n堆顶元素：" + peek)

    /* 元素入堆 */
    val value: Int = 7
    maxHeap.push(value)

    println("\n元素 " + value + " 入堆后")
    maxHeap.print()


    /* 堆顶元素出堆 */
    val pop: Int = maxHeap.pop()
    println("\n堆顶元素 " + pop + " 出堆后")
    maxHeap.print()

    /* 获取堆大小 */
    val size: Int = maxHeap.size()
    println("\n堆元素数量为：" + size)

    /* 判断堆是否为空 */
    val isEmpty: Boolean = maxHeap.isEmpty()
    println("\n堆是否为空：" + isEmpty)

  }
}
