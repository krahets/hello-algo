/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 二分木を構築：分割統治 */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // 部分木区間が空なら終了する
    if (r - l < 0) return null
    // ルートノードを初期化する
    val root = TreeNode(preorder[i])
    // m を求めて左右部分木を分割する
    val m = inorderMap[preorder[i]]!!
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 根ノードを返す
    return root
}

/* 二分木を構築 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* Driver Code */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("前順走査 = ${preorder.contentToString()}")
    println("中順走査 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("構築した二分木：")
    printTree(root)
}