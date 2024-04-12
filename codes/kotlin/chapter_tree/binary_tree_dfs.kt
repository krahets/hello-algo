/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// 初始化列表，用于存储遍历序列
var list = mutableListOf<Int>()

/* 前序遍历 */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // 访问优先级：根节点 -> 左子树 -> 右子树
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* 中序遍历 */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // 访问优先级：左子树 -> 根节点 -> 右子树
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* 后序遍历 */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // 访问优先级：左子树 -> 右子树 -> 根节点
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver Code */
fun main() {
    /* 初始化二叉树 */
    // 这里借助了一个从列表直接生成二叉树的函数
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n初始化二叉树\n")
    printTree(root)

    /* 前序遍历 */
    list.clear()
    preOrder(root)
    println("\n前序遍历的节点打印序列 = $list")

    /* 中序遍历 */
    list.clear()
    inOrder(root)
    println("\n中序遍历的节点打印序列 = $list")

    /* 后序遍历 */
    list.clear()
    postOrder(root)
    println("\n后序遍历的节点打印序列 = $list")
}