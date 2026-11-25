/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* АВЛ-дерево */
class AVLTree {
    var root: TreeNode? = null // Корень

    /* Получить высоту узла */
    fun height(node: TreeNode?): Int {
        // Высота пустого узла равна -1, высота листа равна 0
        return node?.height ?: -1
    }

    /* Обновить высоту узла */
    private fun updateHeight(node: TreeNode?) {
        // Высота узла на 1 больше высоты самого высокого поддерева
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    fun balanceFactor(node: TreeNode?): Int {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0
        // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return height(node.left) - height(node.right)
    }

    /* Правый поворот */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Повернуть node вправо вокруг child
        child.right = node
        node.left = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корень поддерева после поворота
        return child
    }

    /* Левый поворот */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Повернуть node влево вокруг child
        child.left = node
        node.right = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корень поддерева после поворота
        return child
    }

    /* Выполнить поворот, чтобы восстановить баланс поддерева */
    private fun rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        val balanceFactor = balanceFactor(node)
        // Перевес влево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Поворот вправо
                return rightRotate(node)
            } else {
                // Сначала поворот влево, затем вправо
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Перевес вправо
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Поворот влево
                return leftRotate(node)
            } else {
                // Сначала поворот вправо, затем влево
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Дерево сбалансировано: завершить вызов без поворота
        return node
    }

    /* Вставка узла */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Найти место вставки и вставить узел */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Такой узел уже есть: завершить вызов без вставки
        updateHeight(node) // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node)
        // Вернуть корень поддерева
        return node
    }

    /* Удаление узла */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Найти и удалить узел */
        if (_val < node._val)
            node.left = removeHelper(node.left, _val)
        else if (_val > node._val)
            node.right = removeHelper(node.right, _val)
        else {
            if (node.left == null || node.right == null) {
                val child = if (node.left != null)
                    node.left
                else
                    node.right
                // Нет потомков: удалить node и завершить вызов
                if (child == null)
                    return null
                // Один потомок: удалить node
                else
                    node = child
            } else {
                // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node)
        // Вернуть корень поддерева
        return node
    }

    /* Поиск узла */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Искомый узел в правом поддереве cur
            cur = if (cur._val < _val)
                cur.right!!
            // Искомый узел в левом поддереве cur
            else if (cur._val > _val)
                cur.left
            // Узел найден: выйти из цикла
            else
                break
        }
        // Вернуть искомый узел
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nАВЛ-дерево после вставки узла $_val:")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nАВЛ-дерево после удаления узла $_val:")
    printTree(tree.root)
}

/* Основная программа */
fun main() {
    /* Инициализация пустого АВЛ-дерева */
    val avlTree = AVLTree()

    /* Вставка узла */
    // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
    testInsert(avlTree, 1)
    testInsert(avlTree, 2)
    testInsert(avlTree, 3)
    testInsert(avlTree, 4)
    testInsert(avlTree, 5)
    testInsert(avlTree, 8)
    testInsert(avlTree, 7)
    testInsert(avlTree, 9)
    testInsert(avlTree, 10)
    testInsert(avlTree, 6)

    /* Вставка повторяющегося узла */
    testInsert(avlTree, 7)

    /* Удаление узла */
    // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
    testRemove(avlTree, 8) // Удаление узла без потомков
    testRemove(avlTree, 5) // Удаление узла с одним потомком
    testRemove(avlTree, 4) // Удаление узла с двумя потомками

    /* Поиск узла */
    val node = avlTree.search(7)
    println("\nНайденный узел: $node, значение узла = ${node?._val}")
}