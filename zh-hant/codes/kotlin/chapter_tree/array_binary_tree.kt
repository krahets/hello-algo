/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 陣列表示下的二元樹類別 */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* 串列容量 */
    fun size(): Int {
        return tree.size
    }

    /* 獲取索引為 i 節點的值 */
    fun _val(i: Int): Int? {
        // 若索引越界，則返回 null ，代表空位
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 獲取索引為 i 節點的父節點的索引 */
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
        // 若為空位，則返回
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

/* Driver Code */
fun main() {
    // 初始化二元樹
    // 這裡藉助了一個從串列直接生成二元樹的函式
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\n初始化二元樹\n")
    println("二元樹的陣列表示：")
    println(arr)
    println("二元樹的鏈結串列表示：")
    printTree(root)

    // 陣列表示下的二元樹類別
    val abt = ArrayBinaryTree(arr)

    // 訪問節點
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("當前節點的索引為 $i ，值為 ${abt._val(i)}")
    println("其左子節點的索引為 $l ，值為 ${abt._val(l)}")
    println("其右子節點的索引為 $r ，值為 ${abt._val(r)}")
    println("其父節點的索引為 $p ，值為 ${abt._val(p)}")

    // 走訪樹
    var res = abt.levelOrder()
    println("\n層序走訪為：$res")
    res = abt.preOrder()
    println("前序走訪為：$res")
    res = abt.inOrder()
    println("中序走訪為：$res")
    res = abt.postOrder()
    println("後序走訪為：$res")
}