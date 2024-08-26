
/**
 * File: linked_list.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-10 11:37
 */
class linked_list {

  /* 在链表的节点 n0 之后插入节点 P */
  def insert(n0: ListNode, P: ListNode): Unit = {
    val n1: ListNode = n0.next
    n0.next = P
    P.next = n1
  }

  /* 删除链表的节点 n0 之后的首个节点 */
  def remove(n0: ListNode): Unit = {
    if (n0.next == null) {
      return;
    }
    // n0 -> P -> n1
    val P: ListNode = n0.next
    val n1: ListNode = P.next
    n0.next = n1

  }

  /* 访问链表中索引为 index 的节点 */
  def access(head: ListNode, index: Int): ListNode = {
    var temp: ListNode = head
    for (i <- 0 until index) {
      if (temp == null) {
        return null
      }
      temp = temp.next
    }
    temp
  }

  /* 在链表中查找值为 target 的首个节点 */
  def find(head: ListNode, target: Int): Int = {
    var temp: ListNode = head
    var index: Int = 0
    while (temp != null) {
      if (temp.value == target) {
        return index
      }
      temp = temp.next
      index += 1
    }
    -1
  }

}


/* Driver Code */
object linked_list {
  def main(args: Array[String]): Unit = {
    /* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
    // 初始化各个节点
    val node0: ListNode = new ListNode(1)
    val node1: ListNode = new ListNode(3)
    val node2: ListNode = new ListNode(2)
    val node3: ListNode = new ListNode(5)
    val node4: ListNode = new ListNode(4)

    // 构建节点之间的引用
    node0.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    println("初始化的链表为")
    val printUtil: PrintUtil = new PrintUtil()
    printUtil.printLinkedList(node0)

    /* 插入节点 */
    val myLinkedList: linked_list = new linked_list()
    myLinkedList.insert(node0, new ListNode(0))
    println("插入节点后的链表为")
    printUtil.printLinkedList(node0)

    /* 删除节点 */
    myLinkedList.remove(node0)
    println("删除节点后的链表为")
    printUtil.printLinkedList(node0)

    /* 访问节点 */
    val node: ListNode = myLinkedList.access(node0, 3)
    println("链表中索引 3 处的节点的值 = " + node.value)

    /* 查找节点 *//* 查找节点 */
    val index: Int = myLinkedList.find(node0, 2)
    println("链表中值为 2 的节点的索引 = " + index)
  }
}
