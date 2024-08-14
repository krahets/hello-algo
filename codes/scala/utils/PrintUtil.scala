

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, ListBuffer}


/**
 * File: PrintUtil.scala
 * Author: WangBlue
 * Create: 2024-08-09 16:52
 */
class PrintUtil {
  /* 打印矩阵（Array） */
  def printMatrix[T](matrix: ArrayBuffer[ArrayBuffer[T]]): Unit = {
    println("[")
    matrix.foreach { row =>
      println(s"  ${row.mkString(", ")},")
    }
    println("]")
  }


  /* 打印矩阵（List） */
  def printMatrix[T](matrix: List[List[T]]): Unit = {
    println("[")
    matrix.foreach { row =>
      println(s"  $row,")
    }
    println("]")
  }


  /* 打印链表 */
  def printLinkedList(head: ListNode): Unit = {
    val list = ListBuffer[String]()
    var current = head
    while (current != null) {
      list += current.value.toString
      current = current.next
    }
    println(list.mkString(" -> "))
  }

  /* 打印二叉树 */
  def printTree(root: TreeNode): Unit = {
    printTree(root, null, false)
  }


  /*
   * 打印二叉树的辅助类
   */
  def printTree(root: TreeNode, prev: Trunk, isRight: Boolean): Unit = {
    if (root == null) return

    var prevStr = "    "
    val trunk = new Trunk(prev, prevStr)

    printTree(root.right, trunk, true)

    if (prev == null) {
      trunk.str = "———"
    } else if (isRight) {
      trunk.str = "/———"
      prevStr = "   |"
    } else {
      trunk.str = "\\———"
      prev.str = prevStr
    }

    showTrunks(trunk)
    println(" " + root.value)

    if (prev != null) {
      prev.str = prevStr
    }
    trunk.str = "   |"

    printTree(root.left, trunk, false)
  }

  def showTrunks(trunk: Trunk): Unit = {
    if (trunk == null) return
    showTrunks(trunk.pre)
    print(trunk.str)
  }

  /* 打印哈希表 */
  def printHashMap[K, V](map: mutable.Map[K, V]): Unit = {
    map.foreach { case (key, value) =>
      println(s"$key -> $value")
    }
  }


  /* 打印大顶堆（优先队列） */
  def printHeap(queue: mutable.PriorityQueue[Int]): Unit = {

    val list = queue.map(Option(_)).toList
    println(s"堆的数组表示：$list")
    println("堆的树状表示：")
    val treeNode = new TreeNode()
    val root = treeNode.listToTree(list)
    printTree(root)
  }

  /* 打印小顶堆（优先队列） */
  def printMinHeap(queue: mutable.PriorityQueue[Int]): Unit = {
    // 因为queue.map(Option(_)).toList 在打印最小堆的时候会改变数组的顺序，所以需要先reverse一下
    val list = queue.map(Option(_)).toList.reverse
    println(s"堆的数组表示：$list")
    println("堆的树状表示：")
    val treeNode = new TreeNode()
    val root = treeNode.listToTree(list)
    printTree(root)
  }


}
