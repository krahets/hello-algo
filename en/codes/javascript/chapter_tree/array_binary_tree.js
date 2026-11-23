/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Binary tree class using an array representation */
class ArrayBinaryTree {
    #tree;

    /* Constructor */
    constructor(arr) {
        this.#tree = arr;
    }

    /* Array length */
    size() {
        return this.#tree.length;
    }

    /* Get the value of the node at index i */
    val(i) {
        // If the index is out of bounds, return null to indicate an empty position
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* Get the left child index of the node at index i */
    left(i) {
        return 2 * i + 1;
    }

    /* Get the right child index of the node at index i */
    right(i) {
        return 2 * i + 2;
    }

    /* Get the parent index of the node at index i */
    parent(i) {
        return Math.floor((i - 1) / 2); // Floor division
    }

    /* Level-order traversal */
    levelOrder() {
        let res = [];
        // Traverse the array directly
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    #dfs(i, order, res) {
        // Return if this position is empty
        if (this.val(i) === null) return;
        // Preorder traversal
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // Inorder traversal
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // Postorder traversal
        if (order === 'post') res.push(this.val(i));
    }

    /* Preorder traversal */
    preOrder() {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* Inorder traversal */
    inOrder() {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* Postorder traversal */
    postOrder() {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver code */
// Initialize the binary tree
// Use a helper function that builds a binary tree directly from an array
const arr = Array.of(
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
);

const root = arrToTree(arr);
console.log('\nInitialize the binary tree\n');
console.log('Array representation of the binary tree:');
console.log(arr);
console.log('Linked representation of the binary tree:');
printTree(root);

// Binary tree class using an array representation
const abt = new ArrayBinaryTree(arr);

// Access a node
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\nCurrent node index: ' + i + ' with value ' + abt.val(i));
console.log(
    'Left child index: ' + l + ' with value ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'Right child index: ' + r + ' with value ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'Parent index: ' + p + ' with value ' + (p === null ? 'null' : abt.val(p))
);

// Traverse the tree
let res = abt.levelOrder();
console.log('\nLevel-order traversal:' + res);
res = abt.preOrder();
console.log('Preorder traversal:' + res);
res = abt.inOrder();
console.log('Inorder traversal:' + res);
res = abt.postOrder();
console.log('Postorder traversal:' + res);
