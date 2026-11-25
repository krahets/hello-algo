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
        // 空のノードの高さは -1、葉の高さは 0
        return node?.height ?: -1
    }

    /* ノードの高さを更新する */
    private fun updateHeight(node: TreeNode?) {
        // ノードの高さは、左右の部分木の高さの最大値 + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }

    /* 平衡係数を取得する */
    fun balanceFactor(node: TreeNode?): Int {
        // 空のノードの平衡係数は 0
        if (node == null) return 0
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right)
    }

    /* 右回転 */
    private fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // child を軸に node を右回転する
        child.right = node
        node.left = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根を返す
        return child
    }

    /* 左回転 */
    private fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // child を軸に node を左回転する
        child.left = node
        node.right = grandChild
        // ノードの高さを更新する
        updateHeight(node)
        updateHeight(child)
        // 回転後の部分木の根を返す
        return child
    }

    /* 回転して部分木の平衡を回復する */
    private fun rotate(node: TreeNode): TreeNode {
        // ノード node の平衡係数を取得する
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
        // 平衡なので回転せずに戻る
        return node
    }

    /* ノードを挿入する */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* 再帰によるノードの挿入（補助メソッド） */
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
            return node // 値が重複する場合は挿入せずに戻る
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転して部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根を返す
        return node
    }

    /* ノードを削除する */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* 再帰によるノードの削除（補助メソッド） */
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
                // 子が 0 個なら node を削除して戻る
                if (child == null)
                    return null
                // 子が 1 個なら node を削除する
                else
                    node = child
            } else {
                // 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // ノードの高さを更新する
        /* 2. 回転して部分木の平衡を回復する */
        node = rotate(node)
        // 部分木の根を返す
        return node
    }

    /* ノードを探索する */
    fun search(_val: Int): TreeNode? {
        var cur = root
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            cur = if (cur._val < _val)
                cur.right!!
            // 目的のノードは cur の左部分木にある
            else if (cur._val > _val)
                cur.left
            // 目的のノードが見つかったのでループを抜ける
            else
                break
        }
        // 目的のノードを返す
        return cur
    }
}

fun testInsert(tree: AVLTree, _val: Int) {
    tree.insert(_val)
    println("\nノード $_val を挿入した後の AVL 木：")
    printTree(tree.root)
}

fun testRemove(tree: AVLTree, _val: Int) {
    tree.remove(_val)
    println("\nノード $_val を削除した後の AVL 木：")
    printTree(tree.root)
}

/* 実行例 */
fun main() {
    /* 空の AVL 木を初期化する */
    val avlTree = AVLTree()

    /* ノードを挿入する */
    // 挿入後に AVL 木がどのように平衡を保つかに注目
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

    /* 重複するノードを挿入する */
    testInsert(avlTree, 7)

    /* ノードを削除する */
    // 削除後に AVL 木がどのように平衡を保つかに注目
    testRemove(avlTree, 8) // 子が 0 個のノードを削除する
    testRemove(avlTree, 5) // 子が 1 個のノードを削除する
    testRemove(avlTree, 4) // 子が 2 個のノードを削除する

    /* ノードを検索する */
    val node = avlTree.search(7)
    println("\n 見つかったノードのオブジェクト：$node、値 = ${node?._val}")
}