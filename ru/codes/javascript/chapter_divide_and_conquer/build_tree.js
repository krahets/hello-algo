/**
 * File: build_tree.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { printTree } = require('../modules/PrintUtil');
const { TreeNode } = require('../modules/TreeNode');

/* Построение двоичного дерева методом «разделяй и властвуй» */
function dfs(preorder, inorderMap, i, l, r) {
    // Если интервал поддерева пуст, завершаем рекурсию
    if (r - l < 0) return null;
    // Создаём корень
    const root = new TreeNode(preorder[i]);
    // Находим m и разделяем левое и правое поддеревья
    const m = inorderMap.get(preorder[i]);
    // Подзадача: строим левое поддерево
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Подзадача: строим правое поддерево
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Возвращаем корень
    return root;
}

/* Построение двоичного дерева */
function buildTree(preorder, inorder) {
    // Создаём хеш-таблицу индексов элементов inorder
    let inorderMap = new Map();
    for (let i = 0; i < inorder.length; i++) {
        inorderMap.set(inorder[i], i);
    }
    const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    return root;
}

/* Основная программа */
const preorder = [3, 9, 2, 1, 7];
const inorder = [9, 3, 1, 2, 7];
console.log('Прямой обход = ' + JSON.stringify(preorder));
console.log('Симметричный обход = ' + JSON.stringify(inorder));
const root = buildTree(preorder, inorder);
console.log('Построенное двоичное дерево:');
printTree(root);
