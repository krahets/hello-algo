/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Построение двоичного дерева методом «разделяй и властвуй» */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // Если интервал поддерева пуст, завершаем рекурсию
    if r - l < 0 {
        return nil
    }
    // Создаём корень
    let root = TreeNode(x: preorder[i])
    // Находим m и разделяем левое и правое поддеревья
    let m = inorderMap[preorder[i]]!
    // Подзадача: строим левое поддерево
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // Подзадача: строим правое поддерево
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // Возвращаем корень
    return root
}

/* Построение двоичного дерева */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // Создаём хеш-таблицу индексов элементов inorder
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Основная программа */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("Прямой обход = \(preorder)")
        print("Симметричный обход = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("Построенное двоичное дерево:")
        PrintUtil.printTree(root: root)
    }
}
