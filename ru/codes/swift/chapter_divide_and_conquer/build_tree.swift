/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Построить двоичное дерево: разделяй и властвуй */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // Завершить при пустом диапазоне поддерева
    if r - l < 0 {
        return nil
    }
    // Инициализировать корневой узел
    let root = TreeNode(x: preorder[i])
    // Найти m, чтобы разделить левое и правое поддеревья
    let m = inorderMap[preorder[i]]!
    // Подзадача: построить левое поддерево
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // Подзадача: построить правое поддерево
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // Вернуть корневой узел
    return root
}

/* Построить двоичное дерево */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("Предварительный обход = \(preorder)")
        print("Симметричный обход = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("Построенное двоичное дерево:")
        PrintUtil.printTree(root: root)
    }
}
