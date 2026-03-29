/**
 * File: array_binary_tree.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 配列表現による二分木クラス */
class ArrayBinaryTree {
    #tree;

    /* コンストラクタ */
    constructor(arr) {
        this.#tree = arr;
    }

    /* リスト容量 */
    size() {
        return this.#tree.length;
    }

    /* インデックス i のノードの値を取得 */
    val(i) {
        // インデックスが範囲外なら、空きを表す null を返す
        if (i < 0 || i >= this.size()) return null;
        return this.#tree[i];
    }

    /* インデックス i のノードの左子ノードのインデックスを取得 */
    left(i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右子ノードのインデックスを取得 */
    right(i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親ノードのインデックスを取得 */
    parent(i) {
        return Math.floor((i - 1) / 2); // 切り捨て除算
    }

    /* レベル順走査 */
    levelOrder() {
        let res = [];
        // 配列を直接走査する
        for (let i = 0; i < this.size(); i++) {
            if (this.val(i) !== null) res.push(this.val(i));
        }
        return res;
    }

    /* 深さ優先探索 */
    #dfs(i, order, res) {
        // 空きスロットなら返す
        if (this.val(i) === null) return;
        // 先行順走査
        if (order === 'pre') res.push(this.val(i));
        this.#dfs(this.left(i), order, res);
        // 中順走査
        if (order === 'in') res.push(this.val(i));
        this.#dfs(this.right(i), order, res);
        // 後順走査
        if (order === 'post') res.push(this.val(i));
    }

    /* 先行順走査 */
    preOrder() {
        const res = [];
        this.#dfs(0, 'pre', res);
        return res;
    }

    /* 中順走査 */
    inOrder() {
        const res = [];
        this.#dfs(0, 'in', res);
        return res;
    }

    /* 後順走査 */
    postOrder() {
        const res = [];
        this.#dfs(0, 'post', res);
        return res;
    }
}

/* Driver Code */
// 二分木を初期化
// ここでは、配列から直接二分木を生成する関数を利用する
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
console.log('二分木の連結リスト表現：');
printTree(root);

// 配列表現による二分木クラス
const abt = new ArrayBinaryTree(arr);

// ノードにアクセス
const i = 1;
const l = abt.left(i);
const r = abt.right(i);
const p = abt.parent(i);
console.log('\n現在のノードのインデックスは ' + i + ' ，値は ' + abt.val(i));
console.log(
    'その左子ノードのインデックスは ' + l + ' ，値は ' + (l === null ? 'null' : abt.val(l))
);
console.log(
    'その右子ノードのインデックスは ' + r + ' ，値は ' + (r === null ? 'null' : abt.val(r))
);
console.log(
    'その親ノードのインデックスは ' + p + ' ，値は ' + (p === null ? 'null' : abt.val(p))
);

// 木を走査
let res = abt.levelOrder();
console.log('\nレベル順走査：' + res);
res = abt.preOrder();
console.log('先行順走査：' + res);
res = abt.inOrder();
console.log('中間順走査：' + res);
res = abt.postOrder();
console.log('後行順走査：' + res);
