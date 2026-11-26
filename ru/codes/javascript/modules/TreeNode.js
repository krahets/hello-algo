/**
 * File: TreeNode.js
 * Created Time: 2022-12-04
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Узел двоичного дерева */
class TreeNode {
    val; // Значение узла
    left; // Ссылка на левый дочерний узел
    right; // Ссылка на правый дочерний узел
    height; //Высота узла
    constructor(val, left, right, height) {
        this.val = val === undefined ? 0 : val;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
        this.height = height === undefined ? 0 : height;
    }
}

/* Восстановить двоичное дерево из массива */
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
