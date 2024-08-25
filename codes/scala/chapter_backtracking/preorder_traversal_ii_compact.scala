import scala.collection.mutable.ListBuffer

/**
 * File: preorder_traversal_ii_compact.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-16 11:10
 */

class preorder_traversal_ii_compact {
  var path = new ListBuffer[TreeNode]()
  var res = new ListBuffer[ListBuffer[TreeNode]]()

  /* 前序遍历：例题二 */
  def preOrder(root: TreeNode): Unit = {
    if (root == null) {
      return
    }
    // 尝试
    path = path :+ root
    if (root.value == 7) {
      // 记录解
      res = res :+ path
    }
    preOrder(root.left)
    preOrder(root.right)
    // 回退
    path = path.dropRight(1)
  }
}

object preorder_traversal_ii_compact {

  def main(args: Array[String]): Unit = {
    val list: List[Option[Int]] = List(1, 7, 3, 4, 5, 6, 7).map(Option(_))
    val root: TreeNode = new TreeNode().listToTree(list)
    println("\n初始化二叉树")
    new PrintUtil().printTree(root)

    // 前序遍历
    val preor = new preorder_traversal_ii_compact()
    preor.preOrder(root)
    println("\n输出所有根节点到节点 7 的路径")
    preor.res.foreach { path =>
      val vals = path.map(_.value)
      println(vals)
    }
  }
}
