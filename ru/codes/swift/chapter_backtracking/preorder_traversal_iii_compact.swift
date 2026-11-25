/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* Прямой обход: пример 3 */
func preOrder(root: TreeNode?) {
    // Отсечение
    guard let root = root, root.val != 3 else {
        return
    }
    // Пробуем вариант
    path.append(root)
    if root.val == 7 {
        // Сохраняем решение
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // Возврат
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* Основная программа */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nСоздаём двоичное дерево")
        PrintUtil.printTree(root: root)

        // Прямой обход
        path = []
        res = []
        preOrder(root: root)

        print("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
