/**
 * File: binary_tree_bfs.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 层序遍历 */
function levelOrder(root) {
    // 初始化队列，加入根节点
    const queue = [root];
    // 初始化一个列表，用于保存遍历序列
    const list = [];
    while (queue.length) {
        let node = queue.shift(); // 队列出队
        list.push(node.val); // 保存节点值
        if (node.left) queue.push(node.left); // 左子节点入队
        if (node.right) queue.push(node.right); // 右子节点入队
    }
    return list;
}

/* Driver Code */
/* 初始化二叉树 */
// 这里借助了一个从数组直接生成二叉树的函数
const root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log('\n初始化二叉树\n');
printTree(root);

/* 层序遍历 */
const list = levelOrder(root);
console.log('\n层序遍历的节点打印序列 = ' + list);
