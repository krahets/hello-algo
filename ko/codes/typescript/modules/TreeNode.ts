/**
 * File: TreeNode.ts
 * Created Time: 2022-12-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 이진 트리 노드 */
class TreeNode {
    val: number; // 노드 값
    height: number; // 노드 높이
    left: TreeNode | null; // 왼쪽 자식 노드 포인터
    right: TreeNode | null; // 오른쪽 자식 노드 포인터
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

/* 배열을 역직렬화하여 이진 트리로 변환한다 */
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
