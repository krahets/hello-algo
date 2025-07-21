/**
 * File: binary_tree_test.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_tree

import std.unittest.testmacro.*
import std.unittest.*
import cangjie.utils.{TreeNode, PrintUtil}

/* Driver Code */
@Test
func binary_tree_test() {
    /* 初始化二叉树 */
    // 初始化节点
    let n1 = TreeNode(1)
    let n2 = TreeNode(2)
    let n3 = TreeNode(3)
    let n4 = TreeNode(4)
    let n5 = TreeNode(5)
    // 构建节点之间的引用（指针）
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\n初始化二叉树\n");
    PrintUtil.printTree(n1)

    /* 插入与删除节点 */
    let p = TreeNode(0)
    // 在 n1 -> n2 中间插入节点 p
    n1.left = p
    p.left = n2
    println("\n插入节点 P 后\n")
    PrintUtil.printTree(n1)
    // 删除节点 P
    n1.left = n2
    println("\n删除节点 P 后\n")
    PrintUtil.printTree(n1)
}
