/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* Построение двоичного дерева методом «разделяй и властвуй» */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // Если интервал поддерева пуст, завершаем рекурсию
    if (r - l < 0) return null
    // Создаём корень
    val root = TreeNode(preorder[i])
    // Находим m и разделяем левое и правое поддеревья
    val m = inorderMap[preorder[i]]!!
    // Подзадача: строим левое поддерево
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // Подзадача: строим правое поддерево
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // Возвращаем корень
    return root
}

/* Построение двоичного дерева */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // Создаём хеш-таблицу индексов элементов inorder
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* Основная программа */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("Прямой обход = ${preorder.contentToString()}")
    println("Симметричный обход = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("Построенное двоичное дерево:")
    printTree(root)
}