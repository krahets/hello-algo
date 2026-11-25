/**
 * File: preorder_traversal_iii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<MutableList<TreeNode>>? = null

/* Прямой обход: пример 3 */
fun preOrder(root: TreeNode?) {
    // Отсечение
    if (root == null || root._val == 3) {
        return
    }
    // Пробуем вариант
    path!!.add(root)
    if (root._val == 7) {
        // Сохраняем решение
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // Возврат
    path!!.removeAt(path!!.size - 1)
}

/* Основная программа */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nСоздаём двоичное дерево")
    printTree(root)

    // Прямой обход
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}