/**
 * File: avl_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import kotlin.math.max

/* AVL 木 */
class AVLTree {
    var root: TreeNode? = null // 根ノード

    /* ノードの高さを取得 */
    fun height(node: TreeNode?): Int {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node?.height ?: -1
    }

    /* ノードの高さを更新する */
    private fun updateHeight(node: TreeNode?) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* 平衡係数を取得 */
    fun balanceFactor(node: TreeNode?): Int {
        // 空ノードの平衡係数は 0
        if (node == null) return 0
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right)
    }

    /* 右回転 */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // child を支点として node を右回転させる
        child.right = node
        node.left = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 左回転 */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // child を支点として node を左回転させる
        child.left = node
        node.right = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 回転操作を行い、この部分木の平衡を回復する */
    private fun rotate(node: TreeNode): TreeNode {
        // ノード node の平衡係数を取得
        val balanceFactor = balanceFactor(node)
        // 左に偏った木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node)
            } else {
                // 左回転してから右回転
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node)
            } else {
                // 右回転してから左回転
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node
    }

    /* ノードを挿入 */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. 挿入位置を探索してノードを挿入 */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // 重複ノードは挿入せず、そのまま返す
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを削除 */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. ノードを探索して削除 */
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
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == null)
                    return null
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else
                    node = child
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを探索 */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            cur = if (cur._val < _val)
                cur.right!!
            // 目標ノードは cur の左部分木にある
            else if (cur._val > _val)
                cur.left
            // 目標ノードが見つかったらループを抜ける
            else
                break
        }
        // 目標ノードを返す
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nノード $_val を挿入後、AVL 木は")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nノード $_val を削除後、AVL 木は")
    printTree(tree.root)
}

/* Driver Code */
fun main() {
    /* 空の AVL 木を初期化する */
    val avlTree = AVLTree()

    /* ノードを挿入 */
    // ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

    /* 重複ノードを挿入する */
    testInsert(avlTree, 7)

    /* ノードを削除 */
    // ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
    testRemove(avlTree, 8) // 次数 0 のノードを削除する
    testRemove(avlTree, 5) // 次数 1 のノードを削除する
    testRemove(avlTree, 4) // 次数 2 のノードを削除する

    /* ノードを検索 */
    val node = avlTree.search(7)
    println("\n 見つかったノードオブジェクトは $node、ノードの値 = ${node?._val}")
}