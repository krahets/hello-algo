/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 建構二元樹：分治法 */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // 子樹區間為空時終止
    if (r - l < 0) return null
    // 初始化根節點
    val root = TreeNode(preorder[i])
    // 查出 m，據此劃分左右子樹
    val m = inorderMap[preorder[i]]!!
    // 子問題：建構左子樹
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 子問題：建構右子樹
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 回傳根節點
    return root
}

/* 建構二元樹 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // 初始化雜湊表，記錄 inorder 中各元素對應的索引
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* 主程式 */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("前序走訪 = ${preorder.contentToString()}")
    println("中序走訪 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("建構出的二元樹為：")
    printTree(root)
}