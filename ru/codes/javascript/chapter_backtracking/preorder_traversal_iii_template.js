/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Проверяем, является ли текущее состояние решением */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Сохраняем решение */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Проверяем, допустим ли выбор в текущем состоянии */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* Обновляем состояние */
function makeChoice(state, choice) {
    state.push(choice);
}

/* Восстанавливаем состояние */
function undoChoice(state) {
    state.pop();
}

/* Поиск с возвратом: пример 3 */
function backtrack(state, choices, res) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
    }
    // Перебираем все варианты
    for (const choice of choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            // Переходим к следующему выбору
            backtrack(state, [choice.left, choice.right], res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state);
        }
    }
}

// Основная программа
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nСоздаём двоичное дерево');
printTree(root);

// Поиск с возвратом
const res = [];
backtrack([], [root], res);

console.log('\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
