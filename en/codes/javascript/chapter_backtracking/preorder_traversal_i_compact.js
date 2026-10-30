/**
 * File: preorder_traversal_i_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Preorder traversal: example 1 */
function preOrder(root, res) {
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
const res = [];
preOrder(root, res);

console.log('\nOutput all nodes with value 7');
console.log(res.map((node) => node.val));
