/**
 * File: fractional_knapsack.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-18 11:51
 */

/* 物品 */
case class Item(weight: Int, value: Int)



object fractional_knapsack {

  /* 分数背包：贪心 */
  def fractionalKnapsack(weights: Array[Int], values: Array[Int], capacity: Int): Double = {
    // 创建物品列表，包含两个属性：重量、价值
    val items = weights.zip(values).map { case (w, v) => Item(w, v) }

    // 按照单位价值 item.value / item.weight 从高到低进行排序
    val sortedItems = items.sortBy(item => -(item.value.toDouble / item.weight))

    // 循环贪心选择
    var remainingCapacity = capacity
    var totalValue = 0.0

    for (item <- sortedItems) {
      if (item.weight <= remainingCapacity) {
        // 若剩余容量充足，则将当前物品整个装进背包
        totalValue += item.value
        remainingCapacity -= item.weight
      } else {
        // 若剩余容量不足，则将当前物品的一部分装进背包
        totalValue += (item.value.toDouble / item.weight) * remainingCapacity
        // 已无剩余容量，因此跳出循环
        return totalValue
      }
    }
    totalValue
  }
  def main(args: Array[String]): Unit = {
    val wgt = Array(10, 20, 30, 40, 50)
    val value = Array(50, 120, 150, 210, 240)
    val cap = 50

    // 贪心算法
    val res = fractionalKnapsack(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 " + res)
  }

}
