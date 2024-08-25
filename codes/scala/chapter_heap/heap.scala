import scala.collection.mutable

/**
 * File: heap.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-13 21:14
 */


class heap {
  def testPush(heap: mutable.PriorityQueue[Int], value: Int): Unit = {
    heap.enqueue(value) // 元素入堆
    printf(s"\n元素 %d 入堆后\n", value)
    new PrintUtil().printHeap(heap)
  }

  def testPop(heap: mutable.PriorityQueue[Int]): Unit = {
    val value: Int = heap.dequeue() // 堆顶元素出堆
//    println("\n堆顶元素 %d 出堆后\n", value)
    println(f"\n堆顶元素 $value 出堆后")
    new PrintUtil().printHeap(heap)
  }
}
object heap{
  def main(args: Array[String]): Unit = {
    /* 初始化堆 */
    // 初始化最大堆
    val maxHeap: mutable.PriorityQueue[Int] = new mutable.PriorityQueue[Int]()(Ordering[Int])
     //初始化小顶堆
    val minHeap: mutable.PriorityQueue[Int] = new mutable.PriorityQueue[Int]()(Ordering[Int].reverse)

    println("\n以下测试样例为大顶堆")
    val heap: heap = new heap()
    /* 元素入堆 */
    heap.testPush(maxHeap, 1)
    heap.testPush(maxHeap, 3)
    heap.testPush(maxHeap, 2)
    heap.testPush(maxHeap, 5)
    heap.testPush(maxHeap, 4)

    /* 获取堆顶元素 */
    val peek: Int = maxHeap.head
    println(f"堆顶元素为: $peek")

    /* 堆顶元素出堆 */
    heap.testPop(maxHeap)
    heap.testPop(maxHeap)
    heap.testPop(maxHeap)
    heap.testPop(maxHeap)
    heap.testPop(maxHeap)

    /* 获取堆大小 */
    val size: Int = maxHeap.size
    println(f"\n堆大小为: $size")

    /* 判断堆是否为空 */
    val isEmpty = maxHeap.isEmpty
    println(f"\n堆是否为空: $isEmpty")

    // 时间复杂度为 O(n) ，而非 O(nlogn)
    /* 输入列表并建堆 */
    val list = List(1, 3, 2, 5, 4).map(Seq(_))
    list.foreach(minHeap.enqueue)
    new PrintUtil().printMinHeap(minHeap)

 }
}