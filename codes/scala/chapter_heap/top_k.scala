import scala.collection.mutable

/**
 * File: top_k.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-14 10:50
 */

object top_k {
  /* 基于堆查找数组中最大的 k 个元素 */
  def topKHeap(nums: Array[Int], k: Int): mutable.PriorityQueue[Int] = {
    // 初始化小顶堆
    val heap = new mutable.PriorityQueue[Int]()(Ordering.Int.reverse)
    // 将数组的前 k 个元素入堆
    for (i <- 0 until k) {
      heap += nums(i)
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (i <- k until nums.length) {
      // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
      if (nums(i) > heap.head) {
        heap.dequeue()
        heap += nums(i)
      }

    }
    heap

  }

  def main(args: Array[String]): Unit = {
    val nums = Array(1, 7, 6, 3, 2)
    val k = 3
    val heap = topKHeap(nums, k)
    println("最大的 " + k + " 个元素为")
    new PrintUtil().printHeap(heap)
  }

}
