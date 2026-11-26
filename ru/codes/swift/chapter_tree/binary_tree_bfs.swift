/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Обход по уровням */
func levelOrder(root: TreeNode) -> [Int] {
    // Создать очередь и добавить корень
    var queue: [TreeNode] = [root]
    // Создать список для последовательности обхода
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // Извлечь узел из очереди
        list.append(node.val) // Сохранить значение узла
        if let left = node.left {
            queue.append(left) // Добавить левого потомка в очередь
        }
        if let right = node.right {
            queue.append(right) // Добавить правого потомка в очередь
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Основная программа */
    static func main() {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nИнициализация двоичного дерева\n")
        PrintUtil.printTree(root: node)

        /* Обход по уровням */
        let list = levelOrder(root: node)
        print("\nУзлы в порядке обхода по уровням = \(list)")
    }
}
