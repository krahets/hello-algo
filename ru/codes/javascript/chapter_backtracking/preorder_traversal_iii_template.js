/**
 * File: preorder_traversal_iii_template.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Проверить, является ли текущее состояние решением */
function isSolution(state) {
    return state && state[state.length - 1]?.val === 7;
}

/* Записать решение */
function recordSolution(state, res) {
    res.push([...state]);
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
function isValid(state, choice) {
    return choice !== null && choice.val !== 3;
}

/* Обновить состояние */
function makeChoice(state, choice) {
    state.push(choice);
}

/* Восстановить состояние */
function undoChoice(state) {
    state.pop();
}

/* Алгоритм бэктрекинга: пример 3 */
function backtrack(state, choices, res) {
    // Проверить, является ли текущее состояние решением
    if (isSolution(state)) {
        // Записать решение
        recordSolution(state, res);
    }
    // Перебор всех вариантов выбора
    for (const choice of choices) {
        // Отсечение: проверить допустимость выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            // Перейти к следующему выбору
            backtrack(state, [choice.left, choice.right], res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state);
        }
    }
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева');
printTree(root);

// Алгоритм бэктрекинга
const res = [];
backtrack([], [root], res);

console.log('\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
