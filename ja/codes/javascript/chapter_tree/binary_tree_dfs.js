/**
 * File: binary_tree_dfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

// 走査順序を格納するリストを初期化
const list = [];

/* 先行順走査 */
function preOrder(root) {
    if (root === null) return;
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    list.push(root.val);
    preOrder(root.left);
    preOrder(root.right);
}

/* 中順走査 */
function inOrder(root) {
    if (root === null) return;
    // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    inOrder(root.left);
    list.push(root.val);
    inOrder(root.right);
}

/* 後順走査 */
function postOrder(root) {
    if (root === null) return;
    // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    postOrder(root.left);
    postOrder(root.right);
    list.push(root.val);
}

/* Driver Code */
/* 二分木を初期化 */
// ここでは、配列から直接二分木を生成する関数を利用する
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n二分木を初期化\n');
printTree(root);

/* 先行順走査 */
list.length = 0;
preOrder(root);
console.log('\n先行順走査のノード出力シーケンス = ' + list);

/* 中順走査 */
list.length = 0;
inOrder(root);
console.log('\n中間順走査のノード出力シーケンス = ' + list);

/* 後順走査 */
list.length = 0;
postOrder(root);
console.log('\n後行順走査のノード出力シーケンス = ' + list);
