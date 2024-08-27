import scala.collection.mutable.ListBuffer

/**
 * File: list.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-10 17:52
 */
object list {
  def main(args: Array[String]): Unit = {
    /* 初始化列表 */
    // 注意数组的元素类型是 int[] 的包装类 Integer[]
    val numbers: Array[Integer] = Array(1, 3, 2, 5, 4)
    // 使用ListBuffer初始化列表,使得nums列表是可变的
    val nums: ListBuffer[Integer] = ListBuffer(numbers: _*)
    println("列表 nums = [" + nums.mkString(", ") + "]")

    /* 访问元素 */
    val num = nums(1)
    println("访问索引 1 处的元素，得到 num = " + num)

    /* 更新元素 */
    val updatedNums = nums.updated(1, 0)
    println("将索引 1 处的元素更新为 0 ，得到 nums = [" + updatedNums.mkString(", ") + "]")

    /* 清空列表 */
    nums.clear()
    println("清空列表后 nums = [" + nums.mkString(", ") + "]")


    /* 在尾部添加元素 */
    nums += (1)
    nums += (3)
    nums += (2)
    nums += (5)
    nums += (4)
    println("添加元素后 nums = [" + nums.mkString(", ") + "]")

    /* 在中间插入元素 */
    nums.insert(3, 6)
    println("在索引 3 处插入数字 6 ，得到 nums = [" + nums.mkString(", ") + "]")

    /* 删除元素 */
    nums.remove(3)
    println("删除索引 3 处的元素，得到 nums = [" + nums.mkString(", ") + "]")

    /* 通过索引遍历列表 */
    var count: Int = 0
    for (i <- nums.indices) {
      count += nums(i)
    }


    /* 直接遍历列表元素 */
    for (num <- nums) {
      count += num
    }

    /* 拼接两个列表 */
    val nums1: ListBuffer[Integer] = ListBuffer(6, 8, 7, 10, 9)
    nums ++= nums1
    println("将列表 nums1 拼接到 nums 之后，得到 nums = [" + nums.mkString(", ") + "]")

    /* 排序列表 *//* 排序列表 */
    val numsSorted: ListBuffer[Integer] = nums.sorted
    println("排序列表后 nums = [" + numsSorted.mkString(", ") + "]")


  }

}
