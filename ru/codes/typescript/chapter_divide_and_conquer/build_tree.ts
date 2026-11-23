/**
 * File: build_tree.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { printTree } from '../modules/PrintUtil';
import { TreeNode } from '../modules/TreeNode';

/* Построить двоичное дерево: разделяй и властвуй */
function dfs(
    preorder: number[],
    inorderMap: Map<number, number>,
    i: number,
    l: number,
    r: number
): TreeNode | null {
    // Завершить при пустом диапазоне поддерева
    if (r - l < 0) return null;
    // Инициализировать корневой узел
    const root: TreeNode = new TreeNode(preorder[i]);
    // Найти m, чтобы разделить левое и правое поддеревья
    const m = inorderMap.get(preorder[i]);
    // Подзадача: построить левое поддерево
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Подзадача: построить правое поддерево
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Вернуть корневой узел
    return root;
}

/* Построить двоичное дерево */
function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
    let inorderMap = new Map<number, number>();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Driver Code */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('Предварительный обход = ' + JSON.stringify(preorder));
console.log('Симметричный обход = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('Построенное двоичное дерево:');
printTree(root);
