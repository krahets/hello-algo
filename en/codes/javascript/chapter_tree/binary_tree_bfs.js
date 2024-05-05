/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Level-order traversal */
function levelOrder(root) {
    // Initialize queue, add root node
    const queue = [root];
    // Initialize a list to store the traversal sequence
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // Queue dequeues
        list.push(node.val); // Save node value
        if (node.left) queue.push(node.left); // Left child node enqueues
        if (node.right) queue.push(node.right); // Right child node enqueues
    }
    return list;
}

/* Driver Code */
/* Initialize binary tree */
// Use a specific function to convert an array into a binary tree
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize binary tree\n');
printTree(root);

/* Level-order traversal */
const list = levelOrder(root);
console.log('\nPrint sequence of nodes from level-order traversal = ' + list);
