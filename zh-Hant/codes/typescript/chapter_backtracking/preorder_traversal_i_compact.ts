/**
 * File: preorder_traversal_i_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 前序遍历：例题一 */
function preOrder(root: TreeNode | null, res: TreeNode[]): void {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // 记录解
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二叉树');
printTree(root);

// 前序遍历
const res: TreeNode[] = [];
preOrder(root, res);

console.log('\n输出所有值为 7 的节点');
console.log(res.map((node) => node.val));

export {};
