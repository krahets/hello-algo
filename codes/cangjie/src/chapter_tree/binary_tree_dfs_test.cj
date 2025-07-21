/**
 * File: binary_tree_dfs_test.cj
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
func binary_tree_dfs_test() {
    var list = BinaryTreeDfs.list
    // 这里借助了一个从数组直接生成二叉树的函数
    let root = TreeNode.listToTree(ArrayList<?Int64>([1, 2, 3, 4, 5, 6, 7]))
    println("\n初始化二叉树\n")
    PrintUtil.printTree(root)

    /* 前序遍历 */
    list.clear()
    BinaryTreeDfs.preOrder(root)
    println("\n前序遍历的节点打印序列 = ${list}")

    /* 中序遍历 */
    list.clear()
    BinaryTreeDfs.inOrder(root)
    println("\n中序遍历的节点打印序列 = ${list}")

    /* 后序遍历 */
    list.clear()
    BinaryTreeDfs.postOrder(root)
    println("\n后序遍历的节点打印序列 = ${list}")
}
