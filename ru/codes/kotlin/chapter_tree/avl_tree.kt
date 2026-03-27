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
    var root: TreeNode? = null // корневой узел

    /* Получить высоту узла */
    fun height(node: TreeNode?): Int {
        // Высота пустого узла равна -1, а высота листа равна 0
        return node?.height ?: -1
    }

    /* Обновить высоту узла */
    private fun updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* Получить коэффициент баланса */
    fun balanceFactor(node: TreeNode?): Int {
        // Баланс-фактор пустого узла равен 0
        if (node == null) return 0
        // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
        return height(node.left) - height(node.right)
    }

    /* Операция правого поворота */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Используя child как опорную точку, выполнить правый поворот node
        child.right = node
        node.left = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Операция левого поворота */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Используя child как опорную точку, выполнить левый поворот node
        child.left = node
        node.right = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    private fun rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        val balanceFactor = balanceFactor(node)
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Правый поворот
                return rightRotate(node)
            } else {
                // Сначала выполнить левый поворот, затем правый
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Левый поворот
                return leftRotate(node)
            } else {
                // Сначала выполнить правый поворот, затем левый
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
        return node
    }

    /* Вставить узел */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* рекурсиявставить узел(вспомогательный метод) */
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
            return node // Дублирующийся узел не вставлять, сразу вернуть результат
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Удалить узел */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* рекурсияУдалить узел(вспомогательный метод) */
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
                // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                if (child == null)
                    return null
                // Если число дочерних узлов равно 1, сразу удалить node
                else
                    node = child
            } else {
                // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }

    /* Найти узел */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // Выполнять поиск в цикле и выйти после прохождения листового узла
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
    /* Инициализировать пустое AVL-дерево */
    val avlTree = AVLTree()

    /* Вставить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
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

    /* Вставить повторяющийся узел */
    testInsert(avlTree, 7)

    /* Удалить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(avlTree, 8) // Удалить узел степени 0
    testRemove(avlTree, 5) // Удалить узел степени 1
    testRemove(avlTree, 4) // Удалить узел степени 2

    /* Найти узел */
    val node = avlTree.search(7)
    println("\n Найденныйузелобъектравно $node, значение узла = ${node?._val}")
}
