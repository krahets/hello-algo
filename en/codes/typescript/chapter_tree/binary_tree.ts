/**
 * File: binary_tree.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Initialize binary tree */
// Initialize nodes
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// Build references (pointers) between nodes
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\nInitialize binary tree\n');
printTree(n1);

/* Insert node P between n1 -> n2 */
const P = new TreeNode(0);
// Delete node
n1.left = P;
P.left = n2;
console.log('\nAfter inserting node P\n');
printTree(n1);
// Remove node P
n1.left = n2;
console.log('\nAfter removing node P\n');
printTree(n1);

export {};
