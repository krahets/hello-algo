/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Binary tree node */
class TreeNode {
    val: number; // Node value
    height: number; // Node height
    left: TreeNode | null; // Pointer to the left child
    right: TreeNode | null; // Pointer to the right child
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

/* Deserialize an array into a binary tree */
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
