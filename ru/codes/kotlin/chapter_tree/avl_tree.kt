/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* AVL-дерево */
class AVLTree {
    var root: TreeNode? = null // Корневой узел

    /* Получить высоту узла */
    fun height(node: TreeNode?): Int {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node?.height ?: -1
    }

    /* Обновить высоту узла */
    private fun updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    fun balanceFactor(node: TreeNode?): Int {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node.left) - height(node.right)
    }

    /* Операция правого вращения */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Выполнить правое вращение узла node вокруг child
        child.right = node
        node.left = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Операция левого вращения */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Выполнить левое вращение узла node вокруг child
        child.left = node
        node.right = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    private fun rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        val balanceFactor = balanceFactor(node)
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Правое вращение
                return rightRotate(node)
            } else {
                // Сначала левое вращение, затем правое
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Левое вращение
                return leftRotate(node)
            } else {
                // Сначала правое вращение, затем левое
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
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
        /* 1. Найти позицию вставки и вставить узел */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Повторяющийся узел не вставлять, сразу вернуть
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Удаление узла */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Найти узел и удалить его */
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
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Поиск узла */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            cur = if (cur._val < _val)
                cur.right!!
            // Целевой узел находится в левом поддереве cur
            else if (cur._val > _val)
                cur.left
            // Найти целевой узел и выйти из цикла
            else
                break
        }
        // Вернуть целевой узел
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nПосле вставки узла $_val AVL-дерево имеет вид")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nПосле удаления узла $_val AVL-дерево имеет вид")
    printTree(tree.root)
}

/* Driver Code */
fun main() {
    /* Инициализация пустого AVL-дерева */
    val avlTree = AVLTree()

    /* Вставка узла */
    // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
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
    // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(avlTree, 8) // Удаление узла степени 0
    testRemove(avlTree, 5) // Удаление узла степени 1
    testRemove(avlTree, 4) // Удаление узла степени 2

    /* Поиск узла */
    val node = avlTree.search(7)
    println("\nНайденный объект узла = $node, значение узла = ${node?._val}")
}