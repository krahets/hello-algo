/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Инициализировать список для хранения последовательности обхода
var list: [Int] = []

/* Прямой обход */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* Симметричный обход */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Обратный обход */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* Инициализировать двоичное дерево */
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nИнициализировать двоичное дерево\n")
        PrintUtil.printTree(root: root)

        /* Прямой обход */
        list.removeAll()
        preOrder(root: root)
        print("\nПоследовательность узлов при прямом обходе = \(list)")

        /* Симметричный обход */
        list.removeAll()
        inOrder(root: root)
        print("\nПоследовательность узлов при симметричном обходе = \(list)")

        /* Обратный обход */
        list.removeAll()
        postOrder(root: root)
        print("\nПоследовательность узлов при обратном обходе = \(list)")
    }
}
