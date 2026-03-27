/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// Инициализировать список для хранения последовательности обхода
const list: number[] = [];

/* Предварительный обход */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок обхода: корень -> левое поддерево -> правое поддерево
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Симметричный обход */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок обхода: левое поддерево -> корень -> правое поддерево
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Обратный обход */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок обхода: левое поддерево -> правое поддерево -> корень
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver Code */
/* Инициализация двоичного дерева */
// Здесь используется функция, напрямую строящая двоичное дерево из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева\n');
printTree(root);

/* Предварительный обход */
list.length = 0;
preOrder(root);
console.log('\nПоследовательность печати узлов при предварительном обходе = ' + list);

/* Симметричный обход */
list.length = 0;
inOrder(root);
console.log('\nПоследовательность печати узлов при симметричном обходе = ' + list);

/* Обратный обход */
list.length = 0;
postOrder(root);
console.log('\nПоследовательность печати узлов при обратном обходе = ' + list);

export {};
