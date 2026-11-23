/**
 * File: binary_tree_dfs.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { type TreeNode } from '../modules/TreeNode';
import { arrToTree } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

// 走査順序を格納するリストを初期化する
const list: number[] = [];

/* 行きがけ順走査 */
function preOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* 通りがけ順走査 */
function inOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 訪問順序：左部分木 -> 根ノード -> 右部分木
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* 帰りがけ順走査 */
function postOrder(root: TreeNode | null): void {
    if (root === null) {
        return;
    }
    // 訪問順序：左部分木 -> 右部分木 -> 根ノード
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* 実行用コード */
/* 二分木を初期化する */
// ここでは配列から二分木を直接生成する関数を使う
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化する\n');
printTree(root);

/* 行きがけ順走査 */
list.length = 0;
preOrder(root);
console.log('\n行きがけ順走査で表示するノードの順序 = ' + list);

/* 通りがけ順走査 */
list.length = 0;
inOrder(root);
console.log('\n通りがけ順走査で表示するノードの順序 = ' + list);

/* 帰りがけ順走査 */
list.length = 0;
postOrder(root);
console.log('\n帰りがけ順走査で表示するノードの順序 = ' + list);

export {};
