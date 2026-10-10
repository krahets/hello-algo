/**
 * File: space_complexity.js
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

const { ListNode } = require('../modules/ListNode');
const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 関数 */
function constFunc() {
    // 何らかの処理を行う
    return 0;
}

/* 定数階 */
function constant(n) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // ループ内の変数は O(1) の空間を占める
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // ループ内の関数は O(1) の空間を占める
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* 線形階 */
function linear(n) {
    // 長さ n の配列は O(n) の空間を使用
    const nums = new Array(n);
    // 長さ n のリストは O(n) の空間を使用
    const nodes = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* 線形時間（再帰実装） */
function linearRecur(n) {
    console.log(`再帰 n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* 二乗階 */
function quadratic(n) {
    // 行列は O(n^2) の空間を使用する
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // 二次元リストは O(n^2) の空間を使用
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* 二次時間（再帰実装） */
function quadraticRecur(n) {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* 指数時間（完全二分木の構築） */
function buildTree(n) {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Driver Code */
const n = 5;
// 定数階
constant(n);
// 線形階
linear(n);
linearRecur(n);
// 二乗階
quadratic(n);
quadraticRecur(n);
// 指数オーダー
const root = buildTree(n);
printTree(root);
