/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* двоичное дерево поиска */
class BinarySearchTree {
    // Инициализировать пустое дерево
    private var root: TreeNode? = null

    /* Получить корневой узел двоичного дерева */
    fun getRoot(): TreeNode? {
        return root
    }

    /* Найти узел */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Выполнять поиск в цикле и выйти после прохождения листового узла
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

    /* Вставить узел */
    fun insert(num: Int) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != null) {
            // Найти дублирующийся узел и сразу вернуть результат
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
        // Вставить узел
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* Удалить узел */
    fun remove(num: Int) {
        // Если дерево пусто, сразу вернуть результат
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur._val == num)
                break
            pre = cur
            // Удаляемый узел находится в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Удаляемый узел находится в левом поддереве cur
            else
                cur.left
        }
        // Если узла для удаления нет, сразу вернуть результат
        if (cur == null)
            return
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
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
                // Если удаляемый узел является корневым, заново назначить корневой узел
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
            // Заменить cur значением tmp
            cur._val = tmp._val
        }
    }
}

/* Driver Code */
fun main() {
    /* Инициализировать двоичное дерево поиска */
    val bst = BinarySearchTree()
    // Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\nИнициализированное двоичное дерево:\n")
    printTree(bst.getRoot())

    /* Найти узел */
    val node = bst.search(7)
    println("Найденный объект узла равен $node, значение узла = ${node?._val}")

    /* Вставить узел */
    bst.insert(16)
    println("\nПосле вставки узла 16 двоичное дерево имеет вид\n")
    printTree(bst.getRoot())

    /* Удалить узел */
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
