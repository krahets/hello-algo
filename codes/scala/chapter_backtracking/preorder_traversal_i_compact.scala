import scala.collection.mutable.ListBuffer

/**
 * File: preorder_traversal_i_compact.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 09:17
 */

class preorder_traversal_i_compact {
  var res = new ListBuffer[TreeNode]()

  /* 前序遍历：例题一 */
  def preOrder(root: TreeNode): Unit = {
    if (root == null) return
    if (root.value == 7) {
      // 记录解
      res += root
    }
    preOrder(root.left)
    preOrder(root.right)
  }

}

object preorder_traversal_i_compact {
  def main(args: Array[String]): Unit = {
    val list: List[Option[Int]] = List(1, 7, 3, 4, 5, 6, 7).map(Option(_))
    val root: TreeNode = new TreeNode().listToTree(list)
    println("\n初始化二叉树")
    new PrintUtil().printTree(root)

    // 前序遍历
    val preor = new preorder_traversal_i_compact()
    preor.preOrder(root)
    println("\n输出所有值为 7 的节点")
    val values = new ListBuffer[Int]
    for (value <- preor.res) {
      values += value.value
    }
    println(values)


  }
}
