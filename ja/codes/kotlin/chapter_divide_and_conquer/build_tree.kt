/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 二分木の構築：分割統治法 */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // 部分木の区間が空なら終了する
    if (r - l < 0) return null
    // 根ノードを初期化する
    val root = TreeNode(preorder[i])
    // m を調べて左右の部分木を分ける
    val m = inorderMap[preorder[i]]!!
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 根ノードを返す
    return root
}

/* 二分木の構築 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // ハッシュ表を初期化し、inorder の各要素に対応するインデックスを格納する
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* 実行例 */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("行きがけ順 = ${preorder.contentToString()}")
    println("通りがけ順 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("構築した二分木：")
    printTree(root)
}