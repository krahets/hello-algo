/**
 * File: preorder_traversal_iii_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 前序走訪：例題三 */
function preOrder(
    root: TreeNode | null,
    path: TreeNode[],
    res: TreeNode[][]
): void {
    // 剪枝
    if (root === null || root.val === 3) {
        return;
    }
    // 嘗試
    path.push(root);
    if (root.val === 7) {
        // 記錄此解
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // 回溯
    path.pop();
}

// 主程式
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹');
printTree(root);

// 前序走訪
const path: TreeNode[] = [];
const res: TreeNode[][] = [];
preOrder(root, path, res);

console.log('\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不含值為 3 的節點');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});

export {};
