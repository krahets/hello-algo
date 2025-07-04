/**
 * File: preorder_traversal_iii_compact.js
 * Created Time: 2023-05-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { arrToTree } = require('../modules/TreeNode');
const { printTree } = require('../modules/PrintUtil');

/* 前序遍历：例题三 */
function preOrder(root, path, res) {
    // 剪枝
    if (root === null || root.val === 3) {
        return;
    }
    // 尝试
    path.push(root);
    if (root.val === 7) {
        // 记录解
        res.push([...path]);
    }
    preOrder(root.left, path, res);
    preOrder(root.right, path, res);
    // 回退
    path.pop();
}

// Driver Code
const root = arrToTree([1, 7, 3, 4, 5, 6, 7]);
console.log('\n初始化二叉树');
printTree(root);

// 前序遍历
const path = [];
const res = [];
preOrder(root, path, res);

console.log('\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点');
res.forEach((path) => {
    console.log(path.map((node) => node.val));
});
