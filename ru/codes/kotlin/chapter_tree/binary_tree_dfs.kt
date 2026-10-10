/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// Инициализировать список для хранения последовательности обхода
var list = mutableListOf<Int>()

/* Предварительный обход */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: корень -> левое поддерево -> правое поддерево
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* Симметричный обход */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: левое поддерево -> корень -> правое поддерево
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Обратный обход */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: левое поддерево -> правое поддерево -> корень
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver Code */
fun main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализация двоичного дерева\n")
    printTree(root)

    /* Предварительный обход */
    list.clear()
    preOrder(root)
    println("\nПоследовательность печати узлов при предварительном обходе = $list")

    /* Симметричный обход */
    list.clear()
    inOrder(root)
    println("\nПоследовательность печати узлов при симметричном обходе = $list")

    /* Обратный обход */
    list.clear()
    postOrder(root)
    println("\nПоследовательность печати узлов при обратном обходе = $list")
}