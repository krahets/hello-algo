/**
 * File: preorder_traversal_ii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_ii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<MutableList<TreeNode>>? = null

/* Прямой обход: пример 2 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
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

    println("\nВыводим все пути от корня до узлов со значением 7")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}