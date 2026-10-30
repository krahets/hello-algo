/**
 * File: binary_tree_dfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

// Initialize a list to store the traversal sequence
const list = [];

/* Preorder traversal */
function preOrder(root) {
    if (root === null) return;
    // Visit order: root -> left subtree -> right subtree
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* Inorder traversal */
function inOrder(root) {
    if (root === null) return;
    // Visit order: left subtree -> root -> right subtree
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Postorder traversal */
function postOrder(root) {
    if (root === null) return;
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
