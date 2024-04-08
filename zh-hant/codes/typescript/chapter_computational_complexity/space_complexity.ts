/**
 * File: space_complexity.ts
 * Created Time: 2023-02-05
 * Author: Justin (xiefahit@gmail.com)
 */

import { ListNode } from '../modules/ListNode';
import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 函式 */
function constFunc(): number {
    // 執行某些操作
    return 0;
}

/* 常數階 */
function constant(n: number): void {
    // 常數、變數、物件佔用 O(1) 空間
    const a = 0;
    const b = 0;
    const nums = new Array(10000);
    const node = new ListNode(0);
    // 迴圈中的變數佔用 O(1) 空間
    for (let i = 0; i < n; i++) {
        const c = 0;
    }
    // 迴圈中的函式佔用 O(1) 空間
    for (let i = 0; i < n; i++) {
        constFunc();
    }
}

/* 線性階 */
function linear(n: number): void {
    // 長度為 n 的陣列佔用 O(n) 空間
    const nums = new Array(n);
    // 長度為 n 的串列佔用 O(n) 空間
    const nodes: ListNode[] = [];
    for (let i = 0; i < n; i++) {
        nodes.push(new ListNode(i));
    }
    // 長度為 n 的雜湊表佔用 O(n) 空間
    const map = new Map();
    for (let i = 0; i < n; i++) {
        map.set(i, i.toString());
    }
}

/* 線性階（遞迴實現） */
function linearRecur(n: number): void {
    console.log(`遞迴 n = ${n}`);
    if (n === 1) return;
    linearRecur(n - 1);
}

/* 平方階 */
function quadratic(n: number): void {
    // 矩陣佔用 O(n^2) 空間
    const numMatrix = Array(n)
        .fill(null)
        .map(() => Array(n).fill(null));
    // 二維串列佔用 O(n^2) 空間
    const numList = [];
    for (let i = 0; i < n; i++) {
        const tmp = [];
        for (let j = 0; j < n; j++) {
            tmp.push(0);
        }
        numList.push(tmp);
    }
}

/* 平方階（遞迴實現） */
function quadraticRecur(n: number): number {
    if (n <= 0) return 0;
    const nums = new Array(n);
    console.log(`遞迴 n = ${n} 中的 nums 長度 = ${nums.length}`);
    return quadraticRecur(n - 1);
}

/* 指數階（建立滿二元樹） */
function buildTree(n: number): TreeNode | null {
    if (n === 0) return null;
    const root = new TreeNode(0);
    root.left = buildTree(n - 1);
    root.right = buildTree(n - 1);
    return root;
}

/* Driver Code */
const n = 5;
// 常數階
constant(n);
// 線性階
linear(n);
linearRecur(n);
// 平方階
quadratic(n);
quadraticRecur(n);
// 指數階
const root = buildTree(n);
printTree(root);
