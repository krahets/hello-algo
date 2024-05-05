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
    // Initialize queue, add root node
    const queue = [root];
    // Initialize a list to store the traversal sequence
    const list: number[] = [];
    while (queue.length) {
        let node = queue.shift() as TreeNode; // Queue dequeues
        list.push(node.val); // Save node value
        if (node.left) {
            queue.push(node.left); // Left child node enqueues
        }
        if (node.right) {
            queue.push(node.right); // Right child node enqueues
        }
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

export {};
