/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/**
 * Definition for a binary tree node.
 */
class TreeNode {
    val: number;
    left: TreeNode | null;
    right: TreeNode | null;

    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val === undefined ? 0 : val; // 结点值
        this.left = left === undefined ? null : left; // 左子结点指针
        this.right = right === undefined ? null : right; // 右子结点指针
    }
}

/**
 * Generate a binary tree given an array
 * @param arr
 * @return
 */
function arrToTree(arr: (number | null)[]): TreeNode | null {
    if (arr.length === 0) {
        return null;
    }

    const root = new TreeNode(arr[0] as number);
    const queue = [root];
    let i = 0;
    while (queue.length) {
        let node = queue.shift() as TreeNode;
        if (++i >= arr.length) break;
        if (arr[i] !== null) {
            node.left = new TreeNode(arr[i] as number);
            queue.push(node.left);
        }
        if (++i >= arr.length) break;
        if (arr[i] !== null) {
            node.right = new TreeNode(arr[i] as number);
            queue.push(node.right);
        }
    }
    return root;
}

export { TreeNode, arrToTree };
