/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// Initialize list for storing traversal sequence
const list: number[] = [];

/* Preorder traversal */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit priority: root node -> left subtree -> right subtree
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Inorder traversal */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Postorder traversal */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver Code */
/* Initialize binary tree */
// Here we use a function to generate a binary tree directly from an array
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree\n');
printTree(root);

/* Preorder traversal */
list.length = 0;
preOrder(root);
console.log('\nPreorder traversal node print sequence = ' + list);

/* Inorder traversal */
list.length = 0;
inOrder(root);
console.log('\nInorder traversal node print sequence = ' + list);

/* Postorder traversal */
list.length = 0;
postOrder(root);
console.log('\nPostorder traversal node print sequence = ' + list);

export {};
