/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// 初始化串列以儲存走訪序列
var list = mutableListOf<Int>()

/* 前序走訪 */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // 走訪順序：根節點 -> 左子樹 -> 右子樹
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* 中序走訪 */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // 走訪順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* 後序走訪 */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // 走訪順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* 主程式 */
fun main() {
    /* 初始化二元樹 */
    // 這裡使用能從串列直接建立二元樹的函式
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n初始化二元樹\n")
    printTree(root)

    /* 前序走訪 */
    list.clear()
    preOrder(root)
    println("\n依前序走訪印出的節點序列 = $list")

    /* 中序走訪 */
    list.clear()
    inOrder(root)
    println("\n依中序走訪印出的節點序列 = $list")

    /* 後序走訪 */
    list.clear()
    postOrder(root)
    println("\n依後序走訪印出的節點序列 = $list")
}