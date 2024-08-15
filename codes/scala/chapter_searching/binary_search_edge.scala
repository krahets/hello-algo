

/**
 * File: binary_search_edge.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 10:13
 */

class binary_search_edge {
  /* 二分查找最左一个 target */
  def binarySearchLeftEdge(nums: Array[Int], target: Int): Int = {
    // 等价于查找 target 的插入点
    val i = new binary_search_insertion().binarySearchInsertion(nums, target);
    // 未找到 target ，返回 -1
    if (i == nums.length || nums(i) != target) {
      return -1
    }
    // 找到 target ，返回索引 i
    i
  }

  /* 二分查找最右一个 target */
  def binarySearchRightEdge(nums: Array[Int], target: Int): Int = {
    // 转化为查找最左一个 target + 1
    val i = new binary_search_insertion().binarySearchInsertion(nums, target + 1);
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    val j = i - 1
    // 未找到 target ，返回 -1
    if( j == -1 || nums(j)!= target){
      return -1
    }
    // 找到 target ，返回索引 j
    j
  }
}

object binary_search_edge {
  def main(args: Array[String]): Unit = {
    // 包含重复元素的数组
    val binarSearchEdge = new binary_search_edge
    val nums: Array[Int] = Array(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n数组 nums = " + nums.mkString(", "))

    // 二分查找左边界和右边界
    val nums2: Array[Int] = Array(6, 7)
    for(target <- nums2){
      var index = binarSearchEdge.binarySearchLeftEdge(nums, target)
      println("最左一个元素 " + target + " 的索引为 " + index)
      index = binarSearchEdge.binarySearchRightEdge(nums, target)
      println("最右一个元素 " + target + " 的索引为 " + index)
    }

  }

}
