/**
 * File: space_complexity.js
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

const { ListNode } = require('../modules/ListNode');
const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* Function */
function constFunc() {
    // Perform some operations
    return 0;
}

/* Constant complexity */
function constant(n) {
    // Constants, variables, objects occupy O(1) space
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // Variables in a loop occupy O(1) space
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // Functions in a loop occupy O(1) space
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* Linear complexity */
function linear(n) {
    // Array of length n occupies O(n) space
    const nums = new Array(n);
    // A list of length n occupies O(n) space
    const nodes = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // A hash table of length n occupies O(n) space
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* Linear complexity (recursive implementation) */
function linearRecur(n) {
    console.log(`递归 n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* Quadratic complexity */
function quadratic(n) {
    // Matrix occupies O(n^2) space
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // A two-dimensional list occupies O(n^2) space
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* Quadratic complexity (recursive implementation) */
function quadraticRecur(n) {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`递归 n = ${n} 中的 nums 长度 = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* Exponential complexity (building a full binary tree) */
function buildTree(n) {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Driver Code */
const n = 5;
// Constant complexity
constant(n);
// Linear complexity
linear(n);
linearRecur(n);
// Quadratic complexity
quadratic(n);
quadraticRecur(n);
// Exponential complexity
const root = buildTree(n);
printTree(root);
