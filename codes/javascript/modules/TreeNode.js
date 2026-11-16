/**
 * File: TreeNode.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 二叉树节点 */
class TreeNode {
    val; // 节点值
    left; // 左子节点指针
    right; // 右子节点指针
    height; //节点高度
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
        this.height = height === undefined ? 0 : height;
    }
}

/* 将数组反序列化为二叉树 */
function arrToTree(arr, i = 0) {
    if (i < 0 || i >= arr.length || arr[i] === null) {
        return null;
    }
    let root = new TreeNode(arr[i]);
    root.left = arrToTree(arr, 2 * i + 1);
    root.right = arrToTree(arr, 2 * i + 2);
    return root;
}

module.exports = {
    TreeNode,
    arrToTree,
};
