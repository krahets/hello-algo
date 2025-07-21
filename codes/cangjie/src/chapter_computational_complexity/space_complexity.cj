/**
 * File: space_complexity.cj
 * Created Time: 2025-06-22
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import cangjie.utils.{ListNode, TreeNode}
import std.collection.{ArrayList, HashMap}

public class SpaceComplexity {
    /* 函数 */
    static func function(): Int64 {
        // 执行某些操作
        return 0
    }

    /* 常数阶 */
    static func constant(n: Int64): Unit {
        // 常量、变量、对象占用 O(1) 空间
        let a = 0
        var b = 0
        let nums = Array<Int64>(10000, repeat: 0)
        let node = ListNode(0)
        // 循环中的变量占用 O(1) 空间
        for (i in 0..n) {
            var c = 0
        }
        // 循环中的函数占用 O(1) 空间
        for (i in 0..n) {
            function()
        }
    }

    /* 线性阶 */
    static func linear(n: Int64): Unit {
        // 长度为 n 的数组占用 O(n) 空间
        let nums = Array<Int64>(n, repeat: 0)
        // 长度为 n 的列表占用 O(n) 空间
        let nodes = ArrayList<ListNode>()
        for (i in -0..n) {
            nodes.add(ListNode(i))
        }
        // 长度为 n 的哈希表占用 O(n) 空间
        let map = HashMap<Int64, String>()
        for (i in 0..n) {
            map.add(i, "${i}")
        }
    }

    /* 线性阶（递归实现） */
    static func linearRecur(n: Int64): Unit {
        println("递归 n = ${n}")
        if (n == 1) {
            return
        }
        linearRecur(n - 1)
    }

    /* 平方阶 */
    static func quadratic(n: Int64): Unit {
        // 矩阵占用 O(n^2) 空间
        let numMatrix = Array<Array<Int64>>(n, {i => Array<Int64>(n, repeat: 0)})
        // 二维列表占用 O(n^2) 空间
        let numList = ArrayList<ArrayList<Int64>>()
        for (i in 0..n) {
            let tmp = ArrayList<Int64>()
            for (j in 0..n) {
                tmp.add(0)
            }
            numList.add(tmp)
        }
    }

    /* 平方阶（递归实现） */
    static func quadraticRecur(n: Int64): Int64 {
        if (n <= 0) {
            return 0
        }
        // 数组 nums 长度为 n, n-1, ..., 2, 1
        let nums = Array<Int64>(n, repeat: 0)
        println("递归 n = ${n} 中的 nums 长度 = ${nums.size}")
        return quadraticRecur(n - 1)
    }

    /* 指数阶（建立满二叉树） */
    static func buildTree(n: Int64): ?TreeNode {
        if (n == 0) {
            return None
        }
        let root = TreeNode(0)
        root.left = buildTree(n - 1)
        root.right = buildTree(n - 1)
        return root
    }
}
