

/**
 * File: binary_tree.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-12 17:00
 */

object binary_tree {
  def main(args: Array[String]): Unit = {
    /* 初始化二叉树 */
    // 初始化节点
    val n1: TreeNode = new TreeNode(1)
    val n2: TreeNode = new TreeNode(2)
    val n3: TreeNode = new TreeNode(3)
    val n4: TreeNode = new TreeNode(4)
    val n5: TreeNode = new TreeNode(5)
    // 构建节点之间的引用（指针）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\n初始化二叉树\n")
    val printUtil = new PrintUtil()
    printUtil.printTree(n1)
    /* 插入与删除节点 */
    val P = new TreeNode(0)
    // 在 n1 -> n2 中间插入节点 P
    n1.left = P
    P.left = n2
    println("\n插入节点 P 后\n")
    printUtil.printTree(n1)
    // 删除节点 P
    n1.left = n2
    println("\n删除节点 P 后\n")
    printUtil.printTree(n1)
  }

}
