/**
 * File: binary_search_tree_test.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_tree

import std.unittest.testmacro.*
import std.unittest.*
import cangjie.utils.PrintUtil

/* Driver Code */
@Test
func binary_search_tree_test() {
    /* 初始化二叉搜索树 */
    let bst = BinarySearchTree()
    // 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初始化的二叉树为\n")
    PrintUtil.printTree(bst.getRoot())

    /* 查找节点 */
    let node = bst.search(7)
    println("\n查找到的节点值 = ${node?.val}")

    /* 插入节点 */
    bst.insert(16)
    println("\n插入节点 16 后，二叉树为\n")
    PrintUtil.printTree(bst.getRoot())

    /* 删除节点 */
    bst.remove(1)
    println("\n删除节点 1 后，二叉树为\n")
    PrintUtil.printTree(bst.getRoot())
    bst.remove(2)
    println("\n删除节点 2 后，二叉树为\n")
    PrintUtil.printTree(bst.getRoot())
    bst.remove(4)
    println("\n删除节点 4 后，二叉树为\n")
    PrintUtil.printTree(bst.getRoot())
}
