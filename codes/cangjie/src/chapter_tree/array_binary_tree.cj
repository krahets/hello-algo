/**
 * File: array_binary_tree.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_tree

import std.collection.ArrayList

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
    private var tree: ArrayList<?Int64>

    /* 构造方法 */
    public init(arr: Collection<?Int64>) {
        tree = ArrayList<?Int64>(arr)
    }

    /* 列表容量 */
    public prop size: Int64 {
        get() {
            tree.size
        }
    }

    /* 获取索引为 i 节点的值 */
    public func val(i: Int64): ?Int64 {
        // 若索引越界，则返回 null ，代表空位
        if (i < 0 || i >= size) {
            return None
        }
        tree.get(i) ?? None
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    public func left(i: Int64): Int64 {
        2 * i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    public func right(i: Int64): Int64 {
        2 * i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    public func parent(i: Int64): Int64 {
        (i - 1) / 2
    }

    /* 层序遍历 */
    public func levelOrder(): ArrayList<Int64> {
        let res = ArrayList<Int64>(0)
        // 直接遍历数组
        for (i in 0..size) {
            if (let Some(v) <- val(i)) {
                res.add(v)
            }
        }
        return res
    }

    /* 深度优先遍历 */
    private func dfs(i: Int64, order: String, res: ArrayList<Int64>): Unit {
        if (let Some(v) <- val(i)) {
            // 前序遍历
            if ("pre" == order) {
                res.add(v)
            }
            dfs(left(i), order, res)
            // 中序遍历
            if ("in" == order) {
                res.add(v)
            }
            dfs(right(i), order, res)
            // 后序遍历
            if ("post" == order) {
                res.add(v)
            }
        } else { // 若为空位，则返回
            return
        }
    }

    /* 前序遍历 */
    public func preOrder(): ArrayList<Int64> {
        let res = ArrayList<Int64>()
        dfs(0, "pre", res)
        return res
    }

    /* 中序遍历 */
    public func inOrder(): ArrayList<Int64> {
        let res = ArrayList<Int64>()
        dfs(0, "in", res)
        return res
    }

    /* 后序遍历 */
    public func postOrder(): ArrayList<Int64> {
        let res = ArrayList<Int64>()
        dfs(0, "post", res)
        return res
    }
}
