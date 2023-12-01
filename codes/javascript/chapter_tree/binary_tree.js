/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { TreeNode } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 初始化二叉树 */
// 初始化节点
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 构建节点之间的引用（指针）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n初始化二叉树\n');
printTree(n1);

/* 插入与删除节点 */
const P = new TreeNode(0);
// 在 n1 -> n2 中间插入节点 P
n1.left = P;
P.left = n2;
console.log('\n插入节点 P 后\n');
printTree(n1);
// 删除节点 P
n1.left = n2;
console.log('\n删除节点 P 后\n');
printTree(n1);
