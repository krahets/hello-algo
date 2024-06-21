/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 构建二叉树：分治 */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // 子树区间为空时终止
    if (r - l < 0) return null
    // 初始化根节点
    val root = TreeNode(preorder[i])
    // 查询 m ，从而划分左右子树
    val m = inorderMap[preorder[i]]!!
    // 子问题：构建左子树
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 子问题：构建右子树
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 返回根节点
    return root
}

/* 构建二叉树 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // 初始化哈希表，存储 inorder 元素到索引的映射
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
    println("前序遍历 = ${preorder.contentToString()}")
    println("中序遍历 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("构建的二叉树为：")
    printTree(root)
}