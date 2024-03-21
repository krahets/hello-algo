/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// 初始化列表，用于存储遍历序列
var list: [Int] = []

/* 前序遍历 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 访问优先级：根节点 -> 左子树 -> 右子树
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* 中序遍历 */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 访问优先级：左子树 -> 根节点 -> 右子树
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* 后序遍历 */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 访问优先级：左子树 -> 右子树 -> 根节点
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* 初始化二叉树 */
        // 这里借助了一个从数组直接生成二叉树的函数
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n初始化二叉树\n")
        PrintUtil.printTree(root: root)

        /* 前序遍历 */
        list.removeAll()
        preOrder(root: root)
        print("\n前序遍历的节点打印序列 = \(list)")

        /* 中序遍历 */
        list.removeAll()
        inOrder(root: root)
        print("\n中序遍历的节点打印序列 = \(list)")

        /* 后序遍历 */
        list.removeAll()
        postOrder(root: root)
        print("\n后序遍历的节点打印序列 = \(list)")
    }
}
