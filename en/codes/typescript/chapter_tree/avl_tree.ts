/**
 * File: avl_tree.ts
 * Created Time: 2023-02-06
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* AVL tree*/
class AVLTree {
    root: TreeNode;
    /* Constructor */
    constructor() {
        this.root = null; //Root node
    }

    /* Get the node height */
    height(node: TreeNode): number {
        // A null node has height -1; a leaf has height 0
        return node === null ? -1 : node.height;
    }

    /* Update the node height */
    private updateHeight(node: TreeNode): void {
        // The node height equals the height of its taller subtree + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* Get the balance factor */
    balanceFactor(node: TreeNode): number {
        // A null node has balance factor 0
        if (node === null) return 0;
        // Node balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }

    /* Right rotation */
    private rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Left rotation */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Perform rotations to restore balance in this subtree */
    private rotate(node: TreeNode): TreeNode {
        // Get the balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Rotate right
                return this.rightRotate(node);
            } else {
                // Rotate left, then right
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Rotate left
                return this.leftRotate(node);
            } else {
                // Rotate right, then left
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // The tree is balanced; return without rotating
        return node;
    }

    /* Insert a node */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Insert a node recursively (helper method) */
    private insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Return without inserting a duplicate node
        }
        this.updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Remove a node */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Remove a node recursively (helper method) */
    private removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Find and remove the node */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Number of children = 0: remove node and return
                if (child === null) {
                    return null;
                } else {
                    // Number of children = 1: remove node directly
                    node = child;
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = this.rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Find a node */
    search(val: number): TreeNode {
        let cur = this.root;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            if (cur.val < val) {
                // The target node lies in the right subtree of cur
                cur = cur.right;
            } else if (cur.val > val) {
                // The target node lies in the left subtree of cur
                cur = cur.left;
            } else {
                // The target node was found; exit the loop
                break;
            }
        }
        // Return the target node
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\nAfter inserting node ' + val + ' the AVL tree is:');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\nAfter removing node ' + val + ' the AVL tree is:');
    printTree(tree.root);
}

/* Driver code */
/* Initialize an empty AVL tree */
const avlTree = new AVLTree();
/* Insert a node */
// Observe how the AVL tree maintains balance after a node is inserted
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

/* Insert a duplicate node */
testInsert(avlTree, 7);

/* Remove a node */
// Observe how the AVL tree maintains balance after a node is removed
testRemove(avlTree, 8); // Remove a node with 0 children
testRemove(avlTree, 5); // Remove a node with 1 child
testRemove(avlTree, 4); // Remove a node with 2 children

/* Look up a node */
const node = avlTree.search(7);
console.log('\nFound node object:', node, ', node value = ' + node.val);

export {};
