/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 初始化二元樹 */
// 初始化節點
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 構建節點之間的引用（指標）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n初始化二元樹\n');
printTree(n1);

/* 插入與刪除節點 */
const P = new TreeNode(0);
// 在 n1 -> n2 中間插入節點 P
n1.left = P;
P.left = n2;
console.log('\n插入節點 P 後\n');
printTree(n1);
// 刪除節點 P
n1.left = n2;
console.log('\n刪除節點 P 後\n');
printTree(n1);
