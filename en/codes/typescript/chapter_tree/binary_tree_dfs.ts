/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// Initialize a list to store the traversal sequence
const list: number[] = [];

/* Preorder traversal */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit order: root -> left subtree -> right subtree
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Inorder traversal */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit order: left subtree -> root -> right subtree
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Postorder traversal */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // Visit order: left subtree -> right subtree -> root
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver code */
/* Initialize the binary tree */
// Use a helper function that builds a binary tree directly from an array
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree\n');
printTree(root);

/* Preorder traversal */
list.length = 0;
preOrder(root);
console.log('\nNode sequence from preorder traversal = ' + list);

/* Inorder traversal */
list.length = 0;
inOrder(root);
console.log('\nNode sequence from inorder traversal = ' + list);

/* Postorder traversal */
list.length = 0;
postOrder(root);
console.log('\nNode sequence from postorder traversal = ' + list);

export {};
