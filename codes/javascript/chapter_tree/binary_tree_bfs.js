/**
 * File: binary_tree.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

const { arrToTree } = require("../include/TreeNode");
const { printTree } = require("../include/PrintUtil");

/* 层序遍历 */
function hierOrder(root) {
    // 初始化队列，加入根结点
    let queue = [root];
    // 初始化一个列表，用于保存遍历序列
    let list = [];
    while (queue.length) {
        let node = queue.shift();  // 队列出队
        list.push(node.val);          // 保存结点
        if (node.left)
            queue.push(node.left);    // 左子结点入队
        if (node.right)
            queue.push(node.right);   // 右子结点入队

    }
    return list;
}

/* Driver Code */
/* 初始化二叉树 */
// 这里借助了一个从数组直接生成二叉树的函数
var root = arrToTree([1, 2, 3, 4, 5, 6, 7]);
console.log("\n初始化二叉树\n");
printTree(root);

/* 层序遍历 */
let list = hierOrder(root);
console.log("\n层序遍历的结点打印序列 = " + list);
