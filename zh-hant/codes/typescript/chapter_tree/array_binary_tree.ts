/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* 陣列表示下的二元樹類別 */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* 建構子 */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* 串列容量 */
    size(): number {
        return this.#tree.length;
    }

    /* 獲取索引為 i 節點的值 */
    val(i: number): number | null {
        // 若索引越界，則返回 null ，代表空位
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* 獲取索引為 i 節點的父節點的索引 */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 向下整除
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
        // 若為空位，則返回
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

/* Driver Code */
// 初始化二元樹
// 這裡藉助了一個從陣列直接生成二元樹的函式
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
console.log('二元樹的陣列表示：');
console.log(arr);
console.log('二元樹的鏈結串列表示：');
printTree(root);

// 陣列表示下的二元樹類別
const abt = new ArrayBinaryTree(arr);

// 訪問節點
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n當前節點的索引為 ' + i + ' ，值為 ' + abt.val(i));
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
console.log('\n層序走訪為：' + res);
res = abt.preOrder();
console.log('前序走訪為：' + res);
res = abt.inOrder();
console.log('中序走訪為：' + res);
res = abt.postOrder();
console.log('後序走訪為：' + res);

export {};
