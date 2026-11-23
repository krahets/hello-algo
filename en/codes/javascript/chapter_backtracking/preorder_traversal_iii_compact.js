/**
 * File: preorder_traversal_iii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Preorder traversal: example 3 */
function preOrder(root, path, res) {
    // Prune
    if (root === null || root.val === 3) {
        return;
    }
    // Try
    path.push(root);
    if (root.val === 7) {
        // Record the solution
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Backtrack
    path.pop();
}

// Driver code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree');
printTree(root);

// Preorder traversal
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nOutput all paths from the root to nodes with value 7 that contain no node with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
