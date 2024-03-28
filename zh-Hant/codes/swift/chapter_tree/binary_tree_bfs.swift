/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 層序走訪 */
func levelOrder(root: TreeNode) -> [Int] {
    // 初始化佇列，加入根節點
    var queue: [TreeNode] = [root]
    // 初始化一個串列，用於儲存走訪序列
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // 隊列出隊
        list.append(node.val) // 儲存節點值
        if let left = node.left {
            queue.append(left) // 左子節點入列
        }
        if let right = node.right {
            queue.append(right) // 右子節點入列
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver Code */
    static func main() {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n初始化二元樹\n")
        PrintUtil.printTree(root: node)

        /* 層序走訪 */
        let list = levelOrder(root: node)
        print("\n層序走訪的節點列印序列 = \(list)")
    }
}
