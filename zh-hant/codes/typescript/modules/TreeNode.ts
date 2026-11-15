/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 二元樹節點 */
class TreeNode {
    val: number; // 節點值
    height: number; // 節點高度
    left: TreeNode | null; // 左子節點指標
    right: TreeNode | null; // 右子節點指標
    constructor(
        val?: number,
        height?: number,
        left?: TreeNode | null,
        right?: TreeNode | null
    ) {
        this.val = val === undefined ? 0 : val;
        this.height = height === undefined ? 0 : height;
        this.left = left === undefined ? null : left;
        this.right = right === undefined ? null : right;
    }
}

/* 將陣列反序列化為二元樹 */
function arrToTree(arr: (number | null)[], i: number = 0): TreeNode | null {
    if (i < 0 || i >= arr.length || arr[i] === null) {
        return null;
    }
    let root = new TreeNode(arr[i]);
    root.left = arrToTree(arr, 2 * i + 1);
    root.right = arrToTree(arr, 2 * i + 2);
    return root;
}

export { TreeNode, arrToTree };
