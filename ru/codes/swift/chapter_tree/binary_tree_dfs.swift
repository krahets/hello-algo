/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Создать список для последовательности обхода
var list: [Int] = []

/* Прямой обход */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок посещения: корень -> левое поддерево -> правое поддерево
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* Симметричный обход */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок посещения: левое поддерево -> корень -> правое поддерево
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Обратный обход */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Порядок посещения: левое поддерево -> правое поддерево -> корень
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Основная программа */
    static func main() {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nИнициализация двоичного дерева\n")
        PrintUtil.printTree(root: root)

        /* Прямой обход */
        list.removeAll()
        preOrder(root: root)
        print("\nУзлы в порядке прямого обхода = \(list)")

        /* Симметричный обход */
        list.removeAll()
        inOrder(root: root)
        print("\nУзлы в порядке симметричного обхода = \(list)")

        /* Обратный обход */
        list.removeAll()
        postOrder(root: root)
        print("\nУзлы в порядке обратного обхода = \(list)")
    }
}
