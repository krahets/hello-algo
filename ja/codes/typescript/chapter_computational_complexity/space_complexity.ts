/**
 * File: space_complexity.ts
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 関数 */
function constFunc(): number {
    // 何らかの処理を実行する
    return 0;
}

/* 定数オーダー */
function constant(n: number): void {
    // 定数、変数、オブジェクトは O(1) の領域を使用する
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // ループ内の変数は O(1) の領域を使用する
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // ループ内の関数は O(1) の領域を使用する
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* 線形オーダー */
function linear(n: number): void {
    // 長さ n の配列は O(n) の領域を使用する
    const nums = new Array(n);
    // 長さ n のリストは O(n) の領域を使用する
    const nodes: ListNode[] = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // 長さ n のハッシュテーブルは O(n) の領域を使用する
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* 線形オーダー（再帰による実装） */
function linearRecur(n: number): void {
    console.log(`再帰 n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* 二次オーダー */
function quadratic(n: number): void {
    // 行列は O(n^2) の領域を使用する
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // 二次元リストは O(n^2) の領域を使用する
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* 二次オーダー（再帰による実装） */
function quadraticRecur(n: number): number {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`再帰 n = ${n} における nums の長さ = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* 指数オーダー（パーフェクト二分木の構築） */
function buildTree(n: number): TreeNode | null {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* 実行用コード */
const n = 5;
// 定数オーダー
constant(n);
// 線形オーダー
linear(n);
linearRecur(n);
// 二次オーダー
quadratic(n);
quadraticRecur(n);
// 指数オーダー
const root = buildTree(n);
printTree(root);
