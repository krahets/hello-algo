

/**
 * File: linear_search.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 10:44
 */

class linear_search {
  /* 线性查找（数组） */
  def linearSearchArray(nums: Array[Int], target: Int): Int = {
    // 遍历数组
    for (num <- nums) {
      // 找到目标元素，返回其索引
      if (num == target)
        return nums.indexOf(num)
    }
    // 未找到目标值，返回-1
    -1
  }

  /* 线性查找（链表） */
  def linearSearchLinkedList(head: ListNode, target: Int): ListNode = {
    // 遍历链表
    var curr = head
    while (curr != null) {
      // 找到目标值，返回节点
      if (curr.value == target)
        return curr
      // 未找到目标值，移动到下一个节点
      curr = curr.next
    }
    // 未找到目标值，返回null
    null
  }
}

object linear_search {
  def main(args: Array[String]): Unit = {
    val nums = Array(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val target = 3
    /* 在数组中执行线性查找 */

    val linearSearch = new linear_search()
    val index = linearSearch.linearSearchArray(nums, target)
    println("目标元素 3 的索引 = " + index)

    /* 在链表中执行线性查找 *//* 在链表中执行线性查找 */
    val head = new ListNode().arrToLinkedList(nums)
    val node = linearSearch.linearSearchLinkedList(head, target)
    println("目标节点值 3 的对应节点对象为 " + node.value)
  }
}

