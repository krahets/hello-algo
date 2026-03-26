/**
 * File: preorder_traversal_ii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* Прямой обход: пример 2 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Попытаться
    path.append(root)
    if root.val == 7 {
        // Записать решение
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // Откат
    path.removeLast()
}

@main
enum PreorderTraversalIICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nИнициализировать двоичное дерево")
        PrintUtil.printTree(root: root)

        // Прямой обход
        path = []
        res = []
        preOrder(root: root)

        print("\nВывести все пути от корня до узла 7")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
