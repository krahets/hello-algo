/**
 * File: space_complexity.ts
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Функция */
function constFunc(): number {
    // Выполнить некоторые операции
    return 0;
}

/* Константная сложность */
function constant(n: number): void {
    // Константы, переменные и объекты занимают O(1) памяти
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // Переменные цикла занимают O(1) памяти
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // Вызовы функции в цикле требуют O(1) памяти
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* Линейная сложность */
function linear(n: number): void {
    // Массив длины n занимает O(n) памяти
    const nums = new Array(n);
    // Список длины n занимает O(n) памяти
    const nodes: ListNode[] = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // Хеш-таблица из n элементов занимает O(n) памяти
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* Линейная сложность (рекурсия) */
function linearRecur(n: number): void {
    console.log(`Рекурсивный вызов: n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* Квадратичная сложность */
function quadratic(n: number): void {
    // Матрица занимает O(n^2) памяти
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // Двумерный список занимает O(n^2) памяти
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* Квадратичная сложность (рекурсия) */
function quadraticRecur(n: number): number {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`При n = ${n} длина nums = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* Экспоненциальная сложность (построение совершенного двоичного дерева) */
function buildTree(n: number): TreeNode | null {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Основная программа */
const n = 5;
// Константная сложность
constant(n);
// Линейная сложность
linear(n);
linearRecur(n);
// Квадратичная сложность
quadratic(n);
quadraticRecur(n);
// Экспоненциальная сложность
const root = buildTree(n);
printTree(root);
