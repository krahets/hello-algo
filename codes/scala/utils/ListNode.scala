
/**
 * File: ListNode.scala
 * Author: WangBlue
 * Create: 2024-08-09 16:17
 */

/* 链表节点 */

class ListNode {
  var value: Int = 0        // 节点值
  var next: ListNode = _   // 指向下一个节点的指针

  /* 构造函数 */
  def this(value: Int) = {
    this()
    this.value = value
  }


  /* 将列表反序列化为链表 */
  def arrToLinkedList(arr: Array[Int]): ListNode = {
   var dum: ListNode =  new ListNode(0)
    var head: ListNode = dum
    for(i <- arr.indices){
      head.next = new ListNode(arr(i))
      head = head.next
    }
    dum.next
  }



}
