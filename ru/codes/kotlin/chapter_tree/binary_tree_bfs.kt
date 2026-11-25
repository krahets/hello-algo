/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* Обход по уровням */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // Создать очередь и добавить корень
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // Создать список для последовательности обхода
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // Извлечь узел из очереди
        list.add(node?._val!!)       // Сохранить значение узла
        if (node.left != null)
            queue.offer(node.left)   // Добавить левого потомка в очередь
        if (node.right != null)
            queue.offer(node.right)  // Добавить правого потомка в очередь
    }
    return list
}

/* Основная программа */
fun main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализация двоичного дерева\n")
    printTree(root)

    /* Обход по уровням */
    val list = levelOrder(root)
    println("\nУзлы в порядке обхода по уровням = $list")
}