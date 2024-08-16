import scala.collection.mutable.ListBuffer

/**
 * File: subset_sum_ii.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 15:19
 */

object subset_sum_ii {
  /* 回溯算法：子集和 I */
  def backtrack(state: List[Int], target: Int, choices: Array[Int], start: Int, res: ListBuffer[List[Int]]): Unit = {
    // 子集和等于 target 时，记录解
    if (target == 0) {
      res += state
      return
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    // 剪枝三：从 start 开始遍历，避免重复选择同一元素
    for (i <- start until choices.length) {
      // 剪枝一：若子集和超过 target ，则直接结束循环
      // 这是因为数组已排序，后边元素更大，子集和一定超过 target
      if(target < choices(i)) {
        return
      }
      if (!(i > start && choices(i)==choices(i-1))){
        // 尝试：做出选择，更新 target, start
        // 进行下一轮选择
        backtrack(state :+ choices(i), target -choices(i), choices, i + 1, res)
      }
    }
  }

  /* 求解子集和 II */
  def subsetSumII(nums: Array[Int], target: Int): List[List[Int]] = {
    val res = ListBuffer[List[Int]]() // 状态（子集）
    val sortedNums = nums.sorted // 对 nums 进行排序
    val start = 0 // 遍历起始点
    backtrack(List(), target, sortedNums, start, res)
    res.toList
  }

  def main(args: Array[String]): Unit = {
    val nums: Array[Int] = Array(4, 4, 5)
    val target = 9
    val res: List[List[Int]] = subsetSumII(nums, target)
    println(s"输入数组 nums = ${nums.mkString("[", ", ", "]")}, target = $target")
    println(s"所有和等于 $target 的子集 res = ${res.map(_.mkString("[", ", ", "]")).mkString(", ")}")
  }

}
