
/**
 * File: Array.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-10 11:09
 */
class array {
  /* 随机访问元素 */
  def randomAccess(nums: Array[Int]): Int = {
    // 在区间 [0, nums.length) 中随机抽取一个数字
    val index: Int = scala.util.Random.nextInt(nums.length)
    // 获取并返回随机元素
    nums(index)
  }

  /* 扩展数组长度 */
  def extend(nums: Array[Int], enlarge: Int): Array[Int] = {
    // 初始化一个扩展长度后的数组
    val res: Array[Int] = new Array[Int](nums.length + enlarge)
    // 将原数组中的所有元素复制到新数组
    for (i <- nums.indices) {
      res(i) = nums(i)
    }
    // 返回扩展后的新数组
    res
  }

  /* 在数组的索引 index 处插入元素 num */
  def insert(nums: Array[Int], num: Int, index: Int): Unit = {
    // 把索引 index 以及之后的所有元素向后移动一位
    for (i <- nums.length - 1 to index by -1) {
      nums(i) = nums(i - 1)
    }
    // 将 num 赋给 index 处的元素
    nums(index) = num
  }

  /* 删除索引 index 处的元素 */
  def remove(nums: Array[Int], index: Int): Unit = {
    // 把索引 index 之后的所有元素向前移动一位
    for (i <- index until nums.length - 1) {
      nums(i) = nums(i + 1)
    }
  }

  /* 遍历数组 */
  def traverse(nums: Array[Int]): Unit = {
    var count: Int = 0
    // 通过索引遍历数组
    for (i <- nums.indices) {
      count += nums(i)
    }
    // 直接遍历数组元素
    for (num <- nums) {
      count += num
    }
  }

  /* 在数组中查找指定元素 */
  def find(nums: Array[Int], target: Int): Int = {
    for(i <- nums.indices) {
      if(nums(i) == target) {
        return i
      }
    }
    -1
  }
}


object array {
  def main(args: Array[String]): Unit = {

    val myArray = new array()
    /* 初始化数组 */
    val arr: Array[Int] = new Array[Int](5)

    println("数组 arr = [" + arr.mkString(" ") + "]")

    var nums: Array[Int] = Array(1, 3, 2, 5, 4)
    println("数组 nums = [" + nums.mkString(" ") + "]")

    /* 随机访问 */
    val randomNum = myArray.randomAccess(nums)
    println("在 nums 中获取随机元素 " + randomNum)

    /* 长度扩展 */
    nums = myArray.extend(nums, 3)
    println("将数组长度扩展至 8 ，得到 nums = [" + nums.mkString(" ") + "]")

    /* 插入元素 */
    myArray.insert(nums, 6, 3)
    println("在索引 3 处插入数字 6 ，得到 nums = [" + nums.mkString(" ") + "]")

    /* 删除元素 */
    myArray.remove(nums, 2)
    println("删除索引 2 处的元素，得到 nums = [" + nums.mkString(" ") + "]")

    /* 遍历数组 */
    myArray.traverse(nums)

    /* 查找元素 */
    val index = myArray.find(nums, 3)
    println("在 nums 中查找元素 3 ，得到索引 = " + index)
  }

}