/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* Класс двоичного дерева в массивном представлении */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* Конструктор */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* Вместимость списка */
    size(): number {
        return this.#tree.length;
    }

    /* Получить значение узла с индексом i */
    val(i: number): number | null {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую клетку
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла узла с индексом i */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // Округление вниз при делении
    }

    /* Обход по уровням */
    levelOrder(): number[] {
        let res = [];
        // Непосредственно обойти массив
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* Обход в глубину */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // Если это пустая клетка, вернуть результат
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
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* Симметричный обход */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* Обратный обход */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver Code */
// Инициализировать двоичное дерево
// Здесь используется функция, которая напрямую строит двоичное дерево из массива
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
console.log('\nИнициализировать двоичное дерево\n');
console.log('Массивное представление двоичного дерева:');
console.log(arr);
console.log('Связное представление двоичного дерева:');
printTree(root);

// Класс двоичного дерева в массивном представлении
const abt = new ArrayBinaryTree(arr);

// Получить доступ к узлу
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\nИндекс текущего узла равен ' + i + ', значение равно' + abt.val(i));
console.log(
    'Индекс его левого дочернего узла равен ' + l + ', значение равно' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'Индекс его правого дочернего узла равен ' + r + ', значение равно' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'Индекс его родительского узла равен ' + p + ', значение равно' + (p === null ? 'null' : abt.val(p))
);

// Обойти дерево
let res = abt.levelOrder();
console.log('\nРезультат обхода по уровням: ' + res);
res = abt.preOrder();
console.log('прямой обходравно:' + res);
res = abt.inOrder();
console.log('Симметричный обход: ' + res);
res = abt.postOrder();
console.log('обратный обходравно:' + res);

export {};
