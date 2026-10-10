/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* Проверить, является ли текущее состояние решением */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* Записать решение */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* Обновить состояние */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* Восстановить состояние */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* Алгоритм бэктрекинга: пример 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // Проверить, является ли текущее состояние решением
    if (isSolution(state)) {
        // Записать решение
        recordSolution(state, res)
    }
    // Перебор всех вариантов выбора
    for (choice in choices) {
        // Отсечение: проверить допустимость выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice)
            // Перейти к следующему выбору
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice)
        }
    }
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nИнициализация двоичного дерева")
    printTree(root)

    // Алгоритм бэктрекинга
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3")
    for (path in res) {
        val vals = mutableListOf<Int>()
        for (node in path!!) {
            if (node != null) {
                vals.add(node._val)
            }
        }
        println(vals)
    }
}