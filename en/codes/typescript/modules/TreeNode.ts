/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 二叉树节点 */
class TreeNode {
    val: number; // 节点值
    height: number; // 节点高度
    left: TreeNode | null; // 左子节点指针
    right: TreeNode | null; // 右子节点指针
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

/* 将数组反序列化为二叉树 */
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
