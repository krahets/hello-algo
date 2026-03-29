/**
 * File: binary_tree.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../modules/TreeNode';
import { printTree } from '../modules/PrintUtil';

/* 二分木を初期化 */
// ノードを初期化
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// ノード間の参照（ポインタ）を構築する
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n二分木を初期化する\n');
printTree(n1);

/* ノードの挿入と削除 */
const P = new TreeNode(0);
// n1 -> n2 の間にノード P を挿入
n1.left = P;
P.left = n2;
console.log('\nノード P を挿入した後\n');
printTree(n1);
// ノード P を削除
n1.left = n2;
console.log('\nノード P を削除した後\n');
printTree(n1);

export {};
