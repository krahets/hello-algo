/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// 初始化串列，用於儲存走訪序列
var list: [Int] = []

/* 前序走訪 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* 中序走訪 */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* 後序走訪 */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n初始化二元樹\n")
        PrintUtil.printTree(root: root)

        /* 前序走訪 */
        list.removeAll()
        preOrder(root: root)
        print("\n前序走訪的節點列印序列 = \(list)")

        /* 中序走訪 */
        list.removeAll()
        inOrder(root: root)
        print("\n中序走訪的節點列印序列 = \(list)")

        /* 後序走訪 */
        list.removeAll()
        postOrder(root: root)
        print("\n後序走訪的節點列印序列 = \(list)")
    }
}
