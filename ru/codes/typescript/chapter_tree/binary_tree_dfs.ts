/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// Создать список для последовательности обхода
const list: number[] = [];

/* Прямой обход */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок посещения: корень -> левое поддерево -> правое поддерево
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Симметричный обход */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок посещения: левое поддерево -> корень -> правое поддерево
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Обратный обход */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Порядок посещения: левое поддерево -> правое поддерево -> корень
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Основная программа */
/* Инициализация двоичного дерева */
// Используем функцию, которая строит двоичное дерево непосредственно из массива
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nИнициализация двоичного дерева\n');
printTree(root);

/* Прямой обход */
list.length = 0;
preOrder(root);
console.log('\nУзлы в порядке прямого обхода = ' + list);

/* Симметричный обход */
list.length = 0;
inOrder(root);
console.log('\nУзлы в порядке симметричного обхода = ' + list);

/* Обратный обход */
list.length = 0;
postOrder(root);
console.log('\nУзлы в порядке обратного обхода = ' + list);

export {};
