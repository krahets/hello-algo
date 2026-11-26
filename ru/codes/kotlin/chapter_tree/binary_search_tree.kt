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
    // Инициализация пустого дерева
    private var root: TreeNode? = null

    /* Получить корень двоичного дерева */
    fun getRoot(): TreeNode? {
        return root
    }

    /* Поиск узла */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Искомый узел в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Искомый узел в левом поддереве cur
            else if (cur._val > num)
                cur.left
            // Узел найден: выйти из цикла
            else
                break
        }
        // Вернуть искомый узел
        return cur
    }

    /* Вставка узла */
    fun insert(num: Int) {
        // Если дерево пусто, создать корень
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Такой узел уже есть: завершить вызов
            if (cur._val == num)
                return
            pre = cur
            // Место вставки в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Место вставки в левом поддереве cur
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
        // Если дерево пусто, сразу завершить вызов
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Узел для удаления найден: выйти из цикла
            if (cur._val == num)
                break
            pre = cur
            // Узел для удаления в правом поддереве cur
            cur = if (cur._val < num)
                cur.right
            // Узел для удаления в левом поддереве cur
            else
                cur.left
        }
        // Если узел для удаления не найден, завершить вызов
        if (cur == null)
            return
        // Число потомков равно 0 или 1
        if (cur.left == null || cur.right == null) {
            // Если потомков нет, child = null, если потомок один, child указывает на него
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
                // Если удаляется корень, назначить новый корень
                root = child
            }
            // Число потомков равно 2
        } else {
            // Найти следующий за cur узел в порядке симметричного обхода
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Рекурсивно удалить узел tmp
            remove(tmp._val)
            // Заменить значение cur значением tmp
            cur._val = tmp._val
        }
    }
}

/* Основная программа */
fun main() {
    /* Инициализация двоичного дерева поиска */
    val bst = BinarySearchTree()
    // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\nИсходное двоичное дерево:\n")
    printTree(bst.getRoot())

    /* Поиск узла */
    val node = bst.search(7)
    println("Найденный узел: $node, значение узла = ${node?._val}")

    /* Вставка узла */
    bst.insert(16)
    println("\nДвоичное дерево после вставки узла 16:\n")
    printTree(bst.getRoot())

    /* Удаление узла */
    bst.remove(1)
    println("\nДвоичное дерево после удаления узла 1:\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nДвоичное дерево после удаления узла 2:\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nДвоичное дерево после удаления узла 4:\n")
    printTree(bst.getRoot())
}