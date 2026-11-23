/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 二分木を初期化する */
// ノードを初期化する
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// ノード間の参照（ポインタ）を設定する
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n二分木を初期化する\n');
printTree(n1);

/* ノードの挿入と削除 */
const P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入する
n1.left = P;
P.left = n2;
console.log('\nノード P の挿入後\n');
printTree(n1);
// ノード P を削除する
n1.left = n2;
console.log('\nノード P の削除後\n');
printTree(n1);
