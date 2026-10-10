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
    /* 二分木を初期化 */
    // ノードを初期化
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // ノード間の参照（ポインタ）を構築する
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\n二分木を初期化\n")
    printTree(n1)

    /* ノードの挿入と削除 */
    val P = TreeNode(0)
    // n1 -> n2 の間にノード P を挿入
    n1.left = P
    P.left = n2
    println("\nノード P を挿入後\n")
    printTree(n1)
    // ノード P を削除
    n1.left = n2
    println("\nノード P を削除後\n")
    printTree(n1)
}