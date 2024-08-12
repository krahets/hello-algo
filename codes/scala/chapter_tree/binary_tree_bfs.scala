import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * File: binary_tree_bfs.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 17:09
 */

class binary_tree_bfs {
  /* 层序遍历 */
  def levelOrder(root: TreeNode): ArrayBuffer[Int] = {
    // 初始化队列，加入根节点
    val queue = new mutable.Queue[TreeNode]
    queue.enqueue(root)
    // 初始化一个列表，用于保存遍历序列
    val result = new ArrayBuffer[Int]()
    while (queue.nonEmpty){
      val node: TreeNode = queue.dequeue() // 队列出队

      result += node.value // 保存节点值

      if (node.left != null) queue.enqueue(node.left) // 左子节点入队
      if (node.right != null) queue.enqueue(node.right) // 右子节点入队
    }

    result // 返回结果
  }
}

object binary_tree_bfs {

  def main(args: Array[String]): Unit = {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    val treeNode: TreeNode = new TreeNode()
    val myList: List[Integer] = List[Integer](1, 2, 3, 4, 5, 6, 7)
    val optionList: List[Option[Integer]] = myList.map(Option(_))
    val root = treeNode.listToTree(optionList)
    println("\n初始化二叉树\n")
    new PrintUtil().printTree(root)

    /* 层序遍历 */
    val result: ArrayBuffer[Int] = new binary_tree_bfs().levelOrder(root)
    println("\n层序遍历的节点打印序列 = " +result)
  }

}
