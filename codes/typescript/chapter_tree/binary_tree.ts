/**
 * File: binary_tree.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../module/TreeNode';
import { printTree } from '../module/PrintUtil';

/* 初始化二叉树 */
// 初始化结点
let n1 = new TreeNode(1),
    n2 = new TreeNode(2),
    n3 = new TreeNode(3),
    n4 = new TreeNode(4),
    n5 = new TreeNode(5);
// 构建引用指向（即指针）
n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
console.log('\n初始化二叉树\n');
printTree(n1);

/* 插入与删除结点 */
const P = new TreeNode(0);
// 在 n1 -> n2 中间插入结点 P
n1.left = P;
P.left = n2;
console.log('\n插入结点 P 后\n');
printTree(n1);
// 删除结点 P
n1.left = n2;
console.log('\n删除结点 P 后\n');
printTree(n1);
