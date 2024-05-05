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
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Left rotation operation */
    private leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update node height
        this.updateHeight(node);
        this.updateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Perform rotation operation to restore balance to the subtree */
    private rotate(node: TreeNode): TreeNode {
        // Get the balance factor of node
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
        // Balanced tree, no rotation needed, return
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
            return node; // Do not insert duplicate nodes, return
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = this.rotate(node);
        // Return the root node of the subtree
        return node;
    }

    /* Remove node */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Recursively remove node (helper method) */
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
                // Number of child nodes = 0, remove node and return
                if (child === null) {
                    return null;
                } else {
                    // Number of child nodes = 1, remove node
                    node = child;
                }
            } else {
                // Number of child nodes = 2, remove the next node in in-order traversal and replace the current node with it
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = this.rotate(node);
        // Return the root node of the subtree
        return node;
    }

    /* Search node */
    search(val: number): TreeNode {
        let cur = this.root;
        // Loop find, break after passing leaf nodes
        while (cur !== null) {
            if (cur.val < val) {
                // Target node is in cur's right subtree
                cur = cur.right;
            } else if (cur.val > val) {
                // Target node is in cur's left subtree
                cur = cur.left;
            } else {
                // Found target node, break loop
                break;
            }
        }
        // Return target node
        return cur;
    }
}

function testInsert(tree: AVLTree, val: number): void {
    tree.insert(val);
    console.log('\nAfter inserting node ' + val + ', the AVL tree is');
    printTree(tree.root);
}

function testRemove(tree: AVLTree, val: number): void {
    tree.remove(val);
    console.log('\nAfter removing node ' + val + ', the AVL tree is');
    printTree(tree.root);
}

/* Driver Code */
/* Initialize empty AVL tree */
const avlTree = new AVLTree();
/* Insert node */
// Notice how the AVL tree maintains balance after inserting nodes
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

/* Insert duplicate node */
testInsert(avlTree, 7);

/* Remove node */
// Notice how the AVL tree maintains balance after removing nodes
testRemove(avlTree, 8); // Remove node with degree 0
testRemove(avlTree, 5); // Remove node with degree 1
testRemove(avlTree, 4); // Remove node with degree 2

/* Search node */
const node = avlTree.search(7);
console.log('\nFound node object', node, ', node value = ' + node.val);

export {};
