/**
 * File: preorder_traversal_ii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Preorder traversal: Example 2 */
function preOrder(root, path, res) {
    if (root === null) {
        return;
    }
    // Attempt
    path.push(root);
    if (root.val === 7) {
        // Record solution
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // Backtrack
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree');
printTree(root);

// Preorder traversal
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nOutput all paths from root node to node 7');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
