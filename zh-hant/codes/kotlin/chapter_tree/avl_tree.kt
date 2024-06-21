/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* AVL 樹 */
class AVLTree {
    var root: TreeNode? = null // 根節點

    /* 獲取節點高度 */
    fun height(node: TreeNode?): Int {
        // 空節點高度為 -1 ，葉節點高度為 0
        return node?.height ?: -1
    }

    /* 更新節點高度 */
    private fun updateHeight(node: TreeNode?) {
        // 節點高度等於最高子樹高度 + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* 獲取平衡因子 */
    fun balanceFactor(node: TreeNode?): Int {
        // 空節點平衡因子為 0
        if (node == null) return 0
        // 節點平衡因子 = 左子樹高度 - 右子樹高度
        return height(node.left) - height(node.right)
    }

    /* 右旋操作 */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // 以 child 為原點，將 node 向右旋轉
        child.right = node
        node.left = grandChild
        // 更新節點高度
        updateHeight(node)
        updateHeight(child)
        // 返回旋轉後子樹的根節點
        return child
    }

    /* 左旋操作 */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // 以 child 為原點，將 node 向左旋轉
        child.left = node
        node.right = grandChild
        // 更新節點高度
        updateHeight(node)
        updateHeight(child)
        // 返回旋轉後子樹的根節點
        return child
    }

    /* 執行旋轉操作，使該子樹重新恢復平衡 */
    private fun rotate(node: TreeNode): TreeNode {
        // 獲取節點 node 的平衡因子
        val balanceFactor = balanceFactor(node)
        // 左偏樹
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右旋
                return rightRotate(node)
            } else {
                // 先左旋後右旋
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // 右偏樹
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左旋
                return leftRotate(node)
            } else {
                // 先右旋後左旋
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // 平衡樹，無須旋轉，直接返回
        return node
    }

    /* 插入節點 */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* 遞迴插入節點（輔助方法） */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. 查詢插入位置並插入節點 */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // 重複節點不插入，直接返回
        updateHeight(node) // 更新節點高度
        /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
        node = rotate(node)
        // 返回子樹的根節點
        return node
    }

    /* 刪除節點 */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* 遞迴刪除節點（輔助方法） */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. 查詢節點並刪除 */
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
                // 子節點數量 = 0 ，直接刪除 node 並返回
                if (child == null)
                    return null
                // 子節點數量 = 1 ，直接刪除 node
                else
                    node = child
            } else {
                // 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // 更新節點高度
        /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
        node = rotate(node)
        // 返回子樹的根節點
        return node
    }

    /* 查詢節點 */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            cur = if (cur._val < _val)
                cur.right!!
            // 目標節點在 cur 的左子樹中
            else if (cur._val > _val)
                cur.left
            // 找到目標節點，跳出迴圈
            else
                break
        }
        // 返回目標節點
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\n插入節點 $_val 後，AVL 樹為")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\n刪除節點 $_val 後，AVL 樹為")
    printTree(tree.root)
}

/* Driver Code */
fun main() {
    /* 初始化空 AVL 樹 */
    val avlTree = AVLTree()

    /* 插入節點 */
    // 請關注插入節點後，AVL 樹是如何保持平衡的
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

    /* 插入重複節點 */
    testInsert(avlTree, 7)

    /* 刪除節點 */
    // 請關注刪除節點後，AVL 樹是如何保持平衡的
    testRemove(avlTree, 8) // 刪除度為 0 的節點
    testRemove(avlTree, 5) // 刪除度為 1 的節點
    testRemove(avlTree, 4) // 刪除度為 2 的節點

    /* 查詢節點 */
    val node = avlTree.search(7)
    println("\n 查詢到的節點物件為 $node，節點值 = ${node?._val}")
}