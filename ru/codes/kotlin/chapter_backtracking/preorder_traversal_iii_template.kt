/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* Проверяем, является ли текущее состояние решением */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* Сохраняем решение */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* Проверяем, допустим ли выбор в текущем состоянии */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* Обновляем состояние */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* Восстанавливаем состояние */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* Поиск с возвратом: пример 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res)
    }
    // Перебираем все варианты
    for (choice in choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice)
            // Переходим к следующему выбору
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice)
        }
    }
}

/* Основная программа */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nСоздаём двоичное дерево")
    printTree(root)

    // Поиск с возвратом
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
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