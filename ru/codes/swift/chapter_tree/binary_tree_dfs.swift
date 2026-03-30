/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Инициализировать список для хранения последовательности обхода
var list: [Int] = []

/* Предварительный обход */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: корень -> левое поддерево -> правое поддерево
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* Симметричный обход */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: левое поддерево -> корень -> правое поддерево
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Обратный обход */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: левое поддерево -> правое поддерево -> корень
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* Инициализация двоичного дерева */
        // Здесь используется функция, напрямую строящая двоичное дерево из массива
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nИнициализация двоичного дерева\n")
        PrintUtil.printTree(root: root)

        /* Предварительный обход */
        list.removeAll()
        preOrder(root: root)
        print("\nПоследовательность печати узлов при предварительном обходе = \(list)")

        /* Симметричный обход */
        list.removeAll()
        inOrder(root: root)
        print("\nПоследовательность печати узлов при симметричном обходе = \(list)")

        /* Обратный обход */
        list.removeAll()
        postOrder(root: root)
        print("\nПоследовательность печати узлов при обратном обходе = \(list)")
    }
}
