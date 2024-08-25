import scala.collection.mutable.ListBuffer

/**
 * File: subset_sum_i_naive.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 14:33
 */

object subset_sum_i_naive {
  /* 回溯算法：子集和 I */
  def backtrack(state: List[Int], target: Int, total: Int, choices: Array[Int], res: ListBuffer[List[Int]]): Unit = {
    // 子集和等于 target 时，记录解
    if (total == target) {
      res += state
      return
    }
    // 遍历所有选择
    for (i <- choices.indices) {
      // 剪枝：若子集和超过 target ，则跳过该选择
      if (total + choices(i) <= target) {
        // 尝试：做出选择，更新元素和 total
        // 进行下一轮选择
        backtrack(state :+ choices(i), target, total + choices(i), choices, res)
      }
    }
  }
  /* 求解子集和 I（包含重复子集） */
  def subsetSumINaive(nums: Array[Int], target: Int): List[List[Int]] = {
    val res = ListBuffer[List[Int]]()
    val total = 0 // 子集和
    backtrack(List(), target, total, nums, res)
    res.toList
  }

  def main(args: Array[String]): Unit = {
    val nums: Array[Int] = Array(3, 4, 5)
    val target = 9
    val res: List[List[Int]] = subsetSumINaive(nums, target)
    println(s"输入数组 nums = ${nums.mkString("[", ", ", "]")}, target = $target")
    println(s"所有和等于 $target 的子集 res = ${res.map(_.mkString("[", ", ", "]")).mkString(", ")}")
    println("请注意，该方法输出的结果包含重复集合")


  }

}
