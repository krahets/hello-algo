/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* AVL 树 */
class AVLTree {
    var root: TreeNode? = null // 根节点

    /* 获取节点高度 */
    fun height(node: TreeNode?): Int {
        // 空节点高度为 -1 ，叶节点高度为 0
        return node?.height ?: -1
    }

    /* 更新节点高度 */
    private fun updateHeight(node: TreeNode?) {
        // 节点高度等于最高子树高度 + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* 获取平衡因子 */
    fun balanceFactor(node: TreeNode?): Int {
        // 空节点平衡因子为 0
        if (node == null) return 0
        // 节点平衡因子 = 左子树高度 - 右子树高度
        return height(node.left) - height(node.right)
    }

    /* 右旋操作 */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // 以 child 为原点，将 node 向右旋转
        child.right = node
        node.left = grandChild
        // 更新节点高度
        updateHeight(node)
        updateHeight(child)
        // 返回旋转后子树的根节点
        return child
    }

    /* 左旋操作 */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // 以 child 为原点，将 node 向左旋转
        child.left = node
        node.right = grandChild
        // 更新节点高度
        updateHeight(node)
        updateHeight(child)
        // 返回旋转后子树的根节点
        return child
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    private fun rotate(node: TreeNode): TreeNode {
        // 获取节点 node 的平衡因子
        val balanceFactor = balanceFactor(node)
        // 左偏树
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右旋
                return rightRotate(node)
            } else {
                // 先左旋后右旋
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // 右偏树
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左旋
                return leftRotate(node)
            } else {
                // 先右旋后左旋
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // 平衡树，无须旋转，直接返回
        return node
    }

    /* 插入节点 */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* 递归插入节点（辅助方法） */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. 查找插入位置并插入节点 */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // 重复节点不插入，直接返回
        updateHeight(node) // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node)
        // 返回子树的根节点
        return node
    }

    /* 删除节点 */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* 递归删除节点（辅助方法） */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. 查找节点并删除 */
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
                // 子节点数量 = 0 ，直接删除 node 并返回
                if (child == null)
                    return null
                // 子节点数量 = 1 ，直接删除 node
                else
                    node = child
            } else {
                // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node)
        // 返回子树的根节点
        return node
    }

    /* 查找节点 */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            cur = if (cur._val < _val)
                cur.right!!
            // 目标节点在 cur 的左子树中
            else if (cur._val > _val)
                cur.left
            // 找到目标节点，跳出循环
            else
                break
        }
        // 返回目标节点
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\n插入节点 $_val 后，AVL 树为")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\n删除节点 $_val 后，AVL 树为")
    printTree(tree.root)
}

/* Driver Code */
fun main() {
    /* 初始化空 AVL 树 */
    val avlTree = AVLTree()

    /* 插入节点 */
    // 请关注插入节点后，AVL 树是如何保持平衡的
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

    /* 插入重复节点 */
    testInsert(avlTree, 7)

    /* 删除节点 */
    // 请关注删除节点后，AVL 树是如何保持平衡的
    testRemove(avlTree, 8) // 删除度为 0 的节点
    testRemove(avlTree, 5) // 删除度为 1 的节点
    testRemove(avlTree, 4) // 删除度为 2 的节点

    /* 查询节点 */
    val node = avlTree.search(7)
    println("\n 查找到的节点对象为 $node，节点值 = ${node?._val}")
}