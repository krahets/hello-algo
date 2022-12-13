/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const Tree = require("../include/TreeNode");
const { printTree } = require("../include/PrintUtil");

/* 初始化二叉树 */
// 初始化结点
let n1 = new Tree.TreeNode(1),
    n2 = new Tree.TreeNode(2),
    n3 = new Tree.TreeNode(3),
    n4 = new Tree.TreeNode(4),
    n5 = new Tree.TreeNode(5);
// 构建引用指向（即指针）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log("\n初始化二叉树\n");
printTree(n1);

/* 插入与删除结点 */
let P = new Tree.TreeNode(0);
// 在 n1 -> n2 中间插入结点 P
n1.left = P;
P.left = n2;
console.log("\n插入结点 P 后\n");
printTree(n1);
// 删除结点 P
n1.left = n2;
console.log("\n删除结点 P 后\n");
printTree(n1);
