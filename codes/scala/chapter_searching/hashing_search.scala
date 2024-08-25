import scala.collection.mutable

/**
 * File: hashing_search.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 10:38
 */

class hashing_search {
  /* 哈希查找（数组） */
  def hashingSearchArray(map: mutable.Map[Int, Int], key: Int): Int = {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    map.getOrElse(key, -1)
  }

  /* 哈希查找（链表） */
  def hashingSearchLinkedList(map: mutable.Map[Int, ListNode], target: Int): ListNode = {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 null
    map.getOrElse(target, null)
  }
}
object hashing_search {
  def main(args: Array[String]): Unit = {
    val hashingSearch = new hashing_search()


    val target = 3
    /* 哈希查找（数组） */
    val nums = Array(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 初始化哈希表
    val map = mutable.Map[Int, Int]()
    for (i <- nums.indices) {
      map(nums(i)) = i // key: 元素，value: 索引
    }
    val index = hashingSearch.hashingSearchArray(map, target)
    println(s"目标元素 3 的索引 = $index")

    /* 哈希查找（链表） */
    val head = new ListNode().arrToLinkedList(nums)
    // 初始化哈希表
    val map1 = mutable.Map[Int, ListNode]()
    var current = head
    while (current != null) {
      map1(current.value) = current // key: 节点值，value: 节点
      current = current.next
    }
    val node = hashingSearch.hashingSearchLinkedList(map1, target)
    println(s"目标节点值 3 的对应节点对象为 ${node.value}")
  }
}
