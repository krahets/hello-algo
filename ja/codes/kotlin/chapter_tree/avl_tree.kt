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

    /* ノードの高さを取得する */
    fun height(node: TreeNode?): Int {
        // 空ノードの高さは -1 、葉ノードの高さは 0
        return node?.height ?: -1
    }

    /* ノードの高さを更新する */
    private fun updateHeight(node: TreeNode?) {
        // ノードの高さは、最も高い部分木の高さ + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* 平衡係数を取得する */
    fun balanceFactor(node: TreeNode?): Int {
        // 空ノードの平衡係数は 0
        if (node == null) return 0
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right)
    }

    /* 右回転操作 */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // child を中心に node を右回転する
        child.right = node
        node.left = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 左回転操作 */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // child を中心に node を左回転する
        child.left = node
        node.right = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根ノードを返す
        return child
    }

    /* 回転操作によって、この部分木の平衡を回復する */
    private fun rotate(node: TreeNode): TreeNode {
        // ノード node の平衡係数を取得する
        val balanceFactor = balanceFactor(node)
        // 左に偏った木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node)
            } else {
                // 左回転してから右回転する
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
                // 右回転してから左回転する
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // 平衡な木なので、回転せずにそのまま返す
        return node
    }

    /* ノードを挿入する */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    private fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. 挿入位置を探してノードを挿入する */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // 重複したノードは挿入せず、そのまま戻る
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを削除する */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    private fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. ノードを探して削除する */
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
                // 子ノード数 = 0 の場合、node を削除して戻る
                if (child == null)
                    return null
                // 子ノード数 = 1 の場合、node を削除する
                else
                    node = child
            } else {
                // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根ノードを返す
        return node
    }

    /* ノードを探索する */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            cur = if (cur._val < _val)
                cur.right!!
            // 目的のノードは cur の左部分木にある
            else if (cur._val > _val)
                cur.left
            // 目的のノードが見つかったので、ループを終了する
            else
                break
        }
        // 目的のノードを返す
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nノード $_val を挿入した後の AVL 木")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nノード $_val を削除した後の AVL 木")
    printTree(tree.root)
}

/* 実行用コード */
fun main() {
    /* 空の AVL 木を初期化する */
    val avlTree = AVLTree()

    /* ノードを挿入する */
    // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
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

    /* 重複したノードを挿入する */
    testInsert(avlTree, 7)

    /* ノードを削除する */
    // ノード削除後、AVL 木がどのように平衡を保つかに注目する
    testRemove(avlTree, 8) // 次数 0 のノードを削除する
    testRemove(avlTree, 5) // 次数 1 のノードを削除する
    testRemove(avlTree, 4) // 次数 2 のノードを削除する

    /* ノードを探索する */
    val node = avlTree.search(7)
    println("\n 見つかったノードオブジェクトは $node、ノードの値 = ${node?._val}")
}