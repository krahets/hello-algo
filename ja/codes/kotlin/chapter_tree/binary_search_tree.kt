/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 二分探索木 */
class BinarySearchTree {
    // 空の木を初期化する
    private var root: TreeNode? = null

    /* 二分木の根を取得する */
    fun getRoot(): TreeNode? {
        return root
    }

    /* ノードを探索する */
    fun search(num: Int): TreeNode? {
        var cur = root
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 目的のノードは cur の左部分木にある
            else if (cur._val > num)
                cur.left
            // 目的のノードが見つかったのでループを抜ける
            else
                break
        }
        // 目的のノードを返す
        return cur
    }

    /* ノードを挿入する */
    fun insert(num: Int) {
        // 木が空なら根を初期化する
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 値が重複するノードが見つかったらそのまま戻る
            if (cur._val == num)
                return
            pre = cur
            // 挿入位置は cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 挿入位置は cur の左部分木にある
            else
                cur.left
        }
        // ノードを挿入する
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* ノードを削除する */
    fun remove(num: Int) {
        // 木が空ならすぐに戻る
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったのでループを抜ける
            if (cur._val == num)
                break
            pre = cur
            // 削除対象は cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 削除対象は cur の左部分木にある
            else
                cur.left
        }
        // 削除対象が見つからなければそのまま戻る
        if (cur == null)
            return
        // 子が 0 個または 1 個
        if (cur.left == null || cur.right == null) {
            // 子が 0 個なら child = null、1 個なら child はその子
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // ノード cur を削除する
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 削除対象が根なら根を設定し直す
                root = child
            }
            // 子が 2 個
        } else {
            // 通りがけ順で cur の次に来るノードを取得する
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // ノード tmp を再帰的に削除する
            remove(tmp._val)
            // tmp の値で cur の値を上書きする
            cur._val = tmp._val
        }
    }
}

/* 実行例 */
fun main() {
    /* 二分探索木を初期化する */
    val bst = BinarySearchTree()
    // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初期化した二分木：\n")
    printTree(bst.getRoot())

    /* ノードを探索する */
    val node = bst.search(7)
    println("見つかったノードのオブジェクト：$node、値 = ${node?._val}")

    /* ノードを挿入する */
    bst.insert(16)
    println("\nノード 16 を挿入した後の二分木：\n")
    printTree(bst.getRoot())

    /* ノードを削除する */
    bst.remove(1)
    println("\nノード 1 を削除した後の二分木：\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nノード 2 を削除した後の二分木：\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nノード 4 を削除した後の二分木：\n")
    printTree(bst.getRoot())
}