

/**
 * File: merge_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:04
 */

class merge_sort {
  /* 合并左子数组和右子数组 */
  def merge(nums: Array[Int], left: Int, mid: Int, right: Int): Unit = {
    // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
    // 创建一个临时数组 tmp ，用于存放合并后的结果
    val tmp = new Array[Int](right - left + 1)
    // 初始化左子数组和右子数组的起始索引
    var i = left
    var j = mid + 1
    var k = 0
    // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while (i <= mid && j <= right) {
      if(nums(i) <= nums(j)) {
        tmp(k) = nums(i)
        i += 1
      }else {
        tmp(k) = nums(j)
        j += 1
      }
      k += 1
    }
    // 将左子数组和右子数组的剩余元素复制到临时数组中
    while ( i <= mid) {
      tmp(k) = nums(i)
      i += 1
      k += 1
    }
    while ( j <= right) {
      tmp(k) = nums(j)
      k += 1
      j += 1
    }
    // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
    for(k <- tmp.indices){
      nums(left + k) = tmp(k)
    }
  }

  /* 归并排序 */
  def mergeSort(nums: Array[Int], left: Int, right: Int): Unit = {
    // 终止条件
    if (left >= right) return // 当子数组长度为 1 时终止递归
    // 划分阶段// 划分阶段
    val mid = left + (right - left) / 2 // 计算中点
    mergeSort(nums, left, mid) // 递归左子数组
    mergeSort(nums, mid + 1, right) // 递归右子数组
    // 合并阶段// 合并阶段
    merge(nums, left, mid, right)
  }
}

object merge_sort {
  def main(args: Array[String]): Unit = {
    /* 归并排序 */
    val nums = Array(7, 3, 2, 6, 0, 1, 5, 4)
    new merge_sort().mergeSort(nums, 0, nums.length - 1)
    System.out.println("归并排序完成后 nums = " + nums.mkString(", "))
  }
}
