/**
 * File: binary_search_tree.ts
 * Created Time: 2022-12-14
 * Author: Justin (xiefahit@gmail.com)
 */

import { TreeNode } from '../module/TreeNode';
import { printTree } from '../module/PrintUtil';

/* 二叉搜索树 */
let root: TreeNode | null;

function BinarySearchTree(nums: number[]): void {
    nums.sort((a, b) => a - b); // 排序数组
    root = buildTree(nums, 0, nums.length - 1); // 构建二叉搜索树
}

/* 获取二叉树根结点 */
function getRoot(): TreeNode | null {
    return root;
}

/* 构建二叉搜索树 */
function buildTree(nums: number[], i: number, j: number): TreeNode | null {
    if (i > j) {
        return null;
    }
    // 将数组中间结点作为根结点
    let mid = Math.floor((i + j) / 2);
    let root = new TreeNode(nums[mid]);
    // 递归建立左子树和右子树
    root.left = buildTree(nums, i, mid - 1);
    root.right = buildTree(nums, mid + 1, j);
    return root;
}

/* 查找结点 */
function search(num: number): TreeNode | null {
    let cur = root;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        if (cur.val < num) {
            cur = cur.right; // 目标结点在 cur 的右子树中
        } else if (cur.val > num) {
            cur = cur.left; // 目标结点在 cur 的左子树中
        } else {
            break; // 找到目标结点，跳出循环
        }
    }
    // 返回目标结点
    return cur;
}

/* 插入结点 */
function insert(num: number): TreeNode | null {
    // 若树为空，直接提前返回
    if (root === null) {
        return null;
    }
    let cur = root,
        pre: TreeNode | null = null;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        if (cur.val === num) {
            return null; // 找到重复结点，直接返回
        }
        pre = cur;
        if (cur.val < num) {
            cur = cur.right as TreeNode; // 插入位置在 cur 的右子树中
        } else {
            cur = cur.left as TreeNode; // 插入位置在 cur 的左子树中
        }
    }
    // 插入结点 val
    let node = new TreeNode(num);
    if (pre!.val < num) {
        pre!.right = node;
    } else {
        pre!.left = node;
    }
    return node;
}

/* 删除结点 */
function remove(num: number): TreeNode | null {
    // 若树为空，直接提前返回
    if (root === null) {
        return null;
    }
    let cur = root,
        pre: TreeNode | null = null;
    // 循环查找，越过叶结点后跳出
    while (cur !== null) {
        // 找到待删除结点，跳出循环
        if (cur.val === num) {
            break;
        }
        pre = cur;
        if (cur.val < num) {
            cur = cur.right as TreeNode; // 待删除结点在 cur 的右子树中
        } else {
            cur = cur.left as TreeNode; // 待删除结点在 cur 的左子树中
        }
    }
    // 若无待删除结点，则直接返回
    if (cur === null) {
        return null;
    }
    // 子结点数量 = 0 or 1
    if (cur.left === null || cur.right === null) {
        // 当子结点数量 = 0 / 1 时， child = null / 该子结点
        let child = cur.left !== null ? cur.left : cur.right;
        // 删除结点 cur
        if (pre!.left === cur) {
            pre!.left = child;
        } else {
            pre!.right = child;
        }
    }
    // 子结点数量 = 2
    else {
        // 获取中序遍历中 cur 的下一个结点
        let next = getInOrderNext(cur.right);
        let tmp = next!.val;
        // 递归删除结点 nex
        remove(next!.val);
        // 将 nex 的值复制给 cur
        cur.val = tmp;
    }
    return cur;
}

/* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
function getInOrderNext(root: TreeNode | null): TreeNode | null {
    if (root === null) {
        return null;
    }
    // 循环访问左子结点，直到叶结点时为最小结点，跳出
    while (root.left !== null) {
        root = root.left;
    }
    return root;
}

/* Driver Code */
/* 初始化二叉搜索树 */
const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
BinarySearchTree(nums);
console.log('\n初始化的二叉树为\n');
printTree(getRoot());

/* 查找结点 */
let node = search(7);
console.log('\n查找到的结点对象为 ' + node + '，结点值 = ' + node!.val);

/* 插入结点 */
node = insert(16);
console.log('\n插入结点 16 后，二叉树为\n');
printTree(getRoot());

/* 删除结点 */
remove(1);
console.log('\n删除结点 1 后，二叉树为\n');
printTree(getRoot());
remove(2);
console.log('\n删除结点 2 后，二叉树为\n');
printTree(getRoot());
remove(4);
console.log('\n删除结点 4 后，二叉树为\n');
printTree(getRoot());

export {};
