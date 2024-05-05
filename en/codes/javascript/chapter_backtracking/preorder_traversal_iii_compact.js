/**
 * File: preorder_traversal_iii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Pre-order traversal: Example three */
function preOrder(root, path, res) {
    // Pruning
    if (root === null || root.val === 3) {
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
    // Retract
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree');
printTree(root);

// Pre-order traversal
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\nOutput all root-to-node 7 paths, not including nodes with value 3');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
