/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-09
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

type Order = 'pre' | 'in' | 'post';

/* 二分木を配列で表すクラス */
class ArrayBinaryTree {
    #tree: (number | null)[];

    /* コンストラクタ */
    constructor(arr: (number | null)[]) {
        this.#tree = arr;
    }

    /* リストの容量 */
    size(): number {
        return this.#tree.length;
    }

    /* インデックス i のノードの値を取得する */
    val(i: number): number | null {
        // 範囲外なら空きを示す null を返す
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* インデックス i のノードの左の子のインデックスを取得する */
    left(i: number): number {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右の子のインデックスを取得する */
    right(i: number): number {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親のインデックスを取得する */
    parent(i: number): number {
        return Math.floor((i - 1) / 2); // 商を負の無限大の方向に切り下げる
    }

    /* レベル順走査 */
    levelOrder(): number[] {
        let res = [];
        // 配列を順に走査する
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* 深さ優先走査 */
    #dfs(i: number, order: Order, res: (number | null)[]): void {
        // 空きなら戻る
        if (this.val(i) === null) return;
        // 行きがけ順走査
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // 通りがけ順走査
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // 帰りがけ順走査
        if (order === 'post') res.push(this.val(i));
    }

    /* 行きがけ順走査 */
    preOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* 通りがけ順走査 */
    inOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* 帰りがけ順走査 */
    postOrder(): (number | null)[] {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* 実行例 */
// 二分木を初期化する
// ここでは配列から直接二分木を作る関数を使う
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
console.log('\n二分木を初期化\n');
console.log('二分木の配列表現：');
console.log(arr);
console.log('二分木の連結表現：');
printTree(root);

// 二分木を配列で表すクラス
const abt = new ArrayBinaryTree(arr);

// ノードへのアクセス
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n現在のノードのインデックスは ' + i + ' 、値は ' + abt.val(i));
console.log(
    '左の子のインデックスは ' + l + ' 、値は ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    '右の子のインデックスは ' + r + ' 、値は ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    '親のインデックスは ' + p + ' 、値は ' + (p === null ? 'null' : abt.val(p))
);

// 木を走査する
let res = abt.levelOrder();
console.log('\nレベル順：' + res);
res = abt.preOrder();
console.log('行きがけ順：' + res);
res = abt.inOrder();
console.log('通りがけ順：' + res);
res = abt.postOrder();
console.log('帰りがけ順：' + res);

export {};
