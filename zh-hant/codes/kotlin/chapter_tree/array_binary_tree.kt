/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 以陣列表示二元樹的類別 */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* 串列長度 */
    fun size(): Int {
        return tree.size
    }

    /* 取得索引 i 處的節點值 */
    fun _val(i: Int): Int? {
        // 若索引超出範圍，回傳 null 表示空位
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* 取得索引 i 處節點的左子節點索引 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 取得索引 i 處節點的右子節點索引 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 取得索引 i 處節點的父節點索引 */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* 層序走訪 */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // 直接走訪陣列
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* 深度優先走訪 */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // 若為空位，直接返回
        if (_val(i) == null)
            return
        // 前序走訪
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // 中序走訪
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // 後序走訪
        if ("post" == order)
            res.add(_val(i))
    }

    /* 前序走訪 */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* 中序走訪 */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* 後序走訪 */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* 主程式 */
fun main() {
    // 初始化二元樹
    // 這裡使用能從串列直接建立二元樹的函式
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\n初始化二元樹\n")
    println("二元樹的陣列表示法：")
    println(arr)
    println("二元樹的鏈結串列表示法：")
    printTree(root)

    // 以陣列表示二元樹的類別
    val abt = ArrayBinaryTree(arr)

    // 存取節點
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("目前節點的索引為 $i，值為 ${abt._val(i)}")
    println("其左子節點的索引為 $l，值為 ${abt._val(l)}")
    println("其右子節點的索引為 $r，值為 ${abt._val(r)}")
    println("其父節點的索引為 $p，值為 ${abt._val(p)}")

    // 走訪樹
    var res = abt.levelOrder()
    println("\n層序走訪的結果：$res")
    res = abt.preOrder()
    println("前序走訪的結果：$res")
    res = abt.inOrder()
    println("中序走訪的結果：$res")
    res = abt.postOrder()
    println("後序走訪的結果：$res")
}