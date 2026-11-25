/**
 * File: binary_search_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Binary search tree */
class BinarySearchTree {
    /* Constructor */
    constructor() {
        // Initialize an empty tree
        this.root = null;
    }

    /* Get the root of the binary tree */
    getRoot() {
        return this.root;
    }

    /* Search for a node */
    search(num) {
        let cur = this.root;
        // Stop the search after passing a leaf
        while (cur !== null) {
            // The target is in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The target is in the left subtree of cur
            else if (cur.val > num) cur = cur.left;
            // The target was found, so exit the loop
            else break;
        }
        // Return the target node
        return cur;
    }

    /* Insert a node */
    insert(num) {
        // If the tree is empty, initialize the root
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Stop the search after passing a leaf
        while (cur !== null) {
            // Return if a duplicate is found
            if (cur.val === num) return;
            pre = cur;
            // The insertion position is in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The insertion position is in the left subtree of cur
            else cur = cur.left;
        }
        // Insert a node
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /* Delete a node */
    remove(num) {
        // Return immediately if the tree is empty
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Stop the search after passing a leaf
        while (cur !== null) {
            // The node to delete was found, so exit the loop
            if (cur.val === num) break;
            pre = cur;
            // The node to delete is in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The node to delete is in the left subtree of cur
            else cur = cur.left;
        }
        // Return if the node to delete does not exist
        if (cur === null) return;
        // Number of children = 0 or 1
        if (cur.left === null || cur.right === null) {
            // With no children, child = null. With one child, child is that child.
            const child = cur.left !== null ? cur.left : cur.right;
            // Delete node cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // If deleting the root, assign a new root
                this.root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            this.remove(tmp.val);
            // Replace the value of cur with that of tmp
            cur.val = tmp.val;
        }
    }
}

/* Driver code */
/* Initialize the binary search tree */
const bst = new BinarySearchTree();
// Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nInitial binary tree:\n');
printTree(bst.getRoot());

/* Search for a node */
const node = bst.search(7);
console.log('\nNode found: ' + node + ', node value = ' + node.val);

/* Insert a node */
bst.insert(16);
console.log('\nBinary tree after inserting node 16:\n');
printTree(bst.getRoot());

/* Delete a node */
bst.remove(1);
console.log('\nBinary tree after deleting node 1:\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nBinary tree after deleting node 2:\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nBinary tree after deleting node 4:\n');
printTree(bst.getRoot());
