/**
 * File: binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Driver Code */
fun main() {
    /* 初始化二元樹 */
    // 初始化節點
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // 構建節點之間的引用（指標）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\n初始化二元樹\n")
    printTree(n1)

    /* 插入與刪除節點 */
    val P = TreeNode(0)
    // 在 n1 -> n2 中間插入節點 P
    n1.left = P
    P.left = n2
    println("\n插入節點 P 後\n")
    printTree(n1)
    // 刪除節點 P
    n1.left = n2
    println("\n刪除節點 P 後\n")
    printTree(n1)
}