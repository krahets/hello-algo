/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Двоичное дерево поиска */
class BinarySearchTree {
    // Инициализировать пустое дерево
    private var root: TreeNode? = null

    /* Получить корневой узел двоичного дерева */
    fun getRoot(): TreeNode? {
        return root
    }

    /* Поиск узла */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Целевой узел находится в левом поддереве cur
            else if (cur._val > num)
                cur.left
            // Найти целевой узел и выйти из цикла
            else
                break
        }
        // Вернуть целевой узел
        return cur
    }

    /* Вставка узла */
    fun insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur._val == num)
                return
            pre = cur
            // Позиция вставки находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Позиция вставки находится в левом поддереве cur
            else
                cur.left
        }
        // Вставка узла
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* Удаление узла */
    fun remove(num: Int) {
        // Если дерево пусто, сразу вернуть
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur._val == num)
                break
            pre = cur
            // Узел для удаления находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Узел для удаления находится в левом поддереве cur
            else
                cur.left
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == null)
            return
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Удалить узел cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child
            }
            // Число дочерних узлов = 2
        } else {
            // Получить следующий узел после cur в симметричном обходе
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Рекурсивно удалить узел tmp
            remove(tmp._val)
            // Перезаписать cur значением tmp
            cur._val = tmp._val
        }
    }
}

/* Driver Code */
fun main() {
    /* Инициализация двоичного дерева поиска */
    val bst = BinarySearchTree()
    // Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\nИсходное двоичное дерево\n")
    printTree(bst.getRoot())

    /* Поиск узла */
    val node = bst.search(7)
    println("Найденный объект узла = $node, значение узла = ${node?._val}")

    /* Вставка узла */
    bst.insert(16)
    println("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
    printTree(bst.getRoot())

    /* Удаление узла */
    bst.remove(1)
    println("\nПосле удаления узла 1 двоичное дерево имеет вид\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nПосле удаления узла 2 двоичное дерево имеет вид\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nПосле удаления узла 4 двоичное дерево имеет вид\n")
    printTree(bst.getRoot())
}