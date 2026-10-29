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

    /* 二分木の根ノードを取得する */
    fun getRoot(): TreeNode? {
        return root
    }

    /* ノードを探索する */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 目的のノードは cur の左部分木にある
            else if (cur._val > num)
                cur.left
            // 目的のノードが見つかったので、ループを終了する
            else
                break
        }
        // 目的のノードを返す
        return cur
    }

    /* ノードを挿入する */
    fun insert(num: Int) {
        // 木が空の場合、根ノードを初期化する
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // 木が空の場合、そのまま早期リターンする
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur._val == num)
                break
            pre = cur
            // 削除対象のノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 削除対象のノードは cur の左部分木にある
            else
                cur.left
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == null)
            return
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
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
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child
            }
            // 子ノード数 = 2
        } else {
            // 通りがけ順で cur の次のノードを取得する
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // ノード tmp を再帰的に削除する
            remove(tmp._val)
            // tmp で cur を上書きする
            cur._val = tmp._val
        }
    }
}

/* 実行用コード */
fun main() {
    /* 二分探索木を初期化する */
    val bst = BinarySearchTree()
    // 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初期化した二分木\n")
    printTree(bst.getRoot())

    /* ノードを探索する */
    val node = bst.search(7)
    println("見つかったノードオブジェクトは $node、ノードの値 = ${node?._val}")

    /* ノードを挿入する */
    bst.insert(16)
    println("\nノード 16 を挿入した後の二分木\n")
    printTree(bst.getRoot())

    /* ノードを削除する */
    bst.remove(1)
    println("\nノード 1 を削除した後の二分木\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\nノード 2 を削除した後の二分木\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\nノード 4 を削除した後の二分木\n")
    printTree(bst.getRoot())
}