/**
 * File: avl_tree.js
 * Created Time: 2023-02-05
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* AVL tree*/
class AVLTree {
    /* Constructor */
    constructor() {
        this.root = null; //Root node
    }

    /* Get the node height */
    height(node) {
        // A null node has height -1, and a leaf has height 0
        return node === null ? -1 : node.height;
    }

    /* Update the node height */
    #updateHeight(node) {
        // Node height is the height of the taller subtree plus 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }

    /* Get the balance factor */
    balanceFactor(node) {
        // A null node has a balance factor of 0
        if (node === null) return 0;
        // Balance factor = left subtree height - right subtree height
        return this.height(node.left) - this.height(node.right);
    }

    /* Right rotation */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // Rotate node to the right around child
        child.right = node;
        node.left = grandChild;
        // Update the node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Left rotation */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // Rotate node to the left around child
        child.left = node;
        node.right = grandChild;
        // Update the node height
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Return the root of the rotated subtree
        return child;
    }

    /* Rebalance the subtree by rotating it */
    #rotate(node) {
        // Get the balance factor of node
        const balanceFactor = this.balanceFactor(node);
        // Left-heavy tree
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Rotate right
                return this.#rightRotate(node);
            } else {
                // Rotate left, then right
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // Right-heavy tree
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Rotate left
                return this.#leftRotate(node);
            } else {
                // Rotate right, then left
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // The tree is balanced, so return without rotating
        return node;
    }

    /* Insert a node */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* Insert a node recursively (helper method) */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // Return without inserting a duplicate
        this.#updateHeight(node); // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = this.#rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Delete a node */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* Delete a node recursively (helper method) */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. Find the node and delete it */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // No children: delete node and return
                if (child === null) return null;
                // One child: delete node
                else node = child;
            } else {
                // Two children: delete the inorder successor and use it to replace the current node
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // Update the node height
        /* 2. Rebalance the subtree by rotating it */
        node = this.#rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Search for a node */
    search(val) {
        let cur = this.root;
        // Stop the search after passing a leaf
        while (cur !== null) {
            // The target is in the right subtree of cur
            if (cur.val < val) cur = cur.right;
            // The target is in the left subtree of cur
            else if (cur.val > val) cur = cur.left;
            // The target was found, so exit the loop
            else break;
        }
        // Return the target node
        return cur;
    }
}

function testInsert(tree, val) {
    tree.insert(val);
    console.log('\nInsert node ' + val + ' to obtain this AVL tree:');
    printTree(tree.root);
}

function testRemove(tree, val) {
    tree.remove(val);
    console.log('\nDelete node ' + val + ' to obtain this AVL tree:');
    printTree(tree.root);
}

/* Driver code */
/* Initialize an empty AVL tree */
const avlTree = new AVLTree();
/* Insert a node */
// Watch how the AVL tree stays balanced after an insertion
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

/* Delete a node */
// Watch how the AVL tree stays balanced after a deletion
testRemove(avlTree, 8); // Delete a node with no children
testRemove(avlTree, 5); // Delete a node with one child
testRemove(avlTree, 4); // Delete a node with two children

/* Look up a node */
const node = avlTree.search(7);
console.log('\nNode found:', node, ', node value = ' + node.val);
