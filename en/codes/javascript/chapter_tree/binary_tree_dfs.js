/**
 * File: binary_tree_dfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

// Initialize the list for storing traversal sequences
const list = [];

/* Pre-order traversal */
function preOrder(root) {
    if (root === null) return;
    // Visit priority: root node -> left subtree -> right subtree
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* In-order traversal */
function inOrder(root) {
    if (root === null) return;
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* Post-order traversal */
function postOrder(root) {
    if (root === null) return;
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver Code */
/* Initialize binary tree */
// Use a specific function to convert an array into a binary tree
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree\n');
printTree(root);

/* Pre-order traversal */
list.length = 0;
preOrder(root);
console.log('\nPrint sequence of nodes from pre-order traversal = ' + list);

/* In-order traversal */
list.length = 0;
inOrder(root);
console.log('\nPrint sequence of nodes from in-order traversal = ' + list);

/* Post-order traversal */
list.length = 0;
postOrder(root);
console.log('\nPrint sequence of nodes from post-order traversal = ' + list);
