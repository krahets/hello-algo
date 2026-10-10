/**
 * File: TreeNode.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 二分木ノード */
class TreeNode {
    val; // ノード値
    left; // 左の子ノードへのポインタ
    right; // 右の子ノードへのポインタ
    height; // ノードの高さ
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
        this.height = height === undefined ? 0 : height;
    }
}

/* 配列をデシリアライズして二分木に変換する */
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
