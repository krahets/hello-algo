/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 配列表現による二分木クラス */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* リスト容量 */
    fun size(): Int {
        return tree.size
    }

    /* インデックス i のノードの値を取得 */
    fun _val(i: Int): Int? {
        // インデックスが範囲外なら、空きを表す null を返す
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* インデックス i のノードの左子ノードのインデックスを取得 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* インデックス i のノードの右子ノードのインデックスを取得 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* インデックス i のノードの親ノードのインデックスを取得 */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* レベル順走査 */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // 配列を直接走査する
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* 深さ優先探索 */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // 空きスロットなら返す
        if (_val(i) == null)
            return
        // 先行順走査
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // 中順走査
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // 後順走査
        if ("post" == order)
            res.add(_val(i))
    }

    /* 先行順走査 */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* 中順走査 */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* 後順走査 */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* Driver Code */
fun main() {
    // 二分木を初期化する
    // ここでは、リストから二分木を直接生成する関数を利用する
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\n二分木を初期化\n")
    println("二分木の配列表現：")
    println(arr)
    println("二分木の連結リスト表現：")
    printTree(root)

    // 配列表現による二分木クラス
    val abt = ArrayBinaryTree(arr)

    // ノードにアクセス
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("現在のノードのインデックスは $i 、値は ${abt._val(i)}")
    println("左の子ノードのインデックスは $l 、値は ${abt._val(l)}")
    println("右の子ノードのインデックスは $r 、値は ${abt._val(r)}")
    println("親ノードのインデックスは $p 、値は ${abt._val(p)}")

    // 木を走査
    var res = abt.levelOrder()
    println("\nレベル順走査：$res")
    res = abt.preOrder()
    println("先行順走査：$res")
    res = abt.inOrder()
    println("中間順走査：$res")
    res = abt.postOrder()
    println("後行順走査：$res")
}