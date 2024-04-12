/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 数组表示下的二叉树类 */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* 列表容量 */
    fun size(): Int {
        return tree.size
    }

    /* 获取索引为 i 节点的值 */
    fun _val(i: Int): Int? {
        // 若索引越界，则返回 null ，代表空位
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* 层序遍历 */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // 直接遍历数组
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* 深度优先遍历 */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // 若为空位，则返回
        if (_val(i) == null)
            return
        // 前序遍历
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // 中序遍历
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // 后序遍历
        if ("post" == order)
            res.add(_val(i))
    }

    /* 前序遍历 */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* 中序遍历 */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* 后序遍历 */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* Driver Code */
fun main() {
    // 初始化二叉树
    // 这里借助了一个从列表直接生成二叉树的函数
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\n初始化二叉树\n")
    println("二叉树的数组表示：")
    println(arr)
    println("二叉树的链表表示：")
    printTree(root)

    // 数组表示下的二叉树类
    val abt = ArrayBinaryTree(arr)

    // 访问节点
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("当前节点的索引为 $i ，值为 ${abt._val(i)}")
    println("其左子节点的索引为 $l ，值为 ${abt._val(l)}")
    println("其右子节点的索引为 $r ，值为 ${abt._val(r)}")
    println("其父节点的索引为 $p ，值为 ${abt._val(p)}")

    // 遍历树
    var res = abt.levelOrder()
    println("\n层序遍历为：$res")
    res = abt.preOrder()
    println("前序遍历为：$res")
    res = abt.inOrder()
    println("中序遍历为：$res")
    res = abt.postOrder()
    println("后序遍历为：$res")
}