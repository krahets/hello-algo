/**
 * File: preorder_traversal_i_compact.ts
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Preorder traversal: example 1 */
function preOrder(root: TreeNode | null, res: TreeNode[]): void {
    if (root === null) {
        return;
    }
    if (root.val === 7) {
        // Record the solution
        res.push(root);
    }
    preOrder(root.left, res);
    preOrder(root.right, res);
}

// Driver code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree');
printTree(root);

// Preorder traversal
const res: TreeNode[] = [];
preOrder(root, res);

console.log('\nOutput all nodes with value 7');
console.log(res.map((node) => node.val));

export {};
