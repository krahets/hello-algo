/**
 * File: binary_tree_bfs_test.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_tree

import std.unittest.testmacro.*
import std.unittest.*
import std.collection.ArrayList
import cangjie.utils.{TreeNode, PrintUtil}

/* Driver Code */
@Test
func binary_tree_bfs_test() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    let root = TreeNode.listToTree(ArrayList<?Int64>([1, 2, 3, 4, 5, 6, 7]))
    println("\n初始化二叉树\n")
    PrintUtil.printTree(root)

    /* 层序遍历 */
    let list = levelOrder(root)
    println("\n层序遍历的节点打印序列 = ${list}")
}
