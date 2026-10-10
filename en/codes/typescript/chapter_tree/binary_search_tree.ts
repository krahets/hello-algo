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
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num) cur = cur.left;
            // Found target node, exit loop
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
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found duplicate node, return directly
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
        // If tree is empty, return directly
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found node to delete, exit loop
            if (cur.val === num) break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Node to delete is in cur's left subtree
            else cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur === null) return;
        // Number of child nodes = 0 or 1
        if (cur.left === null || cur.right === null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Delete node cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // If deleted node is root node, reassign root node
                this.root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Recursively delete node tmp
            this.remove(tmp!.val);
            // Replace cur with tmp
            cur.val = tmp!.val;
        }
    }
}

/* Driver Code */
/* Initialize binary search tree */
const bst = new BinarySearchTree();
// Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
const nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
for (const num of nums) {
    bst.insert(num);
}
console.log('\nInitialized binary tree is\n');
printTree(bst.getRoot());

/* Search node */
const node = bst.search(7);
console.log(
    '\nFound node object is ' + node + ', node value = ' + (node ? node.val : 'null')
);

/* Insert node */
bst.insert(16);
console.log('\nAfter inserting node 16, binary tree is\n');
printTree(bst.getRoot());

/* Remove node */
bst.remove(1);
console.log('\nAfter removing node 1, binary tree is\n');
printTree(bst.getRoot());
bst.remove(2);
console.log('\nAfter removing node 2, binary tree is\n');
printTree(bst.getRoot());
bst.remove(4);
console.log('\nAfter removing node 4, binary tree is\n');
printTree(bst.getRoot());

export {};
