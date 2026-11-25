/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* 以陣列表示二元樹的類別 */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* 建構方法 */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* 串列長度 */
    size(): number {
        return this.#tree.length;
    }

    /* 取得索引 i 處的節點值 */
    val(i: number): number | null {
        // 若索引超出範圍，回傳 null 表示空位
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* 取得索引 i 處節點的左子節點索引 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 取得索引 i 處節點的右子節點索引 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 取得索引 i 處節點的父節點索引 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 整數除法，向下取整
    }

    /* 層序走訪 */
    levelOrder(): number[] {
        let res = [];
        // 直接走訪陣列
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* 深度優先走訪 */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // 若為空位，直接返回
        if (this.val(i) === null) return;
        // 前序走訪
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // 中序走訪
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // 後序走訪
        if (order === 'post') res.push(this.val(i));
    }

    /* 前序走訪 */
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* 中序走訪 */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* 後序走訪 */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* 主程式 */
// 初始化二元樹
// 這裡使用能從陣列直接建立二元樹的函式
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
console.log('\n初始化二元樹\n');
console.log('二元樹的陣列表示法：');
console.log(arr);
console.log('二元樹的鏈結串列表示法：');
printTree(root);

// 以陣列表示二元樹的類別
const abt = new ArrayBinaryTree(arr);

// 存取節點
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n目前節點的索引為 ' + i + ' ，值為 ' + abt.val(i));
console.log(
    '其左子節點的索引為 ' + l + ' ，值為 ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    '其右子節點的索引為 ' + r + ' ，值為 ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    '其父節點的索引為 ' + p + ' ，值為 ' + (p === null ? 'null' : abt.val(p))
);

// 走訪樹
let res = abt.levelOrder();
console.log('\n層序走訪的結果：' + res);
res = abt.preOrder();
console.log('前序走訪的結果：' + res);
res = abt.inOrder();
console.log('中序走訪的結果：' + res);
res = abt.postOrder();
console.log('後序走訪的結果：' + res);

export {};
