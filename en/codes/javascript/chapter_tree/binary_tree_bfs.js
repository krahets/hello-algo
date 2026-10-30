/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Level-order traversal */
function levelOrder(root) {
    // Initialize a queue and enqueue the root
    const queue = [root];
    // Initialize a list to store the traversal sequence
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // Dequeue from the queue
        list.push(node.val); // Store the node value
        if (node.left) queue.push(node.left); // Enqueue the left child
        if (node.right) queue.push(node.right); // Enqueue the right child
    }
    return list;
}

/* Driver code */
/* Initialize the binary tree */
// Use a helper function that builds a binary tree directly from an array
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree\n');
printTree(root);

/* Level-order traversal */
const list = levelOrder(root);
console.log('\nNode sequence from level-order traversal = ' + list);
