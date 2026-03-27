/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Обход в ширину */
func levelOrder(root: TreeNode) -> [Int] {
    // Инициализировать очередь и добавить корневой узел
    var queue: [TreeNode] = [root]
    // Инициализировать список для хранения последовательности обхода
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // Извлечение из очереди
        list.append(node.val) // Сохранить значение узла
        if let left = node.left {
            queue.append(left) // Поместить левый дочерний узел в очередь
        }
        if let right = node.right {
            queue.append(right) // Поместить правый дочерний узел в очередь
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver Code */
    static func main() {
        /* Инициализация двоичного дерева */
        // Здесь используется функция, напрямую строящая двоичное дерево из массива
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nИнициализация двоичного дерева\n")
        PrintUtil.printTree(root: node)

        /* Обход в ширину */
        let list = levelOrder(root: node)
        print("\nПоследовательность печати узлов при обходе в ширину = \(list)")
    }
}
