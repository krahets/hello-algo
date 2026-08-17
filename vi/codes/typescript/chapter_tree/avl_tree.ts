/**
 * File: avl_tree.ts
 * Created Time: 2023-02-06
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* AVL tree */
class AVLTree {
    root: TreeNode;
    /* Constructor */
    constructor() {
        this.root = null; // Root node
    }

    /* Get node height */
    height(node: TreeNode): number {
        // Empty node height is -1, leaf node height is 0
        return node === null ? -1 : node.height;
    }

    /* Update node height */
    private updateHeight(node: TreeNode): void {
        // Node height equals the height of the tallest subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* Get balance factor */
    balanceFactor(node: TreeNode): number {
        // Empty node balance factor is 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }

    /* Right rotation operation */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }

    /* Left rotation operation */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }

    /* Perform rotation operation to restore balance to this subtree */
    private rotate(node: TreeNode): TreeNode {
        // Get balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Right rotation
                return this.rightRotate(node);
            } else {
                // First left rotation then right rotation
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Left rotation
                return this.leftRotate(node);
            } else {
                // First right rotation then left rotation
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }

    /* Insert node */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Recursively insert node (helper method) */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Duplicate node not inserted, return directly
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.rotate(node);
        // Return root node of subtree
        return node;
    }

    /* Remove node */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Recursively delete node (helper method) */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Find node and delete */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child === null) {
                    return null;
                } else {
                    // Number of child nodes = 1, delete node directly
                    node = child;
                }
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = this.rotate(node);
        // Return root node of subtree
        return node;
    }

    /* Search node */
    search(val: number): TreeNode {
        let cur = this.root;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            if (cur.val < val) {
                // Target node is in cur's right subtree
                cur = cur.right;
            } else if (cur.val > val) {
                // Target node is in cur's left subtree
                cur = cur.left;
            } else {
                // Found target node, exit loop
                break;
            }
        }
        // Return target node
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\nInsert node ' + val + ', AVL tree is');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\nRemove node ' + val + ', AVL tree is');
    printTree(tree.root);
}

/* Driver Code */
/* Please pay attention to how the AVL tree maintains balance after inserting nodes */
const avlTree = new AVLTree();
/* Insert node */
// Delete nodes
testInsert(avlTree, 1);
testInsert(avlTree, 2);
testInsert(avlTree, 3);
testInsert(avlTree, 4);
testInsert(avlTree, 5);
testInsert(avlTree, 8);
testInsert(avlTree, 7);
testInsert(avlTree, 9);
testInsert(avlTree, 10);
testInsert(avlTree, 6);

/* Please pay attention to how the AVL tree maintains balance after deleting nodes */
testInsert(avlTree, 7);

/* Remove node */
// Delete node with degree 1
testRemove(avlTree, 8); // Delete node with degree 2
testRemove(avlTree, 5); // Remove node with degree 1
testRemove(avlTree, 4); // Remove node with degree 2

/* Search node */
const node = avlTree.search(7);
console.log('\nFound node object is', node, ', node value = ' + node.val);

export {};
