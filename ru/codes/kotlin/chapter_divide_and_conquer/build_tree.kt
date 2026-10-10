/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* Построить двоичное дерево: разделяй и властвуй */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // Завершить при пустом диапазоне поддерева
    if (r - l < 0) return null
    // Инициализировать корневой узел
    val root = TreeNode(preorder[i])
    // Найти m, чтобы разделить левое и правое поддеревья
    val m = inorderMap[preorder[i]]!!
    // Подзадача: построить левое поддерево
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // Подзадача: построить правое поддерево
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // Вернуть корневой узел
    return root
}

/* Построить двоичное дерево */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
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
    println("Предварительный обход = ${preorder.contentToString()}")
    println("Симметричный обход = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("Построенное двоичное дерево:")
    printTree(root)
}