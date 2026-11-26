/**
 * File: binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Основная программа */
fun main() {
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // Связать узлы ссылками (указателями)
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\nИнициализация двоичного дерева\n")
    printTree(n1)

    /* Вставка и удаление узлов */
    val P = TreeNode(0)
    // Вставить узел P между n1 и n2
    n1.left = P
    P.left = n2
    println("\nПосле вставки узла P:\n")
    printTree(n1)
    // Удалить узел P
    n1.left = n2
    println("\nПосле удаления узла P:\n")
    printTree(n1)
}