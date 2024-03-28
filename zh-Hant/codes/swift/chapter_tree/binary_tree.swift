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
        /* 初始化二元樹 */
        // 初始化節點
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // 構建節點之間的引用（指標）
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        print("\n初始化二元樹\n")
        PrintUtil.printTree(root: n1)

        /* 插入與刪除節點 */
        let P = TreeNode(x: 0)
        // 在 n1 -> n2 中間插入節點 P
        n1.left = P
        P.left = n2
        print("\n插入節點 P 後\n")
        PrintUtil.printTree(root: n1)
        // 刪除節點 P
        n1.left = n2
        print("\n刪除節點 P 後\n")
        PrintUtil.printTree(root: n1)
    }
}
