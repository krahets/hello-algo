
/**
 * File: DListNode.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-11 19:49
 */


/* 双向链表节点 */
class DListNode {
  var value: Int = _ // 节点值
  var prev: DListNode = _ // 指向前驱节点
  var next: DListNode = _ // 指向后继节点

  def this(value: Int) = {
    this()
    this.value = value
  }
}

