/**
 * File: space_complexity.js
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

const { ListNode } = require('../modules/ListNode');
const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Функция */
function constFunc() {
    // Выполнить некоторые операции
    return 0;
}

/* Константная сложность */
function constant(n) {
    // Константы, переменные и объекты занимают O(1) памяти
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // Переменные в цикле занимают O(1) памяти
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // Функция в цикле занимает O(1) памяти
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* Линейная сложность */
function linear(n) {
    // Массив длины n занимает пространство O(n)
    const nums = new Array(n);
    // Список длины n занимает пространство O(n)
    const nodes = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // Хеш-таблица длины n занимает пространство O(n)
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* Линейная сложность (рекурсивная реализация) */
function linearRecur(n) {
    console.log(`рекурсия n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* Квадратичная сложность */
function quadratic(n) {
    // Матрица занимает пространство O(n^2)
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // Двумерный список занимает пространство O(n^2)
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* Квадратичная сложность (рекурсивная реализация) */
function quadraticRecur(n) {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`рекурсия n = ${n} в nums длина = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
function buildTree(n) {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Driver Code */
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
