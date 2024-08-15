import scala.collection.mutable.ArrayBuffer
import scala.reflect.internal.util.Collections

/**
 * File: bucket_sort.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 15:22
 */

class bucket_sort {
  /* 桶排序 */
  def bucketSort(nums: Array[Float]): Unit = {
    // 初始化 k = n / 2 个桶，预期每个桶分配 2 个元素
    val k = nums.length / 2
    val buckets = Array.fill(k)(List.empty[Float])

    // 1. 将数组元素分配到各个桶中
    nums.foreach { num =>
      // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
      val index = (num * k).toInt
      // 将 num 添加进桶 index
      buckets(index) = num :: buckets(index)
    }

    // 2. 对各个桶执行排序
    val sortedBuckets = buckets.map(_.sorted)

    // 3. 遍历桶合并结果
    var i = 0
    sortedBuckets.foreach { bucket =>
      bucket.foreach { num =>
        nums(i) = num
        i += 1
      }
    }
  }
}

object bucket_sort {
  def main(args: Array[String]): Unit = {
    // 设输入数据为浮点数，范围为 [0, 1)
    val nums = Array(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    val bucketSort = new bucket_sort()
    bucketSort.bucketSort(nums)
    println("桶排序完成后 nums = " + nums.mkString(", "))

  }
}
