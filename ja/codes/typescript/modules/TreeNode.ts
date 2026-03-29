/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 二分木ノード */
class TreeNode {
    val: number; // ノード値
    height: number; // ノードの高さ
    left: TreeNode | null; // 左の子ノードへのポインタ
    right: TreeNode | null; // 右の子ノードへのポインタ
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

/* 配列をデシリアライズして二分木に変換する */
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
