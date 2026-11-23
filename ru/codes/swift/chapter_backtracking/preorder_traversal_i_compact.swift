/**
 * File: preorder_traversal_i_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var res: [TreeNode] = []

/* Предварительный обход: пример 1 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    if root.val == 7 {
        // Записать решение
        res.append(root)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
}

@main
enum PreorderTraversalICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nИнициализация двоичного дерева")
        PrintUtil.printTree(root: root)

        // Предварительный обход
        res = []
        preOrder(root: root)

        print("\nВсе узлы со значением 7")
        var vals: [Int] = []
        for node in res {
            vals.append(node.val)
        }
        print(vals)
    }
}
