/**
 * File: preorder_traversal_iii_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Прямой обход: пример 3 */
function preOrder(
    root: TreeNode | null,
    path: TreeNode[],
    res: TreeNode[][]
): void {
    // Отсечение
    if (root === null || root.val === 3) {
        return;
    }
    // Попытаться
    path.push(root);
    if (root.val === 7) {
        // Записать решение
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Откат
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nИнициализировать двоичное дерево');
printTree(root);

// Прямой обход
const path: TreeNode[] = [];
const res: TreeNode[][] = [];
preOrder(root, path, res);

console.log('\nВывести все пути от корня до узла 7, путь не должен содержать узлы со значением 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
