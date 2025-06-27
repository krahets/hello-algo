/**
 * File: array_binary_tree_test.cj
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
func array_binary_tree_test() {
    // 初始化二叉树
    // 这里借助了一个从数组直接生成二叉树的函数
    let arr: Array<?Int64> = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]

    let root = TreeNode.listToTree(ArrayList<?Int64>(arr))
    println("\n初始化二叉树\n")
    println("二叉树的数组表示：")
    println(arr)
    println("二叉树的链表表示：")
    PrintUtil.printTree(root)

    // 数组表示下的二叉树类
    let abt = ArrayBinaryTree(arr)

    // 访问节点
    let i = 1
    let l = abt.left(i)
    let r = abt.right(i)
    let p = abt.parent(i)
    println("\n当前节点的索引为 ${i} ，值为 ${abt.val(i)}")
    println("其左子节点的索引为 ${l} ，值为 ${abt.val(l)}")
    println("其右子节点的索引为 ${r} ，值为 ${abt.val(r)}")
    println("其父节点的索引为 ${p} ，值为 ${abt.val(p)}")

    // 遍历树
    var res = abt.levelOrder()
    println("\n层序遍历为: ${res}")
    res = abt.preOrder()
    println("前序遍历为: ${res}")
    res = abt.inOrder()
    println("中序遍历为: ${res}")
    res = abt.postOrder()
    println("后序遍历为: ${res}")
}
