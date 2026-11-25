/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// Создать список для последовательности обхода
var list = mutableListOf<Int>()

/* Прямой обход */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок посещения: корень -> левое поддерево -> правое поддерево
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* Симметричный обход */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок посещения: левое поддерево -> корень -> правое поддерево
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Обратный обход */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // Порядок посещения: левое поддерево -> правое поддерево -> корень
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Основная программа */
fun main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализация двоичного дерева\n")
    printTree(root)

    /* Прямой обход */
    list.clear()
    preOrder(root)
    println("\nУзлы в порядке прямого обхода = $list")

    /* Симметричный обход */
    list.clear()
    inOrder(root)
    println("\nУзлы в порядке симметричного обхода = $list")

    /* Обратный обход */
    list.clear()
    postOrder(root)
    println("\nУзлы в порядке обратного обхода = $list")
}