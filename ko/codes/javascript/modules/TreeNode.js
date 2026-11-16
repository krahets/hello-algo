/**
 * File: TreeNode.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* 이진 트리 노드 */
class TreeNode {
    val; // 노드 값
    left; // 왼쪽 자식 노드 포인터
    right; // 오른쪽 자식 노드 포인터
    height; //노드 높이
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
        this.height = height === undefined ? 0 : height;
    }
}

/* 배열을 역직렬화하여 이진 트리로 변환한다 */
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
