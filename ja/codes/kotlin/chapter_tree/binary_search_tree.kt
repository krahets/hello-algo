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

    /* 二分木の根ノードを取得 */
    fun getRoot(): TreeNode? {
        return root
    }

    /* ノードを探索 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 目標ノードは cur の左部分木にある
            else if (cur._val > num)
                cur.left
            // 目標ノードが見つかったらループを抜ける
            else
                break
        }
        // 目標ノードを返す
        return cur
    }

    /* ノードを挿入 */
    fun insert(num: Int) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 重複ノードが見つかったら、直ちに返す
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
        // ノードを挿入
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* ノードを削除 */
    fun remove(num: Int) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur._val == num)
                break
            pre = cur
            // 削除対象ノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 削除対象ノードは cur の左部分木にある
            else
                cur.left
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == null)
            return
        // 子ノード数 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
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
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child
            }
            // 子ノード数 = 2
        } else {
            // 中順走査における cur の次ノードを取得
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // ノード tmp を再帰的に削除
            remove(tmp._val)
            // tmp で cur を上書きする
            cur._val = tmp._val
        }
    }
}

/* Driver Code */
fun main() {
    /* 二分探索木を初期化 */
    val bst = BinarySearchTree()
    // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初期化した二分木は\n")
    printTree(bst.getRoot())

    /* ノードを探索 */
    val node = bst.search(7)
    println("見つかったノードオブジェクトは $node、ノードの値 = ${node?._val}")

    /* ノードを挿入 */
    bst.insert(16)
    println("\nノード 16 を挿入後、二分木は\n")
    printTree(bst.getRoot())

    /* ノードを削除 */
    bst.remove(1)
    println("\nノード 1 を削除後、二分木は\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nノード 2 を削除後、二分木は\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nノード 4 を削除後、二分木は\n")
    printTree(bst.getRoot())
}