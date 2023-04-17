/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/**
 * Definition for a binary tree node.
 */
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
        const node = queue.shift() as TreeNode;
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
