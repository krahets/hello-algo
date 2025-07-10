/**
 * File: tree_node.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.utils

import std.collection.ArrayList

/* 二叉树节点类 */
public class TreeNode {
    public var val: ?Int64 // 节点值
    public var height: Int64 // 节点高度
    public var left: ?TreeNode // 左子节点引用
    public var right: ?TreeNode // 右子节点引用

    /* 构造方法 */
    public init(x: ?Int64) {
        val = x
        this.height = 0
        left = None
        right = None
    }

    // 序列化编码规则请参考：
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二叉树的数组表示：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二叉树的链表表示：
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* 将列表反序列化为二叉树：递归 */
    private static func listToTreeDFS(list: ArrayList<?Int64>, i: Int64): ?TreeNode {
        if (i < 0 || i >= list.size || list.get(i) == None) {
            return None
        }
        let root = TreeNode(list.get(i) ?? None)
        root.left = listToTreeDFS(list, 2 * i + 1)
        root.right = listToTreeDFS(list, 2 * i + 2)
        return root
    }

    /* 将列表反序列化为二叉树 */
    public static func listToTree(list: ArrayList<?Int64>): ?TreeNode {
        return listToTreeDFS(list, 0)
    }

    /* 将二叉树序列化为列表：递归 */
    private static func treeToListDFS(root: ?TreeNode, i: Int64, res: ArrayList<?Int64>): Unit {
        ifNone(root, {=> return ()})
        while (i >= res.size) {
            res.append(None)
        }
        res.set(i, root?.val ?? None)
        treeToListDFS(root?.left ?? None, 2 * i + 1, res)
        treeToListDFS(root?.right ?? None, 2 * i + 2, res)
    }

    /* 将二叉树序列化为列表 */
    public static func treeToList(root: ?TreeNode): ArrayList<?Int64> {
        let res = ArrayList<?Int64>()
        treeToListDFS(root, 0, res)
        return res
    }
}
