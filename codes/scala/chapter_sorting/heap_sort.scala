

/**
 * File: heap_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:15
 */

class heap_sort {
  /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
  def siftDown(nums: Array[Int], n: Int, i: Int): Unit = {
    // 判断节点 i, l, r 中值最大的节点，记为 ma
    var tmp =  i
    val l = 2 * tmp + 1
    val r = 2 * tmp + 2
    var ma = tmp
    if (l < n && nums(l) > nums(ma)) ma = l
    if (r < n && nums(r) > nums(ma)) ma = r
    // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
    if(ma == tmp) return
    // 交换两节点
    val temp = nums(tmp)
    nums(tmp) = nums(ma)
    nums(ma) = temp
    // 循环向下堆化
    tmp = ma
  }

  /* 堆排序 */
  def heapSort(nums: Array[Int]): Unit = {
    // 建堆操作：堆化除叶节点以外的其他所有节点
    for(i<- nums.length/2-1 to 0 by -1) {
      siftDown(nums, nums.length, i)
    }
    // 从堆中提取最大元素，循环 n-1 轮
    for (i <- nums.length - 1 until 0 by -1) {
      // 交换根节点与最右叶节点（交换首元素与尾元素）
      val tmp = nums(0)
      nums(0) = nums(i)
      nums(i) = tmp
      // 以根节点为起点，从顶至底进行堆化
      siftDown(nums, i, 0)
    }
  }
}

object heap_sort {
  def main(args: Array[String]): Unit = {
    val nums = Array(4, 1, 3, 1, 5, 2)
    new heap_sort().heapSort(nums)
    System.out.println("堆排序完成后 nums = " + nums.mkString(", "))
  }
}
