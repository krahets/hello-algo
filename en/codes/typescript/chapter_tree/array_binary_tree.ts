/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* Binary tree class represented by array */
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

    /* Get value of node at index i */
    val(i: number): number | null {
        // If index out of bounds, return null to represent empty position
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* Get index of left child node of node at index i */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* Get index of right child node of node at index i */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* Get index of parent node of node at index i */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // Floor division
    }

    /* Level-order traversal */
    levelOrder(): number[] {
        let res = [];
        // Traverse array directly
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // If empty position, return
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
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* Inorder traversal */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* Postorder traversal */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver Code */
// Initialize binary tree
// Here we use a function to generate a binary tree directly from an array
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
console.log('Array representation of binary tree:');
console.log(arr);
console.log('Linked list representation of binary tree:');
printTree(root);

// Binary tree class represented by array
const abt = new ArrayBinaryTree(arr);

// Access node
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\nCurrent node index is ' + i + ', value is ' + abt.val(i));
console.log(
    'Its left child node index is ' + l + ', value is ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'Its right child node index is ' + r + ', value is ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'Its parent node index is ' + p + ', value is ' + (p === null ? 'null' : abt.val(p))
);

// Traverse tree
let res = abt.levelOrder();
console.log('\nLevel-order traversal is:' + res);
res = abt.preOrder();
console.log('Preorder traversal is:' + res);
res = abt.inOrder();
console.log('Inorder traversal is:' + res);
res = abt.postOrder();
console.log('Postorder traversal is:' + res);

export {};
