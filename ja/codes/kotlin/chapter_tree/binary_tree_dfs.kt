/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// 走査順序を格納するリストを初期化
var list = mutableListOf<Int>()

/* 先行順走査 */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* 中順走査 */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* 後順走査 */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver Code */
fun main() {
    /* 二分木を初期化 */
    // ここではリストから直接二分木を生成する関数を利用する
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n二分木を初期化\n")
    printTree(root)

    /* 先行順走査 */
    list.clear()
    preOrder(root)
    println("\n先行順走査のノード出力順 = $list")

    /* 中順走査 */
    list.clear()
    inOrder(root)
    println("\n中間順走査のノード出力順 = $list")

    /* 後順走査 */
    list.clear()
    postOrder(root)
    println("\n後行順走査のノード出力順 = $list")
}