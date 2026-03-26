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
    // Инициализировать очередь и добавить корневой узел
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // Инициализировать список для хранения последовательности обхода
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // Извлечение из очереди
        list.add(node?._val!!)       // Сохранить значение узла
        if (node.left != null)
            queue.offer(node.left)   // Поместить левого потомка в очередь
        if (node.right != null)
            queue.offer(node.right)  // Поместить правого потомка в очередь
    }
    return list
}

/* Driver Code */
fun main() {
    /* Инициализировать двоичное дерево */
    // Здесь используется функция, которая напрямую строит двоичное дерево из списка
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nИнициализировать двоичное дерево\n")
    printTree(root)

    /* Обход по уровням */
    val list = levelOrder(root)
    println("\nПоследовательность узлов при обходе по уровням = $list")
}
