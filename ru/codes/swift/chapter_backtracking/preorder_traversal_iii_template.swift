/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Проверяем, является ли текущее состояние решением */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* Сохраняем решение */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* Проверяем, допустим ли выбор в текущем состоянии */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* Обновляем состояние */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* Восстанавливаем состояние */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* Поиск с возвратом: пример 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // Проверяем, найдено ли решение
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // Перебираем все варианты
    for choice in choices {
        // Отсечение: проверяем допустимость выбора
        if isValid(state: state, choice: choice) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state: &state, choice: choice)
            // Переходим к следующему выбору
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Основная программа */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nСоздаём двоичное дерево")
        PrintUtil.printTree(root: root)

        // Поиск с возвратом
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

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
