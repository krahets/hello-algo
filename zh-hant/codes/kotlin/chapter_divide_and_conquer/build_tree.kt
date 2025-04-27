/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 構建二元樹：分治 */
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
    // 查詢 m ，從而劃分左右子樹
    val m = inorderMap[preorder[i]]!!
    // 子問題：構建左子樹
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 子問題：構建右子樹
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 返回根節點
    return root
}

/* 構建二元樹 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    println("前序走訪 = ${preorder.contentToString()}")
    println("中序走訪 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("構建的二元樹為：")
    printTree(root)
}