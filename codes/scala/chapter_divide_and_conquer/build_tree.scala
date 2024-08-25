import scala.collection.mutable

/**
 * File: build_tree.scala
 * Author: WangBlue (wangjiping596@gmail.com)
 * Create: 2024-08-15 16:41
 */

class build_tree {
  /* 构建二叉树：分治 */
  def dfs(preorder: Array[Int], inorderMap: mutable.HashMap[Int, Int], i: Int, l: Int, r: Int): TreeNode = {
    // 子树区间为空时终止
    if (r - l < 0) return null
    // 初始化根节点// 初始化根节点
    val root: TreeNode = new TreeNode(preorder(i))
    // 查询 m ，从而划分左右子树
    val m: Int = inorderMap(root.value)
    // 子问题：构建左子树
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 子问题：构建右子树
    root.right = dfs(preorder, inorderMap, i + m - l + 1, m + 1, r)
    root
  }

  /* 构建二叉树 */
  def buildTree(preorder: Array[Int], inorder: Array[Int]): TreeNode = {
    // 初始化哈希表，存储 inorder 元素到索引的映射
    val inorderMap: mutable.HashMap[Int, Int] = mutable.HashMap[Int, Int]()
    for (i <- inorder.indices) inorderMap(inorder(i)) = i

    val root: TreeNode = dfs(preorder, inorderMap, 0, 0, preorder.length - 1)
    root
  }
}

object build_tree {
  def main(args: Array[String]): Unit = {
    val preorder = Array(3, 9, 2, 1, 7)
    val inorder = Array(9, 3, 1, 2, 7)
    println("前序遍历 = " + preorder.mkString(", "))
    println("中序遍历 = " + inorder.mkString(", "))
    val root = new build_tree().buildTree(preorder, inorder)
    println("构建的二叉树为：")
    new PrintUtil().printTree(root)
  }
}
