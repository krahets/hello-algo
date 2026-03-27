/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Проверить, является ли текущее состояние решением */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* Записать решение */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* Обновить состояние */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* Восстановить состояние */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* Алгоритм бэктрекинга: пример 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
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
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\nВсе пути от корня к узлу 7, не содержащие узлов со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
