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
        // Initialize empty tree
        this.root = null;
    }

    /* Get binary tree root node */
    getRoot(): TreeNode | null {
        return this.root;
    }

    /* Search node */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Loop find, break after passing leaf nodes
        while (cur !== null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num) cur = cur.left;
            // Found target node, break loop
            else break;
        }
        // Return target node
        return cur;
    }

    /* Insert node */
    insert(num: number): void {
        // If tree is empty, initialize root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Loop find, break after passing leaf nodes
        while (cur !== null) {
            // Found duplicate node, thus return
            if (cur.val === num) return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Insertion position is in cur's left subtree
            else cur = cur.left;
        }
        // Insert node
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }

    /* Remove node */
    remove(num: number): void {
        // If tree is empty, return
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Loop find, break after passing leaf nodes
        while (cur !== null) {
            // Found node to be removed, break loop
            if (cur.val === num) break;
            pre = cur;
            // Node to be removed is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Node to be removed is in cur's left subtree
            else cur = cur.left;
        }
        // If no node to be removed, return
        if (cur === null) return;
        // Number of child nodes = 0 or 1
        if (cur.left === null || cur.right === null) {
            // When the number of child nodes = 0/1, child = null/that child node
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Remove node cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // If the removed node is the root, reassign the root
                this.root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get the next node in in-order traversal of cur
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Recursively remove node tmp
            this.remove(tmp!.val);
            // Replace cur with tmp
            cur.val = tmp!.val;
        }
    }
}

/* Driver Code */
/* Initialize binary search tree */
const bst = new BinarySearchTree();
// Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nInitialized binary tree is\n');
printTree(bst.getRoot());

/* Search node */
const node = bst.search(7);
console.log(
    '\nFound node object ' + node + ', node value = ' + (node ? node.val : 'null')')
);

/* Insert node */
bst.insert(16);
console.log('\nAfter inserting node 16, the binary tree is\n');
printTree(bst.getRoot());

/* Remove node */
bst.remove(1);
console.log('\nAfter removing node 1, the binary tree is\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nAfter removing node 2, the binary tree is\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nAfter removing node 4, the binary tree is\n');
printTree(bst.getRoot());

export {};
