/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Проверить, является ли текущее состояние решением */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* Записать решение */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* Обновить состояние */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* Восстановить состояние */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* Алгоритм бэктрекинга: пример 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // Проверить, является ли текущее состояние решением
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // Перебор всех вариантов выбора
    for choice in choices {
        // Отсечение: проверить допустимость выбора
        if isValid(state: state, choice: choice) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state: &state, choice: choice)
            // Перейти к следующему выбору
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nИнициализация двоичного дерева")
        PrintUtil.printTree(root: root)

        // Алгоритм бэктрекинга
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\nВсе пути от корня к узлу 7, не содержащие узлов со значением 3")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
