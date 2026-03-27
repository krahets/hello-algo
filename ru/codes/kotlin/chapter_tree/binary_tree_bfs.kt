/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* Обход в ширину */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // Инициализировать очередь и добавить корневой узел
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // Инициализировать список для хранения последовательности обхода
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // Извлечение из очереди
        list.add(node?._val!!)       // Сохранить значение узла
        if (node.left != null)
            queue.offer(node.left)   // Поместить левый дочерний узел в очередь
        if (node.right != null)
            queue.offer(node.right)  // Поместить правый дочерний узел в очередь
    }
    return list
}

/* Driver Code */
fun main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализация двоичного дерева\n")
    printTree(root)

    /* Обход в ширину */
    val list = levelOrder(root)
    println("\nПоследовательность печати узлов при обходе в ширину = $list")
}