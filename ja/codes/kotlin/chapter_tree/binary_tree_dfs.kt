/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// 走査順を記録するリストを初期化する
var list = mutableListOf<Int>()

/* 行きがけ順走査 */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問順：根 -> 左部分木 -> 右部分木
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* 通りがけ順走査 */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問順：左部分木 -> 根 -> 右部分木
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* 帰りがけ順走査 */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問順：左部分木 -> 右部分木 -> 根
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* 実行例 */
fun main() {
    /* 二分木を初期化する */
    // ここではリストから直接二分木を作る関数を使う
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n二分木を初期化\n")
    printTree(root)

    /* 行きがけ順走査 */
    list.clear()
    preOrder(root)
    println("\n行きがけ順に出力したノードの列 = $list")

    /* 通りがけ順走査 */
    list.clear()
    inOrder(root)
    println("\n通りがけ順に出力したノードの列 = $list")

    /* 帰りがけ順走査 */
    list.clear()
    postOrder(root)
    println("\n帰りがけ順に出力したノードの列 = $list")
}