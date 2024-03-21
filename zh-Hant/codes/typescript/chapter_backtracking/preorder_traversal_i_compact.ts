/**
 * File: preorder_traversal_i_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 前序走訪：例題一 */
function preOrder(root: TreeNode | null, res: TreeNode[]): void {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // 記錄解
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二元樹');
printTree(root);

// 前序走訪
const res: TreeNode[] = [];
preOrder(root, res);

console.log('\n輸出所有值為 7 的節點');
console.log(res.map((node) => node.val));

export {};
