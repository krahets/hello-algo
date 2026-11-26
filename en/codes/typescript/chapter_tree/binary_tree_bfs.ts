/**
 * File: binary_tree_bfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Level-order traversal */
function levelOrder(root: TreeNode | null): number[] {
    // Initialize the queue with the root
    const queue = [root];
    // Initialize a list to store the traversal sequence
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // Dequeue a node
        list.push(node.val); // Save the node value
        if (node.left) {
            queue.push(node.left); // Enqueue the left child
        }
        if (node.right) {
            queue.push(node.right); // Enqueue the right child
        }
    }
    return list;
}

/* Driver code */
/* Initialize the binary tree */
// Use a function that builds a binary tree directly from an array
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\nInitialize the binary tree\n');
printTree(root);

/* Level-order traversal */
const list = levelOrder(root);
console.log('\nNodes in level order = ' + list);

export {};
