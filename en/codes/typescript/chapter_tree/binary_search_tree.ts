/**
 * File: binary_search_tree.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* Binary search tree */
class BinarySearchTree {
    private root: TreeNode | null;

    /* Constructor */
    constructor() {
        // Initialize an empty tree
        this.root = null;
    }

    /* Get the root of the binary tree */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* Find a node */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num) cur = cur.left;
            // The target node was found; exit the loop
            else break;
        }
        // Return the target node
        return cur;
    }

    /* Insert a node */
    insert(num: number): void {
        // If the tree is empty, initialize the root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // Return immediately if a duplicate node is found
            if (cur.val === num) return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The insertion position lies in the left subtree of cur
            else cur = cur.left;
        }
        // Insert a node
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* Remove a node */
    remove(num: number): void {
        // Return immediately if the tree is empty
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // The node to remove was found; exit the loop
            if (cur.val === num) break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur === null) return;
        // Number of children = 0 or 1
        if (cur.left === null || cur.right === null) {
            // With 0 / 1 children, child is null / the child node, respectively
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Remove node cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // If the removed node is the root, assign the new root
                this.root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Recursively remove node tmp
            this.remove(tmp!.val);
            // Replace the value of cur with the value of tmp
            cur.val = tmp!.val;
        }
    }
}

/* Driver code */
/* Initialize the binary search tree */
const bst = new BinarySearchTree();
// Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nThe initialized binary tree is:\n');
printTree(bst.getRoot());

/* Find a node */
const node = bst.search(7);
console.log(
    '\nFound node object: ' + node + ', node value = ' + (node ? node.val : 'null')
);

/* Insert a node */
bst.insert(16);
console.log('\nBinary tree after inserting node 16:\n');
printTree(bst.getRoot());

/* Remove a node */
bst.remove(1);
console.log('\nBinary tree after removing node 1:\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nBinary tree after removing node 2:\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nBinary tree after removing node 4:\n');
printTree(bst.getRoot());

export {};
