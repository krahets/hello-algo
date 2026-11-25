/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree {
    #tree;

    /* Конструктор */
    constructor(arr) {
        this.#tree = arr;
    }

    /* Ёмкость списка */
    size() {
        return this.#tree.length;
    }

    /* Получить значение узла с индексом i */
    val(i) {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* Получить индекс левого потомка узла с индексом i */
    left(i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого потомка узла с индексом i */
    right(i) {
        return 2 * i + 2;
    }

    /* Получить индекс родителя узла с индексом i */
    parent(i) {
        return Math.floor((i - 1) / 2); // Целочисленное деление с округлением вниз
    }

    /* Обход по уровням */
    levelOrder() {
        let res = [];
        // Пройти непосредственно по массиву
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* Обход в глубину */
    #dfs(i, order, res) {
        // Если позиция пуста, завершить вызов
        if (this.val(i) === null) return;
        // Прямой обход
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // Симметричный обход
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // Обратный обход
        if (order === 'post') res.push(this.val(i));
    }

    /* Прямой обход */
    preOrder() {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* Симметричный обход */
    inOrder() {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* Обратный обход */
    postOrder() {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Основная программа */
// Инициализация двоичного дерева
// Используем функцию, которая строит двоичное дерево непосредственно из массива
const arr = Array.of(
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
);

const root = arrToTree(arr);
console.log('\nИнициализация двоичного дерева\n');
console.log('Двоичное дерево в виде массива:');
console.log(arr);
console.log('Связное представление двоичного дерева:');
printTree(root);

// Класс двоичного дерева на основе массива
const abt = new ArrayBinaryTree(arr);

// Доступ к узлу
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\nИндекс текущего узла: ' + i + ' · значение:  ' + abt.val(i));
console.log(
    'Индекс левого потомка: ' + l + ' · значение:  ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'Индекс правого потомка: ' + r + ' · значение:  ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'Индекс родителя: ' + p + ' · значение:  ' + (p === null ? 'null' : abt.val(p))
);

// Обход дерева
let res = abt.levelOrder();
console.log('\nОбход по уровням: ' + res);
res = abt.preOrder();
console.log('Прямой обход: ' + res);
res = abt.inOrder();
console.log('Симметричный обход: ' + res);
res = abt.postOrder();
console.log('Обратный обход: ' + res);
