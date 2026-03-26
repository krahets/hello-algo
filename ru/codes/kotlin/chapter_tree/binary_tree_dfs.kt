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

/* Прямой обход */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* Симметричный обход */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Обратный обход */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver Code */
fun main() {
    /* Инициализировать двоичное дерево */
    // Здесь используется функция, которая напрямую строит двоичное дерево из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализировать двоичное дерево\n")
    printTree(root)

    /* Прямой обход */
    list.clear()
    preOrder(root)
    println("\nПоследовательность узлов при прямом обходе = $list")

    /* Симметричный обход */
    list.clear()
    inOrder(root)
    println("\nПоследовательность узлов при симметричном обходе = $list")

    /* Обратный обход */
    list.clear()
    postOrder(root)
    println("\nПоследовательность узлов при обратном обходе = $list")
}
