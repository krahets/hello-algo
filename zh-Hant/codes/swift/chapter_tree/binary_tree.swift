/**
 * File: binary_tree.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BinaryTree {
    /* Driver Code */
    static func main() {
        /* 初始化二叉树 */
        // 初始化节点
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // 构建节点之间的引用（指针）
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        print("\n初始化二叉树\n")
        PrintUtil.printTree(root: n1)

        /* 插入与删除节点 */
        let P = TreeNode(x: 0)
        // 在 n1 -> n2 中间插入节点 P
        n1.left = P
        P.left = n2
        print("\n插入节点 P 后\n")
        PrintUtil.printTree(root: n1)
        // 删除节点 P
        n1.left = n2
        print("\n删除节点 P 后\n")
        PrintUtil.printTree(root: n1)
    }
}
