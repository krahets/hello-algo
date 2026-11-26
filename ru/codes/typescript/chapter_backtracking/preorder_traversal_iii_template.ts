/**
 * File: preorder_traversal_iii_template.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Проверяем, является ли текущее состояние решением */
function isSolution(state: TreeNode[]): boolean {
    return state && state[state.length - 1]?.val === 7;
}

/* Сохраняем решение */
function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
    res.push([...state]);
}

/* Проверяем, допустим ли выбор в текущем состоянии */
function isValid(state: TreeNode[], choice: TreeNode): boolean {
    return choice !== null && choice.val !== 3;
}

/* Обновляем состояние */
function makeChoice(state: TreeNode[], choice: TreeNode): void {
    state.push(choice);
}

/* Восстанавливаем состояние */
function undoChoice(state: TreeNode[]): void {
    state.pop();
}

/* Поиск с возвратом: пример 3 */
function backtrack(
    state: TreeNode[],
    choices: TreeNode[],
    res: TreeNode[][]
): void {
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
const res: TreeNode[][] = [];
backtrack([], [root], res);

console.log('\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
