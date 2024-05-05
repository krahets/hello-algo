/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* Array-based binary tree class */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* Constructor */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* List capacity */
    size(): number {
        return this.#tree.length;
    }

    /* Get the value of the node at index i */
    val(i: number): number | null {
        // If the index is out of bounds, return null, representing an empty spot
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* Get the index of the left child of the node at index i */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* Get the index of the right child of the node at index i */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* Get the index of the parent of the node at index i */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // Integer division down
    }

    /* Level-order traversal */
    levelOrder(): number[] {
        let res = [];
        // Traverse array
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // If it is an empty spot, return
        if (this.val(i) === null) return;
        // Pre-order traversal
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // In-order traversal
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // Post-order traversal
        if (order === 'post') res.push(this.val(i));
    }

    /* Pre-order traversal */
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* In-order traversal */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* Post-order traversal */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver Code */
// Initialize binary tree
// Use a specific function to convert an array into a binary tree
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
console.log('\nInitialize binary tree\n');
console.log('Binary tree's array representation:');
console.log(arr);
console.log('Binary tree's linked list representation:');
printTree(root);

// Array-based binary tree class
const abt = new ArrayBinaryTree(arr);

// Access node
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\nThe current node's index is ' + i + ', value = ' + abt.val(i));
console.log(
    'Its left child node's index is ' + l + ', value = ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'Its right child node's index is ' + r + ', value = ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'Its parent node's index is ' + p + ', value = ' + (p === null ? 'null' : abt.val(p))
);

// Traverse tree
let res = abt.levelOrder();
console.log('\nLevel-order traversal is:' + res);
res = abt.preOrder();
console.log('Pre-order traversal is:' + res);
res = abt.inOrder();
console.log('In-order traversal is:' + res);
res = abt.postOrder();
console.log('Post-order traversal is:' + res);

export {};
