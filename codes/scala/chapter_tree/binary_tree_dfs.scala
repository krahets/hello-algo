import scala.collection.mutable.ArrayBuffer

/**
 * File: binary_tree_dfs.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 17:29
 */

class binary_tree_dfs {
  // 初始化列表，用于存储遍历序列
  val list: ArrayBuffer[Int] = new ArrayBuffer[Int]()

  /* 前序遍历 */
  def preorder(root: TreeNode): Unit = {
    if (root == null){
      return
    }
    // 访问优先级：根节点 -> 左子树 -> 右子树
    list += root.value
    preorder(root.left)
    preorder(root.right)
  }

  /* 中序遍历 */
  def inorder(root: TreeNode): Unit = {
    if (root == null){
      return
    }
    // 访问优先级：左子树 -> 根节点 -> 右子树
    inorder(root.left)
    list += root.value
    inorder(root.right)
  }

  /* 后序遍历 */
  def postorder(root: TreeNode): Unit = {
    if (root == null){
      return
    }
    // 访问优先级：左子树 -> 右子树 -> 根节点
    postorder(root.left)
    postorder(root.right)
    list += root.value
  }
}

object binary_tree_dfs {
  def main(args: Array[String]): Unit = {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    val treeNode: TreeNode = new TreeNode()
    val myList: List[Int] = List[Int](1, 2, 3, 4, 5, 6, 7)
    val optionList: List[Option[Int]] = myList.map(Option(_))
    val root = treeNode.listToTree(optionList)
    println("\n初始化二叉树\n")
    new PrintUtil().printTree(root)


    val binaryTreeDfs = new binary_tree_dfs()

    /* 前序遍历 */
    binaryTreeDfs.list.clear()
    binaryTreeDfs.preorder(root)
    println("\n前序遍历的节点打印序列 = " + binaryTreeDfs.list)

    /* 中序遍历 */
    binaryTreeDfs.list.clear()
    binaryTreeDfs.inorder(root)
    println("\n中序遍历的节点打印序列 = " + binaryTreeDfs.list)

    /* 后序遍历 */
    binaryTreeDfs.list.clear()
    binaryTreeDfs.postorder(root)
    println("\n后序遍历的节点打印序列 = " + binaryTreeDfs.list)
  }

}
