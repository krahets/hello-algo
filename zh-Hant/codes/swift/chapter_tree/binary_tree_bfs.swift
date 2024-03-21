/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 层序遍历 */
func levelOrder(root: TreeNode) -> [Int] {
    // 初始化队列，加入根节点
    var queue: [TreeNode] = [root]
    // 初始化一个列表，用于保存遍历序列
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // 队列出队
        list.append(node.val) // 保存节点值
        if let left = node.left {
            queue.append(left) // 左子节点入队
        }
        if let right = node.right {
            queue.append(right) // 右子节点入队
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver Code */
    static func main() {
        /* 初始化二叉树 */
        // 这里借助了一个从数组直接生成二叉树的函数
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n初始化二叉树\n")
        PrintUtil.printTree(root: node)

        /* 层序遍历 */
        let list = levelOrder(root: node)
        print("\n层序遍历的节点打印序列 = \(list)")
    }
}
