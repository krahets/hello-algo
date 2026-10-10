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
        /* 二分木を初期化 */
        // ノードを初期化
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // ノード間の参照（ポインタ）を構築する
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        print("\n二分木を初期化\n")
        PrintUtil.printTree(root: n1)

        /* ノードの挿入と削除 */
        let P = TreeNode(x: 0)
        // n1 -> n2 の間にノード P を挿入
        n1.left = P
        P.left = n2
        print("\nノード P を挿入後\n")
        PrintUtil.printTree(root: n1)
        // ノード P を削除
        n1.left = n2
        print("\nノード P を削除後\n")
        PrintUtil.printTree(root: n1)
    }
}
