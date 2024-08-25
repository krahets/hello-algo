import java.awt.Choice
import scala.collection.mutable.ListBuffer

/**
 * File: permutations_i.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 14:05
 */

object permutations_i {
  /* 回溯算法：全排列 I */
  def backtrack(state: List[Int], choices: Array[Int],
                selected: Array[Boolean],res: ListBuffer[List[Int]]): Unit = {
    // 当状态长度等于元素数量时，记录解
    if(state.size == choices.length) {
      res += state
      return
    }
    // 遍历所有选择
    for(i <- choices.indices) {
      val choice = choices(i)
      // 剪枝：不允许重复选择元素
      if(!selected(i)) {
        // 尝试：做出选择，更新状态
        selected(i) = true
        // 进行下一轮选择
        backtrack(state :+ choice, choices, selected, res)
        // 回退：撤销选择，恢复到之前的状态
        selected(i) = false
      }
    }
  }

  /* 全排列 I */
  def permutationsI(nums: Array[Int]): List[List[Int]] = {
    val res = ListBuffer[List[Int]]()
    backtrack(List(), nums, Array.fill(nums.length)(false), res)
    res.toList
  }

  def main(args: Array[String]): Unit = {
    // 定义输入数组
    val nums: Array[Int] = Array(1, 2, 3)

    // 调用全排列方法
    val res: List[List[Int]] = permutationsI(nums)

    // 打印结果
    println(s"输入数组 nums = ${nums.mkString(", ")}")
    println(s"所有排列 res = ${res.map(_.mkString("[", ", ", "]")).mkString(", ")}")
  }
}
