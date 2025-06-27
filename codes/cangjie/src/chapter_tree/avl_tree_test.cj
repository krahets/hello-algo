/**
 * File: avl_tree_test.cj
 * Created Time: 2025-06-27
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_tree

import std.unittest.testmacro.*
import std.unittest.*
import cangjie.utils.PrintUtil

/* Driver Code */
@Test
func avl_tree_test() {
    func testInsert(tree: AVLTree, val: Int64) {
        tree.insert(val)
        println("\n插入节点 ${val} 后，AVL 树为")
        PrintUtil.printTree(tree.root)
    }

    func testRemove(tree: AVLTree, val: Int64) {
        tree.remove(val);
        println("\n删除节点 ${val} 后，AVL 树为")
        PrintUtil.printTree(tree.root)
    }

    /* 初始化空 AVL 树 */
    let avlTree = AVLTree()

    /* 插入节点 */
    // 请关注插入节点后，AVL 树是如何保持平衡的
    testInsert(avlTree, 1)
    testInsert(avlTree, 2)
    testInsert(avlTree, 3)
    testInsert(avlTree, 4)
    testInsert(avlTree, 5)
    testInsert(avlTree, 8)
    testInsert(avlTree, 7)
    testInsert(avlTree, 9)
    testInsert(avlTree, 10)
    testInsert(avlTree, 6)

    /* 插入重复节点 */
    testInsert(avlTree, 7)

    /* 删除节点 */
    // 请关注删除节点后，AVL 树是如何保持平衡的
    testRemove(avlTree, 8) // 删除度为 0 的节点
    testRemove(avlTree, 5) // 删除度为 1 的节点
    testRemove(avlTree, 4) // 删除度为 2 的节点

    /* 查询节点 */
    let node = avlTree.search(7)
    println("\n查找到的节点值 = ${node?.val}")
}
